package com.techshop.TechShop.entity;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="customer_authorities")
public class CustomerAuthority {
	
	@ManyToMany(mappedBy = "roles")
	private List<Customer_info> customer;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="customer_id")
	private int customer_id;
	
	@Column(name="authority")
	private String authority;

	public List<Customer_info> getCustomer() {
		return customer;
	}

	public void setCustomer(List<Customer_info> customer) {
		this.customer = customer;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

}
