package com.skilldistillery.jobsearch.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jobsearch.entities.Company;

@Service
@Transactional
public class CompanyDAOImpl implements CompanyDAO{

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Company findCompanyById(Integer companyId) {
		return em.find(Company.class, companyId);
	}

	
	public List<Company> findCompanies(String name) {
		List<Company> ans = new ArrayList<>();
		String jpql = "select company from Company company where company.name like :name";

		ans = em.createQuery(jpql, Company.class).setParameter("name", "%" + name + "%").getResultList();

		return ans;
	}
	
	@Override
	public List<Company> findAllCompanies() {
		String jpql = "SELECT company FROM Company company";
		return em.createQuery(jpql, Company.class).getResultList();
	}

}
