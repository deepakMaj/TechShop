package com.techshop.TechShop.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.techshop.TechShop.entity.CustomerOrder;
import com.techshop.TechShop.service.CustomerOrderService;

@Controller
public class CustomerOrderController {

	@Autowired
	private CustomerOrderService customerOrderService;
	
	@RequestMapping("/myOrders")
	public String showOrders(@RequestParam(value="orderCancelled", required=false) String orderCancelled, Model model) {
		List<CustomerOrder> customerOrder = customerOrderService.findOrder();
		if(orderCancelled != null)
			model.addAttribute("orderCancelled", "Order has been cancelled and refund will be initiated in 2 hours");
		model.addAttribute("customerOrders", customerOrder);
		return "myOrders";
	}
	
	@RequestMapping("/myOrders/cancel/{orderId}")
	public ModelAndView cancelOrder(@PathVariable("orderId") int orderId) {
		ModelAndView model = new ModelAndView("redirect:/myOrders?orderCancelled");
		customerOrderService.cancelOrder(orderId);
		return model;
		
	}
}
