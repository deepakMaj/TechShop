package com.techshop.TechShop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.techshop.TechShop.entity.Shipping_details;

public interface ShippingDetailsDao extends JpaRepository<Shipping_details, Integer> {

	@Modifying(clearAutomatically = true)
	@Query("UPDATE Shipping_details c SET c.address = :address, c.state = :state, c.city = :city, c.pincode = :pincode WHERE c.id = :id")
	void updatedetail(String address, String city, String state, long pincode, int id);

}
