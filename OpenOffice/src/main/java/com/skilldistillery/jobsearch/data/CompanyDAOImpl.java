package com.skilldistillery.jobsearch.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.Job;

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


	@Override
	public Company updateCompany(Integer companyId, Company company) {
		Company oldCompany = em.find(Company.class, company.getId());

		if (company.getName() != null && company.getName() != "") {
			oldCompany.setName(company.getName());
		}

		if (company.getDescription() != null && company.getDescription() != ""){
			oldCompany.setDescription(company.getDescription());
		}
		if (company.getLocation() != null && company.getLocation() != "") {
			oldCompany.setLocation(company.getLocation());
		}

		return oldCompany;
	}


	@Override
	public Company createCompany(Company company) {
		em.persist(company);
		company = em.find(Company.class, company.getId());
		return company;
	}

}
