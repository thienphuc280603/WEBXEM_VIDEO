package com.poly.ps24434.dao.impl;

import java.util.List;

import com.poly.ps24434.dao.AbstractDao;
import com.poly.ps24434.dao.HistoryDao;
import com.poly.ps24434.entity.History;

public class HistoryDaoImpl extends AbstractDao<History> implements HistoryDao{

	@Override
	public List<History> findByUser(String username) {
		String sql = "SELECT o FROM History o WHERE o.user.username = ?0 AND o.video.isActive = 1"
				+ " ORDER BY o.viewedDate DESC";
		return super.findMany(History.class, sql, username);
	}

	@Override
	public List<History> findBuUserAndIsLiked(String username) {
		String sql = "SELECT o FROM History o WHERE o.user.username = ?0 AND o.isLiked = 1"
				+ " AND o.video.isActive = 1"
				+ " ORDER BY o.viewedDate DESC";
		return super.findMany(History.class, sql, username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		String sql = "SELECT o FROM History o WHERE o.user.id = ?0 AND o.video.id = ?1"
				+" AND o.video.isActive = 1";
		return super.findOne(History.class, sql, userId, videoId);
	}

	@Override
	public History create(History entity) {
		return super.create(entity);
	}

	@Override
	public History update(History entity) {
		return super.update(entity);
	}

}
