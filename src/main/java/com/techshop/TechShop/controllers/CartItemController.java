package com.techshop.TechShop.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.techshop.TechShop.entity.Cart;
import com.techshop.TechShop.entity.CartItem;
import com.techshop.TechShop.entity.Customer_info;
import com.techshop.TechShop.entity.Product;
import com.techshop.TechShop.service.CartItemService;
import com.techshop.TechShop.service.CartService;
import com.techshop.TechShop.service.CustomerService;
import com.techshop.TechShop.service.ProductService;

@Controller
public class CartItemController {
	
	@Autowired
	private ProductService productservice;
	
	@Autowired
	private CartService cartservice;
	
	@Autowired
	private CustomerService customerservice;
	
	@Autowired
	private CartItemService cartitemservice;

	@RequestMapping("/cart/add/{productId}")
	public ModelAndView addcartitem(@PathVariable("productId") int id) {
		ModelAndView model = new ModelAndView("redirect:/product/view/" + String.valueOf(id));
		String user = SecurityContextHolder.getContext().getAuthentication().getName();
		Customer_info customer = customerservice.getUserByEmail(user).get(0);
		Cart cart = customer.getCart();
		Product product = productservice.getproductbyid(id);
		List<CartItem> cartitems = cart.getCartitems();
		for(int i=0; i<cartitems.size(); i++) {
			CartItem cartitem = cartitems.get(i);
			if(product.getProductId() == cartitem.getProduct().getProductId()) {
				model.addObject("alreadyadded", true);
				return new ModelAndView("redirect:/product/list/0?alreadyadded");
			}
		}
		CartItem cartitem = new CartItem();
		cartitem.setProduct(product);
		cartitem.setCart(cart);
		cartitem.setPrice(product.getProductPrice());
		cartitemservice.addCartItem(cartitem);
		model.addObject("added",true);
		return model;
	}
	
	@RequestMapping("/cart/remove/{cartitemid}")
	public ModelAndView removeitem(@PathVariable("cartitemid") int cartid) {
		ModelAndView model = new ModelAndView("redirect:/cart/mycart");
		cartitemservice.removeitembyid(cartid);
		return model;
	}
	
	@RequestMapping("/cart/removeall/{cartId}")
	public ModelAndView removeallitems(@PathVariable("cartId") int cartId) {
		ModelAndView model = new ModelAndView("redirect:/cart/mycart");
		Cart cart = cartservice.getcartbyid(cartId);
		List<CartItem> cartitems = cart.getCartitems();
		cartitemservice.removeall(cartitems);
		return model;
	}
	
}
