package com.skilldistillery.jobsearch.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jobsearch.data.ArticleDAO;
import com.skilldistillery.jobsearch.data.IndustryDAO;
import com.skilldistillery.jobsearch.entities.Article;
import com.skilldistillery.jobsearch.entities.Industry;
import com.skilldistillery.jobsearch.entities.Interview;
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
		return "results";
	}

	@RequestMapping("createArticle.do")
	public String createArticle(Model model) {
		model.addAttribute("industryList", industryDao.getAll());

		return "createArticle";
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
	
	@RequestMapping("deletedArticle")
	public String deletedArticle(Integer articleId) {
		dao.deleteArticle(articleId);
		return "adminCenter";
	}

	@RequestMapping(path = "createArticle", method = RequestMethod.POST)
	public ModelAndView createArticle(Integer industryId, Article article, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		article.setIndustry(industryDao.findById(industryId));
		Article newArticle = dao.createArticle(article, session);

		mv.addObject("article", newArticle);
		mv.addObject("articleId", newArticle.getId());
		mv.setViewName("redirect:createArticle?articleId=" + newArticle.getId());
		return mv;
	}

	@RequestMapping(path = "createArticle", method = RequestMethod.GET)
	public ModelAndView createArticleGet(Integer articleId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("article", dao.findArticleById(articleId));
		mv.setViewName("articleBio");
		return mv;
	}

	@RequestMapping("updateAArticle")
	public String updateAArticle(Integer articleId, Model model) {
		
		List<Industry> industryList = industryDao.getAll();
		model.addAttribute("industryList", industryList);
		model.addAttribute("article", dao.findArticleById(articleId));
		return "updateAArticle";
	}
	
	@RequestMapping("updatingAArticle")
	public String updatingAArticle(Article article, Integer industryId, Model model) {
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + industryId);
		Industry industry = new Industry();
		industry.setId(industryId);
		article.setIndustry(industry);
		model.addAttribute("article", dao.updateArticle(article));
		return "redirect:adminCenter";
	}
}