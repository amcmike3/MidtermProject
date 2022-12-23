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

@Entity
public class Company {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String location;
	
	private boolean enabled;
	
	@ManyToMany(mappedBy="companies")
	private List<User> users;
	
	@ManyToMany
	@JoinTable(name="company_has_benefit",
	joinColumns=@JoinColumn(name="company_id"),
	inverseJoinColumns=@JoinColumn(name="benefit_id"))
	private List<Benefit> benefits;

	public Company() {}
	
	public List<Benefit> getBenefits() {
		return benefits;
	}
	
	public void setBenefits(List<Benefit> benefits) {
		this.benefits = benefits;
	}
	
	public void addBenefit(Benefit benefit) {
		if(benefits == null) {
			benefits = new ArrayList<>();
		}
		if (! benefits.contains(benefit)) {
			benefits.add(benefit);
			benefit.addCompany(this);
		}
	}
	
	public void removeBenefit(Benefit benefit) {
		if (benefits != null && benefits.contains(benefit)) {
			benefits.remove(benefit);
			benefit.removeCompany(this);
		}
	}

	public List<User> getUsers() {
		return users;
	}
	
	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	
	public void addUser(User user) {
		if(users == null) {
			users = new ArrayList<>();
		}
		if (! users.contains(user)) {
			users.add(user);
			user.addCompany(this);
		}
	}
	
	public void removeUser(User user) {
		if (users != null && users.contains(user)) {
			users.remove(user);
			user.removeCompany(this);
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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Company [id=").append(id).append(", name=").append(name).append(", location=").append(location)
				.append(", enabled=").append(enabled).append("]");
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
		Company other = (Company) obj;
		return id == other.id;
	}
	
	
}
