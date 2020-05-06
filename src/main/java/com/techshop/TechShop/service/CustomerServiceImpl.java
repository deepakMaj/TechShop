package com.techshop.TechShop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techshop.TechShop.dao.CustomerDao;
import com.techshop.TechShop.dao.ShippingDetailsDao;
import com.techshop.TechShop.entity.Cart;
import com.techshop.TechShop.entity.CustomerAuthority;
import com.techshop.TechShop.entity.Customer_info;
import com.techshop.TechShop.entity.Shipping_details;

@Service
public class CustomerServiceImpl implements CustomerService{

	private CustomerDao customerdao;
	
	private ShippingDetailsDao shippingdao;
	
	@Autowired
	public CustomerServiceImpl(CustomerDao customerDao, ShippingDetailsDao shippingDao) {
		customerdao = customerDao;
		shippingdao = shippingDao;
	}

	@Override
	@Transactional
	public void savecustomer(Customer_info customer) {
		CustomerAuthority role = new CustomerAuthority();
		role.setAuthority("ROLE_USER");
		List<CustomerAuthority> roles = new ArrayList<>();
		roles.add(role); 
		Cart cart = new Cart();
		customer.setCart(cart);
		customer.setRoles(roles);
		customerdao.save(customer);
	}
	
	@Override
	@Transactional
	public boolean userexist(String email) {
		if(!customerdao.findByEmail(email).isEmpty()) 
			return true;
		else
			return false;
	}
	
	@Override
	@Transactional
	public void saveshippingdetails(Shipping_details shippingdetails) {
		shippingdao.save(shippingdetails);
	}

	@Override
	@Transactional
	public List<Customer_info> getUserByEmail(String name) {
		return customerdao.findByEmail(name);
	}

	@Override
	@Transactional
	public void updateshippingdetails(Shipping_details shipping_details, int id) {
		 shippingdao.updatedetail(shipping_details.getAddress(),shipping_details.getCity(), shipping_details.getState(), shipping_details.getPincode(), id);
	}

	@Override
	@Transactional
	public void updatecustomer(Customer_info customer) {
		customerdao.update(customer.getId(), customer.getEmail(), customer.getFirstname(), customer.getLastname(), customer.getPassword(), customer.getMobile());
	}
	
}
