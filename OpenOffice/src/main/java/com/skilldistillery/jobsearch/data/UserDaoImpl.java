package com.skilldistillery.jobsearch.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.CompanyReview;
import com.skilldistillery.jobsearch.entities.Job;
import com.skilldistillery.jobsearch.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public User login(String username, String password) {
		// if there is user with username and password return the user otherwise return
		// null;
		User ans = null;
		String jpql = "select user from User user where user.username = :username and user.password = :password";
		List<User> dbUser = em.createQuery(jpql, User.class).setParameter("username", username)
				.setParameter("password", password).getResultList();

		if (dbUser.size() > 0) {
			ans = dbUser.get(0);
		}

		System.out.println(ans);
		return ans;
	}

	@Override
	public User register(User user) {
		// persist a newly registered user to the database
		User dbUser = null;

		if (user.getPassword() == null || user.getPassword().equals("")) {

		} else if (user.getUsername() == null || user.getUsername().equals("")) {

		} else {
			em.persist(user);
			dbUser = em.find(User.class, user.getId());
		}

		return dbUser;
	}

	@Override
	public boolean isUsernameUnique(String username) {
		// return true if email is unique else return false
		boolean ans = false;
		String jpql = "select user.username from User user where user.username = :blah";
		List<String> dbUsernames = em.createQuery(jpql, String.class).setParameter("blah", username).getResultList();

		if (dbUsernames.size() < 1) {
			ans = true;
		}

		return ans;
	}

	@Override
	public boolean isEmailUnique(String email) {
		/*
		 * return true if email is unique else return false
		 */

		boolean ans = false;
		String jpql = "select user.email from User user where user.email = :blah";

		List<String> dbEmails = em.createQuery(jpql, String.class).setParameter("blah", email).getResultList();

		if (dbEmails.size() < 1) {
			ans = true;
		}

		return ans;
	}

	@Override
	public List<User> findAllUsers() {
		String jpql = "SELECT user FROM User user";
		return em.createQuery(jpql, User.class).getResultList();
	}



	@Override
	public List<User> findUsers(String username) {
		List<User> ans = new ArrayList<>();
		String jpql = "select user from User user where user.username like :name";

		ans = em.createQuery(jpql, User.class).setParameter("name", "%" + username + "%").getResultList();
		return ans;
	}

	@Override
	public User update(User user) {
		User oldUser = em.find(User.class, user.getId());
		
		if (user.getDescription() != null && user.getDescription() != "") {
			oldUser.setDescription(user.getDescription());
		}
		if (user.getFirstName() != null && user.getFirstName() != "") {
			oldUser.setFirstName(user.getFirstName());
		}
		if (user.getLastName() != null && user.getLastName() != "") {
			oldUser.setLastName(user.getLastName());
		}
		if ( user.getEmail() != null && user.getEmail() != "" && isEmailUnique(user.getEmail())) {
			oldUser.setEmail(user.getEmail());
		}
		if (user.getUsername() != null && user.getUsername() != "" && isUsernameUnique(user.getUsername())) {
			oldUser.setUsername(user.getUsername());
		}
		if (user.getImgUrl() != null && user.getImgUrl() != "") {
			oldUser.setImgUrl(user.getImgUrl());
		}
		oldUser.getReviews().size();
		
		return oldUser;
	}

	@Override
	public CompanyReview createUserReview(CompanyReview companyReview) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteUser(Integer id) {
		User user = em.find(User.class, id);
		boolean ans = false;
		
		user.setEnabled(false);
		if (!user.getEnabled()) {
			ans = true;
		}
		
		return ans;
	}




}
