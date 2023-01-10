package com.skilldistillery.jobsearch.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.jobsearch.data.InterviewDAO;
import com.skilldistillery.jobsearch.data.InterviewQuestionDAO;
import com.skilldistillery.jobsearch.entities.Interview;
import com.skilldistillery.jobsearch.entities.InterviewQuestion;

@Controller
public class InterviewQuestionController {

	@Autowired
	private InterviewQuestionDAO dao;
	
	@Autowired
	private InterviewDAO interviewDao;
	
	
	@RequestMapping(path = "createInterviewQuestion", method = RequestMethod.POST)
	public String createInterviewQuestion(InterviewQuestion question, Integer interviewId, Model model) {
		dao.addInterviewQuestion(question, interviewId);
		model.addAttribute("interview", interviewDao.findInterviewById(interviewId));
		
		return"redirect:createInterviewQuestion?interviewId=" + interviewId;
	}
	@RequestMapping(path = "createInterviewQuestion", method = RequestMethod.GET)
	public String createInterviewQuestionGet(Integer interviewId, Model model) {
		model.addAttribute("interview", interviewDao.findInterviewById(interviewId));
		return"interviewBio";
	}
	
	
	@RequestMapping("updateInterviewQuestion")
	public String updateInterviewQuestions(Integer questionId, Model model, Integer interviewId) {
		InterviewQuestion question = dao.updateInterviewQuestion(questionId, dao.findInterviewQuestionById(questionId));
		model.addAttribute("question", question);
		model.addAttribute("interviewId", interviewId);
		model.addAttribute("companyId", dao.findInterviewById(interviewId).getJob().getCompany().getId());
		return "updateInterviewQuestion";
	}
	
	@RequestMapping("updatingInterviewQuestion")
	public String updatingInterviewQuestion(InterviewQuestion question, Integer interviewId, Model model, Integer companyId ) {
		dao.updateInterviewQuestion(question.getId(), question);
		model.addAttribute("interview", dao.findInterviewById(interviewId) );
		model.addAttribute("companyId", companyId);
		return "updateInterview";
	}

	@RequestMapping(path = "addAnotherInterviewQuestion", method = RequestMethod.POST)
	public String addAnotherInterviewQuestion(InterviewQuestion question, Integer interviewId, Model model ) {
		question = dao.addInterviewQuestion(question, interviewId);
		model.addAttribute("interviewId", interviewId);
		return "redirect:addAnotherInterviewQuestion?interviewId=" + interviewId;
	}
	@RequestMapping(path = "addAnotherInterviewQuestion", method = RequestMethod.GET)
	public String addAnotherInterviewQuestionGet(Integer interviewId, Model model ) {
		model.addAttribute("interviewId", interviewId);
		return "createInterviewQuestion";
	}
	
	@RequestMapping(path = "addAnotherInterviewQuestionFromUpdate", method = RequestMethod.POST)
	public String addAnotherInterviewQuestionFromUpdate(InterviewQuestion question, Integer interviewId, Model model) {
		dao.updateInterviewQuestion(question.getId(), question);
		model.addAttribute("interviewId", interviewId);
		return "redirect:addAnotherInterviewQuestionFromUpdate?interviewId=" + interviewId;
	}
	@RequestMapping(path = "addAnotherInterviewQuestionFromUpdate", method = RequestMethod.GET)
	public String addAnotherInterviewQuestionFromUpdateGet(Integer interviewId, Model model) {
		model.addAttribute("interviewId", interviewId);
		return "createInterviewQuestion";
	}
	
}
