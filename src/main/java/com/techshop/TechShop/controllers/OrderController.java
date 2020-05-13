package com.techshop.TechShop.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.techshop.TechShop.entity.Cart;
import com.techshop.TechShop.entity.CartOrder;
import com.techshop.TechShop.entity.Customer_info;
import com.techshop.TechShop.service.CartService;
import com.techshop.TechShop.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private CartService cartservice;
	
	@Autowired
	private OrderService orderservice;
	
	@RequestMapping("/order/{cartId}")
	public String createOrder(@PathVariable("cartId") int cartId, Model model) {
		CartOrder customerOrder = new CartOrder();
		Cart cart = cartservice.getcartbyid(cartId);
		if(cart.getCustomer().getShipping_details() == null) {
			model.addAttribute("noDetails", true);
			return "redirect:/product/list/0?noDetails";
		}
		if(cart.getCustomerOrder() != null) {
			CartOrder order = cart.getCustomerOrder();
			order.setCart(cart);
			order.setCustomer(cart.getCustomer());
			order.setShippingDetails(cart.getCustomer().getShipping_details());
			orderservice.updateOrder(order);
		}
		else {
			customerOrder.setCart(cart);
			Customer_info customer = cart.getCustomer();
			customerOrder.setCustomer(customer);
			customerOrder.setShippingDetails(customer.getShipping_details());
			orderservice.addOrder(customerOrder);
		}
		return "redirect:/checkout?cartId=" + cartId;
	}
}
