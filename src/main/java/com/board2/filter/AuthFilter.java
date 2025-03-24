package com.board2.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.board2.dto.UserDTO;
import com.board2.service.UserService;


@WebFilter(urlPatterns = {"/user/*","/board/*"})
public class AuthFilter extends HttpFilter implements Filter {
	private static final boolean IS_TEST = true;
	private static final long serialVersionUID = 1L;
	private static List<String> ignores = new ArrayList<>();
	static {
		ignores.add("/user/login");
		ignores.add("/user/join");
	}
	private UserService userService = new UserService();
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String uri = req.getRequestURI(); // /user/logout
		if(!ignores.contains(uri)) {
			HttpSession session = req.getSession();
			if(session.getAttribute("user")==null) {
				if(!IS_TEST) {
					req.setAttribute("msg", "로그인이 필요한 요청입니다.");
					req.setAttribute("url", "/views/user/login");
					RequestDispatcher rd = req.getRequestDispatcher("/views/common/msg");
					rd.forward(request, response);
					return;
				}
				UserDTO user = userService.getUser(2);
				session.setAttribute("user", user);
			}
		}		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
