package com.skilldistillery.jobsearch.data;

import java.util.List;

import com.skilldistillery.jobsearch.entities.Job;

public interface JobDAO {

	List<Job> findJobs(String title);

	List<Job> findAllJobs();


}


