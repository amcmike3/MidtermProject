package com.skilldistillery.jobsearch.data;

import java.util.List;

import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.CompanyReview;
import com.skilldistillery.jobsearch.entities.Job;
import com.skilldistillery.jobsearch.entities.User;

public interface UserDAO {
	User findById(int userId);
	User login(String username, String password);
	User register(User user);
	boolean isUsernameUnique(String username);
	boolean isEmailUnique(String email);
	List<User> findAllUsers();
	List<User> findUsers(String username);
	User update(User newUser);
	CompanyReview createUserReview(CompanyReview companyReview);
	boolean deleteUser(Integer id);
	User addSubscrCompToUserBio(Integer companyId, Integer userId);

	boolean accountDisabled(Integer id);

	User reactivate(User inactiveUser);


}