package com.skilldistillery.jobsearch.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.jobsearch.data.UserDAO;
import com.skilldistillery.jobsearch.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = {"/", "home"})
	public String home(Model model) {
		
		model.addAttribute("SMOKETEST", dao.findById(1));
		return "home";
	}
	
	@RequestMapping("login")
	public String sendToLoginPage() {	
		return "login";
	}
	
	@RequestMapping(path = "loggingIn", method = RequestMethod.POST)
	public String loginPage(String username, String password, HttpSession session) {	
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
	
	@RequestMapping("register")
	public String sendToRegisterPage() {	
		return "register";
	}
}
