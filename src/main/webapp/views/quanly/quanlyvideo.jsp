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
                        <div class="form-group col-md-4">
                            <img src="<%=request.getContextPath()%>/images/Need for Speed Unbound 3.jpg" alt="" width="100%"
                                style="margin-top: 30px;">
                        </div>
                        <div class="form-group col-md-8">
                            <div class="form-group">
                                <label for="">YOUTUBE ID?</label>
                                <input type="" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="">VIDEO TITLE?</label>
                                <input type="" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="">VIDEO COUNT?</label>
                                <input type="" class="form-control">
                            </div>

                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1"
                                    style="margin-right: 20px;">ACTIVE</label>
                                <input type="checkbox" class="form-check-input" id="exampleCheck2">
                                <label class="form-check-label" for="exampleCheck1">INACTIVE</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">DESCRIPTION?</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        CREATE
                    </button>
                    <button type="submit" class="btn btn-primary">
                        UPDATE
                    </button>
                    <button type="submit" class="btn btn-primary">
                        DELETE
                    </button>
                    <button type="submit" class="btn btn-primary">
                        RESET
                    </button>
                </form>
            </div>


            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">Youtube ID</th>
                            <th scope="col">Video title</th>
                            <th scope="col">View count</th>
                            <th scope="col">Status</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td>@mdo</td>
                        </tr>
                    </tbody>
                </table>
                <div class="footer" style="display: flex; justify-content: space-between;">
                    <p>85 videos</p>
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