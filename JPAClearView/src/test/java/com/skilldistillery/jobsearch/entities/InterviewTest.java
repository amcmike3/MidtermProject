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

class InterviewTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Interview interview;

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
		interview = em.find(Interview.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_interview_basic_mappings() {
		assertNotNull(interview);
		assertEquals(1, interview.getId());
		assertEquals("What are data structures and algorithms?...", interview.getTitle());
		assertEquals("Two Sum, Regex matching, Binary Search", interview.getQuestions());
	}
	@Test
	void test_User_interview_one_to_many_mapping() {
		assertNotNull(interview);
		assertEquals(1, interview.getUser().getId());
	}

	@Test
	void test_Job_interview_one_to_many_mapping() {
		assertNotNull(interview);
		assertEquals(1, interview.getJob().getId());
	}

}
