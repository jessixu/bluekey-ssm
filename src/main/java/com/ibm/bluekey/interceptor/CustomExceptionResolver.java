/**
 * 
 */
package com.ibm.bluekey.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.bluekey.bean.CustomException;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：CustomExceptionResolver   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年11月9日 上午11:20:28   
* @version        
*/
public class CustomExceptionResolver implements HandlerExceptionResolver{

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.HandlerExceptionResolver#resolveException(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
	 */
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,Exception ex) {
		// TODO Auto-generated method stub
		//如果该 异常类型是系统 自定义的异常，直接取出异常信息，在错误页面展示。
		CustomException customException=null;
		if(ex instanceof CustomException){
			customException=(CustomException)ex;
	    	
	    }else{
	    	//如果该 异常类型不是系统 自定义的异常，构造一个自定义的异常类型（信息为“未知错误”）。
	    	customException=new CustomException("unknown error");
	    }

		//错误信息
		String message=customException.getMessage();
		
		ModelAndView modelAndView=new ModelAndView();
		
		//将错误信息传到页面
		modelAndView.addObject("message",message);
		
		//指向到错误界面
		modelAndView.setViewName("error");
		
		return modelAndView;
	}
}
