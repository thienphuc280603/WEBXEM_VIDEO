package com.poly.ps24434.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.ps24434.constant.SessionAttr;
import com.poly.ps24434.entity.History;
import com.poly.ps24434.entity.User;
import com.poly.ps24434.entity.Video;
import com.poly.ps24434.service.EmailService;
import com.poly.ps24434.service.HistoryService;
import com.poly.ps24434.service.UserService;
import com.poly.ps24434.service.VideoService;
import com.poly.ps24434.service.impl.EmailServiceImpl;
import com.poly.ps24434.service.impl.HistoryServiceImpl;
import com.poly.ps24434.service.impl.UserServiceImpl;
import com.poly.ps24434.service.impl.VideoServiceImpl;
@WebServlet("/video")
public class VideoController extends HttpServlet{

	private VideoService videoService = new VideoServiceImpl();
	private HistoryService historyService = new HistoryServiceImpl();
	private UserService userService= new UserServiceImpl();
	private EmailService emailService = new EmailServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionParam = req.getParameter("action");
		String href = req.getParameter("id");
		HttpSession session = req.getSession();
		
		switch (actionParam) {
		case "watch": {
			doGetWatch(session, href,req, resp);
			break;
		}
		case "like": {
			doGetLike(session, href,req, resp);
			break;
		}
		case "share": {
			doGetShare(session,req, resp);
			break;
		}
		
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionParam = req.getParameter("action");
		String href = req.getParameter("id");
		HttpSession session = req.getSession();
		
		switch (actionParam) {
		case "share": {
			doPostShare(req, resp);
			break;
		}
		
		}
	}
	
	private void doGetWatch(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		Video video = videoService.findByHref(href);
		req.setAttribute("video", video);
		
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		if(currentUser != null) {
			History history = historyService.create(currentUser, video);
			req.setAttribute("flagLikedBtn", history.getIsLiked());
			int viewCount = video.getViews();
			video.setViews(viewCount+ 1);
			videoService.update(video);
			

			List<History> histories = historyService.findBuUserAndIsLiked(currentUser.getUsername());
			List<Video> videos = new ArrayList<>();
			histories.forEach(item->videos.add(item.getVideo()));
			req.setAttribute("videos", videos);
		}
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/chitiet.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	private void doGetLike(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("aplication/json");
		
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		boolean result = historyService.updateLikeOrUnlike(currentUser, href);
		
		
		if(result == true) {
			resp.setStatus(204); //succed but no data
			
		}else {
			resp.setStatus(400);
		}
	}

	
	private void doGetShare(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/chiase.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	private void doPostShare(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("aplication/json");
		String email = req.getParameter("email");
		
		User userWithNewPass = userService.resetPassword(email);
		
		emailService.sendEmail(getServletContext(), userWithNewPass, "share");

	}
	
	
	
	
}
