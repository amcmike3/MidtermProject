package com.skilldistillery.jobsearch.data;

import java.util.List;

import com.skilldistillery.jobsearch.entities.Article;
import com.skilldistillery.jobsearch.entities.User;

public interface ArticleDAO {

	Article findArticleById(Integer articleId);

	List<Article> findArticle(String article);

	List<Article> findAllArticles();

	Article updateArticle(Article article);
	
	boolean deleteArticle(Integer articleId);
 
}
