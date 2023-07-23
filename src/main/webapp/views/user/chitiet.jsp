<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CHI TIẾT</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
	integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous" />
	<link href="<%=request.getContextPath() %>/css/login2.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
</head>
<body>

<header>
        <div class="container-md">
            <div class="header_logo">
                <div class="header_logo__hiden">
                    <img src="<%=request.getContextPath()%>/images/Logok.png" alt="">
                    <span class="p_white" style="font-weight: 800; margin-left: 20px;">TRUYỀN HÌNH SỐ VỆ TINH K+</span>
                </div>
                <div class="header_login">
                    <ul>
                        <li><a href="" id="btnMuaApp" class="p_white">MUA APP K+</a></li>
                        <li><a href="register">Đăng kí</a></li>
                        <li><a href="login">Đăng nhập</a></li>
                        <c:choose>
                        	<c:when test="${not empty sessionScope.currentUser}">
                        		<li><a href="" class="p_white">Welcome  ${sessionScope.currentUser.username}</a></li>
                        	</c:when>
                        </c:choose>
                    </ul>
                </div>
            </div>
            <div class="header_nav">
                <ul class="main_menu">
                    <li><a href="index" class="p_white">HOME</a></li>
                    <li><a href="" class="p_white">TIÊU ĐIỂM</a></li>
                    <li><a href="" class="p_white">MUA K+</a></li>
                    <li><a href="" class="p_white">MY ACCOUNT</a>
                        <ul class="sub_menu">
                            <li><a href="">FOGOT PASSWORD</a></li>
                            <li><a href="">CHANGE PASSWORD</a></li>
                            <li><a href="logout">LOG OFF</a></li>
                            <li><a href="">EDIT PROFILE</a></li>
                        </ul>
                    </li>
                    <li><a href="" class="p_white">APP K+</a></li>
                    <c:choose>
                    	<c:when test="${not empty sessionScope.currentUser}">
                    		<li><a href="favorites" class="p_white">YÊU THÍCH</a></li>
                    		<li><a href="history" class="p_white">LỊCH SỬ</a></li>
                    	</c:when>
                    </c:choose>
                    
                </ul>
            </div>
        </div>
    </header>
	
	<div class="container-md" style="margin-top: 50px; margin-bottom: 100px;">
        <div class="row">
            <div class="col-md-8 main_video">
                 <iframe id="tm-video" src="https://www.youtube.com/embed/${video.href }" width="100%" height="400px;"></iframe>
                <p style="font-size: 20px; font-weight: 600; padding: 0; margin-top: 10px;">
                    ${video.title }
                </p>
                <div class="button_likeANDshare" style="margin-bottom: 20px;">                    
                    <c:if test="${not empty sessionScope.currentUser}">
                      <button id="likeOrUnlikeBtn" style="padding: 5px 20px; border-radius: 20px; border: 0;" class="btn_title">
                      	<c:choose>
                      		<c:when test="${flagLikedBtn == true}">Unlike</c:when>
                      		<c:otherwise>Like</c:otherwise>
                      	</c:choose>
                      </button>
       					
       					<button id="Share" style="padding: 5px 20px; border-radius: 20px; border: 0;" class="btn_title">
                      	<c:choose>
                      		<c:when test="${flagLikedBtn == true}">Unshare</c:when>
                      		<c:otherwise>Share</c:otherwise>
                      	</c:choose>
                      </button>
                      <input type="hidden" value="${video.href }" id="videoIdHdn">
                      </c:if>
                </div>
                <div class="main_title"
                    style="background-color: rgb(221, 219, 219); padding: 20px; border-radius: 10px;">
                    <p style="font-size: 14px; font-weight: 400;">
                        ${video.description }
                    </p>
                    <p id="description">${video.href }</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="list_right">
                <c:forEach var="video" items="${videos}">
                <a href="<c:url value='/video?action=watch&id=${video.href}'/>"
						class="video_a" style="text-decoration: none;">
                    <div class="video_right" style="display: flex; margin-bottom: 10px;">
                        <img src="<c:url value='${video.poster }'/>" alt="" width="150px" height="100px">
                        <p style="margin-left: 10px;">${video.title}
                        </p>
                    </div>
                    </a>
				</c:forEach>
                </div>
            </div>
        </div>
    </div>


