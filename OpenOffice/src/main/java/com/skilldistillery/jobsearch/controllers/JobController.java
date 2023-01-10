package com.skilldistillery.jobsearch.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jobsearch.data.CompanyDAO;
import com.skilldistillery.jobsearch.data.IndustryDAO;
import com.skilldistillery.jobsearch.data.JobDAO;
import com.skilldistillery.jobsearch.data.UserDAO;
import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.Industry;
import com.skilldistillery.jobsearch.entities.Job;
import com.skilldistillery.jobsearch.entities.User;

@Controller
public class JobController {
	@Autowired
	private JobDAO dao;

	@Autowired
	private CompanyDAO compDao;

	@Autowired
	private IndustryDAO inDao;
	
	@Autowired
	private UserDAO userDao;

	@RequestMapping("getJob.do")
	public String getJobByKeyword(String title, Model model) {
		List<Job> job = dao.findJobs(title);
		model.addAttribute("jobList", job);
		return "results";
	}

	@RequestMapping("allJobs.do")
	public String getAllJobs(Model model) {
		List<Job> job = dao.findAllJobs();
		model.addAttribute("jobList", job);
		return "results";

	}

	@RequestMapping("jobBio")
	public String jobBio(Integer jobId, Model model) {
		Job job = dao.findJobById(jobId);
		job.getInterviews().size();
		model.addAttribute("job", job);
		return "jobBio";
	}
    //API method that is handling the createJob.do call from the front end jsp.
	@PostMapping("createJob.do")
	//
	public ModelAndView jobTypeCreatedForInterview(Job job, Integer companyId, Integer industryId) {
		ModelAndView mv = new ModelAndView();
		Industry industry = inDao.findById(industryId);
		Company company = compDao.findCompanyById(companyId);
		job.setCompany(company);
	
		job.setIndustry(industry);
		
		Job newJob = dao.createJob(job);

		company.addJob(newJob);

		newJob.setCompany(company);

		mv.addObject("jobId", newJob.getId());
		mv.setViewName("redirect:createJob.do?jobId=" + newJob.getId());
		return mv;
	}
	
	@GetMapping("createJob.do")
	public String jobTypeCreatedForInterviewGet( Integer jobId, Model model) {
		model.addAttribute("jobId", jobId);
		return "createInterview";
	}
	
	
	@RequestMapping("reviewJobLogin")
	public ModelAndView reviewJobLogin(Integer jobId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviewJobLogin");
		mv.addObject("jobId", jobId);
		return mv;
	}
	
	@RequestMapping(path = "reviewJobLoggingIn", method = RequestMethod.POST)
	public String reviewJobLoggingIn(String username, String password, HttpSession session, Model model, Integer jobId) {
		String ans = "";
		User user = userDao.login(username, password);
		model.addAttribute("jobId", jobId);
		if (user == null) {
			ans = "reviewJobLogin";
		} else {
			user.getReviews().size();
			user.getArticles().size();
			session.setAttribute("user", user);
			ans = "redirect:reviewJobLoggingInGet?jobId=" + jobId;
		}

		return ans;
	}
	@RequestMapping(path = "reviewJobLoggingInGet", method = RequestMethod.GET)
	public String reviewJobLoggingInGET( Model model, Integer jobId) {
		model.addAttribute("jobId", jobId);
		
		return "createInterview";
	}
		
	@RequestMapping("updateAJob")
	public String updateAJob(Integer jobId, Model model) {
		model.addAttribute("job", dao.findJobById(jobId));
		model.addAttribute("industryList", inDao.getAll());
		return "updateAJob";
	}
	
	@RequestMapping("updatingAJob")
	public String updatingAJob(Job job, Model model) {
		model.addAttribute("job", dao.updateJob(job));
		return "redirect:adminCenter";
	}
	

	
}