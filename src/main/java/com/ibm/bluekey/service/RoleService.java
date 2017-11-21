/**
 * 
 */
package com.ibm.bluekey.service;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.bluekey.bean.Authorization;
import com.ibm.bluekey.bean.AuthorizationExample;
import com.ibm.bluekey.bean.Bu;
import com.ibm.bluekey.bean.BuExample;
import com.ibm.bluekey.bean.Function;
import com.ibm.bluekey.bean.FunctionExample;
import com.ibm.bluekey.bean.Role;
import com.ibm.bluekey.bean.RoleExample;
import com.ibm.bluekey.dao.BuMapper;
import com.ibm.bluekey.dao.FunctionMapper;
import com.ibm.bluekey.dao.RoleMapper;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：RoleService   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年10月12日 下午3:19:09   
* @version        
*/
@Service
public class RoleService {
	@Autowired
	RoleMapper roleMapper;
	@Autowired
	BuMapper buMapper;
	@Autowired
	FunctionMapper functionMapper;
	
	/**
	 * 根据条件查询出role
	 * @param role
	 * @return
	 */
	public List<Role> getRolebyCondition(Role role){
		
		RoleExample roleExample = new RoleExample();
		
		if(role.getFunction()==null){
			roleExample.createCriteria().andDeletedEqualTo(0).andBuEqualTo(role.getBu());
		}else{
			if(role.getJobRole()==null){
				roleExample.createCriteria().andDeletedEqualTo(0).andBuEqualTo(role.getBu()).andFunctionEqualTo(role.getFunction());
			}else{
				if(role.getCommodity()==null){
					roleExample.createCriteria().andDeletedEqualTo(0).andBuEqualTo(role.getBu()).andFunctionEqualTo(role.getFunction()).andJobRoleEqualTo(role.getJobRole());
				}else{
					roleExample.createCriteria().andDeletedEqualTo(0).andBuEqualTo(role.getBu()).andFunctionEqualTo(role.getFunction()).andJobRoleEqualTo(role.getJobRole()).andCommodityEqualTo(role.getCommodity());
				}
			}
		}
		
		
		
		return roleMapper.selectByExample(roleExample);
	}
	
	/**
	 * 根据roleid 查询出Role
	 * @param roleId
	 * @return
	 */
	public Role getRoleById(int roleId) {
		
		return roleMapper.selectByPrimaryKey(roleId);
	}

	/**
	 * 查找所有role
	 * @return
	 */
	public List<Role> getRoleList() {
		RoleExample roleExample = new RoleExample();
		roleExample.createCriteria().andDeletedEqualTo(0);
		
		return roleMapper.selectByExample(roleExample);
	}

	/**
	 * @param role
	 * @return 
	 */
	public int addRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.insertSelective(role);
	}

	/**
	 * 保存编辑role
	 * @param role
	 * @return 
	 * 
	 */
	public int saveRole(Role role) {
		
		return roleMapper.updateByPrimaryKeySelective(role);
	}

	/**
	 * 删除role
	 * @param role
	 * @return 
	 */
	public int deleteRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.updateByPrimaryKeySelective(role);
	}

	/**
	 * @return
	 */
	public JSONObject getBuMap() {
		JSONObject buJson = new JSONObject();
		
		BuExample buExample = new BuExample();
		buExample.createCriteria().andDeletedEqualTo(0);
		List<Bu> buList =   buMapper.selectByExample(buExample);
		
		for(Bu bu:buList ){
			buJson.put(bu.getBuId().toString(), bu.getName());
		
		}
		return buJson;
		
	}

	/**
	 * @return
	 */
	public JSONObject getFuntionMap() {
		JSONObject functionJson = new JSONObject();
		
		FunctionExample functionExample = new FunctionExample();
		functionExample.createCriteria().andDeletedEqualTo(0);
		List<Function> functionList =   functionMapper.selectByExample(functionExample);
		
		for(Function function:functionList ){
			functionJson.put(function.getfId().toString(), function.getName());
		
		}
		return functionJson;
	}

	
	
}
