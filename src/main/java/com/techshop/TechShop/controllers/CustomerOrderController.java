package com.techshop.TechShop.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.techshop.TechShop.entity.CustomerOrder;
import com.techshop.TechShop.service.CustomerOrderService;

@Controller
public class CustomerOrderController {

	@Autowired
	private CustomerOrderService customerOrderService;
	
	@RequestMapping("/myOrders")
	public String showOrders(Model model) {
		List<CustomerOrder> customerOrder = customerOrderService.findOrder();
		model.addAttribute("customerOrders", customerOrder);
		return "myOrders";
	}
}
