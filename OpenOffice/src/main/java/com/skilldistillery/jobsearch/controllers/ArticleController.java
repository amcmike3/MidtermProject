package com.skilldistillery.jobsearch.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.jobsearch.data.ArticleDAO;

@Controller
public class ArticleController {
	
	@Autowired
	private ArticleDAO dao;
}
