package com.skilldistillery.jobsearch.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jobsearch.entities.Company;
import com.skilldistillery.jobsearch.entities.Interview;
import com.skilldistillery.jobsearch.entities.InterviewQuestion;
import com.skilldistillery.jobsearch.entities.User;

@Service
@Transactional
public class InterviewQuestionDAOImpl implements InterviewQuestionDAO{

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
	public InterviewQuestion findInterviewQuestionById(Integer interviewQuestionId) {
		return em.find(InterviewQuestion.class, interviewQuestionId);
	}

	@Override
	public InterviewQuestion updateInterviewQuestion(int interviewQuestionId, InterviewQuestion interviewQuestion) {

			InterviewQuestion interviewQuestionUpdate = em.find(InterviewQuestion.class, interviewQuestionId);

			interviewQuestionUpdate.setTitle(interviewQuestion.getTitle());
			interviewQuestionUpdate.setName(interviewQuestion.getName());
			interviewQuestionUpdate.setDescription(interviewQuestion.getDescription());

			return interviewQuestionUpdate;
	}

	@Override
	public Interview findInterviewById(Integer interviewId) {
		return em.find(Interview.class, interviewId);

	}

	@Override
	public InterviewQuestion addInterviewQuestion(InterviewQuestion question, Integer interviewId) {
		em.persist(question);
		question.addInterview(em.find(Interview.class, interviewId));
		return question;
	}
	
}
