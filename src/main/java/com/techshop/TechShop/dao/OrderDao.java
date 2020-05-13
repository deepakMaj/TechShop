package com.techshop.TechShop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.techshop.TechShop.entity.CartOrder;

public interface OrderDao extends JpaRepository<CartOrder, Integer> {

}
