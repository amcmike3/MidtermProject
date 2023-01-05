package com.skilldistillery.jobsearch.data;

import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.Interview;
import com.skilldistillery.jobsearch.entities.User;

public interface InterviewDAO {

	User findById(int userId);
	Company findCompanyById(Integer companyId);
	Interview findInterviewById(Integer interviewId);
	Interview updateInterview(int interviewId, Interview interview);
	
}
