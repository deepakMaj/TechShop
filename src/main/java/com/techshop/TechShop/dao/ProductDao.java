package com.techshop.TechShop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.techshop.TechShop.entity.Product;

public interface ProductDao extends JpaRepository<Product, Integer>{

	@Modifying(clearAutomatically = true)
	@Query("UPDATE Product p SET p.url = :url, p.productName = :productName, p.productPrice = :productPrice,"
			+ "p.category = :category, p.productDescription = :productDescription, p.productManufacturer = :productManufacturer WHERE p.productId = :productId")
	void update(int productId, String category, String productDescription, String productManufacturer,
			String productName, String productPrice, String url);

}
