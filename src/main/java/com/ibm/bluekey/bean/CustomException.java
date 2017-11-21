/**
 * 
 */
package com.ibm.bluekey.bean;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：CustomException   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年11月16日 上午11:43:53   
* @version        
*/
public class CustomException extends Exception{
	
	//异常信息
	private String message;
	
	public CustomException(String message){
		super(message);
		this.message=message;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}
}
