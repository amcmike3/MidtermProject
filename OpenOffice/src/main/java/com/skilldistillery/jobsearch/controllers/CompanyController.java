package com.skilldistillery.jobsearch.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jobsearch.data.CompanyDAO;
import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.Job;

@Controller
public class CompanyController {

	@Autowired
	private CompanyDAO dao;
	
	@RequestMapping("getCompany.do")
	public String getCompanyByKeyword(String name, Model model) {
		List<Company> company = dao.findCompanies(name);
		model.addAttribute("companyList", company);
		return "results";

	}
	
	@RequestMapping("allCompanies.do")
	public String getAllCompanies(Model model) {
		List<Company> company = dao.findAllCompanies();
		model.addAttribute("companyList", company);
		return "results";
	}

	
	@RequestMapping("companyBio")
	public ModelAndView companyBio(Integer companyId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("companyBio");
		Company company = dao.findCompanyById(companyId);
		mv.addObject("company", company);
		return mv;
	}
	
	@RequestMapping("companyJobs")
	public ModelAndView companyJobs(Integer companyId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("companyJobs");
		Company company = dao.findCompanyById(companyId);
		List<Job> jobs = new ArrayList<>();
		int index = 0;
		for (Job job : company.getJobs()) {
			if (index > 4) {
				break;
			}
			jobs.add(job);
			index++;
		}
		mv.addObject("companyJobs", jobs);
		mv.addObject("company", company);
		return mv;
	}
	
	@RequestMapping("allReviews")
	public String allReviews(Integer companyId, Model model) {
		Company company = dao.findCompanyById(companyId);
		model.addAttribute("company", company);
		
		return "allReviews";
	}
}
