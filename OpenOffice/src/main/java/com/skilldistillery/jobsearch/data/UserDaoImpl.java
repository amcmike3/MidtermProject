package com.skilldistillery.jobsearch.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.CompanyReview;
import com.skilldistillery.jobsearch.entities.Job;
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
		// if there is user with username and password return the user otherwise return
		// null;
		User ans = null;
		String jpql = "select user from User user where user.username = :username and user.password = :password";
		List<User> dbUser = em.createQuery(jpql, User.class).setParameter("username", username)
				.setParameter("password", password).getResultList();

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

	@Override
	public List<User> findAllUsers() {
		String jpql = "SELECT user FROM User user";
		return em.createQuery(jpql, User.class).getResultList();
	}



	@Override
	public List<User> findUsers(String username) {
		List<User> ans = new ArrayList<>();
		String jpql = "select user from User user where user.username like :name";

		ans = em.createQuery(jpql, User.class).setParameter("name", "%" + username + "%").getResultList();
		return ans;
	}

//	@Override
//	public boolean deleteReview(Integer reviewId) {
//		boolean isDeleted = false;
//		System.out.println("Inside delete review");
//		CompanyReview cr = em.find(CompanyReview.class, reviewId);
//
//		if (cr != null) {
//			em.remove(cr);
//			em.flush();
//			if (!em.contains(cr)) {
//				isDeleted = true;
//			}
//		}
//		return isDeleted;
//	}
	
	public CompanyReview createUserReview(CompanyReview companyReview){
	    CompanyReview review = null;
	    int userId = companyReview.getUser().getId();
	    User user = findById(userId);
	    int companyId = companyReview.getCompany().getId();
	    Company company = findCompanyById(companyId);
	    
	    if(user != null && company != null){
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
	public List<Job> findJobs(String title) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Company findCompanyById(Integer companyId) {
		// TODO Auto-generated method stub
		return null;
	}


}
