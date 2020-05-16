package com.techshop.TechShop.service;

import java.util.List;
import com.techshop.TechShop.entity.CustomerOrder;
import com.techshop.TechShop.entity.CartOrder;

public interface CustomerOrderService {

	void saveOrder(CartOrder order);

	List<CustomerOrder> findOrder();

	void cancelOrder(int orderId);
}
