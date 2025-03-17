package com.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.web.dto.UserDTO;
import com.web.service.UserService;


@WebServlet(urlPatterns = "/user/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		int idx = uri.lastIndexOf("/")+1;
		String cmd = uri.substring(idx);
		if("user-list".equals(cmd)) {
			request.setAttribute("users", userService.selectUsers(null));
		}else if("user-view".equals(cmd) || "user-update".equals(cmd)) {
			int uiNum = Integer.parseInt(request.getParameter("uiNum"));
			request.setAttribute("user", userService.selectUser(uiNum));
		}
		RequestDispatcher rd = request.getRequestDispatcher("/views" + uri);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		int idx = uri.lastIndexOf("/")+1;
		String cmd = uri.substring(idx);
		UserDTO user = new UserDTO();
		try {
			BeanUtils.populate(user, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String msg = "";
		String url = "";
		if("login".equals(cmd)) {
			UserDTO loginUser = userService.login(user.getUiId(), user.getUiPwd());
			HttpSession session = request.getSession();
			session.setAttribute("user", loginUser);
			msg = "아이디나 비밀번호가 잘못되었습니다.";
			url = "/views/user/login";
			if(loginUser!=null) {
				msg = loginUser.getUiName() + "님 반갑습니다.";
				url = "/";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		RequestDispatcher rd = request.getRequestDispatcher("/views/common/msg");
		rd.forward(request, response);
	}

}
