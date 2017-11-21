/**
 * 
 */
package com.ibm.bluekey.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;
import javax.ws.rs.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ibm.bluekey.bean.Authorization;
import com.ibm.bluekey.bean.CustomException;
import com.ibm.bluekey.bean.LoginUser;
import com.ibm.bluekey.bean.User;
import com.ibm.bluekey.service.AuthorizationService;
import com.ibm.bluekey.utils.ResponseData;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：AuthorizationController   
* 类描述：   
* 创建人：Bruce-wu   
* 创建时间：2017年11月2日 上午10:14:51   
* @version        
*/
@RequestMapping("/auth")
@Controller
public class AuthorizationController {
		
	@Autowired
	AuthorizationService authorizationService;
	
	/**
	 * authorization 分页显示列表页面
	 * @param beginNum
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResponseData getAuthList(@RequestParam(value="beginNum",defaultValue="1")Integer beginNum){
		PageHelper.startPage(beginNum,15);
		
		List<Authorization> authList =  authorizationService.getAuthorizationList();
		String[] authRightArr         ={"visit","edit admin","add admin","delete admin","edit authrization","add authrization","delete authrization"};
		String[] organizationRightArr ={"visit","edit BU","add BU","delete BU","edit function","add function","delete function","edit job role","add job role","delete job role","edit commodity","add commodity","delete commodity"};
		String[] roleRightArr		  ={"visit","edit","add","delete"};
	    String[] accessRightArr       ={"visit","edit","add","delete"};
		
		PageInfo pageInfo = new PageInfo(authList,5);
		return ResponseData.success().add("pageInfo", pageInfo).add("authRightArr", authRightArr).add("organizationRightArr", organizationRightArr).add("roleRightArr", roleRightArr).add("accessRightArr", accessRightArr);
	}
	
	/**
	 * 根据ID查询authorization
	 * @param req
	 * @param authorization
	 * @param authRight
	 * @return
	 */
	@RequestMapping(value="/authorization/{authRoleId}", method=RequestMethod.GET)
	@ResponseBody
	public ResponseData getAuthorizationByID(HttpServletRequest req,@PathVariable("authRoleId") int authRoleId ){
		
		
		try{
			Authorization auth = authorizationService.getAuthorizationByID(authRoleId);
			//为空抛出异常
			if(auth==null){
				throw new CustomException("The auth isn't exist");
			}
			return ResponseData.success().add("auth", auth);
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
	}
	
	/**
	 * 新增authorization
	 * @param req
	 * @param authorization
	 * @param authRight
	 * @return
	 */
	@RequestMapping(value="/authorization", method=RequestMethod.PUT)
	@ResponseBody
	public ResponseData addAuthorization(HttpServletRequest req,Authorization authorization ){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		authorization.setAuthRoleId(null);
		authorization.setUpdateTime(dateNow);
		authorization.setUpdateOperator(loginUser.getUser().getEmail());
		authorization.setCreateTime(dateNow);
		authorization.setCreateOperator(loginUser.getUser().getEmail());
		
		try{
			authorizationService.addAuthorization(authorization);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
	}
	
	/**
	 * 保存authorization
	 * @param req
	 * @param authorization
	 * @param authRight
	 * @return
	 */
	@RequestMapping(value="/authorization", method=RequestMethod.POST)
	@ResponseBody
	public ResponseData saveAuthorization(HttpServletRequest req,Authorization authorization ){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		authorization.setUpdateTime(dateNow);
		authorization.setUpdateOperator(loginUser.getUser().getEmail());
		authorization.setCreateTime(dateNow);
		authorization.setCreateOperator(loginUser.getUser().getEmail());
		
		try{
			authorizationService.saveAuthorization(authorization);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
	}
	
	
	/**
	 * 删除authorization
	 * @param req
	 * @param authorization
	 * @param authRight
	 * @return
	 */
	@RequestMapping(value="/authorization/{authRoleId}", method=RequestMethod.DELETE)
	@ResponseBody
	public ResponseData deleteAuthorization(HttpServletRequest req,@PathVariable("authRoleId") int authRoleId ){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
		Authorization authorization = new Authorization();
		authorization.setAuthRoleId(authRoleId);
		authorization.setUpdateTime(dateNow);
		authorization.setUpdateOperator(loginUser.getUser().getEmail());
		
		authorization.setDeleted(1);
		try{
			authorizationService.deleteAuthorization(authorization);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
	}
	
	@RequestMapping("/authList")
	@ResponseBody
	public ResponseData getAuthList(){
		List<Authorization> authList = authorizationService.getAuthorizationList();
		
		return ResponseData.success().add("authList",authList);
	}
}
