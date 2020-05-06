package com.techshop.TechShop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.techshop.TechShop.entity.CustomerAuthority;

public interface CustomerAuthorityDao extends JpaRepository<CustomerAuthority, Integer> {

}
