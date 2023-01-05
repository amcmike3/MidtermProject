package com.skilldistillery.jobsearch.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.jobsearch.data.CompanyReviewDAO;
import com.skilldistillery.jobsearch.entities.CompanyReview;

@Controller
public class CompanyReviewController {

	@Autowired
	private CompanyReviewDAO dao;
	
	@RequestMapping("review.do")
	public String create() {

		return "createUserReview";
		
	}
	
	@RequestMapping(path = "createUserReview.do", method = RequestMethod.POST)
	public String create(CompanyReview companyReview, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		CompanyReview review = dao.create(companyReview);
		mv.addObject("review", review);
		mv.setViewName("added");
		redir.addFlashAttribute("review", review);
		return "redirect:added.do";

	}
	
	@RequestMapping("added.do")
	public ModelAndView addedReview(CompanyReview companyReview) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("review", companyReview);
		mv.setViewName("added");
		return mv;

	}
	@RequestMapping("deleteReview.do")
	public String deleteReview(Integer reviewId) {
		dao.deleteReview(reviewId);
		return "successfullyDeletedPage";
}
}