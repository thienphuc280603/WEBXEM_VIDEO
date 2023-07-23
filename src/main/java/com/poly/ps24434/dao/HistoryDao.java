package com.poly.ps24434.dao;

import java.util.List;

import com.poly.ps24434.entity.History;

public interface HistoryDao {
	List<History> findByUser(String username);
	List<History> findBuUserAndIsLiked(String username);
	History findByUserIdAndVideoId(Integer userId, Integer videoId);
	History create(History entity);
	History update(History entity);
}
