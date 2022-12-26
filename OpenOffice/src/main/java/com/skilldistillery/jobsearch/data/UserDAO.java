package com.skilldistillery.jobsearch.data;

import com.skilldistillery.jobsearch.entities.User;

public interface UserDAO {
	User findById(int userId);
	User login(String username, String password);
}
