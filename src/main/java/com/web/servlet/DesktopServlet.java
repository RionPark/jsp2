package com.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.web.common.CommonCMD;
import com.web.dto.CpuDTO;
import com.web.dto.DesktopDTO;
import com.web.service.CpuService;
import com.web.service.DesktopService;


@WebServlet("/desktop/*")
public class DesktopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CpuService cpuService = new CpuService();
	private DesktopService desktopService = new DesktopService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = CommonCMD.getCmd(request);
		if("desktop-insert".equals(cmd) || "desktop-update".equals(cmd)) {
			List<CpuDTO> cpus = cpuService.selectCpus(null);
			request.setAttribute("cpus", cpus);
		}
		
		if("desktop-list".equals(cmd)) {
			List<DesktopDTO> desktops = desktopService.selectDesktops(null);
			request.setAttribute("desktops", desktops);
		}else if("desktop-view".equals(cmd) || "desktop-update".equals(cmd)) {
			int diNum = Integer.parseInt(request.getParameter("diNum"));
			DesktopDTO desktop = desktopService.selectDesktop(diNum);
			request.setAttribute("desktop", desktop);
		}
		CommonCMD.viewsForward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String cmd = CommonCMD.getCmd(request);
		DesktopDTO desktop = new DesktopDTO();
		try {
			BeanUtils.populate(desktop, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String url = "/desktop/desktop-list";
		String msg = "실패하였습니다.";
		if("insert".equals(cmd)) {
			if(desktopService.insertDesktop(desktop)==1) {
				msg = "성공입니다.";
			}
		}else if("update".equals(cmd)) {
			if(desktopService.updateDesktop(desktop)==1) {
				msg = "성공입니다.";
			}
		}
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		CommonCMD.msgForward(request, response);
	}

}
