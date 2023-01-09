package com.skilldistillery.jobsearch.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jobsearch.entities.Article;

@Service
@Transactional
public class ArticleDAOImpl implements ArticleDAO {
 
	@PersistenceContext
	private EntityManager em;

	@Override
	public Article findArticleById(Integer articleId) {
		Article article = em.find(Article.class, articleId);
		return article;
	}
	
	
}
