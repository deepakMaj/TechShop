package com.techshop.TechShop.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.techshop.TechShop.entity.Product;
import com.techshop.TechShop.service.ProductService;

@Controller
@RequestMapping("/admin/product")
public class AdminController {
	
	@Autowired 
	private ProductService productservice;
	
	@GetMapping("/new")
	public String addProduct(Model model) {
		Product product = new Product();
		model.addAttribute("product_detail", product);
		return "addproduct";
	}
	
	@PostMapping("/new")
	public ModelAndView addProductProcess(@ModelAttribute("product_detail") Product product) {
		ModelAndView model = new ModelAndView("redirect:/product/list/0");
		productservice.addproduct(product);
		model.addObject("productsuccess", true);
		return model;
	}
	
	@GetMapping("/edit/{productId}")
	public String updateProduct(@PathVariable("productId") int id, Model model) {
		Product product = productservice.getproductbyid(id);
		model.addAttribute("productdetails", product);
		return "updateproduct";
	}
	
	@PostMapping("/edit/{productId}")
	public ModelAndView updateProductProcess(@ModelAttribute("productdetails") Product product) {
		ModelAndView model = new ModelAndView("redirect:/product/list/0?updatesuccess");
		productservice.updateproduct(product);
		model.addObject("updatesuccess", true);
		return model;
	}
	
	@RequestMapping("/delete/{productId}")
	public ModelAndView deleteproduct(@PathVariable("productId") int id) {
		ModelAndView model = new ModelAndView("redirect:/product/list?deleteproduct");
		productservice.deleteproduct(id);
		model.addObject("deleteproduct", true);
		return model;
	}
	
	

}
