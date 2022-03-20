package com.ssafy.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.dao.videoDAO;

/**
 * Servlet implementation class searchServlet
 */
@WebServlet("/search")
public class searchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		request.setAttribute("videos", videoDAO.getInstance().searchVideo(keyword));
		request.getRequestDispatcher("board/index.jsp").forward(request, response);
	}

}
