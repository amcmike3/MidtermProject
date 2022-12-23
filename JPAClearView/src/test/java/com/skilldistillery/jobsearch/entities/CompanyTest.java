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

class CompanyTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Company company;

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
		company = em.find(Company.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_company_basic_mappings() {
		assertNotNull(company);
		assertEquals(1, company.getId());
		assertEquals("The good company", company.getName());
		assertEquals("we are wherever you are", company.getLocation());
	}
	
	@Test
	void test_Company_User_many_to_many_mapping() {
		assertNotNull(company);
		assertTrue(company.getUsers().size() > 0);
	}
	
	@Test
	void test_Company_Benefit_many_to_many_mapping() {
		assertNotNull(company);
		assertTrue(company.getBenefits().size() > 0);
	}

	@Test
	void test_Company_CompanyImage_one_to_many_mapping() {
		assertNotNull(company);
		assertTrue(company.getImages().size() > 0);
	}
	@Test
	void test_Company_Job_one_to_many_mapping() {
		assertNotNull(company);
		assertTrue(company.getJobs().size() > 0);
	}


}
