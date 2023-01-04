package com.skilldistillery.jobsearch.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.jobsearch.data.CompanyReviewDAO;

@Controller
public class CompanyReviewController {

	@Autowired
	private CompanyReviewDAO dao;
}
