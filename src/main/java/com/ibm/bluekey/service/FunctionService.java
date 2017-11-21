/**
 * 
 */
package com.ibm.bluekey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.bluekey.bean.Function;
import com.ibm.bluekey.bean.FunctionExample;
import com.ibm.bluekey.dao.FunctionMapper;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：FunctionService   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年10月12日 上午11:32:20   
* @version        
*/
@Service
public class FunctionService {
	@Autowired
	FunctionMapper functionMapper;
	
	
	/**
	 * 根据BuId 查找所有function
	 * @param BuId
	 * @return
	 */
	public List<Function> getFunctionListByBuId(int BuId){
		FunctionExample functionExample = new FunctionExample();
		functionExample.createCriteria().andDeletedEqualTo(0).andBuIdEqualTo(BuId);
		
		return functionMapper.selectByExample(functionExample);
				
	}
	
	
	/**
	 * 查找所有的Function
	 * @return
	 */
	public List<Function> getFunctionList() {
		
		FunctionExample functionExample = new FunctionExample();
		functionExample.createCriteria().andDeletedEqualTo(0);
		
		return functionMapper.selectByExample(functionExample);
	}


	/**
	 * 保存function
	 * @param function
	 * @return 
	 */
	public int saveFunction(Function function) {
		// TODO Auto-generated method stub
		return functionMapper.updateByPrimaryKeySelective(function);
	}


	/**
	 * 新增function
	 * @param function
	 * @return 
	 */
	public int addFunction(Function function) {
		// TODO Auto-generated method stub
		return functionMapper.insertSelective(function);
	}


	/**
	 * 根据FID查找function
	 * @param fId
	 * @return
	 */
	public Function getFunctionByFid(int fId) {
		// TODO Auto-generated method stub
		return functionMapper.selectByPrimaryKey(fId);
	}


	/**
	 * 删除function 假删除
	 * @param function
	 * @return 
	 */
	public int deleteFunction(Function function) {
		// TODO Auto-generated method stub
		return functionMapper.updateByPrimaryKeySelective(function);
	}
}
