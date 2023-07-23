package com.poly.ps24434.service;

import javax.servlet.ServletContext;

import com.poly.ps24434.entity.User;

public interface EmailService {
	void sendEmail(ServletContext context, User recipient, String type);
}
