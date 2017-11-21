/**
 * 
 */
package com.ibm.bluekey.test;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//import com.alibaba.fastjson.JSONObject;
import com.ibm.bluekey.bean.Access;
import com.ibm.bluekey.bean.AccessExample;
import com.ibm.bluekey.dao.AccessMapper;

import com.ibm.bluekey.bean.Employeeinfo;
import com.ibm.bluekey.dao.UserDao;
import com.ibm.bluekey.service.HttpRequestService;
/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：AccessTest   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年10月10日 下午4:59:00   
* @version        
*/

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class AccessTest {
	
	@Autowired
	AccessMapper accessMapper;
	
	@Autowired
	SqlSession sqlSession;
	@Autowired
	UserDao userDao;
	@Autowired
	HttpRequestService httpRequestService;
	/**
	 * 测试Access Mapper
	 * @throws Exception 
	 */
	@Test
	public void testCRUD() throws Exception{
		
			String url = "http://api.map.baidu.com/telematics/v3/weather?location=武汉&ak=8IoIaU655sQrs95uMWRWPDIa";
            String result=httpRequestService.sendGet(url, "");
            
            /*//返回xml数据并解析
            Document doc = DocumentHelper.parseText(result);
            String appid = doc.selectSingleNode("/message/body/params/appid").getText();
            String tag = doc.selectSingleNode("/message/body/params/tag").getText();
            String eid = doc.selectSingleNode("/message/body/params/eid").getText();*/
            
           
            
        
	}
	
	
}
