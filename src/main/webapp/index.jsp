<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<div class="category">
			<ul class="cate-list" style="padding-left: 0;">
				<li class="popular"><a href="">인기</a></li>
				<li class="popular"><a href="">프론트</a></li>
				<li class="popular"><a href="">백엔드</a></li>
				<li class="popular"><a href="">풀스택</a></li>
				<li class="popular"><a href="">알고리즘</a></li>
				<li class="popular"><a href="">db</a></li>
			</ul>
			<button type="button" class="btn-category">전체 카테고리</button>
		</div>
		<!-- Categories widget-->
	</div>
	<div class="index-outer2">
		<!-- Nested row for non-featured blog posts-->
		<div class="row">
			<div class="row row-cols-2 row-cols-lg-3">
				<!-- Blog post-->
				<div class="card mb-4">
					<a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
					<div class="card-body">
						<div class="small text-muted">January 1, 2021</div>
						<h2 class="card-title h4">Post Title</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
						<a class="btn btn-primary" href="#!">Read more →</a>
					</div>
				</div>
				<!-- Blog post-->
				<div class="card mb-4">
					<a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
					<div class="card-body">
						<div class="small text-muted">January 1, 2021</div>
						<h2 class="card-title h4">Post Title</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
						<a class="btn btn-primary" href="#!">Read more →</a>
					</div>
				</div>
				<!-- Blog post-->
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
			<div class="row row-cols-2 row-cols-lg-3">
				<!-- Blog post-->
				<div class="card mb-4">
					<a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
					<div class="card-body">
						<div class="small text-muted">January 1, 2021</div>
						<h2 class="card-title h4">Post Title</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
						<a class="btn btn-primary" href="#!">Read more →</a>
					</div>
				</div>
				<!-- Blog post-->
				<div class="card mb-4">
					<a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
					<div class="card-body">
						<div class="small text-muted">January 1, 2021</div>
						<h2 class="card-title h4">Post Title</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
						<a class="btn btn-primary" href="#!">Read more →</a>
					</div>
				</div>
				<!-- Blog post-->
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
		</div>
		<!-- Pagination-->
		<nav aria-label="Pagination">
			<hr class="my-0" />
			<ul class="pagination justify-content-center my-4 ">
				<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
				<li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
				<li class="page-item"><a class="page-link" href="#!">2</a></li>
				<li class="page-item"><a class="page-link" href="#!">3</a></li>
				<li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
				<li class="page-item"><a class="page-link" href="#!">15</a></li>
				<li class="page-item"><a class="page-link" href="#!">Older</a></li>
			</ul>
		</nav>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
