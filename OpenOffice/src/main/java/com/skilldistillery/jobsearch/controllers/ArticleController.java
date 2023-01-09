package com.skilldistillery.jobsearch.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jobsearch.data.ArticleDAO;
import com.skilldistillery.jobsearch.entities.Article;

@Controller
public class ArticleController {
	
	@Autowired
	private ArticleDAO dao;
	
	@RequestMapping("articleBio")
	public String articleBio(HttpSession session, Integer articleId, Model model) {
		model.addAttribute("article", dao.findArticleById(articleId));
				
		return "articleBio";
	}
}
