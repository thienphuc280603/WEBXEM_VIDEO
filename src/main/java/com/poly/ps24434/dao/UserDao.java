package com.poly.ps24434.dao;

import java.util.List;
import java.util.Map;

import com.poly.ps24434.entity.User;

public interface UserDao {
	User findById(Integer id);
	User findByEmail(String email);
	User findByUserName(String username);
	User findByUserNameAndPassword(String username, String password);
	List<User> findAll();
	List<User> findAll(int pageNumber, int pageSize);
	User create(User entity);
	User update(User entity);
	User delete(User entity);
	List<User> findUserLikedVideoByVideoHref(Map<String, Object> params);
}
