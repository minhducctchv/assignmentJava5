package edu.mdt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.mdt.entity.TaiKhoan;

public class AdminInterceptor implements HandlerInterceptor{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("admin hello");
		HttpSession session=request.getSession();
		TaiKhoan tk=(TaiKhoan) session.getAttribute("user");
		if(tk==null|| tk.isVaitro()!=true) {
			request.setAttribute("AdminError", "123");
			request.getRequestDispatcher("/trang-chu").forward(request, response);
			
			return false;
		}
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}
}
