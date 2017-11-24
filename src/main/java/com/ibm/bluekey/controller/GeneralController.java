/**
 * 
 */
package com.ibm.bluekey.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.bluekey.bean.Access;
import com.ibm.bluekey.bean.LoginUser;
import com.ibm.bluekey.bean.User;
import com.ibm.bluekey.service.UserService;
import com.ibm.bluekey.utils.LDAP;
import com.ibm.bluekey.utils.ResponseData;
import com.ibm.bluemail.service.BlueMailService;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：generalController   
* 类描述：   
* 创建人：bruce-wu   
* 创建时间：2017年10月11日 下午5:24:58   
* @version        
*/
@Controller
@RequestMapping("/general")
public class GeneralController {
	
	@Autowired
	UserService userService;
	
	/**
	 * 用户反馈页面
	 * @return
	 */
	@RequestMapping("/feedback")
	public String feedback(){
		
		return "general/feedback";
	}
	
	/**
	 * 处理feedback
	 * @param req
	 * @return
	 */
	@RequestMapping("/doFeedback")
	@ResponseBody
	public ResponseData doFeedback(HttpServletRequest req){
		
		try{
			LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
			String subject = req.getParameter("subject");
			String content = req.getParameter("content");
			
			BlueMailService bms = new BlueMailService();
			
			Map<String,String> adminMap = userService.getAdminListMap();
			
			System.out.println("adminMap:"+adminMap);
			String responseCode =bms.sendTestEmail(adminMap.get("super"),adminMap.get("normal"),"",loginUser.getUser().getEmail(),subject,content,"abled");//send mail 
			/*JSONObject blueMailJson = new JSONObject(responseCode);
			JSONObject getStatus = blueMailJson.getJSONObject("getStatus");
			String status = getStatus.getString("status");
			*/
			System.out.println("feedback_responseCode:"+responseCode);
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	/**
	 * 访问about 页面
	 * @return
	 */
	@RequestMapping("/about")
	public String about(){
		
		return "general/about";
	}
	
	/**
	 * 访问setting 页面
	 * @return
	 */
	@RequestMapping("/setting")
	public String setting(){
		
		return "general/setting";
	}
	
	
}
