package com.techshop.TechShop.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.techshop.TechShop.entity.Cart;
import com.techshop.TechShop.entity.CustomerOrder;
import com.techshop.TechShop.entity.Customer_info;
import com.techshop.TechShop.service.CartService;
import com.techshop.TechShop.service.CustomerOrderService;

@Controller
public class OrderController {
	
	@Autowired
	private CartService cartservice;
	
	@Autowired
	private CustomerOrderService orderservice;
	
	@RequestMapping("/order/${cartId}")
	public String createOrder(@PathVariable("cartId") int cartId, Model model) {
		CustomerOrder customerOrder = new CustomerOrder();
		Cart cart = cartservice.getcartbyid(cartId);
		customerOrder.setCart(cart);
		Customer_info customer = cart.getCustomer();
		customerOrder.setCustomer(customer);
		customerOrder.setShippingDetails(customer.getShipping_details());
		orderservice.addOrder(customerOrder);
		return "redirect:/checkout?cartId=" + cartId;
	}
}
