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
	List<Job> findAllJobs();
	List<Company> findAllCompanies();
	List<Company> findCompanies(String name);
	List<User> findUsers(String username);
	List<Job> findJobs(String title);
	Company findCompanyById(Integer companyId);
	boolean deleteReview(Integer reviewId);
	CompanyReview createUserReview(CompanyReview companyReview);

}