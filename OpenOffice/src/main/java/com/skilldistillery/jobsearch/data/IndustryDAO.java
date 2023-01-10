package com.skilldistillery.jobsearch.data;

import java.util.List;

import com.skilldistillery.jobsearch.entities.Industry;


public interface IndustryDAO {

	public List<Industry> getAll();

	public Industry findById(Integer industryId);
	
	
	
}
