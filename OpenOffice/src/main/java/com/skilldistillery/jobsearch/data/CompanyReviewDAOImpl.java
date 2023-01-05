package com.skilldistillery.jobsearch.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.CompanyReview;
import com.skilldistillery.jobsearch.entities.User;

@Service
@Transactional
public class CompanyReviewDAOImpl implements CompanyReviewDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public Company findCompanyById(Integer companyId) {
		return em.find(Company.class, companyId);
	}

	@Override
	public CompanyReview create(CompanyReview companyReview) {
		CompanyReview review = null;
		int userId = companyReview.getUser().getId();
		User user = findById(userId);
		int companyId = companyReview.getCompany().getId();
		Company company = findCompanyById(companyId);

		if (user != null && company != null) {
			review = new CompanyReview();
			review.setContent(companyReview.getContent());
			review.setReviewDate(companyReview.getReviewDate());
			review.setUser(user);
			review.setRecommendation(companyReview.isRecommendation());
			review.setRating(companyReview.getRating());
			review.setPros(companyReview.getPros());
			review.setCons(companyReview.getCons());
			review.setTitle(companyReview.getTitle());
			review.setAdvice(companyReview.getAdvice());
			review.setCompany(company);
		}
		return review;
	}
	
	@Override
	public CompanyReview updateUserReview(int companyId, CompanyReview companyReview) {
		
		CompanyReview reviewUpdate = em.find(CompanyReview.class, companyId );
		
		reviewUpdate.setContent(companyReview.getContent());
		reviewUpdate.setReviewDate(companyReview.getReviewDate());
		reviewUpdate.setRecommendation(companyReview.isRecommendation());
		reviewUpdate.setRating(companyReview.getRating());
		reviewUpdate.setPros(companyReview.getPros());
		reviewUpdate.setCons(companyReview.getCons());
		reviewUpdate.setTitle(companyReview.getTitle());
		reviewUpdate.setAdvice(companyReview.getAdvice());
		
		return reviewUpdate;
	}
}
