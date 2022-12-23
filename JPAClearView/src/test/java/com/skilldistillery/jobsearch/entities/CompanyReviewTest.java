package com.skilldistillery.jobsearch.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CompanyReviewTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private CompanyReview review;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	emf = Persistence.createEntityManagerFactory("JPAOpenOffice");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		review = em.find(CompanyReview.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_review_password_basic_mappings() {
		assertNotNull(review);
		assertEquals(1, review.getId());
		assertEquals("Sarcasm 101", review.getTitle());
		assertEquals("keep humor in the company culture", review.getAdvice());
	}
	
	@Test
	void test_Company_CompanyReview_one_to_many_mapping() {
		assertNotNull(review);
		assertEquals(1, review.getCompany().getId());
	}
	@Test
	void test_User_CompanyReview_one_to_many_mapping() {
		assertNotNull(review);
		assertEquals(1, review.getUser().getId());
	}

}
