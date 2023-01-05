package com.skilldistillery.jobsearch.data;

import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.CompanyReview;
import com.skilldistillery.jobsearch.entities.User;

public interface CompanyReviewDAO {
	
	User findById(int userId);
	Company findCompanyById(Integer companyId);

	CompanyReview createUserReview(CompanyReview companyReview);
	boolean deleteReview(Integer reviewId);
	//CompanyReview updateUserReview(int companyId, CompanyReview companyReview);
	CompanyReview create(CompanyReview companyReview);
	
}
