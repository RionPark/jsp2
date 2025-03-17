package com.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.web.common.CommonCMD;
import com.web.dto.FoodDTO;
import com.web.dto.UserDTO;
import com.web.service.FoodService;

@WebServlet(urlPatterns = "/food/*")
public class FoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FoodService foodService = new FoodService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = CommonCMD.getCmd(request);
		if("food-list".equals(cmd)) {
			List<FoodDTO> foods = foodService.selectFoods(null);
			request.setAttribute("foods", foods);
		}else if("food-view".equals(cmd) || "food-update".equals(cmd)) {
			String fiNumStr = request.getParameter("fiNum");
			int fiNum = Integer.parseInt(fiNumStr);
			FoodDTO food = foodService.selectFood(fiNum);
			request.setAttribute("food", food);
		}
		CommonCMD.viewsForward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String cmd = CommonCMD.getCmd(request);
		FoodDTO food = new FoodDTO();
		try {
			BeanUtils.populate(food, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String msg = "";
		String url = "/food/food-list";
		if("insert".equals(cmd)) {
			msg = "입력 실패";
			if(foodService.insertFood(food)==1) {
				msg = "입력 성공";
			}
		}else if("update".equals(cmd)) {
			msg = "수정 실패";
			if(foodService.updateFood(food)==1) {
				msg = "수정 성공";
			}
		}else if("delete".equals(cmd)) {
			msg = "삭제 실패";
			if(foodService.deleteFood(food.getFiNum())==1) {
				msg = "삭제 성공";
			}
			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		CommonCMD.msgForward(request, response);
	}

}
