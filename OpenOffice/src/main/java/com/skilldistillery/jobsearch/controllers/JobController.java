package com.skilldistillery.jobsearch.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@PostMapping("createJob.do")
	public ModelAndView jobTypeCreatedForInterview(Job job, Integer companyId, Integer industryId) {
		ModelAndView mv = new ModelAndView();
		Industry industry = inDao.findById(industryId);
		Company company = compDao.findCompanyById(companyId);
		// find the company that the job is created for
		// get the list of jobs for that company
//		List<Job> jobs = dao.findAllJobsWithinASpecificCompany(companyId);
		job.setCompany(company);
		// once the back end has the industry the user picked, set it to the new job
		job.setIndustry(industry);
		
		
		
		Job newJob = dao.createJob(job);
		// actually create the job with the info from the form and the company and list
		// set
		// find the industry that the user picked in the drop down to assign it to the
		// job(join column)
		industry = inDao.findById(industryId);
		// add the job to the pre existing list of jobs that a company has
		company.addJob(newJob);
		// set the company to the job that was created.. because a Job HAS A Company.
		newJob.setCompany(company);

		mv.addObject("jobId", newJob.getId());
		mv.setViewName("createInterview");
		return mv;
	}
	
	@RequestMapping("reviewJobLogin")
	public ModelAndView reviewJobLogin(Integer jobId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviewJobLogin");
		mv.addObject("jobId", jobId);
		return mv;
	}
	
	@RequestMapping("reviewJobLoggingIn")
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
			ans = "createInterview";
		}

		return ans;
	}
}