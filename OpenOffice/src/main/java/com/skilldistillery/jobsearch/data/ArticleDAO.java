package com.skilldistillery.jobsearch.data;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.skilldistillery.jobsearch.entities.Article;
import com.skilldistillery.jobsearch.entities.User;

public interface ArticleDAO {

	Article findArticleById(Integer articleId);

	List<Article> findArticle(String article);

	List<Article> findAllArticles();

	Article createArticle(Article article, HttpSession session);
	
	Article updateArticle(Article article);
	
	boolean deleteArticle(Integer articleId);

 
}
