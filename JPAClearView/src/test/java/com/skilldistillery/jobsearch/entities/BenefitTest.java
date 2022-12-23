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

class BenefitTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Benefit benefit;

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
		benefit = em.find(Benefit.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_benefit_password_basic_mappings() {
		assertNotNull(benefit);
		assertEquals(1, benefit.getId());
		assertEquals("401k", benefit.getName());
		assertEquals("401k matching 100%", benefit.getDescription());
	}
	
	@Test
	void test_Benefit_Company_many_to_many_mapping() {
		assertNotNull(benefit);
		assertTrue(benefit.getCompanies().size() > 0);
	}

}
