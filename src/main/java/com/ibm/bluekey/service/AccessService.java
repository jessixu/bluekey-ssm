/**
 * 
 */
package com.ibm.bluekey.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.bluekey.bean.Access;
import com.ibm.bluekey.bean.AccessExample;
import com.ibm.bluekey.bean.CustomException;
import com.ibm.bluekey.bean.Role;
import com.ibm.bluekey.dao.AccessMapper;
import com.ibm.bluekey.dao.RoleMapper;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：AccessService   
* 类描述：   
* 创建人：Bruce-wu   
* 创建时间：2017年10月11日 上午10:10:34   
* @version        
*/
@Service
public class AccessService {
	
	@Autowired
	AccessMapper accessMapper;
	@Autowired
	RoleMapper roleMapper;
	
	
	
	/**
	 * 查找所有access列表
	 * @return 
	 */
	public List<Access> getAllAccess() {
		
		AccessExample accessExample = new AccessExample();
		accessExample.createCriteria().andDeletedEqualTo(0);
		
		return accessMapper.selectByExample(accessExample);
	}

	/**
	 * 根据role id查询出角色的access map
	 * @param roleId
	 * @return
	 * @throws Exception 
	 */
	public ArrayList<Map<String, String>> getResultByRoleId(int roleId) throws Exception {
		
		ArrayList<Map<String,String>> resultList = new ArrayList();
		Map<String,String> GeneralAccessMap =  new HashMap<String,String>();
		Map<String,String> FunctionAccessMap =  new HashMap<String,String>();
		Map<String,String> generalMap = new HashMap<String,String>();
    	Map<String,String> functionMap = new HashMap<String,String>();
		
    	List<Access> accessList =getAllAccess();
    	for(int i=0;i<accessList.size();i++){
    		
    		if(accessList.get(i).getParentPart()==1){
    			
    			/*String accessId = Integer.toString(accessList.get(i).getAccessid());*/
    			GeneralAccessMap.put(Integer.toString(accessList.get(i).getAccessId()), accessList.get(i).getShortTitle());
	    	}else if(accessList.get(i).getParentPart()==2){
	    		FunctionAccessMap.put(Integer.toString(accessList.get(i).getAccessId()), accessList.get(i).getShortTitle());
	    	}
	    }
    	
    	Role  role = roleMapper.selectByPrimaryKey(roleId);
    	
    	if(role==null){
			throw new CustomException("The role isn't exist");
		}
    	
    	String[] accessArr = role.getAccessList().split(",");
    	
    	for(int i=0;i<accessArr.length; i++){
    		if(GeneralAccessMap.containsKey (accessArr[i])){
    			generalMap.put(accessArr[i], GeneralAccessMap.get(accessArr[i]));
    		}else if(FunctionAccessMap.containsKey (accessArr[i])){
    			functionMap.put(accessArr[i], FunctionAccessMap.get(accessArr[i]));
    		}
    	}
    	
    	resultList.add(generalMap);
    	resultList.add(functionMap);
		return resultList;
	}

	/**
	 * @param accessId
	 * @return
	 */
	public Access getAccessById(int accessId) {
		
	
		return accessMapper.selectByPrimaryKey(accessId);
	}

	/**
	 * 模糊搜索查询access *(查询tital,shortTital,function,apply step)
	 * 
	 * @param trim
	 * @return
	 */
	public List<Access> getAccessListBySearch(String search) {
		
		
		return accessMapper.selectAccessLikeSearch(search);
	}
	
	/**
	 * 模糊查找Access （只查找tital和short tital）
	 * @param search
	 * @return
	 */
	public List<Access> getAccessListBySearchOnlyTitle(String search){
		
		return accessMapper.selectAccessLikeSearchOnlyTitle(search);
	}

	
	/**
	 * 保存Access
	 * @param accessId
	 * @return
	 */
	public int saveAccess(Access access) {
		
		
		return accessMapper.updateByPrimaryKeySelective(access);
	}

	
	/**
	 * 新增一条access记录
	 * @param access
	 * @return 
	 */
	public int addAccess(Access access) {
		
		return accessMapper.insertSelective(access);
		
	}

	
	/**
	 * 删除一条access (假删除)
	 * @param accessId
	 */
	public int deleteAccess(Access access) {
		// TODO Auto-generated method stub
		return accessMapper.updateByPrimaryKeySelective(access);
	}

	/**
	 * 根据类型权限 找出所有的access
	 * @return
	 */
	public Map<String, List<String[]>> getAccssListByClass() {
		
		Map<String, List<String[]>> accessMap = new HashMap<String, List<String[]>>();
		
		//找到所有的GeneralAccess
		AccessExample generalAccessExample = new AccessExample();
		generalAccessExample.createCriteria().andDeletedEqualTo(0).andParentPartEqualTo(1);
		
		List<Access> generaAccessList =  accessMapper.selectByExample(generalAccessExample);
		ArrayList<String[]> generaList = new ArrayList();
		
		for(Access access:generaAccessList){
	    	String[] temp={access.getAccessId().toString(),access.getShortTitle()};
	    	generaList.add(temp);
	    }
		accessMap.put("generaAccessList",generaList);
		
		//找到所有的functionAccess
		AccessExample functionAccessExample = new AccessExample();
		functionAccessExample.createCriteria().andDeletedEqualTo(0).andParentPartEqualTo(2);
		
		List<Access> functionAccessList =  accessMapper.selectByExample(functionAccessExample);
		ArrayList<String[]> functionList = new ArrayList();
		
		for(Access access:functionAccessList){
	    	String[] temp={access.getAccessId().toString(),access.getShortTitle()};
	    	functionList.add(temp);
	    }
		
		accessMap.put("functionAccessList",functionList);
		
		return accessMap;
	}

	
	
}
