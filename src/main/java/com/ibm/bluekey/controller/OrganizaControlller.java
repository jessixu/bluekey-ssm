/**
 * 
 */
package com.ibm.bluekey.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.runners.Parameterized.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.ibm.bluekey.bean.Bu;
import com.ibm.bluekey.bean.Commodity;
import com.ibm.bluekey.bean.CustomException;
import com.ibm.bluekey.bean.Function;
import com.ibm.bluekey.bean.JobRole;
import com.ibm.bluekey.bean.LoginUser;
import com.ibm.bluekey.bean.User;
import com.ibm.bluekey.service.BuService;
import com.ibm.bluekey.service.CommodityService;
import com.ibm.bluekey.service.FunctionService;
import com.ibm.bluekey.service.JobRoleService;
import com.ibm.bluekey.utils.ResponseData;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：OrganizaControlller   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年10月19日 上午10:14:38   
* @version        
*/
@Controller
@RequestMapping("/organization")
public class OrganizaControlller {
		
	@Autowired
	BuService buService;
	@Autowired
	FunctionService functionService;
	@Autowired
	JobRoleService jobRoleService;
	@Autowired
	CommodityService commodityService;
	
	
	/**
	 * Organization List 页面
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/list")
	public String getOrganizaList(HttpServletRequest req,Model model) throws Exception{
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		String[] organizationArr = loginUser.getAuthorization().getOrganizationRight().split(",");
		
		if(Arrays.binarySearch(organizationArr, "0")<0){
			throw new CustomException("You haven't right to visit the page!");
		}
		
		List<Bu> buList = buService.getBuList();
		List<Function> functionList = functionService.getFunctionList();
		List<JobRole> jobRoleList = jobRoleService.getJobRoleList();
		List<Commodity> commodityList = commodityService.getCommodityList();
		
		Map<Integer,String> jobRoleMap = new HashMap<Integer,String>();
		for(JobRole jobRole:jobRoleList){
			jobRoleMap.put(jobRole.getjId(),jobRole.getName());
		}
		
		Map<Integer,String> functionMap = new HashMap<Integer,String>();
		for(Function function:functionList){
			functionMap.put(function.getfId(),function.getName());
		}
		
		Map<Integer,String> buMap = new HashMap<Integer,String>();
		for(Bu bu:buList){
			buMap.put(bu.getBuId(),bu.getName());
		}
		
		model.addAttribute("buList", buList);
		model.addAttribute("functionList", functionList);
		model.addAttribute("jobRoleList", jobRoleList);
		model.addAttribute("commodityList", commodityList);
		
		model.addAttribute("buMap", buMap);
		model.addAttribute("functionMap", functionMap);
		model.addAttribute("jobRoleMap", jobRoleMap);
		
		
		
		return "organization/list";
	}
	
	/**
	 * 查询Commodity
	 * @param commodity
	 * @return
	 */
	@RequestMapping(value="/commodity/{cId}",method=RequestMethod.GET)
	@ResponseBody
	public ResponseData getCommodity(HttpServletRequest req,@PathVariable("cId") int cId){
		
		try{
			
			Commodity commodity = commodityService.getCommodityByCid(cId);
			return ResponseData.success().add("commodity", commodity);
			
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 保存修改Commodity
	 * @param commodity
	 * @return
	 */
	@RequestMapping(value="/commodity",method=RequestMethod.POST)
	@ResponseBody
	public ResponseData saveCommodity(HttpServletRequest req,Commodity commodity){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		commodity.setUpdateTime(dateNow);
		commodity.setUpdateOperator(loginUser.getUser().getEmail());
		
		try{
			commodityService.saveCommodity(commodity);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 新增Commodity
	 * @param commodity
	 * @return
	 */
	@RequestMapping(value="/commodity",method=RequestMethod.PUT)
	@ResponseBody
	public ResponseData addCommodity(HttpServletRequest req,Commodity commodity){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		commodity.setcId(null);
		commodity.setUpdateTime(dateNow);
		commodity.setUpdateOperator(loginUser.getUser().getEmail());
		commodity.setCreateTime(dateNow);
		commodity.setCreateOperator(loginUser.getUser().getEmail());
		
		try{
			commodityService.addCommodity(commodity);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 删除Commodity
	 * @param commodity
	 * @return
	 */
	@RequestMapping(value="/commodity/{cId}",method=RequestMethod.DELETE)
	@ResponseBody
	public ResponseData deleteCommodity(HttpServletRequest req,@PathVariable("cId") int cId){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		Commodity commodity = commodityService.getCommodityByCid(cId);
		commodity.setUpdateTime(dateNow);
		commodity.setUpdateOperator(loginUser.getUser().getEmail());
		commodity.setDeleted(1);
		
		try{
			commodityService.deleteCommodity(commodity);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 保存修改jobRole
	 * @param jobRole
	 * @return
	 */
	@RequestMapping(value="/jobRole",method=RequestMethod.POST)
	@ResponseBody
	public ResponseData saveJobRole(HttpServletRequest req,JobRole jobRole){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		jobRole.setUpdateTime(dateNow);
		jobRole.setUpdateOperator(loginUser.getUser().getEmail());
		
		try{
			jobRoleService.saveJobRole(jobRole);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 新增jobRole
	 * @param jobRole
	 * @return
	 */
	@RequestMapping(value="/jobRole",method=RequestMethod.PUT)
	@ResponseBody
	public ResponseData addJobRole(HttpServletRequest req,JobRole jobRole){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		jobRole.setjId(null);
		jobRole.setUpdateTime(dateNow);
		jobRole.setUpdateOperator(loginUser.getUser().getEmail());
		jobRole.setCreateTime(dateNow);
		jobRole.setCreateOperator(loginUser.getUser().getEmail());
		
		try{
			jobRoleService.addJobRole(jobRole);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 删除jobRole
	 * @param jobRole
	 * @return
	 */
	@RequestMapping(value="/jobRole/{jId}",method=RequestMethod.DELETE)
	@ResponseBody
	public ResponseData deleteJobRole(HttpServletRequest req,@PathVariable("jId") int jId){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		try{
			
			Date dateNow = new Date();
			JobRole jobRole = jobRoleService.getjobRoleByJid(jId);
			jobRole.setUpdateTime(dateNow);
			jobRole.setUpdateOperator(loginUser.getUser().getEmail());
			jobRole.setDeleted(1);
			jobRoleService.deleteJobRole(jobRole);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	
	/**
	 * 保存修改function
	 * @param function
	 * @return
	 */
	@RequestMapping(value="/function",method=RequestMethod.POST)
	@ResponseBody
	public ResponseData saveFunction(HttpServletRequest req,Function function){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		function.setUpdateTime(dateNow);
		function.setUpdateOperator(loginUser.getUser().getEmail());
		
		try{
			functionService.saveFunction(function);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 新增function
	 * @param function
	 * @return
	 */
	@RequestMapping(value="/function",method=RequestMethod.PUT)
	@ResponseBody
	public ResponseData addJobRole(HttpServletRequest req,Function function){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		function.setfId(null);
		function.setUpdateTime(dateNow);
		function.setUpdateOperator(loginUser.getUser().getEmail());
		function.setCreateTime(dateNow);
		function.setCreateOperator(loginUser.getUser().getEmail());
		
		try{
			functionService.addFunction(function);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 删除function
	 * @param function
	 * @return
	 */
	@RequestMapping(value="/function/{fId}",method=RequestMethod.DELETE)
	@ResponseBody
	public ResponseData deleteFunction(HttpServletRequest req,@PathVariable("fId") int fId){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		Function function = functionService.getFunctionByFid(fId);
		function.setUpdateTime(dateNow);
		function.setUpdateOperator(loginUser.getUser().getEmail());
		function.setDeleted(1);
		
		try{
			functionService.deleteFunction(function);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 保存修改bu
	 * @param bu
	 * @return
	 */
	@RequestMapping(value="/bu",method=RequestMethod.POST)
	@ResponseBody
	public ResponseData saveBu(HttpServletRequest req,Bu bu){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		bu.setUpdateTime(dateNow);
		bu.setUpdateOperator(loginUser.getUser().getEmail());
		
		try{
			buService.saveBu(bu);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 新增bu
	 * @param bu
	 * @return
	 */
	@RequestMapping(value="/bu",method=RequestMethod.PUT)
	@ResponseBody
	public ResponseData addBu(HttpServletRequest req,Bu bu){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		bu.setBuId(null);
		bu.setUpdateTime(dateNow);
		bu.setUpdateOperator(loginUser.getUser().getEmail());
		bu.setCreateTime(dateNow);
		bu.setCreateOperator(loginUser.getUser().getEmail());
		
		try{
			buService.addBu(bu);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 删除function
	 * @param function
	 * @return
	 */
	@RequestMapping(value="/bu/{buId}",method=RequestMethod.DELETE)
	@ResponseBody
	public ResponseData deleteBu(HttpServletRequest req,@PathVariable("buId") int buId){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		Bu bu = buService.getBuByBuid(buId);
		bu.setUpdateTime(dateNow);
		bu.setUpdateOperator(loginUser.getUser().getEmail());
		bu.setDeleted(1);
		
		try{
			buService.deleteBu(bu);
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
	@RequestMapping(value="/getBuList" )
	@ResponseBody
	public  ResponseData getBuList() throws Exception{
		
		List<Bu>  buList = buService.getBuList();
		
	    return  ResponseData.success().add("buList", buList);         
		
	}
	
	
	
	/**
	 * 
	 * @param 
	 * @return 	异步查询jobrole,表示将方法的返回值放入request(请求key/value ，输出json)
	 * @throws Exception
	 */
	@RequestMapping(value="/getJobRoleList")
	@ResponseBody
	public  ResponseData getJobRoleList(HttpServletRequest request) throws Exception{
		
		List<JobRole>  jobRoleList = jobRoleService.getJobRoleList();
		
	    return  ResponseData.success().add("jobRoleList", jobRoleList); 
		
	}
	
	/**
	 * 
	 * @param 
	 * @return 	异步查询function,表示将方法的返回值放入request(请求key/value ，输出json)
	 * @throws Exception
	 */
	@RequestMapping(value="/getFunctionList")
	@ResponseBody
	public  ResponseData getFunctionList(HttpServletRequest request) throws Exception{
		
		List<Function>  functionList = functionService.getFunctionList();
		
	    return  ResponseData.success().add("functionList", functionList); 
		
	}
	
	
}
