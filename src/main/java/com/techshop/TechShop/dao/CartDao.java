package com.techshop.TechShop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.techshop.TechShop.entity.Cart;

public interface CartDao extends JpaRepository<Cart, Integer> {

}
