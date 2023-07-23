package com.poly.ps24434.entity;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "history")
public class History {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "userId", referencedColumnName = "id")
//	@JsonIgnoreProperties(va) chỗ này thiếu
	private User user;
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "videoId", referencedColumnName = "id")
	private Video video;
	
	@Column(name = "viewedDate")
	@CreationTimestamp
	private Timestamp viewedDate;
	@Column(name = "isLiked")
	private Boolean isLiked;
	@Column(name = "likeDate")
	private Timestamp likeDate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}
	public Timestamp getViewedDate() {
		return viewedDate;
	}
	public void setViewedDate(Timestamp viewDate) {
		this.viewedDate = viewDate;
	}
	public Boolean getIsLiked() {
		return isLiked;
	}
	public void setIsLiked(Boolean isLiked) {
		this.isLiked = isLiked;
	}
	public Timestamp getLikeDate() {
		return likeDate;
	}
	public void setLikeDate(Timestamp likeDate) {
		this.likeDate = likeDate;
	}
	
	
}
