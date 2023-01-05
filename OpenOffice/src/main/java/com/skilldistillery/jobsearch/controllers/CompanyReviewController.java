package com.skilldistillery.jobsearch.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jobsearch.data.CompanyReviewDAO;

@Controller
public class CompanyReviewController {

	@Autowired
	private CompanyReviewDAO dao;
	
//	@RequestMapping("deleteReview.do")
//	public String deleteReview(Integer reviewId) {
//		dao.deleteReview(reviewId);
//
//		return "successfullyDeletedPage";
//	}
}
