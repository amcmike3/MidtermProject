package com.skilldistillery.jobsearch.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.Interview;
import com.skilldistillery.jobsearch.entities.Job;
import com.skilldistillery.jobsearch.entities.User;

@Service
@Transactional
public class InterviewDAOImpl implements InterviewDAO {

	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public Company findCompanyById(Integer companyId) {
		return em.find(Company.class, companyId);
	}

	@Override
	public Interview findInterviewById(Integer interviewId) {
		return em.find(Interview.class, interviewId);
	}

	@Override
	public Interview updateInterview(int interviewId, Interview interview) {

			Interview interviewUpdate = em.find(Interview.class, interviewId);

			interviewUpdate.setTitle(interview.getTitle());
			interviewUpdate.setProcess(interview.getProcess());
			interviewUpdate.setJobOffered(interview.getJobOffered());
			interviewUpdate.setInterviewQuestions(interview.getInterviewQuestions());

			return interviewUpdate;
	}

	@Override
	public List<Interview> userInterviewsForCompany(int companyId, int userId) {
		String jpql = "SELECT i FROM Interview i WHERE i.job.company.id = :cid AND i.user.id = :uid";
		return em.createQuery(jpql, Interview.class).setParameter("cid", companyId).setParameter("uid", userId).getResultList();
	}

	@Override
	public Interview createInterview(Integer jobId, Interview interview) {
		em.persist(interview);
		interview.setJob(em.find(Job.class, jobId));
		return interview;
	}
	
	
	
}
