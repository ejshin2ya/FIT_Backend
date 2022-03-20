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
 * Servlet implementation class modifyReview
 */
@WebServlet("/modifyReview")
public class modifyReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String videoId = request.getParameter("videoId");
		int reviewId = Integer.parseInt(request.getParameter("MreviewId"));
		String text = request.getParameter("content");
		String name = request.getParameter("Mname");
		reviewDTO review = reviewDAO.getInstance().selectOne(reviewId);
		review.setText(text);
		reviewDAO.getInstance().modifyReview(review);
		response.sendRedirect("detail?id="+videoId);
	}

}
