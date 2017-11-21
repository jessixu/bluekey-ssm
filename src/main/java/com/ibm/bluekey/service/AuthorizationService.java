/**
 * 
 */
package com.ibm.bluekey.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.bluekey.bean.Authorization;
import com.ibm.bluekey.bean.AuthorizationExample;
import com.ibm.bluekey.dao.AuthorizationMapper;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：AuthorizationService   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年11月2日 上午10:16:58   
* @version        
*/
@Service
public class AuthorizationService {
		@Autowired
		AuthorizationMapper authorizationMapper;
		
		/**
		 * authorization列表
		 * @return
		 */
		public List<Authorization> getAuthorizationList(){
			AuthorizationExample authorizationExample = new AuthorizationExample();
			authorizationExample.createCriteria().andDeletedEqualTo(0);
			
			return authorizationMapper.selectByExample(authorizationExample);
			
		}

		/**
		 * 新增authorization
		 * @param authorization
		 * @return 
		 */
		public int addAuthorization(Authorization authorization) {
			// TODO Auto-generated method stub
			return authorizationMapper.insertSelective(authorization);
		}

		/**
		 * 根据ID查找Authorization
		 * @param authRoleId
		 * @return 
		 */
		public Authorization getAuthorizationByID(int authRoleId) {
			// TODO Auto-generated method stub
			return authorizationMapper.selectByPrimaryKey(authRoleId);
		}

		/**
		 * 保存编辑
		 * @param authorization
		 * @return 
		 */
		public int saveAuthorization(Authorization authorization) {
			// TODO Auto-generated method stub
			return authorizationMapper.updateByPrimaryKeySelective(authorization);
		}

		/**
		 * 删除authorization 假删除
		 * @param authorization
		 * @return 
		 */
		public int deleteAuthorization(Authorization authorization) {
			// TODO Auto-generated method stub
			return authorizationMapper.updateByPrimaryKeySelective(authorization);
		}

		/**
		 * @return
		 */
		public JSONObject getAuthorizationMap() {
			JSONObject authJson = new JSONObject();
			AuthorizationExample authorizationExample = new AuthorizationExample();
			authorizationExample.createCriteria().andDeletedEqualTo(0);
			
			List<Authorization> authList =   authorizationMapper.selectByExample(authorizationExample);
			for(Authorization auth:authList ){
				authJson.put(auth.getAuthRoleId().toString(), auth.getName());
			
			}
			return authJson;
		}
}
