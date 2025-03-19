package com.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.common.CommonCMD;
import com.web.dto.CourseDTO;
import com.web.dto.StudentDTO;
import com.web.service.CourseService;
import com.web.service.StudentService;


@WebServlet(urlPatterns = "/student/*")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StudentService studentService = new StudentService();
    private CourseService courseService = new CourseService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = CommonCMD.getCmd(request);
		if("student-list".equals(cmd)) {
			List<StudentDTO> students = studentService.getStudents(null);
			request.setAttribute("students", students);
		}else if("student-view".equals(cmd) || "student-update".equals(cmd)) {
			int siNum = Integer.parseInt(request.getParameter("siNum"));
			StudentDTO student = studentService.getStudent(siNum);
			List<CourseDTO> courses = courseService.getCoursesBySiNum(siNum);
			request.setAttribute("courses", courses);
			request.setAttribute("student", student);
		}
		CommonCMD.viewsForward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
