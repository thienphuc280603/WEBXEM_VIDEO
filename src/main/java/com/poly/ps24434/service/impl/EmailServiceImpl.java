package com.poly.ps24434.service.impl;

import javax.servlet.ServletContext;

import com.poly.ps24434.entity.User;
import com.poly.ps24434.service.EmailService;
import com.poly.ps24434.utils.SendEmailUtils;

public class EmailServiceImpl implements EmailService{

	private static final String EMAIL_WELCOME_SUBJECT = "Welcom to Online entertaiment";
	private static final String EMAIL_FOGOT_PASSWORD = "Online entertaiment - New Password";
	private static final String EMAIL_SHARE = "Cai video hay lam";
	@Override
	public void sendEmail(ServletContext context, User recipient, String type) {
        String host = context.getInitParameter("host");
        String port = context.getInitParameter("port");
        String user = context.getInitParameter("user");
        String pass = context.getInitParameter("pass");
        try {
			String content = null;
			String subject = null;
			switch (type) {
			case "welcome": {
				subject = EMAIL_WELCOME_SUBJECT;
				content = "Dear" + recipient.getUsername() + ", hope you have a good time";
				break;
			}
			case "forgot": {
				subject = EMAIL_FOGOT_PASSWORD;
				content = "Dear" + recipient.getUsername() + ", your new password here: " + recipient.getPassword();
				break;
			}
			case "share": {
				subject = EMAIL_SHARE;
				content = "Video share";
				break;
			}
			default:
				subject = "Online entertaiment";
				content = "lỗi";
			}
			SendEmailUtils.sendEmail(host, port, user, pass, recipient.getEmail(), subject, content);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
