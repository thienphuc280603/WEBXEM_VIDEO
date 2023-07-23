package com.poly.ps24434.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.ps24434.constant.SessionAttr;
import com.poly.ps24434.entity.User;
import com.poly.ps24434.entity.Video;
import com.poly.ps24434.service.VideoService;
import com.poly.ps24434.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = { "/admin/video" })
public class VideoController extends HttpServlet {

	private VideoService videoService = new VideoServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			String action = req.getParameter("action");
			switch (action) {
			case "view": {
				dogetOverView(req, resp);
				break;
			}
			case "delete": {
				doPostDelete(req, resp);
				break;
			}
			case "add": {
				dogetAdd(req, resp);
				break;
			}
			case "edit": {
				dogetEdit(req, resp);
				break;
			}
			}
		} else {
			resp.sendRedirect("index");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			String action = req.getParameter("action");
			switch (action) {
			case "delete": {
				doPostDelete(req, resp);
				break;
			}
			case "add": {
				doPostAdd(req, resp);
				break;
			}
			}
		} else {
			resp.sendRedirect("index");
		}
	}
//	}

	protected void dogetOverView(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Video> videos = videoService.findAll();
		req.setAttribute("videos", videos);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/quanly/chinhsuavideoAdmin.jsp");
		requestDispatcher.forward(req, resp);
	}

	protected void dogetAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/quanly/quanlyvideoAdmin.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	protected void dogetEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String href = req.getParameter("href");
		Video video = videoService.findByHref(href);
		req.setAttribute("video", video);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/quanly/quanlyvideoAdmin.jsp");
		requestDispatcher.forward(req, resp);
	}

	protected void doPostDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		String href = req.getParameter("href");
		Video videoDeleted = videoService.delete(href);
		if (videoDeleted != null) {
			resp.setStatus(204);
		} else {
			resp.setStatus(400);
		}

	}

	protected void doPostAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		String title = req.getParameter("title");
		String href = req.getParameter("href");
		String description = req.getParameter("description");
		String poster = req.getParameter("poster");
		System.out.print("tilt get được" + title);
		try {
			Video video = new Video();
			video.setTitle(title);
			video.setHref(href);
			video.setDescription(description);
			video.setPoster(poster);
			Video videoReturn = videoService.create(video);
			if (videoReturn != null) {
				resp.setStatus(204);
			} else {
				resp.setStatus(400);
			}
		} catch (Exception e) {
			System.out.print(e);
		}

	}

}
