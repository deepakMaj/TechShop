package com.techshop.TechShop.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techshop.TechShop.dao.CartDao;
import com.techshop.TechShop.entity.Cart;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartdao;
	
	@Autowired
	private CustomerOrderService orderService;

	@Override
	@Transactional
	public Cart getcartbyid(int cartId) {
		return cartdao.getOne(cartId);
	}
	
	@Transactional
	public void update(Cart cart) {
		int cartId = cart.getCartId();
		double grandTotal = orderService.getCustomerGrandTotal(cartId);
		cart.setGrandTotal(grandTotal);
		cartdao.update(cart.getCartId(), cart.getGrandTotal());
	}
	
	@Transactional
	public Cart validate(int cartId) throws IOException {
		Cart cart = cartdao.getOne(cartId);
		if(cart == null || cart.getCartitems().size() == 0) {
			throw new IOException(cartId+"");
		}
		update(cart);
		return cart;
	}
	
	

}
