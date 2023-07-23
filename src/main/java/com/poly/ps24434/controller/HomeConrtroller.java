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
import com.poly.ps24434.service.HistoryService;
import com.poly.ps24434.service.VideoService;
import com.poly.ps24434.service.impl.HistoryServiceImpl;
import com.poly.ps24434.service.impl.VideoServiceImpl;
@WebServlet({"/index", "/favorites", "/history"})
public class HomeConrtroller extends HttpServlet{
	
	private VideoService videoService = new VideoServiceImpl();
	private HistoryService historyService = new HistoryServiceImpl();
	private static final int VIDEO_MAX_PAGE_SIZE = 6;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		switch (path) {
		case "/index": {
			doGetIndex(req, resp);
			break;
		}
		case "/favorites": {
			doGetFavorites(session, req, resp);
			break;
		}
		case "/history": {
			doGetHistory(session,req ,resp);
			break;
		}
		}
	}
	
	private void doGetIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Video> countVideo = videoService.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double)VIDEO_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);
		String pageNumber = req.getParameter("page");
		List<Video> videos; 
		if(pageNumber == null) {
			videos = videoService.findAll(1, VIDEO_MAX_PAGE_SIZE);
		}else {
			videos = videoService.findAll(Integer.valueOf(pageNumber), VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", Integer.valueOf(pageNumber));
		}
		
		req.setAttribute("videos", videos);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/index.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	
	private void doGetFavorites(HttpSession session,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User)session.getAttribute(SessionAttr.CURRENT_USER);
		List<History> histories = historyService.findBuUserAndIsLiked(user.getUsername());
		List<Video> videos = new ArrayList<>();
		histories.forEach(item->videos.add(item.getVideo()));
		req.setAttribute("videos", videos);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/favorite.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	private void doGetHistory(HttpSession session,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User)session.getAttribute(SessionAttr.CURRENT_USER);
		List<History> histories = historyService.findByUser(user.getUsername());
		List<Video> videos = new ArrayList<>();
		histories.forEach(item->videos.add(item.getVideo()));
		req.setAttribute("videos", videos);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/history.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	
	
	
	
	
	
}
