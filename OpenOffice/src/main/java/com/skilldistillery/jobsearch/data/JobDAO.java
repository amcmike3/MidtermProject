package com.skilldistillery.jobsearch.data;

import java.util.List;

import com.skilldistillery.jobsearch.entities.Job;

public interface JobDAO {

	List<Job> findJobs(String title);

	List<Job> findAllJobs();
	
	List<Job> findAllJobsWithinASpecificCompany(Integer companyId)
;
	Job findJobById(Integer jobId);

	Job createJob(Job job);
	
	Job updateJob(Job job);


		
}


