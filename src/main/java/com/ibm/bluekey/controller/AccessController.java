
package com.ibm.bluekey.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.relation.RoleList;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.objenesis.instantiator.basic.AccessibleInstantiator;
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
import com.ibm.bluekey.bean.CustomException;
import com.ibm.bluekey.bean.LoginUser;
import com.ibm.bluekey.bean.MailTemplate;
import com.ibm.bluekey.bean.Role;
import com.ibm.bluekey.bean.User;
import com.ibm.bluekey.service.AccessService;
import com.ibm.bluekey.service.MailTemplateService;
import com.ibm.bluekey.service.RoleService;
import com.ibm.bluekey.service.generalFunctionService;
import com.ibm.bluekey.utils.ResponseData;


/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：AccessController   
* 类描述：   
* 创建人：Bruce-wu   
* 创建时间：2017年10月11日 上午10:06:18   
* @version        
*/

@Controller
@RequestMapping("/access")
public class AccessController {
	
	
	
	@Autowired
	AccessService accessService;
	@Autowired
	RoleService roleService;
	@Autowired
	MailTemplateService mailTemplateService;
	
	
	/**
	 * 根据Role ID 查找 对应的所有权限
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/result/{roleId}")
	public String getAccessbByRoleId(HttpServletRequest req, Model model,@PathVariable("roleId") int roleId) throws Exception{
		
		ArrayList<Map<String,String>> list = accessService.getResultByRoleId(roleId);
		
		model.addAttribute("generalAccess", list.get(0));
		model.addAttribute("functionAccess", list.get(1));
		return "access/result";
	}
	
	
	
	@RequestMapping("/checkBoxAccess/{roleId}")
	@ResponseBody
	public ResponseData checkBoxAccess( @PathVariable("roleId") int roleId) throws Exception{
		String[] accessArr = null ;
		List<String[]> generalList = null;
		List<String[]> functionList = null;
		
		Map<String,List<String[]>> accessMap = accessService.getAccssListByClass();
		generalList = accessMap.get("generaAccessList");
		functionList = accessMap.get("functionAccessList");
		
		if(roleId != 0){
			Role role = roleService.getRoleById(roleId);
			
			//为空抛出异常
			if(role==null){
				throw new CustomException("The role isn't exist");
			}
			
			accessArr = role.getAccessList().split(",");
			
			for(int i = 0; i < generalList.size(); i++){
				if(Arrays.asList(accessArr).contains(generalList.get(i)[0])){
					generalList.set(i, generalFunctionService.concat(generalList.get(i), new String[]{"checked"}));
				}
			}
			
			for(int i = 0; i < functionList.size(); i++){
				if(Arrays.asList(accessArr).contains(functionList.get(i)[0])){
					functionList.set(i, generalFunctionService.concat(functionList.get(i), new String[]{"checked"}));
				}
			}
			return ResponseData.success().add("generalList", generalList).add("functionList", functionList).add("role", role);
		}
		
		return ResponseData.success().add("generalList", generalList).add("functionList", functionList);
		
	}
	
	
	
	/**
	 * 查找出access详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/detail/{accessId}")
	public String getDetail( Model model,@PathVariable("accessId") int accessId) throws Exception{
		
		Access access = accessService.getAccessById(accessId);
		//为空抛出异常
		if(access==null){
			throw new CustomException("The access isn't exist");
		}
		
		MailTemplate mailTemplate = new MailTemplate();
		
		
		model.addAttribute("access", access);
		
		if(access.getApplyEmail()!=null&&!access.getApplyEmail().equals("")){
			List<MailTemplate> mailTemplateList = mailTemplateService.getMailTemplateByAccessId(accessId);
			if(!mailTemplateList.isEmpty()){
				mailTemplate = mailTemplateList.get(0);
			}
		}
		
		model.addAttribute("mailTemplate", mailTemplate);

		return "access/access";
	}
	
	/**
	 *  access List  页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/accessList")
	public String getUser(HttpServletRequest req, Model model) throws Exception{
		
		//判断是否有权限进入
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		String[] accessArr = loginUser.getAuthorization().getAccessRight().split(",");
		System.out.println(Arrays.binarySearch(accessArr, "0"));
		if(Arrays.binarySearch(accessArr, "0")<0){
			throw new CustomException("You haven't right to visit the page!");
		}
		
		return "access/accessList";
	}
	
	/**
	 * 异步分页
	 * @param beginNum
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResponseData getUserList(@RequestParam(value="beginNum",defaultValue="1")Integer beginNum){
		
		//设置PageHelper起始页数和每页的数量
		PageHelper.startPage(beginNum, 20);
		
		String[] belongAccess = new String[]{"","general access","function access"};
		List<Access> accessList = accessService.getAllAccess();
		
		PageInfo pageInfo = new PageInfo(accessList,5);
		return ResponseData.success().add("pageInfo", pageInfo).add("belongAccess", belongAccess);
	}
	
	
	/**
	 * 导航栏模糊搜索
	 * @param model
	 * @param search
	 * @return
	 */
	@RequestMapping("/search")
	public String search( Model model,String search){
		
		System.out.println(search);
		List<Access>  accessList = accessService.getAccessListBySearch(search.trim()); //search 
		
		System.out.println(accessList);
		
		model.addAttribute("search",search.trim());
		model.addAttribute("size",accessList.size());
		model.addAttribute("accessList",accessList);
		
		return "access/search";
	}
	
