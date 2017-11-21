/**
 * 
 */
package com.ibm.bluekey.service;

import org.springframework.stereotype.Service;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：generalFunctionService   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年10月26日 下午5:31:06   
* @version        
*/
@Service
public class generalFunctionService {
	
	//two array to be one 
	public static String[] concat(String[] a, String[] b) {  
	   String[] c= new String[a.length+b.length];  
	   System.arraycopy(a, 0, c, 0, a.length);  
	   System.arraycopy(b, 0, c, a.length, b.length);  
	   return c;  
	}  
}
