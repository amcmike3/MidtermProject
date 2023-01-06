package com.skilldistillery.jobsearch.data;

import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.Interview;
import com.skilldistillery.jobsearch.entities.InterviewQuestion;
import com.skilldistillery.jobsearch.entities.User;

public interface InterviewQuestionDAO {

	User findById(int userId);
	Company findCompanyById(Integer companyId);
	Interview findInterviewById(Integer interviewId);
	InterviewQuestion findInterviewQuestionById(Integer interviewQuestionId);
	InterviewQuestion updateInterviewQuestion(Integer interviewQuestionId, InterviewQuestion interviewQuestion);
	InterviewQuestion addInterviewQuestion(InterviewQuestion question, Integer interviewId);
}
