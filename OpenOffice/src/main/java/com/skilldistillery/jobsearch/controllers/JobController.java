package com.skilldistillery.jobsearch.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jobsearch.data.CompanyDAO;
import com.skilldistillery.jobsearch.data.IndustryDAO;
import com.skilldistillery.jobsearch.data.JobDAO;
import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.Industry;
import com.skilldistillery.jobsearch.entities.Job;

@Controller
public class JobController {
	@Autowired
	private JobDAO dao;

	@Autowired
	private CompanyDAO compDao;

	@Autowired
	private IndustryDAO inDao;

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
		Industry industry = null;
		Company company = null;
		// get the list of jobs for that company
		List<Job> jobs = dao.findAllJobsWithinASpecificCompany(companyId);
		System.out.println(jobs.toString());
		Job newJob = job;
		// find the industry that the user picked in the drop down to assign it to the
		// job(join column)
		industry = inDao.findById(industryId);
		// once the back end has the industry the user picked, set it to the new job
		newJob.setIndustry(industry);
		// add the job to the pre existing list of jobs that a company has
		jobs.add(newJob);
		// find the company that the job is created for
		company = compDao.findCompanyById(companyId);
		// set the list "jobs" to the companies list of jobs . A Company HAS A list of
		// jobs
		company.setJobs(jobs);
		// set the company to the job that was created.. because a Job HAS A Company.
		newJob.setCompany(company);
		// actually create the job with the info from the form and the company and list
		// set
		dao.createJob(newJob);

		mv.addObject("Job", newJob);
		mv.setViewName("createInterview");
		return mv;
	}
}