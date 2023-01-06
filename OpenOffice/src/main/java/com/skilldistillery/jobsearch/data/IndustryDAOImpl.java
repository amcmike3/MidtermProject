package com.skilldistillery.jobsearch.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jobsearch.entities.Industry;

@Service
@Transactional
public class IndustryDAOImpl implements IndustryDAO{

	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Industry> getAll() {
		List<Industry> industryList = new ArrayList<>();
		
		String jpql = "SELECT industry FROM Industry industry";
		
		industryList = em.createQuery(jpql, Industry.class).getResultList();
		
		 return industryList;
	}

	@Override
	public Industry findById(Integer industryId) {
		
		return em.find(Industry.class, industryId);
	}
	
	
}
