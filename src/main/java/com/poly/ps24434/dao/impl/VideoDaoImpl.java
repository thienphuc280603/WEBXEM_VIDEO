package com.poly.ps24434.dao.impl;

import java.util.List;

import com.poly.ps24434.dao.AbstractDao;
import com.poly.ps24434.dao.VideoDao;
import com.poly.ps24434.entity.Video;

public class VideoDaoImpl extends AbstractDao<Video> implements VideoDao{

	@Override
	public Video findById(Integer id) {
		return super.findById(Video.class, id);
	}

	@Override
	public Video findByHref(String href) {
		String sql = "SELECT o FROM Video o WHERE o.href = ?0";
		return super.findOne(Video.class, sql, href);
	}

	@Override
	public List<Video> findAll() {
		return super.findAll(Video.class, true);
	}

	@Override
	public List<Video> findAll(int pageNumber, int pageSize) {
		return super.findAll(Video.class, true, pageNumber, pageSize);
	}

	@Override
	public Video create(Video entity) {
		return super.create(entity);
	}

	@Override
	public Video update(Video entity) {
		return super.update(entity);
	}

	@Override
	public Video delete(Video entity) {
		// TODO Auto-generated method stub
		return null;
	}

}
