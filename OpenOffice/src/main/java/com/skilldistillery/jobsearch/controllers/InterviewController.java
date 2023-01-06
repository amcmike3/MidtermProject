package com.skilldistillery.jobsearch.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jobsearch.data.InterviewDAO;
import com.skilldistillery.jobsearch.entities.Interview;

@Controller
public class InterviewController {

	@Autowired
	private InterviewDAO dao;

	@RequestMapping("interviewBio")
	public ModelAndView interviewBio(Integer interviewId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("interviewBio");
		mv.addObject("interview", dao.findInterviewById(interviewId));
		return mv;
	}

	@RequestMapping("allInterviews")
	public ModelAndView allInterviews(Integer jobId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("allInterviews");
		return mv;
	}
	
	@RequestMapping("createInterview")
	public String createInterview(Integer jobId, Interview interview, Model model) {
			interview = dao.createInterview(jobId, interview);
			model.addAttribute("interviewId", interview.getId());
			return "createInterviewQuestion";
	}
	
	@RequestMapping("updateInterview")
	public String updateInterview(Integer companyId, Integer interviewId, Model model) {		
		
		Interview interview = dao.findInterviewById(interviewId);
		model.addAttribute("interview", interview);
		model.addAttribute("companyId", companyId);
		
		return "updateInterview";
		
	}
	
	@RequestMapping("updatingInterview")
	public String updatingInterview(Integer companyId, Interview interview, Model model) {
		dao.updateInterview(interview.getId(), interview);
		model.addAttribute("company", dao.findCompanyById(companyId));
		
		return "companyBio";
	}
	
}
