package com.techshop.TechShop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import com.techshop.TechShop.entity.Cart;

public interface CartDao extends JpaRepository<Cart, Integer> {

	@Modifying(clearAutomatically=true)
	@Query("UPDATE Cart c SET c.grandTotal = :grandTotal WHERE c.cartId = :cartId")
	void update(int cartId, double grandTotal);

}
