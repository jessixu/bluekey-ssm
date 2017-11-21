/**
 * 
 */
package com.ibm.bluekey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.bluekey.bean.Access;
import com.ibm.bluekey.bean.AccessExample;
import com.ibm.bluekey.bean.SendRecord;
import com.ibm.bluekey.bean.SendRecordExample;
import com.ibm.bluekey.dao.AccessMapper;
import com.ibm.bluekey.dao.SendRecordMapper;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：SendRecordService   
* 类描述：   
* 创建人：Bruce-wu   
* 创建时间：2017年10月12日 上午10:50:18   
* @version        
*/
@Service
public class SendRecordService {
	
	@Autowired
	SendRecordMapper sendRecordMapper;
	
	
	
	/**
	 * 根据userID查找所有邮件申请发送记录
	 * @return 
	 */
	public List<SendRecord> getSendRecordByUserId(int userId) {
		
		SendRecordExample sendRecordExample = new SendRecordExample();
		sendRecordExample.createCriteria().andDeletedEqualTo(0).andUserIdEqualTo(userId);
		
		return sendRecordMapper.selectByExample(sendRecordExample);
	}



	/**
	 * 保存发送邮件记录
	 * @param sendRecord
	 * @return 
	 */
	public int saveRecord(SendRecord sendRecord) {
		// TODO Auto-generated method stub
		return sendRecordMapper.insertSelective(sendRecord);
	}
}
