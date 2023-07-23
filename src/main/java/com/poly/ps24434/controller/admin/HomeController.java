package com.poly.ps24434.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.ps24434.constant.SessionAttr;
import com.poly.ps24434.dto.Userdto;
import com.poly.ps24434.dto.VideoLikedInfo;
import com.poly.ps24434.entity.User;
import com.poly.ps24434.service.StatsService;
import com.poly.ps24434.service.UserService;
import com.poly.ps24434.service.impl.StatsServiceImpl;
import com.poly.ps24434.service.impl.UserServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;


@WebServlet(urlPatterns = {"/admin", "/favoritesadmin"}, name="HomeControllerOfAdmin")
public class HomeController extends HttpServlet{
	private StatsService statsService = new StatsServiceImpl();
	private UserService userService = new UserServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User)session.getAttribute(SessionAttr.CURRENT_USER);
		if(currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			
			String path = req.getServletPath();
			switch (path) {
			case "/admin": {
				doGetHome(req, resp);
				break;
			}
			case "/favoritesadmin": {
				doGetFavorites(req, resp);
				break;
			}
			}
		}else {
			resp.sendRedirect("index");
		}
		
	}
	
	
	protected void doGetHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<VideoLikedInfo> videos = statsService.findVideoLikedInfo();
		req.setAttribute("videos", videos);
		System.out.print("Admin");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/quanly/thongke.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	protected void doGetFavorites(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		String videoHref = req.getParameter("href");
		List<Userdto> users = userService.findUsersLikedVideoByVideoHref(videoHref);
		if(users.isEmpty()) {
			resp.setStatus(400);
		}else {
			ObjectMapper mapper = new ObjectMapper();
			String dataResponse = mapper.writeValueAsString(users);
			resp.setStatus(200);
			out.print(dataResponse);
			out.flush();
		}
	}
}
