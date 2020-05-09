package com.techshop.TechShop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techshop.TechShop.dao.CustomerOrderDao;
import com.techshop.TechShop.entity.Cart;
import com.techshop.TechShop.entity.CartItem;
import com.techshop.TechShop.entity.CustomerOrder;

@Service
public class CustomerOrderServiceImpl implements CustomerOrderService {
	
	@Autowired
	private CustomerOrderDao orderDao;
	
	@Autowired
	private CartService cartService;

	@Override
	@Transactional
	public void addOrder(CustomerOrder customerOrder) {
		orderDao.save(customerOrder);
	}

	@Override
	@Transactional
	public double getCustomerGrandTotal(int cartId) {
		double grandTotal = 0.0;
		Cart cart = cartService.getcartbyid(cartId);
		List<CartItem> cartitems = cart.getCartitems();
		for(CartItem x : cartitems) {
			grandTotal += Double.parseDouble(x.getPrice());
		}
		return grandTotal;
	}

}
