package com.poly.ps24434.dao;

import java.util.List;

import com.poly.ps24434.dto.VideoLikedInfo;

public interface StatsDao {
	List<VideoLikedInfo> findVideoLikedInfo();
}
