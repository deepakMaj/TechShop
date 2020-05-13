package com.techshop.TechShop.service;

import com.techshop.TechShop.entity.CartOrder;

public interface OrderService {

	void addOrder(CartOrder customerOrder);

	double getCustomerGrandTotal(int cartId);

	void updateOrder(CartOrder customerOrder);

}
