package com.techshop.TechShop.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WelcomeController {
	
	@RequestMapping("/")
	public String welcome(@RequestParam(value="login", required=false) String loginsuccess,
						@RequestParam(value="shippingmessage", required=false) String message,
						@RequestParam(value="loginaccesserror", required=false) String loginaccesserror,
						@RequestParam(value="addproductaccesserror", required=false) String addproductaccesserror,
						@RequestParam(value="updatesuccess", required=false) String updatesuccess,
						@RequestParam(value="signupaccesserror", required=false) String signupaccesserror,
						@RequestParam(value="updateaccesserror", required=false) String updateaccesserror,
						@RequestParam(value="shippingdetailsaccesserror", required=false) String shippingdetailsaccesserror, Model model) {
		if(loginsuccess != null)
			model.addAttribute("loginsuccess", "You have successfully logged in");
		if(loginaccesserror != null)
			model.addAttribute("loginaccesserror", "You are already logged in");
		if(updateaccesserror != null)
			model.addAttribute("updateaccesserror", "Sign in to perform the desired action");
		if(signupaccesserror != null)
			model.addAttribute("signupaccesserror", "You must sign out to access the page");
		if(message != null)
			model.addAttribute("success", "Shipping details were added successfully");
		if(shippingdetailsaccesserror != null)
			model.addAttribute("shippingdetailsaccesserror", "Sign in to perfom the desired action");
		if(updatesuccess != null)
			model.addAttribute("updatesuccess", "Account was updated successfully");
		if(addproductaccesserror != null)
			model.addAttribute("addproductaccesserror", "Only admin can access the page");
		return "welcome";
	}
	
	@RequestMapping("/about")
	public String aboutpage(){
		return "about";
	}

}
