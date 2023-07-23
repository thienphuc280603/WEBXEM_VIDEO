package com.poly.ps24434.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.ps24434.dao.HistoryDao;
import com.poly.ps24434.dao.impl.HistoryDaoImpl;
import com.poly.ps24434.entity.History;
import com.poly.ps24434.entity.User;
import com.poly.ps24434.entity.Video;
import com.poly.ps24434.service.HistoryService;
import com.poly.ps24434.service.VideoService;

public class HistoryServiceImpl implements HistoryService{

	private HistoryDao dao;
	private VideoService videoService = new VideoServiceImpl();
	
	
	public HistoryServiceImpl() {
		dao = new HistoryDaoImpl();
	}

	@Override
	public List<History> findByUser(String username) {
		return dao.findByUser(username);
	}

	@Override
	public List<History> findBuUserAndIsLiked(String username) {
		return dao.findBuUserAndIsLiked(username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		return dao.findByUserIdAndVideoId(userId, videoId);
	}

	@Override
	public History create(User user, Video video) {
		History existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		if(existHistory == null) {
			existHistory = new History();
			existHistory.setUser(user);
			existHistory.setVideo(video);
			existHistory.setIsLiked(Boolean.FALSE);
			existHistory.setViewedDate(new Timestamp(System.currentTimeMillis()));
			return dao.create(existHistory);
		}	
		return existHistory;
	}

	@Override
	public boolean updateLikeOrUnlike(User user, String videoHref) {
		Video video = videoService.findByHref(videoHref);
		History existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		if(existHistory.getIsLiked() == Boolean.FALSE) {
			existHistory.setIsLiked(Boolean.TRUE);
			existHistory.setLikeDate(new Timestamp(System.currentTimeMillis()));
		}else {
			existHistory.setIsLiked(Boolean.FALSE);
			existHistory.setLikeDate(null);
		}
		History updatedHistory = dao.update(existHistory);
		return updatedHistory != null ? true :false;
	}

}
