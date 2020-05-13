package com.techshop.TechShop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techshop.TechShop.dao.CustomerOrderDao;
import com.techshop.TechShop.entity.CartItem;
import com.techshop.TechShop.entity.CartOrder;
import com.techshop.TechShop.entity.CustomerOrder;

@Service
public class CustomerOrderServiceImpl implements CustomerOrderService{
	
	@Autowired
	private CustomerOrderDao customerOrderDao;
	
	@Override
	@Transactional
	public void saveOrder(CartOrder order) {
		CustomerOrder customerOrder = new CustomerOrder();
		customerOrder.setCustomer(order.getCart().getCustomer());
		customerOrder.setGrandTotal(order.getCart().getGrandTotal());
		List<CartItem> cartitems = order.getCart().getCartitems();
		ArrayList<Integer> productIds = new ArrayList<>();
		for(CartItem x : cartitems) {
			productIds.add(x.getProduct().getProductId());
		}
		customerOrder.setProductItems(productIds);
		customerOrderDao.save(customerOrder);
	}

	@Override
	public List<CustomerOrder> findOrder() {
		return customerOrderDao.findAll();
	}


}
