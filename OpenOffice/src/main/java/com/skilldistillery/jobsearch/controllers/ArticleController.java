package com.skilldistillery.jobsearch.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jobsearch.data.ArticleDAO;
import com.skilldistillery.jobsearch.entities.Article;
import com.skilldistillery.jobsearch.entities.User;

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
	
	@RequestMapping("updateArticle")
	public String updateArticle(Integer articleId, Model model) {
		model.addAttribute("article", dao.findArticleById(articleId));
		return "updateArticle";
	}
	
	@RequestMapping("updatingArticle")
	public String updatingArticle(Article article, Model model) {
		System.out.println("-----------------------------" + article);
		model.addAttribute("article", dao.updateArticle(article));
		return "articleBio";
	}
	
	@RequestMapping("deleteArticle")
	public String deleteArticle(Integer articleId, Model model, HttpSession session) {
		User user = dao.findArticleById(articleId).getUser();
		
		model.addAttribute("success", dao.deleteArticle(articleId));
		GeneralController.refreshUser(user, session);
		return "articleDeletedSuccess";
	}
}
