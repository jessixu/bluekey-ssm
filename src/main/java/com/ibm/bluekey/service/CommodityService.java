/**
 * 
 */
package com.ibm.bluekey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.bluekey.bean.Commodity;
import com.ibm.bluekey.bean.CommodityExample;
import com.ibm.bluekey.dao.CommodityMapper;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：CommodityService   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年10月12日 下午1:43:08   
* @version        
*/
@Service
public class CommodityService {

	@Autowired
	CommodityMapper commodityMapper;
	
	/**
	 * 根据JId查找所有的Commodity
	 * @param J_id
	 * @return
	 */
	public List<Commodity> getCommodityListByJId(int J_id){
		CommodityExample commodityExample = new CommodityExample();
		commodityExample.createCriteria().andDeletedEqualTo(0).andJIdEqualTo(J_id);
		
		return commodityMapper.selectByExample(commodityExample);
		
		
	}
	
	/**
	 *查找所有的Commodity
	 * @return
	 */
	public List<Commodity> getCommodityList(){
		CommodityExample commodityExample = new CommodityExample();
		commodityExample.createCriteria().andDeletedEqualTo(0);
		
		return commodityMapper.selectByExample(commodityExample);
		
		
	}

	/**
	 * 新增一条Commodity
	 * @param commodity
	 * @return 
	 */
	public int addCommodity(Commodity commodity) {
		
		
		return commodityMapper.insertSelective(commodity);
	}

	/**
	 * 假删除
	 * @param commodity
	 * @return 
	 */
	public int deleteCommodity(Commodity commodity) {
		// TODO Auto-generated method stub
		return commodityMapper.updateByPrimaryKeySelective(commodity);
	}
	
	/**
	 * 根据cId查找Commodity
	 * @param cId
	 * @return
	 */
	public Commodity getCommodityByCid(int cId){
		return commodityMapper.selectByPrimaryKey(cId);
	}

	/**
	 * 保存Commodity
	 * @param commodity
	 * @return 
	 */
	public int saveCommodity(Commodity commodity) {
		
		// TODO Auto-generated method stub
		return commodityMapper.updateByPrimaryKeySelective(commodity);
	}

	
}
