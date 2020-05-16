package com.techshop.TechShop.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class CustomerOrder implements Serializable{

	private static final long serialVersionUID = 5857866105977788126L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int orderId;
	
	@ManyToOne
	@JoinColumn(name="customerId")
	private Customer_info customer;
	
	@ManyToMany
	@JoinTable(name="CustomerOrder_Product", joinColumns= {
			@JoinColumn(name="OrderId", referencedColumnName="orderId")
	}, inverseJoinColumns= {@JoinColumn(name="ProductId", referencedColumnName="Product_Id")})
    private List<Product> productItems;
    
	private double grandTotal;

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Customer_info getCustomer() {
		return customer;
	}

	public void setCustomer(Customer_info customer) {
		this.customer = customer;
	}

	public List<Product> getProductItems() {
		return productItems;
	}

	public void setProductItems(List<Product> list) {
		this.productItems = list;
	}

	public double getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}
	
}
