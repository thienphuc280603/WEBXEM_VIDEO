package com.poly.ps24434.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.ps24434.constant.SessionAttr;
import com.poly.ps24434.entity.User;
import com.poly.ps24434.service.EmailService;
import com.poly.ps24434.service.UserService;
import com.poly.ps24434.service.impl.EmailServiceImpl;
import com.poly.ps24434.service.impl.UserServiceImpl;

@WebServlet({"/login", "/logout", "/register", "/forgotPass", "/changePass", "/editProfile"})
public class UserController extends HttpServlet {
	
	private UserService userService= new UserServiceImpl();
	private EmailService emailService = new EmailServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		switch (path) {
		case "/login": {
			doGetLogin(req, resp);
			break;
		}
		case "/register": {
			doGetRegister(req, resp);
			break;
		}
		case "/logout": {
			doGetLogout(session,req ,resp);
			break;
		}
		case "/forgotPass": {
			doGetForgotPass(req, resp);
			break;
		}
		case "/changePass": {
			doGetChangePass(req, resp);
			break;
		}
		case "/editProfile": {
			doGetEditProfile(req, resp);
			break;
		}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		switch (path) {
		case "/login": {
			doPostLogin( session ,req, resp);
			break;
		}
		case "/register": {
			doPostRegister(session, req, resp);
			break;
		}
		case "/forgotPass": {
			doPostForgotPass(req, resp);
			break;
		}
		case "/changePass": {
			doPostChangePass(session, req, resp);
			break;
		}
		case "/editProfile": {
			doPostEditProfile(session, req, resp);
			break;
		}
		}
	}

	private void doGetLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/login.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	private void doGetRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/register.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	
	private void doGetForgotPass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/fogot.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	
	
	
	private void doGetChangePass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/doimatkhau.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	private void doGetEditProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/capnhattk.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	
	
	
	
	
	
	
	
	
	private void doGetLogout(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		session.removeAttribute(SessionAttr.CURRENT_USER);
		resp.sendRedirect("index");
	}
	
	private void doPostLogin(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		User user = userService.login(username, password);
		if(user != null) {
			session.setAttribute(SessionAttr.CURRENT_USER, user);
			resp.sendRedirect("index");
		}else {
			resp.sendRedirect("login");
		}
	}
	
	private void doPostRegister(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email =  req.getParameter("email");
		
		User user = userService.create(username, password, email);
		if(user != null) {
			emailService.sendEmail(getServletContext(), user, "welcome");/////////enum
			session.setAttribute(SessionAttr.CURRENT_USER, user);
			resp.sendRedirect("index");
		}else {
			resp.sendRedirect("register");
		}
	}
	
	private void doPostForgotPass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("aplication/json");
		String email = req.getParameter("email");
		
		User userWithNewPass = userService.resetPassword(email);
		
		if(userWithNewPass != null) {
			emailService.sendEmail(getServletContext(), userWithNewPass, "forgot");
			resp.setStatus(204);
		}else {
			resp.setStatus(400);
		}
	}
	

	
	private void doPostChangePass(HttpSession session,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String currentPass = req.getParameter("currentPass");
		String newPass = req.getParameter("newPass");
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		if(currentUser.getPassword().equals(currentPass)) {
			currentUser.setPassword(newPass);
			User updatedUsser = userService.update(currentUser);
			if(updatedUsser != null) {
				session.setAttribute(SessionAttr.CURRENT_USER, updatedUsser);
				System.out.print("Đổi thành công");
				resp.sendRedirect("index");
			}
			else {
				resp.sendRedirect("changePass");
			}
		}
	}
	
	private void doPostEditProfile(HttpSession session,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String messageCheckLogin = "Vui lòng đăng nhập tài khoản để thực hiện chức năng này !";
		try {
			User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
			currentUser.setPassword(password);
			currentUser.setUsername(username);
			currentUser.setEmail(email);
			User updatedUsser = userService.update(currentUser);
			if(updatedUsser != null) {
				session.setAttribute(SessionAttr.CURRENT_USER, updatedUsser);
				System.out.print("Đổi thành công");
				resp.sendRedirect("index");
			}
			else {
				resp.sendRedirect("editProfile");
			}
		} catch (Exception e) {
			req.setAttribute("messageUpdateFail", messageCheckLogin);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/capnhattk.jsp");
			requestDispatcher.forward(req, resp);
			
		}
		
			
		}
	

}
