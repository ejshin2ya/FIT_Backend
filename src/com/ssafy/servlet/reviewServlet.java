package com.ssafy.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.dao.reviewDAO;
import com.ssafy.dao.reviewDTO;

/**
 * Servlet implementation class reviewServlet
 */
@WebServlet("/review")
public class reviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String videoId = request.getParameter("videoId");
		String userId = request.getParameter("userId");
		String text = request.getParameter("text");
		reviewDAO.getInstance().addReview(new reviewDTO(videoId, userId, text));
		response.sendRedirect("detail?id="+videoId);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String videoId = request.getParameter("videoId");
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		reviewDAO.getInstance().removeReview(reviewId);
		response.sendRedirect("detail?id="+videoId);
	}
}
