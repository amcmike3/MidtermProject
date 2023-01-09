package com.skilldistillery.jobsearch.data;

import com.skilldistillery.jobsearch.entities.Article;

public interface ArticleDAO {

	Article findArticleById(Integer articleId);
 
}
