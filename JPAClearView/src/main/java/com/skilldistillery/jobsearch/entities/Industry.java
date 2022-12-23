package com.skilldistillery.jobsearch.entities;


import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity
public class Industry {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@OneToMany(mappedBy="industry")
	private List<Article> articles; 
	
	
	
	public Industry() {}
	

	public List<Article> getArticles() {
		return articles;
	}


	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}

	public void addArticle(Article article) {
		if (articles == null ) {
			articles = new ArrayList<>();
		}
		if (! articles.contains(article)) {
			articles.add(article);
			article.getIndustry().removeArticle(article);
		}
		article.setIndustry(this);
	}
	
	public void removeArticle(Article article) {
		if (articles != null && articles.contains(article)) {
			articles.remove(article);
			article.setIndustry(null);
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Industry [id=").append(id).append(", name=").append(name).append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Industry other = (Industry) obj;
		return id == other.id;
	}
	
	
}
