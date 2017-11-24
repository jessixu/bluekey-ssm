
package com.ibm.bluekey.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ibm.bluekey.bean.Bu;
import com.ibm.bluekey.bean.Commodity;
import com.ibm.bluekey.bean.CustomException;
import com.ibm.bluekey.bean.Function;
import com.ibm.bluekey.bean.JobRole;
import com.ibm.bluekey.bean.LoginUser;
import com.ibm.bluekey.bean.Role;
import com.ibm.bluekey.bean.User;
import com.ibm.bluekey.service.BuService;
import com.ibm.bluekey.service.CommodityService;
import com.ibm.bluekey.service.FunctionService;
import com.ibm.bluekey.service.JobRoleService;
import com.ibm.bluekey.service.RoleService;
import com.ibm.bluekey.service.UserService;
import com.ibm.bluekey.service.generalFunctionService;
import com.ibm.bluekey.utils.ResponseData;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：RoleController   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年10月12日 上午11:02:48   
* @version        
*/
@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	BuService buService;
	@Autowired
	FunctionService functionService;
	@Autowired
	JobRoleService jobRoleService;
	@Autowired
	CommodityService commodityService;
	@Autowired
	UserService userService;
	@Autowired
	RoleService roleService;

	private Map<Integer,String> buMap ;
	private Map<Integer,String> functionMap ;
	private Map<Integer,String> jobRoleMap ;
	private Map<Integer,String> commodityMap ;
	
	@InitBinder
	public void iniiBinder(){
		
		List<Bu> buList = buService.getBuList();
		for(Bu bu:buList){
			buMap.put(bu.getBuId(),bu.getName());
		}
		List<Function> functionList = functionService.getFunctionList();
		functionMap = new HashMap<Integer,String>();
		for(Function function:functionList){
			functionMap.put(function.getfId(),function.getName());
		}
		
		List<JobRole> jobRoleList = jobRoleService.getJobRoleList();
		jobRoleMap = new HashMap<Integer,String>();
		for(JobRole jobRole:jobRoleList){
			jobRoleMap.put(jobRole.getjId(),jobRole.getName());
		}
		
		List<Commodity> commodityList = commodityService.getCommodityList();
		commodityMap = new HashMap<Integer,String>();
		for(Commodity commodity:commodityList){
			commodityMap.put(commodity.getcId(),commodity.getName());
		}
	}
	
	
	/**
	 * query查询结果
	 * @param req
	 * @param model
	 * @param role
	 * @param remember_type
	 * @return
	 */
	@RequestMapping("/result")
	@ResponseBody
	public ResponseData result(HttpServletRequest req, Model model,Role role,String remember_type){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		loginUser.getUser().setRemember(role.getBu()+","+role.getFunction()+","+role.getJobRole()+","+role.getCommodity());
		
		if(role.getJobRole()==null){
			return ResponseData.error().add("errorMsg", "Job role must be selected");
		}
		
		if(remember_type!=null&&!remember_type.equals("")){
			userService.updateRemember(loginUser.getUser());
		}
		
		List<Role> roleList = roleService.getRolebyCondition(role);
		
		if(!roleList.isEmpty()){
			int roleId = roleList.get(0).getRoleId();
			return ResponseData.success().add("roleId", roleId);
			
		}else{
			return ResponseData.error();
		}
	}
	
	
	
	
	/**
	 * roleList 页面
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/roleList")
	public String getRoleList(HttpServletRequest req,Model model) throws Exception{
		
		//判断是否有权限进入
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		String[] roleArr = loginUser.getAuthorization().getRoleRight().split(",");
		
		if(Arrays.binarySearch(roleArr, "0")<0){
			throw new CustomException("You haven't right to visit the page!");
		}
		
		return "role/roleList";
	}
	
	/**
	 *异步加载role 数据
	 * @param beginNum
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResponseData queryRoleList(@RequestParam(value="beginNum",defaultValue="1") int beginNum){
		
		PageHelper.startPage(beginNum,20);
		List<Role> roleList =roleService.getRoleList();
		
		PageInfo pageInfo = new PageInfo(roleList,5);
		
		List<Bu> buList = buService.getBuList();
		for(Bu bu:buList){
			buMap.put(bu.getBuId(),bu.getName());
		}
		List<Function> functionList = functionService.getFunctionList();
		functionMap = new HashMap<Integer,String>();
		for(Function function:functionList){
			functionMap.put(function.getfId(),function.getName());
		}
		
		List<JobRole> jobRoleList = jobRoleService.getJobRoleList();
		jobRoleMap = new HashMap<Integer,String>();
		for(JobRole jobRole:jobRoleList){
			jobRoleMap.put(jobRole.getjId(),jobRole.getName());
		}
		
		List<Commodity> commodityList = commodityService.getCommodityList();
		commodityMap = new HashMap<Integer,String>();
		for(Commodity commodity:commodityList){
			commodityMap.put(commodity.getcId(),commodity.getName());
		}
		
		return ResponseData.success().add("pageInfo", pageInfo).add("buMap",buMap).add("functionMap",functionMap).add("jobRoleMap",jobRoleMap).add("commodityMap",commodityMap);
	}
	
	
	/**
	 * 根据条件快速查找role
	 * @param role
	 * @return
	 */
	@RequestMapping("/queryRole")
	@ResponseBody
	public ResponseData queryRole (Role role){
		List<Role> roleList = roleService.getRolebyCondition(role);
		
		PageInfo pageInfo = new PageInfo(roleList,100);
		
		List<Bu> buList = buService.getBuList();
		buMap = new HashMap<Integer,String>();
		for(Bu bu:buList){
			buMap.put(bu.getBuId(),bu.getName());
		}
		
		List<Function> functionList = functionService.getFunctionList();
		functionMap = new HashMap<Integer,String>();
		for(Function function:functionList){
			functionMap.put(function.getfId(),function.getName());
		}
		
		List<JobRole> jobRoleList = jobRoleService.getJobRoleList();
		jobRoleMap = new HashMap<Integer,String>();
		for(JobRole jobRole:jobRoleList){
			jobRoleMap.put(jobRole.getjId(),jobRole.getName());
		}
		
		List<Commodity> commodityList = commodityService.getCommodityList();
		commodityMap = new HashMap<Integer,String>();
		for(Commodity commodity:commodityList){
			commodityMap.put(commodity.getcId(),commodity.getName());
		}
		if(!roleList.isEmpty()){
			return ResponseData.success().add("pageInfo", pageInfo).add("buMap",buMap).add("functionMap",functionMap).add("jobRoleMap",jobRoleMap).add("commodityMap",commodityMap);
			
		}else{
			return ResponseData.error();
		}
	}
	
	/**
	 * 保存role
	 * @param req
	 * @param role
	 * @return
	 */
	
	@RequestMapping(value="/role",method=RequestMethod.POST)
	@ResponseBody
	public ResponseData saveRole(HttpServletRequest req,Role role,String[] generalAccess,String[] functionAccess) throws SQLException{
		
		StringBuilder accessList_SB = new StringBuilder();
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		for(String general:generalAccess){
			accessList_SB.append(general+",");
		}
		
		for(String function:functionAccess){
			accessList_SB.append(function+",");
		}
		String accessList =accessList_SB.substring(0,accessList_SB.length()-1);
		
		Date dateNow = new Date();
		role.setUpdateTime(dateNow);
		role.setUpdateOperator(loginUser.getUser().getEmail());
		role.setAccessList(accessList);
		
		try{
			roleService.saveRole(role);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 新增role
	 * @param req
	 * @param role
	 * @return
	 */
	
	@RequestMapping(value="/role",method=RequestMethod.PUT)
	@ResponseBody
	public ResponseData addRole(HttpServletRequest req,Role role,String[] generalAccess,String[] functionAccess){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		//检查该role是否存在
		if(roleService.getRolebyCondition(role).isEmpty()){
			return ResponseData.error().add("msg", "The role had been created.Please change others!");
		}
		
		StringBuilder accessList_SB = new StringBuilder();
		
		for(String general:generalAccess){
			accessList_SB.append(general+",");
		}
		
		for(String function:functionAccess){
			accessList_SB.append(function+",");
		}
		String accessList =accessList_SB.substring(0,accessList_SB.length()-1);
		
		Date dateNow = new Date();
		role.setCreateTime(dateNow);
		role.setCreateOperator(loginUser.getUser().getEmail());
		role.setUpdateTime(dateNow);
		role.setUpdateOperator(loginUser.getUser().getEmail());
		role.setAccessList(accessList);
		try{
			roleService.addRole(role);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	
	/**
	 * 删除role
	 * @param req
	 * @param role
	 * @return
	 */
	
	@RequestMapping(value="/role/{roleId}",method=RequestMethod.DELETE)
	@ResponseBody
	public ResponseData deleteRole(HttpServletRequest req,@PathVariable("roleId") int roleId) throws SQLException{
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Role role = new Role();
		Date dateNow = new Date();
		role.setRoleId(roleId);
		role.setUpdateTime(dateNow);
		role.setUpdateOperator(loginUser.getUser().getEmail());
		role.setDeleted(1);
		
		try{
			roleService.deleteRole(role);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
	}
	
	
	/**
	 * 
	 * @param 
	 * @return 	测试数据回现 异步查询BU,表示将方法的返回值放入request(请求key/value ，输出json)
	 * @throws Exception
	 */
	@RequestMapping(value="/getBuList")
	@ResponseBody
	public  String getBuList() throws Exception{
		
		List<Bu>  buList = buService.getBuList();
		//return buMap;
		JSONArray jsonArray = new JSONArray();
		
		for(Bu bu:buList){
			JSONObject json = new JSONObject();
			json.put("name", bu.getName());
		    json.put("value", bu.getBuId());
		    jsonArray.put(json);
		}
	    
	     System.out.println(jsonArray);
	     
	     //转换为字符串
	    String jsonStr = jsonArray.toString();
	    return  jsonStr;         
		
	}
	
	/**
	 * 
	 * @param 
	 * @return 	测试数据回现 异步查询Function,表示将方法的返回值放入request(请求key/value ，输出json)
	 * @throws Exception
	 */
	@RequestMapping(value="/getFunctionList")
	@ResponseBody
	public  String getFunctionList(HttpServletRequest request) throws Exception{
		
		System.out.println("bu:"+request.getParameter("bu"));
		List<Function>  functionList = functionService.getFunctionListByBuId(Integer.parseInt(request.getParameter("bu")));
		//return buMap;
		JSONArray jsonArray = new JSONArray();
		
		for(Function function:functionList){
			JSONObject json = new JSONObject();
			json.put("name", function.getName());
		    json.put("value", function.getfId());
		    jsonArray.put(json);
		}
	    
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("function", jsonArray);
		 System.out.println(jsonResult);
	     
	     //转换为字符串
	    String jsonStr = jsonResult.toString();
	    return  jsonStr;         
		
	}
	
	/**
	 * 
	 * @param 
	 * @return 	测试数据回现 异步查询jobrole,表示将方法的返回值放入request(请求key/value ，输出json)
	 * @throws Exception
	 */
	@RequestMapping(value="/getJobroleList")
	@ResponseBody
	public  String getJobroleList(HttpServletRequest request) throws Exception{
		
		System.out.println("function:"+request.getParameter("function"));
		List<JobRole>  jobRoleList = jobRoleService.getJobRoleListByFid(Integer.parseInt(request.getParameter("function")));
		//return buMap;
		JSONArray jsonArray = new JSONArray();
		
		for(JobRole jobRole:jobRoleList){
			JSONObject json = new JSONObject();
			json.put("name", jobRole.getName());
		    json.put("value", jobRole.getjId());
		    jsonArray.put(json);
		}
	    
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("jobRole", jsonArray);
		 System.out.println(jsonResult);
	     
	     //转换为字符串
	    String jsonStr = jsonResult.toString();
	    return  jsonStr;         
		
	}
	
	
	/**
	 * 
	 * @param 
	 * @return 	测试数据回现 异步查询jobrole,表示将方法的返回值放入request(请求key/value ，输出json)
	 * @throws Exception
	 */
	@RequestMapping(value="/getCommodityList")
	@ResponseBody
	public  String getCommodityList(HttpServletRequest request) throws Exception{
		
		System.out.println("jobRole:"+request.getParameter("jobRole"));
		List<Commodity>  commodityList = commodityService.getCommodityListByJId(Integer.parseInt(request.getParameter("jobRole")));
		//return buMap;
		JSONArray jsonArray = new JSONArray();
		
		for(Commodity commodity:commodityList){
			JSONObject json = new JSONObject();
			json.put("name", commodity.getName());
		    json.put("value", commodity.getcId());
		    jsonArray.put(json);
		}
	    
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("commodity", jsonArray);
		 System.out.println(jsonResult);
	     
	     //转换为字符串
	    String jsonStr = jsonResult.toString();
	    return  jsonStr;         
		
	}
}
