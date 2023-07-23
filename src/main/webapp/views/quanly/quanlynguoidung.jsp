<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
</head>
<body>
	<header>
            <nav class="navbar navbar-expand-lg navbar-light"
                style="background-color: black; justify-content:
                space-between;">
                <span class="navbar-text" style="color: yellow;">
                    ADMINISTRATION TOOL
                </span>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto" style="margin-left: 1100px;">
                        <li class="nav-item active">
                            <a class="nav-link" href="#" style="color: green;">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: green;">Features</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: green;">Pricing</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

	<div class="container-md main_page" style="margin-top: 50px;">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="home-tab" data-toggle="tab" data-target="#home" type="button"
                    role="tab" aria-controls="home" aria-selected="true" style="color: orange;">VIDEO
                    EDITION</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="profile-tab" data-toggle="tab" data-target="#profile" type="button"
                    role="tab" aria-controls="profile" aria-selected="false" style="color: orange;">VIDEO LIST</button>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <form style="
                border: 1px solid orangered;
                padding: 10px;
                text-align: left;
                ">
                    <h3>REGISTRATION</h3>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="">USERNAME?</label>
                            <input class="form-control">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="">PASSSWORD?</label>
                            <input class="form-control">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="">FULLNAME ?</label>
                            <input class="form-control">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="">EMAIL ADDRESS ?</label>
                            <input class="form-control">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary" style="text-align: right">
                        UPDATE
                    </button>
                    <button type="submit" class="btn btn-primary" style="text-align: right">
                        DELETE
                    </button>
                </form>
            </div>


            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">Username</th>
                            <th scope="col">Password</th>
                            <th scope="col">Fullname</th>
                            <th scope="col">Email</th>
                            <th scope="col">Role</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">TeoNV</th>
                            <td>123456</td>
                            <td>Nguyễn Văn Tèo</td>
                            <td>teonv@gmail.com</td>
                            <td>Admin</td>
                            <td>Edit</td>
                        </tr>
                    </tbody>
                </table>
                <div class="footer" style="display: flex; justify-content: space-between;">
                    <p>185 user</p>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="button" class="btn btn-primary">Fist</button>
                        <button type="button" class="btn btn-primary">Prev</button>
                        <button type="button" class="btn btn-primary">Next</button>
                        <button type="button" class="btn btn-primary">Final</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>