package com.skilldistillery.jobsearch.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Job {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private Integer salary;

	@Column(name = "years_experience")
	private Integer yearsExperience;

	private String skills;

	private String education;

	private String certifications;

	private boolean enabled;
	
	private String description;

	@ManyToOne
	@JoinColumn(name = "industry_id")
	private Industry industry;

	@ManyToOne
	@JoinColumn(name = "company_id")
	private Company company;

	@OneToMany
	@JoinColumn(name = "job_id")
	private List<Interview> interviews;
	
	private String title;
	// methods start
	public Job() {
	}

	public List<Interview> getInterviews() {
		return interviews;
	}

	public void setInterviews(List<Interview> interviews) {
		this.interviews = interviews;
	}

	public void addInterview(Interview interview) {
		if (interviews == null) {
			interviews = new ArrayList<>();
		}
		if (!interviews.contains(interview)) {
			interviews.add(interview);
			interview.getUser().removeInterview(interview);
		}
		interview.setJob(this);
	}

	public void removeInterview(Interview interview) {
		if (interviews != null && interviews.contains(interview)) {
			interviews.remove(interview);
			interview.setJob(null);
		}
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Industry getIndustry() {
		return industry;
	}

	public void setIndustry(Industry industry) {
		this.industry = industry;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getSalary() {
		return salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	public Integer getYearsExperience() {
		return yearsExperience;
	}

	public void setYearsExperience(Integer yearsExperience) {
		this.yearsExperience = yearsExperience;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getCertifications() {
		return certifications;
	}

	public void setCertifications(String certifications) {
		this.certifications = certifications;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
		builder.append("Job [id=").append(id).append(", salary=").append(salary).append(", yearsExperience=")
				.append(yearsExperience).append(", skills=").append(skills).append(", education=").append(education)
				.append(", certifications=").append(certifications).append(", enabled=").append(enabled).append("]");
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
		Job other = (Job) obj;
		return id == other.id;
	}

}


