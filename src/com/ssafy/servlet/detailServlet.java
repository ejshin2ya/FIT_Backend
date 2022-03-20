package com.ssafy.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.dao.reviewDAO;
import com.ssafy.dao.videoDAO;

/**
 * Servlet implementation class detailServlet
 */
@WebServlet("/detail")
public class detailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String id = request.getParameter("id");
		videoDAO.getInstance().addViewPoint(id);
		request.setAttribute("video", videoDAO.getInstance().selectOne(id));
		request.setAttribute("reviews", reviewDAO.getInstance().selectReview(id));
		request.getRequestDispatcher("board/detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
