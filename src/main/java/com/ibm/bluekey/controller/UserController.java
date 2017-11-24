
package com.ibm.bluekey.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ibm.bluekey.bean.Access;
import com.ibm.bluekey.bean.Authorization;
import com.ibm.bluekey.bean.CustomException;
import com.ibm.bluekey.bean.LoginUser;
import com.ibm.bluekey.bean.SendRecord;
import com.ibm.bluekey.bean.User;
import com.ibm.bluekey.service.AccessService;
import com.ibm.bluekey.service.AuthorizationService;
import com.ibm.bluekey.service.HttpRequestService;
import com.ibm.bluekey.service.RoleService;
import com.ibm.bluekey.service.SendRecordService;
import com.ibm.bluekey.service.UserService;
import com.ibm.bluekey.utils.LDAP;
import com.ibm.bluekey.utils.ResponseData;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：UserController   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年10月11日 下午5:20:29   
* @version        
*/
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	@Autowired
	SendRecordService sendRecordService;
	@Autowired
	AuthorizationService authorizationService;
	@Autowired
	RoleService roleService;
	@Autowired
	HttpRequestService httpRequestService;
	
	/**
	 * index页面逻辑
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest req, Model model){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser"); 
		
		if(loginUser==null){
			return "login";
		}else{
		    return "redirect:user/query";
			//return "query";
	    }
	}
	
	
	
	
	/**
	 * 登录
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public ResponseData login(HttpServletRequest req, Model model){
		
		LDAP ldap = new LDAP();
		String email = req.getParameter("email").trim();
		String password = req.getParameter("password");
		
		
		if(email!=null && password!=null) {
			try{
				
				if((LoginUser) req.getSession().getAttribute("loginUser")!=null){
					//如果已经登录
					LoginUser loginUser =(LoginUser) req.getSession().getAttribute("loginUser");
				}else{
					LoginUser loginUser = new LoginUser();
					boolean isAuthentication = ldap.authenticate(email, password);
					//boolean isAuthentication =true;
					if(isAuthentication) {
						List<User> userList = userService.findUserByEmail(email);
						User user;
						if(userList.isEmpty()){
							user = userService.insertUser(email);
						}else{
							user = userList.get(0);
							if(user.getAuthorizationRole()>0){
								
								loginUser.setAuthorization(authorizationService.getAuthorizationByID(user.getAuthorizationRole()));
								
								String result = httpRequestService.sendGet("/api/find/?q=email:"+user.getEmail(),"&limit=1");
								
								JSONArray jsonObjectArr = new JSONArray(result);
								JSONObject myjObject = jsonObjectArr.getJSONObject(0);
								loginUser.setUid(myjObject.getString("uid")); 
								loginUser.setName(myjObject.getString("name")); 
								loginUser.setNotesId(myjObject.getString("notes-id")); 
								loginUser.setBio(myjObject.getString("bio")); 
								loginUser.setLocation(myjObject.getString("location"));
					            
							}
						}
						loginUser.setUser(user);
						HttpSession session = req.getSession();
						session.setMaxInactiveInterval(12*3600);
						req.getSession().setAttribute("loginUser", loginUser);
						
						System.out.println(loginUser.getUser().getUserId());
						
						model.addAttribute("loginUser", loginUser);
						
						return ResponseData.success();
					}else{
						return ResponseData.error();
					}
				}
			}catch(Exception  e ){
				
				e.printStackTrace(); 
				return ResponseData.error();
			}
		}
		return ResponseData.error();
	}
	
	/**
	 * 注销登录
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req, Model model){
		
		req.getSession().removeAttribute("loginUser");     //destory session
		
		return "login";
	}
	
	
	/**
	 * 查询页面
	 * @return
	 */
	@RequestMapping("/query")
	public String query(HttpServletRequest req, Model model){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser"); 
		
		String remember= loginUser.getUser().getRemember();
		String[] remember_arr =new String[] {"1","1","1","1"}; 
		
		if(remember!=null&&!remember.equals("")){ 
			remember_arr = remember.split(",");
		}
		
		model.addAttribute("remember_arr", remember_arr);
		
		return "query";
	}
	
	@RequestMapping("/userList")
	public String getUserList(HttpServletRequest req,Model model) throws Exception{
		
		//判断是否有权限进入
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		String[] authArr = loginUser.getAuthorization().getAuthRight().split(",");
		
		if(Arrays.binarySearch(authArr, "0")<0){
			throw new CustomException("You haven't right to visit the page!");
		}
		
		JSONObject authJson = authorizationService.getAuthorizationMap();
		JSONObject buJson = roleService.getBuMap();
		JSONObject functionJson = roleService.getFuntionMap();
		
		model.addAttribute("authJson", authJson);
		model.addAttribute("buJson", buJson);
		model.addAttribute("functionJson", functionJson);
		return "user/userList";
	}
	
	/**
	 * admin 分页查询
	 * @param beginNum
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResponseData getAdminUserList(@RequestParam("beginNum") int beginNum ){
		PageHelper.startPage(beginNum,15);
		
		try{
			List<User> userList = userService.getAdminList();
			PageInfo pageInfo = new PageInfo(userList,5);
			
			return ResponseData.success().add("pageInfo", pageInfo);
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	/**
	 * 
	 * @param req
	 * @param model
	 * @return 用户中心获取邮件发送历史记录
	 * @throws Exception
	 */
	
	@RequestMapping(value="/history")
	public String history(HttpServletRequest req, Model model) throws Exception{
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser"); 
		List<SendRecord> sendRecordList = sendRecordService.getSendRecordByUserId(loginUser.getUser().getUserId());
		
		model.addAttribute("sendRecordList", sendRecordList);
		
		return "user/history";
	}
	
	/**
	 * 查找用户 根据ID
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/user/{userId}",method=RequestMethod.GET)
	@ResponseBody
	public ResponseData getUserByID(@PathVariable("userId") int userId){
		User user= userService.getUserByID(userId);
		return ResponseData.success().add("user", user);
	}
	
	/**
	 * 新增用户 根据ID
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/user",method=RequestMethod.PUT)
	@ResponseBody
	public ResponseData addAdmin(HttpServletRequest req,User user){
		try{
			List<User> userList = userService.findUserByEmail(user.getEmail());
			LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
			Date dateNow = new Date();
			
			user.setUpdateOperator(loginUser.getUser().getEmail());
			user.setUpdateTime(dateNow);;
			
			if(userList.isEmpty()){
				userService.insertUser(user);
			}else{
				user.setUserId(userList.get(0).getUserId());
				userService.updateUser(user);
			}
			
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 保存用户
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/user",method=RequestMethod.POST)
	@ResponseBody
	public ResponseData saveAdmin(HttpServletRequest req,User user){
		try{
			
			LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
			Date dateNow = new Date();
			
			user.setUpdateOperator(loginUser.getUser().getEmail());
			user.setUpdateTime(dateNow);;
			
			userService.updateUser(user);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 删除用户
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/user/{userId}",method=RequestMethod.DELETE)
	@ResponseBody
	public ResponseData deleteAdmin(HttpServletRequest req,@PathVariable int userId){
		try{
			
			LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
			Date dateNow = new Date();
			User user = new User();
			
			user.setUserId(userId);
			user.setUpdateOperator(loginUser.getUser().getEmail());
			user.setUpdateTime(dateNow);;
			user.setDeleted(1);
			userService.deleteUser(user);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
}
