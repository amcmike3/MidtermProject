package com.skilldistillery.jobsearch.data;

import java.util.List;

import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.Interview;
import com.skilldistillery.jobsearch.entities.User;

public interface InterviewDAO {

	User findById(int userId);
	Company findCompanyById(Integer companyId);
	Interview findInterviewById(Integer interviewId);
	Interview updateInterview(int interviewId, Interview interview);
	List<Interview> userInterviewsForCompany(int companyId, int userId);
	Interview createInterview(Integer jobId, Interview interview);
	
}
