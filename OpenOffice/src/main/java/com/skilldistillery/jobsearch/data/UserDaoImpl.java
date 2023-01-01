package com.skilldistillery.jobsearch.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
		// if there is user with username and password return the user otherwise return null;
		User ans = null;
		String jpql = "select user from User user where user.username = :username and user.password = :password";
		List<User> dbUser = em.createQuery(jpql, User.class)
				.setParameter("username", username)
				.setParameter("password", password)
				.getResultList();

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

}
