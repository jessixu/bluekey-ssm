/**
 * 
 */
package com.ibm.bluekey.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.bluekey.bean.LoginUser;
import com.ibm.bluekey.bean.MailTemplate;
import com.ibm.bluekey.bean.SendRecord;
import com.ibm.bluekey.bean.User;
import com.ibm.bluekey.service.MailTemplateService;
import com.ibm.bluekey.service.SendRecordService;
import com.ibm.bluekey.utils.ResponseData;
import com.ibm.bluemail.service.BlueMailService;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：MailController   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年10月17日 下午2:57:28   
* @version        
*/
@Controller
@RequestMapping("/mail")
public class MailController {
	
	@Autowired
	MailTemplateService mailTemplateService;
	@Autowired
	SendRecordService  sendRecordService;
	
	/**
	 * 保存邮件模板
	 * @param mailTemplate
	 * @return
	 */
	@RequestMapping("/saveMail")
	@ResponseBody
	public ResponseData saveMailTemplate(HttpServletRequest req,MailTemplate mailTemplate){
		
		LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
		
		Date dateNow = new Date();
				
		if(mailTemplate.getAccessId()==null){
			return ResponseData.error().add("errorMsg", "Please fill in access information first");
		}
		
		try{
			mailTemplate.setUpdateTime(dateNow);
			mailTemplate.setUpdateOperator(loginUser.getUser().getEmail());
			
			if(mailTemplate.getTempId()==null){
				mailTemplate.setCreateTime(dateNow);
				mailTemplate.setCreateOperator(loginUser.getUser().getEmail());
				mailTemplateService.addMailTemplate(mailTemplate);
			}else{
				mailTemplateService.saveMailTemplate(mailTemplate);
			}
			
			return ResponseData.success();
		}catch(Exception e){
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
	
	@RequestMapping("/sendEmail")
	@ResponseBody
	public ResponseData sendEmail(HttpServletRequest req,SendRecord sendRecord){
		
		
		try{
			LoginUser loginUser = (LoginUser) req.getSession().getAttribute("loginUser");
			
			BlueMailService bms = new BlueMailService();
			Date dateNow = new Date();
			sendRecord.setCreateTime(dateNow); 
			sendRecordService.saveRecord(sendRecord);
			
			String responseCode =bms.sendTestEmail("brucel@cn.ibm.com","brucel@cn.ibm.com","","brucel@cn.ibm.com",sendRecord.getEmailSubject(),sendRecord.getContent(),"abled");//send mail 
			System.out.println("sendEmail_responseCode:"+responseCode);
			//String responseCode =bms.sendTestEmail(sendRecord.getReceiveEmail(),loginUser.getUser().getEmail(),"",loginUser.getUser().getEmail(),sendRecord.getEmailSubject(),sendRecord.getContent(),"abled");//send mail 
			JSONObject blueMailJson = new JSONObject(responseCode);
			JSONObject getStatus = blueMailJson.getJSONObject("getStatus");
			String status = getStatus.getString("status");
			
			return ResponseData.success();
		}catch(Exception  e ){
			
			e.printStackTrace(); 
			return ResponseData.error();
		}
		
	}
}
