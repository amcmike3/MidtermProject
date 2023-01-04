package com.skilldistillery.jobsearch.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.jobsearch.data.JobDAO;

@Controller
public class JobController {
	@Autowired
	private JobDAO dao;

}


