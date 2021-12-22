<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>
		<!-- Page content-->
<div class="container">
	<div class="index-outer1">
		<!-- Blog entries-->
		<div class="col-lg-8">
			<!-- Featured blog post-->
			<div class="card mb-4">
				<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-inner ">
						<div class="carousel-item active">
							<a href="#!"> <img src="https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/zZX/image/PoUmWOJMQg8DHzrn9PIuCIuwCwk" class="d-block  main-slide" alt="...">
							</a>
						</div>
						<div class="carousel-item ">
							<a href="#!"> <img src="https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/zZX/image/PoUmWOJMQg8DHzrn9PIuCIuwCwk" class="d-block  main-slide" alt="...">
							</a>
						</div>
						<div class="carousel-item ">
							<a href="#!"> <img src="https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/zZX/image/PoUmWOJMQg8DHzrn9PIuCIuwCwk" class="d-block  main-slide" alt="...">
							</a>
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="col-lg-9"></div>
		</div>
		<!-- Side widgets-->
		<!-- Search widget-->
		<!-- 카테고리코드-->
		<!--로그인 하지않았을떄   -->
		<sec:authorize access="isAnonymous()">
		<div class="category" style="margin-bottom:5px;">
			
			<div class="category2">
				<button type="button" class="btn-category">카테고리</button>
				<ul class="cate-list" style="padding-left: 0;  height: 270px;">
					<li class="popular"><a href="">웹개발</a></li>
					<li class="popular"><a href="">프론트</a></li>
					<li class="popular"><a href="">백엔드</a></li>
					<li class="popular"><a href="">풀스택</a></li>
					<li class="popular"><a href="">모바일 앱 개발</a></li>
					<li class="popular"><a href="">프로그래밍 언어</a></li>
					<li class="popular"><a href="">알고리즘</a></li>
					<li class="popular"><a href="">데이터베이스</a></li>
					<li class="popular"><a href="">게임개발</a></li>
					
				</ul>
				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" style="display:flex; margin-left:10px;">
	          		<input type="search" class="form-control form-control-dark" placeholder="찾고있는 스터디그룹을 검색해보세요!" aria-label="Search">
	          		<button type="button" class="btn btn-info" style="margin-left:10px; background-color:#6D8EF2 ; color:white;"><i class="fas fa-search"></i></button>
	        	</form>
			</div>
		</div>
		</sec:authorize>
		<!--로그인 했을 때  -->
		<sec:authorize access="isAuthenticated()">
		<div class="col-lg-4">
		
		<div class="login-index category" style="margin-bottom:5px;">
			
			<div class="category2">
				<button type="button" class="btn-category">카테고리</button>
				<ul class="cate-list" style="padding-left: 0;">
					<li class="login-popular"><a href="">로그인</a></li>
					<li class="login-popular"><a href="">프론트</a></li>
					<li class="login-popular"><a href="">백엔드</a></li>
					<li class="login-popular"><a href="">풀스택</a></li>
					<li class="login-popular"><a href="">모바일 앱 개발</a></li>
					<li class="login-popular"><a href="">프로그래밍 언어</a></li>
					<li class="login-popular"><a href="">알고리즘</a></li>
					<li class="login-popular"><a href="">데이터베이스</a></li>
					<li class="login-popular"><a href="">게임개발</a></li>
				</ul>
				
			</div>
		</div>
		<div class="login-index category " style="margin-bottom:5px;">
				<div class="index-member-box d-flex">
				<img src="${pageContext.request.contextPath }/resources/images/facebook.png" alt="" />					
				<div class="index-member-info">
				<a href="${pageContext.request.contextPath }/member/memberUpdate.do" ><p style="font-size: 20px;">&nbsp;<sec:authentication property="principal.memberName"/>님 </p></a>
				<form:form action="${pageContext.request.contextPath }/member/memberLogout.do" method="POST">
					<input type = "submit" id="loginOut" value="로그아웃" />
				</form:form>	
				
				
				</div>
				<div class="index-member">
				<button type="button" class="btn btn-outline-primary">DM</button>
				</div>
				</div>
				<div class="index-member-group">
				<a href="${pageContext.request.contextPath}/member/memberGroupList.do">신청 그룹</a>
				<a href="${pageContext.request.contextPath}/member/memberGroupList.do">가입 그룹</a>
				<a href="${pageContext.request.contextPath}/member/memberGroupList.do">관심 그룹</a>
				</div>
			</div>
		</div>
		</sec:authorize>
			
		
		<!-- Categories widget-->
	</div>
		
	<hr />

	<h2>BEST</h2>
	<div class="index-group-list" style="height: 430px;">

		<div class="card mb-4 search-card">
			<a href="#!"><img class="card-img-top"
				src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
			<div class="card-body">
				<div class="small text-muted">January 1, 2021</div>
				<h2 class="card-title h4">Slide 1</h2>
				<p class="card-text">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Reiciendis aliquid atque, nulla.</p>
				<a class="btn btn-primary" href="#!">Read more →</a>
			</div>
		</div>
		
		<div class="card mb-4 search-card" >
			<a href="#!"><img class="card-img-top"
				src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
			<div class="card-body">
				<div class="small text-muted">January 1, 2021</div>
				<h2 class="card-title h4">Slide 2</h2>
				<p class="card-text">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Reiciendis aliquid atque, nulla.</p>
				<a class="btn btn-primary" href="#!">Read more →</a>
			</div>
		</div>
		
		<div class="card mb-4 search-card" >
			<a href="#!"><img class="card-img-top"
				src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
			<div class="card-body">
				<div class="small text-muted">January 1, 2021</div>
				<h2 class="card-title h4">Slide 3</h2>
				<p class="card-text">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Reiciendis aliquid atque, nulla.</p>
				<a class="btn btn-primary" href="#!">Read more →</a>
			</div>
		</div>
		
		<div class="card mb-4 search-card" >
			<a href="#!"><img class="card-img-top"
				src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
			<div class="card-body">
				<div class="small text-muted">January 1, 2021</div>
				<h2 class="card-title h4">Slide 4</h2>
				<p class="card-text">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Reiciendis aliquid atque, nulla.</p>
				<a class="btn btn-primary" href="#!">Read more →</a>
			</div>
		</div>


	</div>
	<br />
	<hr />
	<h2>NEW</h2>
		<div class="index-group-list" style="height: 430px;">

		<div class="card mb-4 search-card">
			<a href="#!"><img class="card-img-top"
				src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
			<div class="card-body">
				<div class="small text-muted">January 1, 2021</div>
				<h2 class="card-title h4">Slide 1</h2>
				<p class="card-text">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Reiciendis aliquid atque, nulla.</p>
				<a class="btn btn-primary" href="#!">Read more →</a>
			</div>
		</div>
		
		<div class="card mb-4 search-card" >
			<a href="#!"><img class="card-img-top"
				src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
			<div class="card-body">
				<div class="small text-muted">January 1, 2021</div>
				<h2 class="card-title h4">Slide 2</h2>
				<p class="card-text">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Reiciendis aliquid atque, nulla.</p>
				<a class="btn btn-primary" href="#!">Read more →</a>
			</div>
		</div>
		
		<div class="card mb-4 search-card" >
			<a href="#!"><img class="card-img-top"
				src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
			<div class="card-body">
				<div class="small text-muted">January 1, 2021</div>
				<h2 class="card-title h4">Slide 3</h2>
				<p class="card-text">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Reiciendis aliquid atque, nulla.</p>
				<a class="btn btn-primary" href="#!">Read more →</a>
			</div>
		</div>
		
		<div class="card mb-4 search-card" >
			<a href="#!"><img class="card-img-top"
				src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
			<div class="card-body">
				<div class="small text-muted">January 1, 2021</div>
				<h2 class="card-title h4">Slide 4</h2>
				<p class="card-text">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Reiciendis aliquid atque, nulla.</p>
				<a class="btn btn-primary" href="#!">Read more →</a>
			</div>
		</div>


	</div>
	
	<br /><br />

	

	<!-- 	<div class="index-outer2">
		Nested row for non-featured blog posts
		
		
			<hr />
			<h2>NEW</h2>
			<div class="row row-cols-2 row-cols-lg-3">
				Blog post
				<div class="card mb-4">
					<a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
					<div class="card-body">
						<div class="small text-muted">January 1, 2021</div>
						<h2 class="card-title h4">Post Title</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
						<a class="btn btn-primary" href="#!">Read more →</a>
					</div>
				</div>
				Blog post
				<div class="card mb-4">
					<a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
					<div class="card-body">
						<div class="small text-muted">January 1, 2021</div>
						<h2 class="card-title h4">Post Title</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
						<a class="btn btn-primary" href="#!">Read more →</a>
					</div>
				</div>
				Blog post
				<div class="card mb-4">
					<a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
					<div class="card-body">
						<div class="small text-muted">January 1, 2021</div>
						<h2 class="card-title h4">Post Title</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
						<a class="btn btn-primary" href="#!">Read more →</a>
					</div>
				</div>

			</div>
		</div> -->
</div>

<script> 
$(document).ready(function(){ 
	// 옵셥 사용하지 않을 경우 
	$('.single-item').slick(); 
	// 옵셥 사용할 경우 
	$('.index-group-list').slick({ 
		// 옵션 삽입
		slidesToShow: 3, 
		slidesToScroll: 1


		}); 
	}); 
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
