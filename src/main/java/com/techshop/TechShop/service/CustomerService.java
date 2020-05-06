package com.techshop.TechShop.service;

import java.util.List;

import javax.validation.Valid;

import com.techshop.TechShop.entity.Customer_info;
import com.techshop.TechShop.entity.Shipping_details;

public interface CustomerService {
	
	void savecustomer(Customer_info customer);

	void saveshippingdetails(Shipping_details shipping_details);

	boolean userexist(String email);

	List<Customer_info> getUserByEmail(String name);

	void updateshippingdetails(@Valid Shipping_details shipping_details, int id);

	void updatecustomer(Customer_info customer);

}
