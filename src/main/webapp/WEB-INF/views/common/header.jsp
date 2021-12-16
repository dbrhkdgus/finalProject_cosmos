<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>${param.title}</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/css/index.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<c:if test="${not empty msg}">
<script>
	alert("${msg}");
</script>
</c:if>
</head>
    <body>
        <header style="box-shadow: 12px -7px 22px #ccc; margin-bottom: 50px;">
            <!-- Responsive navbar-->
            <nav class="navbar navbar-expand-lg">
                <div class="container" id="headerContainer">
                    <div id="navbar">
                        <div class="nav-logo">
                            <a href="">
                                <img src="${pageContext.request.contextPath }/resources/images/cosmoslogo_black.png" class="nav-logo-img" alt="">
                            </a>
                        </div>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mb-2 mb-lg-0">
                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/group/groupSearch.do">Search</a></li>
                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/main/qa.do">문의사항</a></li>
                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/main/noticeList.do">공지사항</a></li>
                            </ul>
                        </div>
                    </div>
                <div id="login-form-div">
                  
                    <div class="card-body">
                        <div class="login-form">
                            <button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/member/memberLogin.do';">로그인</button>
                            <button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do';">회원가입</button>
                            
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </header>
<script>

</script>