	/**
	 * 编辑access  ,RESTful 风格
	 * @param model
	 * @param accessId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/access/{accessId}",method=RequestMethod.GET)
	public String editAccess(HttpServletRequest req,Model model,@PathVariable("accessId")int accessId) throws Exception{
		
		//判断是否有权限进入
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		String[] accessArr = loginUser.getAuthorization().getAccessRight().split(",");
		System.out.println(Arrays.binarySearch(accessArr, "0"));
		if(Arrays.binarySearch(accessArr, "0")<0){
			throw new CustomException("You haven't right to visit the page!");
		}
		
		Access access = accessService.getAccessById(accessId);
		//为空抛出异常
		if(access==null){
			throw new CustomException("The access isn't exist");
		}
		
		MailTemplate mailTemplate = new MailTemplate();
		
		List<MailTemplate> mailTemplateList = mailTemplateService.getMailTemplateByAccessId(accessId);
		//为空抛出异常
		if(mailTemplateList==null){
			throw new CustomException("The mail Template isn't exist");
		}
		
		if(!mailTemplateList.isEmpty()){
			mailTemplate = mailTemplateList.get(0);
		}
		
		model.addAttribute("access", access);
		model.addAttribute("mailTemplate", mailTemplate);
		
		return "access/edit";
	}
	
	/**
	 * 保存access  ,RESTful 风格
	 * @param model
	 * @param accessId
	 * @return
	 */
	@RequestMapping(value="/access",method=RequestMethod.POST)
	@ResponseBody
	public ResponseData saveAccess(HttpServletRequest req,Model model,Access access)throws SQLException{
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		access.setUpdateTime(dateNow);
		access.setUpdateOperator(loginUser.getUser().getEmail());
		try{
			accessService.saveAccess(access);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	@RequestMapping("/add")
	public String getAccess(HttpServletRequest req) throws Exception{
		
		//判断是否有权限进入
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		String[] accessArr = loginUser.getAuthorization().getAccessRight().split(",");
		System.out.println(Arrays.binarySearch(accessArr, "0"));
		if(Arrays.binarySearch(accessArr, "0")<0){
			throw new CustomException("You haven't right to visit the page!");
		}
		return "access/add";
		
	}
	
	/**
	 * 新增access  ,RESTful 风格
	 * @param model
	 * @param accessId
	 * @return
	 */
	@RequestMapping(value="/access",method=RequestMethod.PUT)
	@ResponseBody
	public ResponseData addAccess(HttpServletRequest req,Model model,Access access)throws SQLException{
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		access.setCreateTime(dateNow);
		access.setCreateOperator(loginUser.getUser().getEmail());
		access.setUpdateTime(dateNow);
		access.setUpdateOperator(loginUser.getUser().getEmail());
		try{
			accessService.addAccess(access);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 删除access  ,RESTful 风格
	 * @param model
	 * @param accessId
	 * @return
	 */
	@RequestMapping(value="/access/{accessId}",method=RequestMethod.DELETE)
	@ResponseBody
	public ResponseData daleteAccess(HttpServletRequest req, @PathVariable("accessId")int accessId)throws SQLException{
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		
		Access access= new Access();
		access.setAccessId(accessId);
		access.setUpdateTime(dateNow);
		access.setUpdateOperator(loginUser.getUser().getEmail());
		access.setDeleted(1);
		
		try{
			accessService.deleteAccess(access);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * accessList 快速搜索，
	 * @param accessSearch
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/searchAccess")
	@ResponseBody
	public ResponseData searcheaAccess(String accessSearch) throws Exception{
		System.out.println(accessSearch);
		
		List<Access>  accessList = accessService.getAccessListBySearchOnlyTitle(accessSearch.trim()); //search
		if(accessList.isEmpty()){
			return ResponseData.error();
		}
		
		return ResponseData.success().add("accessList", accessList);
	}
}
