package com.skilldistillery.jobsearch.data;

import com.skilldistillery.jobsearch.entities.User;

public interface UserDAO {
	User findById(int userId);
	User login(String username, String password);
	User register(User user);
	boolean isUsernameUnique(String username);
	boolean isEmailUnique(String email);
}
