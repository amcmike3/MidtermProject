package com.skilldistillery.jobsearch.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.jobsearch.data.InterviewQuestionDAO;

@Controller
public class InterviewQuestionController {

	@Autowired
	private InterviewQuestionDAO dao;
	
	
	
}
