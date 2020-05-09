package com.techshop.TechShop.service;

import com.techshop.TechShop.entity.CustomerOrder;

public interface CustomerOrderService {

	void addOrder(CustomerOrder customerOrder);

	double getCustomerGrandTotal(int cartId);

}
