package com.skilldistillery.jobsearch.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jobsearch.data.InterviewDAO;
import com.skilldistillery.jobsearch.data.InterviewQuestionDAO;
import com.skilldistillery.jobsearch.entities.InterviewQuestion;

@Controller
public class InterviewQuestionController {

	@Autowired
	private InterviewQuestionDAO dao;
	
	@Autowired
	private InterviewDAO interviewDao;
	
	
	@RequestMapping("createInterviewQuestion")
	public String createInterviewQuestion(InterviewQuestion question, Integer interviewId, Model model) {
		dao.addInterviewQuestion(question, interviewId);
		model.addAttribute("interview", interviewDao.findInterviewById(interviewId));
		
		return"interviewBio";
	}
	
	@RequestMapping("updateInterviewQuestion")
	public String updateInterviewQuestions(Integer questionId, Model model, Integer interviewId) {
		InterviewQuestion question = dao.updateInterviewQuestion(questionId, dao.findInterviewQuestionById(questionId));
		model.addAttribute("question", question);
		model.addAttribute("interviewId", interviewId);
		return "updateInterviewQuestion";
	}
	
	@RequestMapping("updatingInterviewQuestion")
	public String updatingInterviewQuestion(InterviewQuestion question, Integer interviewId, Model model ) {
		dao.updateInterviewQuestion(question.getId(), question);
		model.addAttribute("interview", dao.findInterviewById(interviewId) );
		return "updateInterview";
	}

	@RequestMapping("addAnotherInterviewQuestion")
	public String addAnotherInterviewQuestion(InterviewQuestion question, Integer interviewId ) {
		question = dao.addInterviewQuestion(question, interviewId);
		return "createInterviewQuestion";
	}
	
}
