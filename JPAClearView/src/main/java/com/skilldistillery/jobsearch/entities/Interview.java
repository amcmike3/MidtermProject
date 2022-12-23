package com.skilldistillery.jobsearch.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Interview {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String process;
	
	@Column(name="comment_date")
	private LocalDateTime commentDate;
	
	private String title;
	
	@Column(name="job_offered")
	private Boolean jobOffered;
	
	private String questions;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	public Interview() {}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public LocalDateTime getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Boolean getJobOffered() {
		return jobOffered;
	}

	public void setJobOffered(Boolean jobOffered) {
		this.jobOffered = jobOffered;
	}

	public String getQuestions() {
		return questions;
	}

	public void setQuestions(String questions) {
		this.questions = questions;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Interview [id=").append(id).append(", process=").append(process).append(", commentDate=")
				.append(commentDate).append(", title=").append(title).append(", jobOffered=").append(jobOffered)
				.append(", questions=").append(questions).append("]");
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
		Interview other = (Interview) obj;
		return id == other.id;
	}
	
	
}
