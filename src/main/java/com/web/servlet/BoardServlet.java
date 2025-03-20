package com.web.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.web.common.CommonCMD;
import com.web.dto.BoardDTO;
import com.web.service.BoardService;

@WebServlet(urlPatterns = "/board/*")
@MultipartConfig(
	fileSizeThreshold = 1024*100,
	maxFileSize = 1024*1024*100,
	maxRequestSize = 1024*1024*500
		)
public class BoardServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = CommonCMD.getCmd(request);
		if("board-list".equals(cmd)) {
			List<BoardDTO> boards = boardService.selectBoards(null);
			request.setAttribute("boards", boards);
		}else if("board-view".equals(cmd) || "board-update".equals(cmd)) {
			String biNumStr = request.getParameter("biNum");
			int biNum = Integer.parseInt(biNumStr);
			BoardDTO board = boardService.selectBoard(biNum);
			request.setAttribute("board", board);
		}
		CommonCMD.viewsForward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String uploadPath = request.getServletContext().getRealPath("") + "/upload";
		File root = new File(uploadPath);
		if(!root.exists()) {
			root.mkdir();
		}
		Collection<Part> parts = request.getParts();
		for(Part part : parts) {
			String name = part.getName();
			String submittedFilename = part.getSubmittedFileName();
			out.println("name : " + name + ", submittedFilename : " + submittedFilename + "<br>");
		}
		
//		String cmd = CommonCMD.getCmd(request);
//		BoardDTO board = new BoardDTO();
//		try {
//			BeanUtils.populate(board, request.getParameterMap());
//		} catch (IllegalAccessException e) {
//			e.printStackTrace();
//		} catch (InvocationTargetException e) {
//			e.printStackTrace();
//		}
//		String msg = "";
//		String url = "/board/board-list";
//		if("insert".equals(cmd)) {
//			msg = "입력 실패";
//			if(boardService.insertBoard(board)==1) {
//				msg = "입력 성공";
//			}
//		}else if("update".equals(cmd)) {
//			msg = "수정 실패";
//			if(boardService.updateBoard(board)==1) {
//				msg = "수정 성공";
//			}
//		}else if("delete".equals(cmd)) {
//			msg = "삭제 실패";
//			if(boardService.deleteBoard(board.getBiNum())==1) {
//				msg = "삭제 성공";
//			}
//			
//		}
//		request.setAttribute("msg", msg);
//		request.setAttribute("url", url);
//		CommonCMD.msgForward(request, response);
	}

}
