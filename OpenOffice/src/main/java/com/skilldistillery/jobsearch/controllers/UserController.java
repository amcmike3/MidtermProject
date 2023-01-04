package com.skilldistillery.jobsearch.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jobsearch.data.UserDAO;
import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.Job;
import com.skilldistillery.jobsearch.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;

	@RequestMapping(path = { "/", "home" })
	public String home(Model model) {

		model.addAttribute("SMOKETEST", dao.findById(1));
		return "home";
	}

	@RequestMapping("login")
	public String sendToLoginPage() {
		return "login";
	}
	
	@RequestMapping("search")
	public String sendToSearchPage() {
		return "search";
	}
	

	@RequestMapping(path = "loggingIn", method = RequestMethod.POST)
	public String login(String username, String password, HttpSession session) {
		String ans = "";
		User user = dao.login(username, password);
		if (user == null) {
			ans = "login";
		} else {
			session.setAttribute("user", user);
			ans = "home";
		}

		return ans;
	}

	@RequestMapping(path = "loggingOut.do")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:home";
	}

	@RequestMapping("register")
	public String sendToRegisterPage() {
		return "register";
	}

	@RequestMapping("registering")
	public String register(User user, Model model, HttpSession session) {
		String ans = "";
		// if username is unique and email is unique then register user otherwise
		// refresh register page with form pre-filled except for respective not unique
		// input
		if (!dao.isEmailUnique(user.getEmail())) {
			model.addAttribute("notUniqueEmail", true);
			model.addAttribute("user", user);
			ans = "register";

		} else if (!dao.isUsernameUnique(user.getUsername())) {
			model.addAttribute("notUniqueUsername", true);
			model.addAttribute("user", user);
			ans = "register";
		} else {
			User daoUser = dao.register(user);
			if (daoUser != null) {
				session.setAttribute("user", daoUser);
				ans = "home";
			} else {
				ans = "register";
			}
		}

		return ans;
	}

	@RequestMapping("getUser.do")
	public String getUsersByKeyword(String username, Model model) {
		List<User> users = dao.findUsers(username);
		model.addAttribute("userList", users);
		return "results";

	}

	@RequestMapping("getCompany.do")
	public String getCompanyByKeyword(String name, Model model) {
		List<Company> company = dao.findCompanies(name);
		model.addAttribute("companyList", company);
		return "results";

	}

	@RequestMapping("getJob.do")
	public String getJobByKeyword( String title, Model model) {
		List<Job> job = dao.findJobs(title);
		model.addAttribute("jobList", job);
		return "results";

	}

	@RequestMapping("allUser.do")
	public String getAllUsers(Model model) {
		List<User> users = dao.findAllUsers();
		model.addAttribute("userList", users);
		return "results";

	}

	@RequestMapping("allCompanies.do")
	public String getAllCompanies(Model model) {
		List<Company> company = dao.findAllCompanies();
		model.addAttribute("companyList", company);
		return "results";
	}

	@RequestMapping("allJobs.do")
	public String getAllJobs(Model model) {
		List<Job> job = dao.findAllJobs();
		model.addAttribute("jobList", job);
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

	@RequestMapping("deleteReview.do")
	public String deleteReview(Integer reviewId) {
		dao.deleteReview(reviewId);
		
		return "successfullyDeletedPage";
}

	
	@RequestMapping("allReviews")
	public String allReviews(Integer companyId, Model model) {
		Company company = dao.findCompanyById(companyId);
		model.addAttribute("company", company);
		
		return "allReviews";
	}
	
	@RequestMapping("user")
	public ModelAndView userBio(Integer userId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userBio");

		return mv;
	}
}
