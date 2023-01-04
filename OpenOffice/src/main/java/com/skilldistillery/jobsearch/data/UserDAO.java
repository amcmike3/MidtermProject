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
<<<<<<< HEAD
	List<Job> findJobs(String title);
	Company findCompanyById(Integer companyId);
	boolean deleteReview(Integer reviewId);
	CompanyReview createUserReview(CompanyReview companyReview);

=======
>>>>>>> fae3606ac81837c65e4e17a9329f1c1818dc178f
}