/**
 * 
 */
package com.ibm.bluekey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.bluekey.bean.Bu;
import com.ibm.bluekey.bean.BuExample;
import com.ibm.bluekey.dao.BuMapper;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：BuService   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年10月12日 上午11:06:18   
* @version        
*/
@Service
public class BuService {
	@Autowired
	BuMapper buMapper;
	
	/**
	 * 查询所有BU
	 * @return
	 */
	public  List<Bu> getBuList(){
		BuExample buExample = new BuExample();
		buExample.createCriteria().andDeletedEqualTo(0);
		
		return buMapper.selectByExample(buExample);
	}

	/**
	 * 保存BU修改
	 * @param bu
	 * @return 
	 */
	public int saveBu(Bu bu) {
		// TODO Auto-generated method stub
		return buMapper.updateByPrimaryKeySelective(bu);
	}

	/**
	 * 新增一条BU
	 * @param bu
	 */
	public int addBu(Bu bu) {
		// TODO Auto-generated method stub
		return buMapper.insertSelective(bu);
	}

	/**
	 * 根据buID c查询BU
	 * @param buId
	 * @return
	 */
	public Bu getBuByBuid(int buId) {
		// TODO Auto-generated method stub
		return buMapper.selectByPrimaryKey(buId);
	}

	/**
	 * 删除BU 假删除
	 * @param bu
	 * @return 
	 */
	public int deleteBu(Bu bu) {
		// TODO Auto-generated method stub
		return buMapper.updateByPrimaryKeySelective(bu);
	}
}
