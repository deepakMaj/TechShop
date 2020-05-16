package com.techshop.TechShop.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.techshop.TechShop.entity.Customer_info;
import com.techshop.TechShop.entity.Product;
import com.techshop.TechShop.service.CustomerService;
import com.techshop.TechShop.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productservice;
	
	@Autowired
	private CustomerService customerservice;
	
	@RequestMapping("/list/{pageNo}")
	public String productlist(@RequestParam(value="productsuccess", required=false) String productsuccess,
										@RequestParam(value="accesserror", required=false) String accesserror,
										@RequestParam(value="updatesuccess", required=false) String updatesuccess,
										@RequestParam(value="alreadyadded", required=false) String alreadyadded,
										@RequestParam(value="deleteproduct", required=false) String deleteproduct,
										@RequestParam(value="noDetails", required=false) String nodetails,
										@RequestParam(value="searchValue", required=false) String searchValue,
										@RequestParam(value="laptops", required=false) String laptop,
										@RequestParam(value="mobiles", required=false) String mobile,
										@RequestParam(name="brandProduct", required=false) String brandProduct,
										@PathVariable("pageNo") Integer pageNo,@RequestParam(defaultValue= "6") Integer pageSize, Model model) {
		if(mobile != null) {
			List<Product> mobiles = productservice.getByCategory("Mobile");
			model.addAttribute("products", mobiles);
			model.addAttribute("categoryMobile", true);
		}
		else if(laptop != null) {
			List<Product> laptops = productservice.getByCategory("Laptop");
			model.addAttribute("products", laptops);
			model.addAttribute("categoryLaptop", true);
		}
		else if(searchValue != null) {
			List<Product> searchProducts = productservice.getByManufacturer(searchValue);
			if(searchProducts.isEmpty()) {
				model.addAttribute("noProducts", true);
			}
			else {
				model.addAttribute("products", searchProducts);
				model.addAttribute("searchValue", true);
			}
		}
		else if(brandProduct != null) {
			List<Product> brandProducts = productservice.getByManufacturer(brandProduct);
			model.addAttribute("products", brandProducts);
			model.addAttribute("searchValue", true);
		}
		else {
			List<Product> products = productservice.getproducts(pageNo, pageSize);
			model.addAttribute("pages", Math.ceil((int)productservice.getallproducts()/pageSize));
			model.addAttribute("products", products);
		}
		if(productsuccess != null)
			model.addAttribute("productsuccess", "Product was added successfully");
		if(accesserror != null)
			model.addAttribute("accesserror", "Sign in to view the desired product");
		if(updatesuccess != null)
			model.addAttribute("updatesuccess", "Product was updated successfully");
		if(deleteproduct != null)
			model.addAttribute("deleteproduct", "Product was deleted successfully");
		if(nodetails != null)
			model.addAttribute("nodetails", "Add Shipping Details for checkout");
		if(alreadyadded != null)
			model.addAttribute("alreadyadded", "Product is already added in Cart");
		return "productlist";
	}
	
	@RequestMapping("/view/{productId}")
	public ModelAndView productview(@PathVariable("productId") int id, @RequestParam(value="added", required=false) String added) {
		ModelAndView model = new ModelAndView("productview");
		if(SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser")) {
			model.addObject("accesserror", true);
			return new ModelAndView("redirect:/product/list/0?accesserror");
		}
		else {
			if(added != null)
				model.addObject("added", "Product was successfully added in Cart");
			Product product = productservice.getproductbyid(id);
			Customer_info customer = customerservice.getUserByEmail(SecurityContextHolder.getContext().getAuthentication().getName()).get(0);
			model.addObject("delivery", customer.getShipping_details());
			model.addObject("productview", product);
		}
		return model;
	}

}
