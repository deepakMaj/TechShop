package com.techshop.TechShop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.techshop.TechShop.dao.CartDao;
import com.techshop.TechShop.entity.Cart;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartdao;

	@Override
	@Transactional
	public Cart getcartbyid(int cartId) {
		return cartdao.getOne(cartId);
	}
	
	

}
