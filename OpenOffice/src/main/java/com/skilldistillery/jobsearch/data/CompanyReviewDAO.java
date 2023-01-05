package com.skilldistillery.jobsearch.data;

import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.CompanyReview;
import com.skilldistillery.jobsearch.entities.User;

public interface CompanyReviewDAO {
	
	User findById(int userId);
	Company findCompanyById(Integer companyId);
<<<<<<< HEAD
	CompanyReview createUserReview(CompanyReview companyReview);
	CompanyReview updateUserReview(int companyId, CompanyReview companyReview);
	
	

=======
	CompanyReview create(CompanyReview companyReview);
>>>>>>> 86e042c8d46323dd9976ae3c05578769d66f9b78
	
}
