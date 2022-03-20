package com.ssafy.dao;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.google.gson.Gson;

public class reviewDAO {
	List<reviewDTO> reviews;
	int idx;
	
	private reviewDAO() {
		reviews = new ArrayList<>();
		idx = 1;
		reviews.add(new reviewDTO("", "", ""));
	}
	private static reviewDAO instance = new reviewDAO();
	public static reviewDAO getInstance() {
		return instance;
	}
	
	
	
	//영상별 리뷰 출력
	public List<reviewDTO> selectReview(String videoId) {
		List<reviewDTO> result = new ArrayList<reviewDTO>();
		for(reviewDTO r:reviews) {
			if(r.getVideoId().equals(videoId)) {
				result.add(r);
			}					
		}
		return result;
	}
	//리뷰 작성
	public void addReview(reviewDTO review) {
		review.setNo(idx++);
		reviews.add(review);
	}
	
	//리뷰 삭제
	public void removeReview(int reviewId) {
		for(reviewDTO r:reviews) {
			if(r.getNo()==reviewId) {
				reviews.remove(r);
				break;
			}
		}
	}
	
	//리뷰 하나만 출력
	public reviewDTO selectOne(int reviewId) {
		for(reviewDTO r:reviews) {
			if(r.getNo()==reviewId) {
				return r;
			}
		}
		return null;
	}
	
	//수정한 리뷰 저장
	public void modifyReview(reviewDTO review) {
		reviewDTO r = selectOne(review.getNo());
		r.setText(review.getText());		
	}
}
