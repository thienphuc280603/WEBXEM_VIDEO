<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Đăng nhập</title>
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
<link href="<%=request.getContextPath()%>/css/login.css"
	rel="stylesheet">
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
                        <li><a href="register" class="p_white">Đăng kí</a></li>
                        <li><a href="login">Đăng nhập</a></li>
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
                    <li><a href="" class="p_white">YÊU THÍCH</a></li>
                </ul>
            </div>
        </div>
    </header>

    <div class="container-md" style="min-height: 600px;">
        <p style="text-align: right; margin-top: 20px;">K+ Đăng nhập</p>
        <div class="title" style="border-bottom: 1px solid rgb(150, 149, 149); width: 100%;">
            <span style="font-size: 20px;">ĐĂNG NHẬP</span>
        </div>

        <center>
            <div class="form">
                <span
                    style="font-size: 25px; border-bottom: 1px solid rgb(150, 149, 149); margin-left: 60px; padding: 0 0 20px 0;">
                   Quên mật khẩu</span>
                <div class="login" method="post">
                    <input type="email" name="email" id="email" placeholder="Email"
                        style="width: 350px; height: 35px; border-radius: 5px; border: 1px solid rgb(228, 227, 227);">
                        <a id="messageReturn"></a>
                    <button id="sendBtn" type="submit">Send</button>
                </div>
                
            </div>
        </center>
    </div>

    <div class="infomation">
        <div class="container-md">
            <div class="row">
                <div class="col-md-3 info">
                    <img src="<%=request.getContextPath()%>/images/Logok.png" alt="">
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
    

    <script type="text/javascript">
		$("#sendBtn").click(function(){
			$("#messageReturn").text("");
			var email = $("#email").val();
			var formData = {"email": email};
			$.ajax({
				url: "forgotPass",
				type: "post",
				data: formData
			}).then(function(data){
				$("#messageReturn").text("Password đã được reset, check email của bạn");
				setTimeout(function(){
					window.location.href = "http://localhost:8080/PS24434_NguyenThienPhuc_ASMFinal/index";
				}, 5*1000);
			}).fail(function(error){
				$("#messageReturn").text("Lỗi thông tin");
			})
		});
	</script>
</body>
</html>