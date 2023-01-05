package com.skilldistillery.jobsearch.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jobsearch.data.InterviewDAO;

@Controller
public class InterviewController {

	@Autowired
	private InterviewDAO dao;

	@RequestMapping("interviewBio")
	public ModelAndView interviewBio(Integer jobId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("interviewBio");
		return mv;
	}

	@RequestMapping("allInterviews")
	public ModelAndView allInterviews(Integer jobId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("allInterviews");
		return mv;
	}
	
	@RequestMapping("createInterview")
	public String createInterview(Integer jobId) {
		
		return "createInterview";
	}
}
