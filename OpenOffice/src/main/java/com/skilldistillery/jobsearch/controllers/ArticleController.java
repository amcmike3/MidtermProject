package com.skilldistillery.jobsearch.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping("getArticle")
	public String getArticle(String title, Model model) {
		model.addAttribute("articles", dao.findArticle(title));

		return "results";

	}
	
	@RequestMapping("allArticles")
	public String allArticles(Model model) {
		model.addAttribute("articles", dao.findAllArticles());
		return "allArticles";
	}
}
