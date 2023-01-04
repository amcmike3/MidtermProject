package com.skilldistillery.jobsearch.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

@Service
@Transactional
public class CompanyImageDAOImpl implements CompanyImageDAO {

	@PersistenceContext
	private EntityManager em;
	
	
}
