package com.ssafy.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.dao.videoDAO;

/**
 * Servlet implementation class mainServlet
 */
@WebServlet("/main")
public class mainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("id");
		Map<String, String> partMap = new HashMap<String, String>();
		partMap.put("all", "전신");
		partMap.put("body", "전신");
		partMap.put("top", "상체");
		partMap.put("bottom", "하체");
		partMap.put("stomach", "복부");
		if(part==null || part.equals("all")) {
			request.setAttribute("videos", videoDAO.getInstance().selectAll());
			request.getRequestDispatcher("board/index.jsp").forward(request, response);
		}else {
			request.setAttribute("videos", videoDAO.getInstance().selectPart(partMap.get(part)));
			System.out.println(videoDAO.getInstance().selectPart(partMap.get(part)).size());
			request.getRequestDispatcher("board/index.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
