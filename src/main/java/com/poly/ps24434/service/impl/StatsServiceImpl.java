package com.poly.ps24434.service.impl;

import java.util.List;

import com.poly.ps24434.dao.StatsDao;
import com.poly.ps24434.dao.impl.StatsDaoImpl;
import com.poly.ps24434.dto.VideoLikedInfo;
import com.poly.ps24434.service.StatsService;

public class StatsServiceImpl implements StatsService{
	
	private StatsDao statsDao;

	public StatsServiceImpl() {
		statsDao = new StatsDaoImpl();
	}

	@Override
	public List<VideoLikedInfo> findVideoLikedInfo() {
		return statsDao.findVideoLikedInfo();
	}
	
	
	

}
