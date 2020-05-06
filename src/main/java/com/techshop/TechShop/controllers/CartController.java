package com.techshop.TechShop.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.techshop.TechShop.entity.CartItem;
import com.techshop.TechShop.entity.Customer_info;
//import com.techshop.TechShop.service.CartService;
import com.techshop.TechShop.service.CustomerService;

@Controller
public class CartController {
	
	@Autowired
	private CustomerService customerservice;
	
//	@Autowired
	//private CartService cartservice;

	@RequestMapping("/cart/mycart")
	public ModelAndView viewcart() {
		ModelAndView model = new ModelAndView("cart");
		String user = SecurityContextHolder.getContext().getAuthentication().getName();
		Customer_info customer = customerservice.getUserByEmail(user).get(0);
		if(customer.getCart().getCartitems().isEmpty())
			model.addObject("nocartitems", true);
		else {
			double grandTotal = 0.0;
			List<CartItem> cartitems = customer.getCart().getCartitems();
			for(CartItem x : cartitems) {
				grandTotal += Double.parseDouble(x.getPrice());
			}
			model.addObject("grandtotal", (int)grandTotal);
 			model.addObject("cartitems",customer.getCart().getCartitems());
 			model.addObject("cartId", customer.getCart().getCartId());
		}
		return model;
	}
}
