package com.poly.ps24434.service;

import java.util.List;

import com.poly.ps24434.entity.History;
import com.poly.ps24434.entity.User;
import com.poly.ps24434.entity.Video;

public interface HistoryService {
	List<History> findByUser(String username);
	List<History> findBuUserAndIsLiked(String username);
	History findByUserIdAndVideoId(Integer userId, Integer videoId);
	History create(User user, Video video);
	boolean updateLikeOrUnlike(User user, String videoHref);
}
