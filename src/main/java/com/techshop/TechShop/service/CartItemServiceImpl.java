package com.techshop.TechShop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.techshop.TechShop.dao.CartItemDao;
import com.techshop.TechShop.entity.CartItem;

@Service
public class CartItemServiceImpl implements CartItemService {
	
	@Autowired
	private CartItemDao cartitemdao;

	@Override
	@Transactional
	public void addCartItem(CartItem cartitem) {
		cartitemdao.save(cartitem);
	}

	@Override
	@Transactional
	public void removeitembyid(int cartid) {
		cartitemdao.deleteById(cartid);
	}

	@Override
	@Transactional
	public void removeall(List<CartItem> cartitems) {
		cartitemdao.deleteAll(cartitems);
	}

}
