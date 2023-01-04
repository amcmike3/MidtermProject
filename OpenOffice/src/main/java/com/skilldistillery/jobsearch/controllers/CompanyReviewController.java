package com.skilldistillery.jobsearch.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jobsearch.data.CompanyReviewDAO;
import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.CompanyReview;
import com.skilldistillery.jobsearch.entities.User;

@Controller
public class CompanyReviewController {

	@Autowired
	private CompanyReviewDAO dao;
	
	@RequestMapping("review.do")
	public String create(CompanyReview companyReview, Model model) {

		return "createUserReview";
		
	}
}
