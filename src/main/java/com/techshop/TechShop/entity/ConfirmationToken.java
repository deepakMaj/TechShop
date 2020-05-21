package com.techshop.TechShop.entity;

import java.util.Date;
import java.util.UUID;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class ConfirmationToken {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long tokenId;
	
	private String confirmationToken;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;
	
	@OneToOne(targetEntity = Customer_info.class, fetch = FetchType.EAGER)
	@JoinColumn(name="user_id", nullable=false)
	private Customer_info customer;
	
	public ConfirmationToken() {
	}
	
	public ConfirmationToken(Customer_info customer) {
		this.customer = customer;
		createdDate = new Date();
		confirmationToken = UUID.randomUUID().toString();
	}

	public long getTokenId() {
		return tokenId;
	}

	public void setTokenId(long tokenId) {
		this.tokenId = tokenId;
	}

	public String getConfirmationToken() {
		return confirmationToken;
	}

	public void setConfirmationToken(String confirmationToken) {
		this.confirmationToken = confirmationToken;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Customer_info getCustomer() {
		return customer;
	}

	public void setCustomer(Customer_info customer) {
		this.customer = customer;
	}
	
}
