package com.techshop.TechShop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techshop.TechShop.dao.OrderDao;
import com.techshop.TechShop.entity.Cart;
import com.techshop.TechShop.entity.CartItem;
import com.techshop.TechShop.entity.CartOrder;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private CartService cartService;

	@Override
	@Transactional
	public void addOrder(CartOrder customerOrder) {
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

	@Override
	@Transactional
	public void updateOrder(CartOrder customerOrder) {
		orderDao.save(customerOrder);
	}

}
