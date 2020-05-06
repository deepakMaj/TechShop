package com.techshop.TechShop.service;

import java.util.List;

import com.techshop.TechShop.entity.CartItem;

public interface CartItemService {

	void addCartItem(CartItem cartitem);

	void removeitembyid(int cartid);

	void removeall(List<CartItem> cartitems);

}
