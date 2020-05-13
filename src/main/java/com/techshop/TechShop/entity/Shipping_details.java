package com.techshop.TechShop.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "Shipping_details")
public class Shipping_details  implements Serializable{

	private static final long serialVersionUID = -4084285115314963379L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "state")
	private String state;
	
	@Column(name = "city")
	private String city;
	
	@OneToOne(mappedBy = "shipping_details")
	private Customer_info customer;
	
	@NotNull(message = "Please fill the field with valid pincode")
	@Digits(integer = 6, message = "Enter valid pincode", fraction = 0)
	@Column(name="pincode")
	private long pincode;
	
	@OneToOne(mappedBy="shippingDetails")
	private CartOrder customerOrder;

	public Customer_info getCustomer() {
		return customer;
	}

	public void setCustomer(Customer_info customer) {
		this.customer = customer;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public long getPincode() {
		return pincode;
	}

	public void setPincode(long pincode) {
		this.pincode = pincode;
	}
	
}
