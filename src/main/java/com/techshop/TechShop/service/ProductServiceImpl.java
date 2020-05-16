package com.techshop.TechShop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techshop.TechShop.dao.ProductDao;
import com.techshop.TechShop.entity.Product;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productdao;

	@Override
	@Transactional
	public void addproduct(Product product) {
		productdao.save(product);
	}

	@Override
	@Transactional
	public List<Product> getproducts(Integer pageNo, Integer pageSize) {
		Pageable paging = PageRequest.of(pageNo, pageSize);
		Page<Product> products = productdao.findAll(paging);
		return products.getContent();
	}

	@Override
	@Transactional
	public Product getproductbyid(int id) {
		return productdao.getOne(id);
	}

	@Override
	@Transactional
	public void updateproduct(Product product) {
		productdao.update(product.getProductId(), product.getCategory(), product.getProductDescription(), product.getProductManufacturer(),
									product.getProductName(), product.getProductPrice(), product.getUrl());
	}

	@Override
	@Transactional
	public void deleteproduct(int id) {
		productdao.deleteById(id);
	}

	@Override
	@Transactional
	public List<Product> getByCategory(String string) {
		return productdao.findByCategory(string);
	}

	@Override
	@Transactional
	public List<Product> getByManufacturer(String searchValue) {
		return productdao.findByManufacturer(searchValue);
	}

	@Override
	@Transactional
	public Object getallproducts() {
		return productdao.findAll().size();
	}

	
}
