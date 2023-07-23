package com.poly.ps24434.service;

import java.util.List;

import com.poly.ps24434.dto.VideoLikedInfo;

public interface StatsService {
	List<VideoLikedInfo> findVideoLikedInfo();
}
