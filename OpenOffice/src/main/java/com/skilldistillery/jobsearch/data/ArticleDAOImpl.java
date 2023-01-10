package com.skilldistillery.jobsearch.data;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jobsearch.entities.Article;
import com.skilldistillery.jobsearch.entities.User;

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
	
	@Override
	public List<Article> findAllArticles() {
		String jpql = "SELECT article FROM Article article";
		return em.createQuery(jpql, Article.class).getResultList();
	}



	@Override
	public List<Article> findArticle(String title) {
		List<Article> ans = new ArrayList<>();
		String jpql = "select article from Article article where article.title like :title";

		ans = em.createQuery(jpql, Article.class).setParameter("title", "%" + title + "%").getResultList();
		return ans;
	}

	@Override
<<<<<<< HEAD
	public Article createArticle(Article article, HttpSession session) {
		article.setDatePosted(LocalDateTime.now());
		article.setUser((User) session.getAttribute("user"));
		em.persist(article);
		return article;
=======
	public Article updateArticle(Article article) {
		Article updateArticle = em.find(Article.class, article.getId());
		System.out.println("--------------------------------------" + article);
		System.out.println("--------------------------------------" + updateArticle);
		updateArticle.setTitle(article.getTitle());
		updateArticle.setDescription(article.getDescription());
		
		return updateArticle;
	}

	@Override
	public boolean deleteArticle(Integer articleId) {
		em.remove(findArticleById(articleId));
		if(findArticleById(articleId) == null) {
			return true;
		}
		return false;
>>>>>>> 35cea5e70953b2018e20910b6585d1f2e39de545
	}
	
	
}
