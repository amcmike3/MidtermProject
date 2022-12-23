package com.skilldistillery.jobsearch.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
@Entity
@Table(name="interview_question")
public class InterviewQuestion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	private String name;
	
	private String description;
	
	@ManyToMany
	@JoinTable(name="interview_has_interview_question",
	joinColumns=@JoinColumn(name="interview_question_id"),
	inverseJoinColumns=@JoinColumn(name="interview_id")
	)
	private List<Interview> interviews;
	
	public InterviewQuestion() {}
	
	public List<Interview> getInterviews() {
		return interviews;
	}

	public void setInterviews(List<Interview> interviews) {
		this.interviews = interviews;
	}
	
	public void addInterview(Interview interview) {
		if(interviews == null) {
			interviews = new ArrayList<>();
		}
		if (! interviews.contains(interview)) {
			interviews.add(interview);
			interview.addInterviewQuestion(this);
		}
	}
	
	public void removeInterview(Interview interview) {
		if (interviews != null && interviews.contains(interview)) {
			interviews.remove(interview);
			interview.removeInterviewQuestion(this);
		}
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("InterviewQuestion [id=").append(id).append(", title=").append(title).append(", name=")
				.append(name).append(", description=").append(description).append("]");
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
		InterviewQuestion other = (InterviewQuestion) obj;
		return id == other.id;
	}
	
	
	
	
}
