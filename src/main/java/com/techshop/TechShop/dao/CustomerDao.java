package com.techshop.TechShop.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.techshop.TechShop.entity.Customer_info;

public interface CustomerDao extends JpaRepository<Customer_info, Integer> {
	
	List<Customer_info> findByEmail(String email);

	@Modifying(clearAutomatically = true)
	@Query("UPDATE Customer_info c SET c.firstname = :firstname, c.lastname = :lastname, "
			+ "c.email = :email, c.password = :password, c.mobile = :mobile WHERE c.id = :id")
	void update(int id, String email, String firstname, String lastname, String password, String mobile);

}
