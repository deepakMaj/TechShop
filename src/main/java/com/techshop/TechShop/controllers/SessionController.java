package com.techshop.TechShop.controllers;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.techshop.TechShop.entity.Customer_info;
import com.techshop.TechShop.entity.Login_info;
import com.techshop.TechShop.entity.Shipping_details;
import com.techshop.TechShop.service.CustomerService;

@Controller
public class SessionController {
	
	@Autowired
	 PasswordEncoder passwordEncoder;
	
	@Autowired
	private CustomerService customerservice;

	@RequestMapping("/login")
	public String loginForm(@RequestParam(value = "error",required = false) String error,
			@RequestParam(value = "message",required = false) String message,
			@RequestParam(value= "logout", required = false) String logout, Model model) {
		if (error != null) {
			model.addAttribute("error","Invalid credentials provided");
		}
		if (message != null) {
			model.addAttribute("message","You have successfully signed up");
		}
		if(logout != null) {
			model.addAttribute("logout","You have successfully logged out");
		}
		model.addAttribute("loginsuccess", true);
		Login_info logininfo = new Login_info();
		model.addAttribute("logininfo", logininfo);
		return "login";
	}
	
	@GetMapping("/edit_form")
	public String editform(Model model) {
		if(SecurityContextHolder.getContext().getAuthentication().getName().toString().equals("anonymousUser")) {
			model.addAttribute("updateaccesserror", true);
			return "redirect:/?updateaccesserror";
		}
		else {
			Customer_info customer = customerservice.getUserByEmail(SecurityContextHolder.getContext().getAuthentication().getName()).get(0);
			model.addAttribute("customer", customer);
		}
		return "edit_form";
	}
	
	@PostMapping("/edit_form")
	public ModelAndView editprocess(@Valid @ModelAttribute("customer") Customer_info customer, BindingResult result) {
		ModelAndView model= new ModelAndView("redirect:/");
		if(result.hasErrors()) 
			return new ModelAndView("/edit_form");
		String encodedPassword  = passwordEncoder.encode(customer.getPassword());
		customer.setPassword(encodedPassword);
		customerservice.updatecustomer(customer);
		model.addObject("updatesuccess", true);
		return model;
	}
	
	@GetMapping("/signup")
	public String signupForm(Model model) {
		Customer_info customer = new Customer_info();
		model.addAttribute("customer", customer);
		return "signup";
	}
	
	@PostMapping("/signup")
	public ModelAndView signupprocess(@Valid @ModelAttribute("customer") Customer_info customer, BindingResult result) {
		ModelAndView model = new ModelAndView("redirect:/login");
		if(result.hasErrors()) 
			return new ModelAndView("/signup");
		String encodedPassword  = passwordEncoder.encode(customer.getPassword());
		customer.setPassword(encodedPassword);
		boolean result_detail = customerservice.userexist(customer.getEmail());
		if(result_detail == true) {
			model.addObject("customererror", "Customer already exsist");
			return new ModelAndView("/signup");
		}
		model.addObject("message", true);
		customerservice.savecustomer(customer);
		return model;
	}
	
	@GetMapping("/shipping_details_form")
	public String shipping_details(Model model) {
		String user = SecurityContextHolder.getContext().getAuthentication().getName();
		Customer_info customer = customerservice.getUserByEmail(user).get(0);
		if(customer.getShipping_details() != null) {
			model.addAttribute("shipping_details", customer.getShipping_details());
		}
		else {
			Shipping_details shipping_details = new Shipping_details();
			model.addAttribute("shipping_details", shipping_details);
		}
		model.addAttribute("shippingdetailsaccesserror", true);
		return "shipping_form";
	}

	@PostMapping("/shipping_details_form")
	public ModelAndView shippingdetailsprocess(@Valid @ModelAttribute("shipping_details") Shipping_details shipping_details, BindingResult result) {
		ModelAndView model = new ModelAndView("redirect:/");
		if(result.hasErrors())
			return new ModelAndView("shipping_form");
		Customer_info customer = customerservice.getUserByEmail(SecurityContextHolder.getContext().getAuthentication().getName()).get(0);
		if(customer.getShipping_details() == null) {
			customer.setShipping_details(shipping_details);
			customerservice.saveshippingdetails(shipping_details);
		}
		else
			customerservice.updateshippingdetails(shipping_details, customer.getShipping_details().getId());
		model.addObject("shippingmessage", true);
		return model;
	}
}
