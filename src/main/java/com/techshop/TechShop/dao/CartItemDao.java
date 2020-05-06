package com.techshop.TechShop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.techshop.TechShop.entity.CartItem;

public interface CartItemDao extends JpaRepository<CartItem, Integer> {

}
