package com.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.web.dto.GameDTO;
import com.web.service.GameService;

@WebServlet(urlPatterns = "/game/*")
public class GameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  private GameService gameService = new GameService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); // /game/game-list , 실제경로 => /WEB-INF/views/game/game-list.jsp
		int idx = uri.lastIndexOf("/") + 1;
		String cmd = uri.substring(idx);
		if("game-list".equals(cmd)) {
			String search = request.getParameter("search");// giName, giPrice, giDesc, giGenre
			String searchStr = request.getParameter("searchStr"); //?
			Map<String,String> param = new HashMap<>();
			param.put("search", search);
			param.put("searchStr", searchStr);
			List<GameDTO> games = gameService.selectGames(param);
			request.setAttribute("games", games);
		}else if("game-view".equals(cmd) || "game-update".equals(cmd)) {
			int giNum = Integer.parseInt(request.getParameter("giNum"));
			GameDTO game = gameService.selectGame(giNum);
			request.setAttribute("game", game);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views" + uri + ".jsp"); // /game/game-list
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		int idx = uri.lastIndexOf("/") + 1;
		String cmd = uri.substring(idx);
		GameDTO game = new GameDTO();
		try {
			BeanUtils.populate(game, request.getParameterMap()); // game.setGiGenre();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String msg = "";
		String url = "/game/game-list";
		if("insert".equals(cmd)) {
			msg = "게임 등록이 실패하였습니다.";
			if(gameService.insertGame(game)==1) {
				msg = "게임 등록이 성공하였습니다.";
			}
		}else if("update".equals(cmd)) {
			msg = "게임 수정이 실패하였습니다.";
			if(gameService.updateGame(game)==1) {
				msg = "게임 수정이 성공하였습니다.";
			}
			url = "/game/game-view?giNum=" + game.getGiNum();
		}else if("delete".equals(cmd)) {
			msg = "게임 삭제가 실패하였습니다.";
			if(gameService.deleteGame(game.getGiNum())==1) {
				msg = "게임 삭제가 성공하였습니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		rd.forward(request, response);
	}

}
