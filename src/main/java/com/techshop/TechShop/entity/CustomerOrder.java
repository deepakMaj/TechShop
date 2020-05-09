package com.techshop.TechShop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class CustomerOrder {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="OrderId")
	private int customerOrderId;
	
	@OneToOne
	@JoinColumn(name="CartId")
	private Cart cart;
	
	@OneToOne
	@JoinColumn(name="CustomerId")
	private Customer_info customer;
	
	@OneToOne
	@JoinColumn(name="ShippingAddressId")
	private Shipping_details shippingDetails;

	public int getCustomerOrderId() {
		return customerOrderId;
	}

	public void setCustomerOrderId(int customerOrderId) {
		this.customerOrderId = customerOrderId;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Customer_info getCustomer() {
		return customer;
	}

	public void setCustomer(Customer_info customer) {
		this.customer = customer;
	}

	public Shipping_details getShippingDetails() {
		return shippingDetails;
	}

	public void setShippingDetails(Shipping_details shippingDetails) {
		this.shippingDetails = shippingDetails;
	}
	
	
}
