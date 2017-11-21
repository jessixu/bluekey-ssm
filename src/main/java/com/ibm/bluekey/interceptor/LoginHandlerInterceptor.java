/**
 * 
 */
package com.ibm.bluekey.interceptor;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.bluekey.bean.LoginUser;
/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：LoginHandlerInterceptor   
* 类描述：   
* 创建人：tony-wu   
* 创建时间：2017年11月8日 下午6:06:44   
* @version        
*/
public class LoginHandlerInterceptor implements HandlerInterceptor  {

	/* (non-Javadoc)
	 * 在执行Handler完成后执行此方法，使用于统一的异常处理，统一的日志处理等
	 * @see org.springframework.web.servlet.HandlerInterceptor#afterCompletion(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * 进入Handler方法之后，返回ModelAndView之前执行，使用场景从ModelAndView参数出发，比如，将公用的模型数据在这里传入到视图，也可以统一指定显示的视图等
	 * @see org.springframework.web.servlet.HandlerInterceptor#postHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * 在进入Handler方法之前执行了，使用于身份认证，身份授权，登陆校验等，比如身份认证，用户没有登陆，拦截不再向下执行，返回值为 false ，即可实现拦截；否则，返回true时，拦截不进行执行；
	 * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String url = request.getRequestURI();
		System.out.println(url);
		if(url.indexOf("login")>=0){
			return true;
		}
		
		LoginUser loginUser  = (LoginUser) request.getSession().getAttribute("loginUser");
		if(loginUser!=null){
			return true;
		}
		
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
		return false;
	}

}
