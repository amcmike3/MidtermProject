package com.skilldistillery.jobsearch.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jobsearch.entities.Job;
import com.skilldistillery.jobsearch.entities.User;

@Service
@Transactional
public class JobDAOImpl implements JobDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Job> findAllJobs() {
		String jpql = "SELECT job FROM Job job";
		return em.createQuery(jpql, Job.class).getResultList();
	}

	@Override
	public List<Job> findJobs(String title) {

		List<Job> ans = new ArrayList<>();
		String jpql = "select job from Job job where job.title like :title";

		ans = em.createQuery(jpql, Job.class).setParameter("title", "%" + title + "%").getResultList();
		return ans;

	}

	@Override
	public Job findJobById(Integer jobId) {
		return em.find(Job.class, jobId);
	}

	@Override
	public Job createJob(Job job) {

		em.persist(job);
		
		job = em.find(Job.class, job.getId());
		
		
		return job;

	}

	@Override
	public List<Job> findAllJobsWithinASpecificCompany(Integer companyId) {
		List<Job> companyJobs = new ArrayList<>();

		String jpql = "select job from Job job where Company company.id = :companyId";
		companyJobs = em.createQuery(jpql, Job.class).setParameter("companyId", companyId).getResultList();

		return companyJobs;
	}

	@Override
	public Job updateJob(Job job) {
		Job oldJob = em.find(Job.class, job.getId());

		if (job.getTitle() != null && job.getTitle() != "") {
			oldJob.setTitle(job.getTitle());
		}
		if (job.getSalary() != null && job.getSalary() >= 0) {
			oldJob.setSalary(job.getSalary());
		}
		if (job.getYearsExperience() != null && job.getYearsExperience() >= 0) {
			oldJob.setYearsExperience(job.getYearsExperience());
		}
		if (job.getSkills() != null && job.getSkills() != ""){
			oldJob.setSkills(job.getSkills());
		}
		if (job.getEducation() != null && job.getEducation() != "") {
			oldJob.setEducation(job.getEducation());
		}
		if (job.getCertifications() != null && job.getCertifications() != "") {
			oldJob.setCertifications(job.getCertifications());
		}
		if (job.getDescription() != null && job.getDescription() != "") {
			oldJob.setDescription(job.getDescription());
		}
		if (job.getIndustry() != null) {
			oldJob.setIndustry(job.getIndustry());
		}
		oldJob.setEnabled(job.isEnabled());

		return oldJob;
	}

}
