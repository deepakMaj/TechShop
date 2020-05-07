package com.techshop.TechShop.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name="customer_info")
public class Customer_info {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;

	@Column(name="firstname")
	private String firstname;

	@Column(name="lastname")
	private String lastname;
	
	@NotEmpty(message="Please enter valid email")
	@Email(message="Please enter valid email")
	@Column(name="email", unique=true)
	private String email;
	
	@Column(name="password")
	private String password;
	
	@Size(min = 10, max = 10, message = "Please enter valid mobile number")
	@Column(name="mobile")
	private String mobile;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="shipping_details_id")
	private Shipping_details shipping_details;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name="Customer_Roles", joinColumns= {
			@JoinColumn(name="Customer_id", referencedColumnName="id")
	}, inverseJoinColumns= {@JoinColumn(name="Role_id", referencedColumnName="customer_id")})
	private List<CustomerAuthority> roles;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name="cartId")
	private Cart cart;
	
	private int enabled;
	
	public Customer_info() {
	}

	public Cart getCart() {
		return cart;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Shipping_details getShipping_details() {
		return shipping_details;
	}

	public void setShipping_details(Shipping_details shipping_details) {
		this.shipping_details = shipping_details;
	}

	public List<CustomerAuthority> getRoles() {
		return roles;
	}

	public void setRoles(List<CustomerAuthority> roles) {
		this.roles = roles;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

}
