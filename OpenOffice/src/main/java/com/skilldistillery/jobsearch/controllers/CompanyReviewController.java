package com.skilldistillery.jobsearch.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.jobsearch.data.CompanyReviewDAO;
import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.CompanyReview;
import com.skilldistillery.jobsearch.entities.User;

@Controller
public class CompanyReviewController {

	@Autowired
	private CompanyReviewDAO dao;

	@RequestMapping("review.do")
	public String create(HttpSession session, Integer companyId) {
		session.setAttribute("companyId", companyId);
		return "createUserReview";

	}
	@RequestMapping(path = "createUserReview.do", method = RequestMethod.POST)
	public String create(CompanyReview companyReview, RedirectAttributes redir, HttpSession session) {
		
		companyReview.setUser((User) session.getAttribute("user"));
		Company company = new Company();
		company.setId((int) session.getAttribute("companyId"));
		companyReview.setCompany(company);
		
		CompanyReview review = dao.create(companyReview);
		redir.addFlashAttribute("companyReview", review);
		return "redirect:added.do";

	}

	@RequestMapping("added.do")
	public ModelAndView addedReview() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("added");
		return mv;

	}
	@RequestMapping(path = "deleteReview.do", method = RequestMethod.POST)
	public String deleteReview(Integer userId, Integer reviewId) {
	System.out.println("userid: " + userId);
		dao.deleteReview(userId, reviewId);
		return "successfullyDeletedPage";
	}

	@RequestMapping("updateCompanyReview.do")
	public String updateCompany(Integer companyId, Integer reviewId ,Model model) {
		CompanyReview review = dao.findReviewById(reviewId);
		model.addAttribute("review", review);
		model.addAttribute("companyId", companyId);
		
		return "updateCompany";

	}
	
	@RequestMapping("updatingCompanyReview.do")
	public String updatingCompanyReview(Integer companyId,CompanyReview review, Model model) {
		System.out.println("---------------------------"+ companyId);
		System.out.println(review);
		dao.updateCompanyReview(companyId, review);
		model.addAttribute("company", dao.findCompanyById(companyId));
		
		return "companyBio";
	}

}