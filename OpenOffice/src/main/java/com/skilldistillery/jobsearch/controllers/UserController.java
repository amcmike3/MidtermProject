package com.skilldistillery.jobsearch.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jobsearch.data.CompanyDAO;
import com.skilldistillery.jobsearch.data.UserDAO;
import com.skilldistillery.jobsearch.entities.Article;
import com.skilldistillery.jobsearch.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;

	@Autowired
	private CompanyDAO compDao;

	@RequestMapping(path = "loggingIn", method = RequestMethod.POST)
	public String login(String username, String password, HttpSession session) {
		String ans = "";
		User user = dao.login(username, password);
		if (user == null) {
			ans = "login";
		} else {
			user.getReviews().size();
			user.getArticles().size();
			session.setAttribute("user", user);
			ans = "redirect:home";
		}

		return ans;
	}

	@RequestMapping(path = "registering", method = RequestMethod.POST)
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
				System.out.println("-----------------" + daoUser.isRole());
				session.setAttribute("user", daoUser);
				ans = "redirect:home";
			} else {
				ans = "register";
			}
		}
		return ans;
	}

	@RequestMapping("userBio")
	public ModelAndView userBio(Integer userId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userBio");
		mv.addObject("user", dao.findById(userId));
		return mv;
	}

	@RequestMapping("userSessionBio")
	public ModelAndView userSessionBio(Integer userId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.setAttribute("user", dao.findById(userId));
		mv.setViewName("userSessionBio");

		return mv;
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
	public String sendToUpdateUser() {
		return "updateUser";
	}

	@RequestMapping("updatingUser")
	public String updateUser(User user, HttpSession session, Model model) {
		session.setAttribute("user", dao.update(user));

		return "userSessionBio";
	}

	@RequestMapping("deleteUser")
	public String deleteUser(Integer id, Model model, HttpSession session) {

		boolean success = dao.deleteUser(id);
		if (success) {
			session.invalidate();
		}
		model.addAttribute("success", success);

		return "userDelete";
	}

	@RequestMapping("subscribe.do")
	public ModelAndView subscribeToCompany(Integer companyId, Integer userId) {
		ModelAndView mv = new ModelAndView();
		User user = dao.addSubscrCompToUserBio(companyId, userId);
		mv.addObject("user", user);
		mv.setViewName("userBio");

		return mv;
	}

	@RequestMapping(path = { "viewSubscription.do" })
	public ModelAndView goToViewSubscriptions(Integer userId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = dao.findById(userId);
		mv.addObject("user", user);
		session.setAttribute("user", user);
		mv.setViewName("viewSubscription");
		return mv;

	}
	
	
	@RequestMapping("adminCenter")
	public String adminCenter(Integer userId, HttpSession session, Model model, User user) {
		
		return "adminCenter";
		
	}
		
	@RequestMapping("updateAUser")
	public String updateAUser(Integer userId, Model model) {
		model.addAttribute("user", dao.findById(userId));
		return "updateAUser";
	}
	
	@RequestMapping("updatingAUser")
	public String updatingAUser(User user, Model model) {
		model.addAttribute("user", dao.update(user));
		return "redirect:adminCenter";
	}
	

}