<div class="infomation">
        <div class="container-md">
            <div class="row">
                <div class="col-md-3 info">
                    <img src="./images/Logok.png" alt="">
                    <p class="p_white">Dịch vụ truyền hình trả tiền dành cho mọi thành viên trong gia đình với nội dung
                        độc
                        quyền, nhóm kênh
                        phong phú, phủ sóng toàn quốc, chất lượng HD và nhiều dịch vụ tiện ích như ứng dụng K+ miễn phí
                        xem
                        trên máy tính, điện thoại với kho phim và thể thao VOD đặc sắc.</p>
                    <div class="face">
                        <p class="p_white">Liên hệ quảng cáo: ad.kplus.vn</p>
                        <img src="./images/kadvan.png" alt="" width="200px">
                    </div>

                    <div class="face">
                        <p class="p_white">Liên hệ tuyển dụng: careers.kplus.vn</p>
                        <img src="https://kplus-website-production-cdn.azureedge.net/content/upload/1/root/logo-kplus-careers.png"
                            alt="" width=150px;>
                    </div>
                </div>

                <div class="col-md-3 info">
                    <div class="face">
                        <p class="p_white" style="font-size: 15px; font-weight: 700;">TIÊU ĐIỂM</p>
                        <p class="p_white">Lịch phát sóng</p>
                        <p class="p_white">Tin tức</p>
                    </div>

                    <div class="face" style="margin-top: 20px;">
                        <p class="p_white" style="font-size: 15px; font-weight: 700;"> HỖ TRỢ</p>
                        <p class="p_white">Gia hạn trực tuyến</p>
                        <p class="p_white">Các cách gia hạn</p>
                    </div>
                </div>

                <div class="col-md-3 info">
                    <div class="face">
                        <p class="p_white" style="font-size: 15px; font-weight: 700;">MUA K+</p>
                        <p class="p_white">Tìm Đại lý gần nhất</p>
                        <p class="p_white">Các gói kênh</p>
                    </div>
                </div>

                <div class="col-md-3 info">
                    <div class="face">
                        <p class="p_white" style="font-size: 15px; font-weight: 700;">LIÊN HỆ</p>
                        <p class="p_white">Công ty TNHH truyền hình số vệ tinh Việt Nam. Giấy chứng nhận đăng ký doanh
                            nghiệp số 0103932332 do Sở Kế hoạch và Đầu tư Thành phố Hà Nội cấp lần đầu ngày 25/5/2009,
                            thay đổi lần thứ 8 ngày 2/06/2022. Người đại diện theo pháp luật: Ông Thomas Jayet – Chức
                            vụ: Tổng Giám đốc.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <div class="container-md">
            <p style="padding: 5px;margin: 0;" class="p_white">©2009-2022 Truyền hình K+ giữ bản quyền.</p>
        </div>
    </footer>
	<script>
		$("#likeOrUnlikeBtn").click(function(){
			var videoId = $('#videoIdHdn').val();
			$.ajax({
				url: "video?action=like&id=" + videoId
			}).then(function(data){
				var text = $("#likeOrUnlikeBtn").text();
				if(text.indexOf("Like") != -1){
					$("#likeOrUnlikeBtn").text("Unlike");
				}else{
					$("#likeOrUnlikeBtn").text("Like");
				}
			}).fail(function(){
				alert('try again');
			});
		});
		
		$("#Share").click(function(){
			var videoId = $('#videoIdHdn').val();
			$.ajax({
				url: "video?action=share&id=" + videoId
			}).then(function(data){
				var text = $("#Share").text();
				if(text.indexOf("Share") != -1){
					$("#Share").text("Unshare");
				}else{
					$("#Share").text("Share");
				}
			}).fail(function(){
				alert('try again');
			});
		});
	</script>
</body>
</html>