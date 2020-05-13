package com.techshop.TechShop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.techshop.TechShop.entity.CustomerOrder;


public interface CustomerOrderDao extends JpaRepository<CustomerOrder, Integer> {

}
