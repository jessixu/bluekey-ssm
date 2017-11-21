/**
 * 
 */
package com.ibm.bluekey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.bluekey.bean.JobRole;
import com.ibm.bluekey.bean.JobRoleExample;
import com.ibm.bluekey.dao.JobRoleMapper;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：JobRoleService   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年10月12日 上午11:50:37   
* @version        
*/
@Service
public class JobRoleService {
	@Autowired
	JobRoleMapper jobRoleMapper;
	
	/**
	 * 根据FId 查找所有的job role
	 * @param FId
	 * @return
	 */
	public List<JobRole> getJobRoleListByFid(int FId){
		JobRoleExample jobRoleExample = new JobRoleExample();
		jobRoleExample.createCriteria().andDeletedEqualTo(0).andFIdEqualTo(FId);
		
		return jobRoleMapper.selectByExample(jobRoleExample);
				
	}


	/**
	 * 查找所有的job role
	 * @return
	 */
	public List<JobRole> getJobRoleList() {
		
		JobRoleExample jobRoleExample = new JobRoleExample();
		jobRoleExample.createCriteria().andDeletedEqualTo(0);
		
		return jobRoleMapper.selectByExample(jobRoleExample);
	}


	/**
	 * 保存Jobrole
	 * @param jobRole
	 * @return 
	 */
	public int saveJobRole(JobRole jobRole) {
		// TODO Auto-generated method stub
		return jobRoleMapper.updateByPrimaryKeySelective(jobRole);
	}


	/**
	 * 新增Jobrole
	 * @param jobRole
	 * @return 
	 */
	public int addJobRole(JobRole jobRole) {
		// TODO Auto-generated method stub
		return jobRoleMapper.insertSelective(jobRole);
	}


	/**
	 * 根据jId查询Jobrole
	 * @param jId
	 * @return
	 */
	public JobRole getjobRoleByJid(int jId) {
		// TODO Auto-generated method stub
		return jobRoleMapper.selectByPrimaryKey(jId);
	}


	/**
	 * 假删除
	 * @param jobRole
	 * @return 
	 */
	public int deleteJobRole(JobRole jobRole) {
		// TODO Auto-generated method stub
		return jobRoleMapper.updateByPrimaryKeySelective(jobRole);
	}
}
