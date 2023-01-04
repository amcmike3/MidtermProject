package com.skilldistillery.jobsearch.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.jobsearch.data.CompanyDAO;

@Controller
public class CompanyController {

	@Autowired
	private CompanyDAO dao;
}
