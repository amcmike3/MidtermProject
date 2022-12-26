package com.skilldistillery.jobsearch.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
		// TODO make this method check db if there is user with username and password
		// if there is return the user otherwise return null;
		return null;
	}

}
