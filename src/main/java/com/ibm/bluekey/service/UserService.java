/**
 * 
 */
package com.ibm.bluekey.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.bluekey.bean.AccessExample;
import com.ibm.bluekey.bean.Role;
import com.ibm.bluekey.bean.User;
import com.ibm.bluekey.bean.UserExample;
import com.ibm.bluekey.bean.UserExample.Criteria;
import java.util.Map;
import com.ibm.bluekey.dao.UserMapper;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：UserService   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年10月11日 下午5:31:55   
* @version        
*/
@Service
public class UserService {

	@Autowired
	UserMapper userMapper;
	
	
	/**
	 * 新增用户
	 * @param email
	 * @return
	 */
	public  User insertUser(String email){
		Date dateNow = new Date();
		User user= new User();
		user.setEmail(email);
		user.setActived(1);
		user.setCreateTime(dateNow);
		
		userMapper.insertSelective(user);
		
		return user;
	}
	
	/**
	 * 根据邮箱查找用户
	 * @param email
	 * @return
	 */
	public  List<User> findUserByEmail(String email){
		
		UserExample userExample = new UserExample();
		userExample.createCriteria().andEmailEqualTo(email).andDeletedEqualTo(0);
		
		return  userMapper.selectByExample(userExample);
	}
	
	public boolean updateRemember(User user){
		
		User updateUser =new User();
		updateUser.setRemember(user.getRemember());
		
		UserExample userExample = new UserExample();
		userExample.createCriteria().andUserIdEqualTo(user.getUserId());
		
		int result = userMapper.updateByExampleSelective(updateUser, userExample);
		if(result!=0){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * 获取超级管理员和普通管理员用户 
	 *
	 * @return List<User>
	 */
	public List<User> getAdminList() {
		
		Map<String,String> adminMap = new HashMap();
		StringBuffer superAdmin=new StringBuffer();  
		StringBuffer normalAdmin=new StringBuffer();  
		
		UserExample userExample = new UserExample();
		userExample.createCriteria().andDeletedEqualTo(0).andAuthorizationRoleGreaterThan(0); 
		
		return userMapper.selectByExample(userExample);
		
	}
	
	/**
	 * 获取超级管理员和普通管理员用户 映射
	 *
	 * @return Map<String,String>
	 */
	public Map<String,String> getAdminListMap() {
		
		Map<String,String> adminMap = new HashMap();
		StringBuffer superAdmin=new StringBuffer();  
		StringBuffer normalAdmin=new StringBuffer();  
		
		UserExample superUserExample = new UserExample();
		superUserExample.createCriteria().andDeletedEqualTo(0).andAuthorizationRoleEqualTo(1); 
		List<User> superAdminList = userMapper.selectByExample(superUserExample);
		for(User admin:superAdminList){
			superAdmin.append(admin.getEmail()+",");
		}
		
		UserExample userExample = new UserExample();
		userExample.createCriteria().andDeletedEqualTo(0).andAuthorizationRoleGreaterThan(1); 
		List<User> normalAdminList = userMapper.selectByExample(userExample);
		for(User normal:normalAdminList){
			normalAdmin.append(normal.getEmail()+",");
		}
		
		adminMap.put("super", superAdmin.toString());
		adminMap.put("normal",normalAdmin.toString());
		
		return adminMap;
		
	}

	/**
	 * 根据ID查找User
	 * @param userId
	 * @return
	 */
	public User getUserByID(int userId) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(userId);
	}

	/**
	 *新增user
	 * @param user
	 * @return 
	 */
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.insertSelective(user);
	}

	/**
	 * 更新用户
	 * @param user
	 * @return 
	 */
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKeySelective(user);
	}

	/**
	 * 删除User 假删除
	 * @param user
	 * @return 
	 */
	public int deleteUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKeySelective(user);
	}
	
	
}
