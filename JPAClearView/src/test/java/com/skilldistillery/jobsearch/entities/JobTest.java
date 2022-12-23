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

class JobTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Job job;

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
		job = em.find(Job.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_job_password_id_and_role() {
		assertNotNull(job);
		assertEquals(1, job.getId());
		assertEquals(89999, job.getSalary());
		assertEquals("Administration", job.getSkills());
	}
	
	@Test
	void test_Job_Industry_one_to_many_mapping() {
		assertNotNull(job);
		assertEquals(1, job.getIndustry().getId());
	}
	@Test
	void test_Job_Company_one_to_many_mapping() {
		assertNotNull(job);
		assertEquals(1, job.getCompany().getId());
	}
}
