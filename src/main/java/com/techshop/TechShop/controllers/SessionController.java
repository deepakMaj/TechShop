package com.techshop.TechShop.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.techshop.TechShop.dao.ConfirmationTokenDao;
import com.techshop.TechShop.entity.ConfirmationToken;
import com.techshop.TechShop.entity.Customer_info;
import com.techshop.TechShop.entity.Login_info;
import com.techshop.TechShop.entity.Shipping_details;
import com.techshop.TechShop.service.ConfirmationTokenServiceImpl;
import com.techshop.TechShop.service.CustomerService;

@Controller
public class SessionController {
	
	@Autowired
	private ConfirmationTokenDao tokenDao;
	
	@Autowired
	 private ConfirmationTokenServiceImpl emailSenderService;
	
	@Autowired
	 PasswordEncoder passwordEncoder;
	
	@Autowired
	private CustomerService customerservice;

	@RequestMapping("/login")
	public String loginForm(@RequestParam(value = "error",required = false) String error,
			@RequestParam(value = "message",required = false) String message,
			@RequestParam(value = "validmessage",required = false) String validmessage,
			@RequestParam(value= "logout", required = false) String logout,
			@RequestParam(value= "verified", required = false) String verified,
			@RequestParam(value= "email", required = false) String email,Model model) {
		if (error != null) {
			model.addAttribute("error", "Invalid credentials provided");
		}
		if(validmessage !=null) {
			model.addAttribute("validmessage", validmessage);
		}
		if (message != null) {
			model.addAttribute("message", "A verification email has been sent to "+email);
		}
		if(logout != null) {
			model.addAttribute("logout", "You have successfully logged out");
		}
		if(verified != null) {
			model.addAttribute("verified","Your account has been successfully created and verified");
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
	public String signupForm(Model model, @RequestParam(value="customererror", required=false) String error,	
									@RequestParam("accountError") String accountError) {
		Customer_info customer = new Customer_info();
		if(error != null)
			model.addAttribute("customererror", "Customer already exists!");
		if(accountError != null)
			model.addAttribute("customererror", "The link is broken or invalid!");
		model.addAttribute("customer", customer);
		return "signup";
	}
	
	@PostMapping("/signup")
	public ModelAndView signupprocess(@Valid @ModelAttribute("customer") Customer_info customer, BindingResult result) {
		ModelAndView model = new ModelAndView("redirect:/login");
		if(result.hasErrors()) {
			return new ModelAndView("/signup");
			}
		boolean result_detail = customerservice.userexist(customer.getEmail());
		if(result_detail == true) {
			model.addObject("customererror", true);
			return new ModelAndView("redirect:/signup");
		}
		else {
			model.addObject("message", true);
			String encodedPassword  = passwordEncoder.encode(customer.getPassword());
			customer.setPassword(encodedPassword);
			customerservice.savecustomer(customer);
			ConfirmationToken token = new ConfirmationToken(customer);
			tokenDao.save(token);
			SimpleMailMessage mail = new SimpleMailMessage();
			mail.setTo(customer.getEmail());
			mail.setSubject("Complete Registration");
			mail.setFrom("techproductshop2020@gmail.com");
			mail.setText("To confirm your account, please click here : "
		            +"http://tech-product-shop.herokuapp.com/confirm-account?token="+token.getConfirmationToken());
			emailSenderService.sendEmail(mail);
			model.addObject("email", customer.getEmail());
		}
		return model;
	}
	
	@GetMapping(value="/confirm-account")
	public ModelAndView confirmAccount(@RequestParam("token") String token) {
		ModelAndView model = new ModelAndView("redirect:/login?verified");
		ConfirmationToken confirmationToken = tokenDao.findByConfirmationToken(token);
		if(confirmationToken != null) {
			Customer_info customer = customerservice.getUserByEmail(confirmationToken.getCustomer().getEmail()).get(0);
			customer.setEnabled(1);
			customerservice.savecustomer(customer);
			model.addObject("verified", true);
		}
		else {
			model.addObject("accountError", true);
			return new ModelAndView("redirect:/signup?accountError");
		}
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
	
	@GetMapping("/forgotPassword")
	public ModelAndView forgotPassword(Customer_info customer) {
		ModelAndView model = new ModelAndView("forgotPassword");
		model.addObject("customer", customer);
		return model;
	}
	
	@PostMapping("/forgotPassword")
	public ModelAndView forgotPasswordProcess(Customer_info customer) {
		ModelAndView model = new ModelAndView("redirect:/login?validmessage");
		Customer_info existingCustomer = customerservice.getUserByEmail(customer.getEmail()).get(0);
		if(existingCustomer != null) {
			ConfirmationToken confirmationToken = new ConfirmationToken(existingCustomer);
			tokenDao.save(confirmationToken);
			SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setTo(existingCustomer.getEmail());
            mailMessage.setSubject("Complete Password Reset!");
            mailMessage.setFrom("techproductshop2020@gmail.com");
            mailMessage.setText("To complete the password reset process, please click here: "
              + "http://tech-product-shop.herokuapp.com/confirm-reset?token="+confirmationToken.getConfirmationToken());
            emailSenderService.sendEmail(mailMessage);
            model.addObject("validmessage", "Request to reset password received. Check your inbox for the reset link.");
		}
		else {
            model.addObject("validmessage", "This email address does not exist!");
        }
        return model;
	}
	
	@RequestMapping(value="/confirm-reset", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView changePassoword(@RequestParam("token")String confirmationToken){
		ModelAndView model = new ModelAndView("redirect:/reset-Password");
		ConfirmationToken token = tokenDao.findByConfirmationToken(confirmationToken);
		if(token != null) {
			Customer_info customer = customerservice.getUserByEmail(token.getCustomer().getEmail()).get(0);
			model.addObject("customer", customer);
			customerservice.updatecustomer(customer);
			model.setViewName("resetPassword");
		}
		else {
			model.addObject("message", "The link is broken or invalid!");
		}
		return model;
	}
	
	@PostMapping("reset-Password")
    public ModelAndView resetUserPassword(Customer_info customer) {
		ModelAndView model = new ModelAndView("redirect:/login?validmessage");
        if (customer.getEmail() != null) {
            Customer_info tokenCustomer = customerservice.getUserByEmail(customer.getEmail()).get(0);
            tokenCustomer.setPassword(passwordEncoder.encode(customer.getPassword()));
            customerservice.savecustomer(customer);
            model.addObject("validmessage", "Password successfully reset. You can now log in with the new credentials.");
        } else {
            model.addObject("validmessage", "The link is invalid or broken!");
        }
        return model;
    }
	
}
