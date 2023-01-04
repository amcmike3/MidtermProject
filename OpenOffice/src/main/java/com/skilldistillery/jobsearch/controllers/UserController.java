package com.skilldistillery.jobsearch.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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


	@RequestMapping(path = "loggingIn", method = RequestMethod.POST)
	public String login(String username, String password, HttpSession session) {
		String ans = "";
		User user = dao.login(username, password);
		if (user == null) {
			ans = "login";
		} else {
			user.getReviews().size();
			session.setAttribute("user", user);
			ans = "home";
		}

		return ans;
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

	@RequestMapping("allUser.do")
	public String getAllUsers(Model model) {
		List<User> users = dao.findAllUsers();
		model.addAttribute("userList", users);
		return "results";
		
	}
	
	@RequestMapping("updateUser")
	public String sendToUpdateUser(){
		return "updateUser";
	}


	

}
