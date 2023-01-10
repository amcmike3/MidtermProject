package com.skilldistillery.jobsearch.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jobsearch.data.ArticleDAO;
import com.skilldistillery.jobsearch.data.IndustryDAO;
import com.skilldistillery.jobsearch.entities.Article;
import com.skilldistillery.jobsearch.entities.Interview;
import com.skilldistillery.jobsearch.entities.User;

@Controller
public class ArticleController {

	@Autowired
	private ArticleDAO dao;
	@Autowired
	private IndustryDAO industryDao;

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
	
	@RequestMapping("createArticle.do")
	public String createArticle(Model model) {
		model.addAttribute("industryList", industryDao.getAll());
		
			return "createArticle";
}
	
	@RequestMapping("createArticle")
	public ModelAndView createArticle(Integer industryId, Article article, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		article.setIndustry(industryDao.findById(industryId));
		
		mv.addObject("article", dao.createArticle( article, session));
		mv.setViewName("articleBio");
		return mv;
	}
}