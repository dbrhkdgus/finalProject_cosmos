<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin</title>
    
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- sock.js 라이브러리 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js" integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- stomp.js 라이브러리 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
   <!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/css/fontawesome.min.css">
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/css/bootstrap.min.css">
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/css/templatemo-style.css">
<!--
Product Admin CSS Template
https://templatemo.com/tm-524-product-admin
-->

	
</head>
<style>
#seeMore{
    font-size: 12px;
}
</style>


<body>
    <div>
        <header>
            <nav class="navbar navbar-expand-xl" >
                <div class="container h-100">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/main.do">
                <img style="height: 50px;" src="${pageContext.request.contextPath}/resources/images/cosmoslogo_white.png" alt="">
        </a>
        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fas fa-bars tm-nav-icon"></i>
    </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto h-100">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/members.do" role="button" aria-haspopup="true" aria-expanded="false">
                    <i class="far fa-user"></i>

                    <span>회원관리</span>
                    </a>

                </li>                        
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="adminGroupNavbarDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-sitemap"></i>

                    <span>
                        모임관리 <i class="fas fa-angle-down"></i>
                        </span>
                    </a>
                    <div class="dropdown-menu admin-group-menu" aria-labelledby="adminGroupNavbarDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/groups.do">모임 목록</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/permitGroups.do">모임 승인 관리</a>
                    </div>
                </li>  
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/board.do">
                        <i class="far fa-clipboard"></i>
                        게시물 관리
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/QnA.do">
                        <i class="fas fa-question"></i>
                        문의사항
                        <span class="sr-only">(current)</span>
                    </a>
                </li>


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="staticsNavbarDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-chart-bar"></i>

                    <span>
                        통계 <i class="fas fa-angle-down"></i>
                        </span>
                    </a>
                    <div class="dropdown-menu statics-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/StatisticsOfMember.do">회원 통계</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/StatisticsOfGroup.do">모임 통계</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/StatisticsOfSales.do">매출 통계</a>

                    </div>
                </li>
                
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link d-block" href="${pageContext.request.contextPath}">
                        <b>COSMOS 메인</b>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    
</nav>
<script>

//상단 nav Bar 토글이 재작동하지 않는 문제 해결 코드
$('#adminGroupNavbarDropdown').click(function() {
	$('.admin-group-menu').toggle();
});

$('#staticsNavbarDropdown').click(function() {
	$('.statics-menu').toggle();
});

$(document).click(function(){
	$('.admin-group-menu').	hide();
	$('.statics-menu').	hide();
});


</script>
</header>

