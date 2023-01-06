package com.skilldistillery.jobsearch.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jobsearch.data.InterviewDAO;
import com.skilldistillery.jobsearch.data.JobDAO;
import com.skilldistillery.jobsearch.entities.Interview;
import com.skilldistillery.jobsearch.entities.User;

@Controller
public class InterviewController {

	@Autowired
	private InterviewDAO dao;
	@Autowired
	private JobDAO jobDao;
	

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
		mv.addObject("job", jobDao.findJobById(jobId));
		mv.addObject("interviews", jobDao.findJobById(jobId).getInterviews());
		mv.setViewName("allInterviews");
		return mv;
	}
	
	@RequestMapping("sendToCreateInterview")
	public String sendToCreateInterview(Integer jobId) {
		return "createInterviewQuestion";
	}
	
	@RequestMapping("createInterview")
	public String createInterview(Integer jobId, Interview interview, Model model, HttpSession session) {
			interview = dao.createInterview(jobId, interview, (User)session.getAttribute("user"));
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
