package com.techshop.TechShop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.techshop.TechShop.entity.ConfirmationToken;

public interface ConfirmationTokenDao extends JpaRepository<ConfirmationToken, Long>{
	
	ConfirmationToken findByConfirmationToken(String token);

}
