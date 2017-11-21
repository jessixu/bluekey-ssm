/**
 * 
 */
package com.ibm.bluekey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.bluekey.bean.MailTemplate;
import com.ibm.bluekey.bean.MailTemplateExample;
import com.ibm.bluekey.dao.MailTemplateMapper;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：MailTemplateService   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年10月12日 下午5:28:43   
* @version        
*/
@Service
public class MailTemplateService {
	
	@Autowired
	MailTemplateMapper mailTemplateMapper;
	
	
	/**
	 * 根据accessIdID查找邮件模板信息
	 * @param mailTemplateId
	 * @return
	 */
	 public List<MailTemplate> getMailTemplateByAccessId(int accessId){
		 MailTemplateExample mailTemplateExample = new MailTemplateExample();
		 mailTemplateExample.createCriteria().andAccessIdEqualTo(accessId);
		 return mailTemplateMapper.selectByExampleWithBLOBs(mailTemplateExample);
	 }
	 
	 /**
	  * 保存邮件模板
	  * @param mailTemplate
	  * @return
	  */
	 public int saveMailTemplate(MailTemplate mailTemplate){
		 
		 MailTemplateExample mailTemplateExample = new MailTemplateExample();
		 mailTemplateExample.createCriteria().andAccessIdEqualTo(mailTemplate.getAccessId());
		 
		 return mailTemplateMapper.updateByExampleSelective(mailTemplate, mailTemplateExample);
	 }

	/**
	 * @param mailTemplate
	 */
	public int addMailTemplate(MailTemplate mailTemplate) {
		
		return mailTemplateMapper.insertSelective(mailTemplate);
	}

}
