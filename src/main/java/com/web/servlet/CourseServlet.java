package com.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.common.CommonCMD;
import com.web.service.CourseService;


@WebServlet("/course/*")
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CourseService courseService = new CourseService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = CommonCMD.getCmd(request);
		String msg = "";
		String url = "";
		if("si-ci-update".equals(cmd)) {
			int siNum = Integer.parseInt(request.getParameter("siNum"));
			String[] ciNums = request.getParameterValues("ciNum");
			List<Integer> ciNumList = new ArrayList<>();
			if(ciNums!=null) {
				for(String ciNum : ciNums) {
					ciNumList.add(Integer.parseInt(ciNum));
				}
			}
			boolean isSuccess = courseService.updateMapSiCi(siNum, ciNumList);
			msg = "수강 변경이 실패하였습니다.";
			if(isSuccess) {
				msg = "수강 변경이 성공하였습니다.";
			}
			url = "/student/student-view?siNum=" + siNum;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		CommonCMD.msgForward(request, response);
	}

}
