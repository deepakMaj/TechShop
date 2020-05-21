package com.techshop.TechShop.service;

import com.techshop.TechShop.entity.ConfirmationToken;

public interface ConfirmationTokenService {

	void saveToken(ConfirmationToken token);

	ConfirmationToken findByConfirmationToken(String token);

}
