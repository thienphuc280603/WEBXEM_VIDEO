<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Favorite</title>
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
<link href="<%=request.getContextPath()%>/css/trangchu2.css"
	rel="stylesheet">
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
                            <li><a href="forgotPass">FOGOT PASSWORD</a></li>
                            <li><a href="changePass">CHANGE PASSWORD</a></li>
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
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="z-index: 0;">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="<%=request.getContextPath()%>/images/banner1.png" class="d-block w-100" alt="">
            </div>
            <div class="carousel-item">
                <img src="<%=request.getContextPath()%>/images/banner2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="<%=request.getContextPath()%>/images/banner3.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="<%=request.getContextPath()%>/images/banner4.png" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-target="#carouselExampleIndicators" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-target="#carouselExampleIndicators" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </button>
    </div>

    <div class="container-md">
        <div class="buttonGroup" style="margin-top: 20px;">
            <div class="row">

                <div class="col-md-3 buttonGroup_button">
                    <span style="font-weight: 400; font-size: 30px;">Đăng kí lắp đặt</span>
                    <p>Bạn hãy để lại thông tin liên hệ hoặc tìm K+ store hay Đại lý K+ gần nhất.</p>
                </div>

                <div class="col-md-3 buttonGroup_button">
                    <span style="font-weight: 400; font-size: 30px;">Gia hạn thuê bao</span>
                    <p>Có thể gia hạn trực tuyến ngay trên website với mã thẻ cào, mã điện tử...</p>
                </div>


                <div class="col-md-3 buttonGroup_button">
                    <span style="font-weight: 400; font-size: 30px;">Tìm đại lý gần nhà </span>
                    <p>Tìm Chi nhánh, Đại lý K+ gần nhất theo Tỉnh/Thành, Quận/Huyện.</p>
                </div>

                <div class="col-md-3 buttonGroup_button">
                    <span style="font-weight: 400; font-size: 30px;">Liên hệ trực tuyến</span>
                    <p>Chat với chúng tôi dưới góc phải hoặc Hỗ trợ/ Liên hệ.</p>
                </div>
            </div>
        </div>
    </div>
	
	
	<div class="container-md">
		<p
			style="text-align: center; margin-bottom: 50px; font-size: 30px; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">
			DANH SÁCH VIDEO</p>
		<div class="row">
			<c:forEach var="video" items="${videos}">
				<div class="col-md-4">
					<a href="<c:url value='/video?action=watch&id=${video.href}'/>"
						class="video_a" style="text-decoration: none;">
						<div class="video">
							<img src="<c:url value='${video.poster }'/>" width="100%">
							<div class="title">
								<p id="title" tyle="white-space: nowrap; overflow: hidden;">${video.title}
								</p>
							</div>
							<div class="button" style="display: flex; justify-content: space-between;">
								<p style="color: black;">${video.views } Views</p>
								<p style="color: black;">${video.shares } Share</p>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>

    <div class="container-md">
        <div class="buttonGroup" style="margin-top: 20px;">
            <div class="row">

                <div class="col-md-4 buttonGroup_button">
                    <span style="font-weight: 400; font-size: 20px;">Xem gì trên K+ tuần này?</span>
                    <p>Bóng đá, quần vợt độc quyền; Phim Việt chiếu rạp mới nhất, phim truyền hình nổi tiếng...</p>
                </div>

                <div class="col-md-4 buttonGroup_button">
                    <span style="font-weight: 400; font-size: 20px;">Lịch phát sóng</span>
                    <p>Xem trước lịch phát sóng các chương trình bạn yêu thích tới 7 ngày!</p>
                </div>


                <div class="col-md-4 buttonGroup_button">
                    <span style="font-weight: 400; font-size: 20px;">Đồng phân phối</span>
                    <p>Bạn có thể đăng ký xem gói 4 kênh K+ trên các hệ thống truyền hình khác.</p>
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
                        <img src="<%=request.getContextPath()%>/images/kadvan.png" alt="" width="200px">
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
</body>
</html>