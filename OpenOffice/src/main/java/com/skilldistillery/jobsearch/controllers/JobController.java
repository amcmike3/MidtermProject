package com.skilldistillery.jobsearch.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jobsearch.data.JobDAO;
import com.skilldistillery.jobsearch.entities.Job;

@Controller
public class JobController {
	@Autowired
	private JobDAO dao;
	
	@RequestMapping("getJob.do")
	public String getJobByKeyword( String title, Model model) {
		List<Job> job = dao.findJobs(title);
		model.addAttribute("jobList", job);
		return "results";

	}



	@RequestMapping("allJobs.do")
	public String getAllJobs(Model model) {
		List<Job> job = dao.findAllJobs();
		model.addAttribute("jobList", job);
		return "results";

	}


}


