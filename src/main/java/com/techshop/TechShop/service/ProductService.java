package com.techshop.TechShop.service;

import java.util.List;

import com.techshop.TechShop.entity.Product;

public interface ProductService {

	void addproduct(Product product);

	List<Product> getproducts(Integer pageNo, Integer pageSize);

	Product getproductbyid(int id);

	void updateproduct(Product product);

	void deleteproduct(int id);

}
