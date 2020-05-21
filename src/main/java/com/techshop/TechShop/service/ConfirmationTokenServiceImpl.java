package com.techshop.TechShop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techshop.TechShop.dao.ConfirmationTokenDao;
import com.techshop.TechShop.entity.ConfirmationToken;

@Service
public class ConfirmationTokenServiceImpl implements ConfirmationTokenService{
	
	private JavaMailSender javaMailSender;
	
	@Autowired
	private ConfirmationTokenDao tokenDao;

    @Autowired
    public ConfirmationTokenServiceImpl(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    @Async
    public void sendEmail(SimpleMailMessage email) {
        javaMailSender.send(email);
    }

	@Override
	@Transactional
	public void saveToken(ConfirmationToken token) {
		tokenDao.save(token);
	}

	@Override
	@Transactional
	public ConfirmationToken findByConfirmationToken(String token) {
		return tokenDao.findByConfirmationToken(token);
	}
    
}
