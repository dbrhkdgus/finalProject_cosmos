<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="그룹 상세 정보" name="title"/>
</jsp:include>
<!-- detail시작부분 -->
<div class="class-detail-wrap">

	<!-- 왼쪽 클래스 정보 -->
	<div class="class-detail-left-container">
		<section class="class-info-first">
			<div class="class-info-title"width: 700px;>
				<h6 style="background-color: #F0E3F7; width: fit-content;">스터디원
					모집중!</h6>
				<h1 class="c-title">자바 스프링 들으면 들을수록 어렵다!</h1>
				<div class="leader-profile">
					<div class="leader-profile-img" style="background: #BDBDBD;">
						<img class="profile" src="/resources/최원.png">
					</div>
					<div class="group-leader-info">
						<span id="group-leader-name">최원</span>
					</div>
				</div>
			</div>
			<div class="class-img-box">
				<img class="class-img" src="https://i.ibb.co/yPk2Nk5/2.jpg" alt="클래스배너 이미지">
			</div>
			<div class="class-nav-bar">
				<ul class="nav nav-tabs">
					<li class="nav-item classbar"><a class="nav-link active"
						href="#class-summary">스터디소개</a></li>
					<li class="nav-item classbar"><a class="nav-link"
						href="#class-graph">위치</a></li>
					<li class="nav-item classbar"><a class="nav-link"
						href="#class-review">리뷰</a></li>
				</ul>
				<hr style="margin: 0; height: 10px; background-color: #D3CBF4;">

			</div>
		</section>

		<!-- 클래스 소개 section -->
		<section class="class-info-comm">
			<div class="comm-left-box">
				<p class="class-left-title" id="class-summary">스터디소개</p>
			</div>
			<div class="comm-right-box">
				<p class="class-right-content">Lorem ipsum dolor sit amet
					consectetur adipisicing elit. Totam ad sint soluta dicta, autem
					laborum, magnam id molestiae blanditiis inventore pariatur
					excepturi voluptas repellendus ratione ea eligendi cumque quibusdam
					odit?</p>
			</div>

		</section>

		<section class="class-info-comm">
			<div class="comm-left-box">
				<p class="class-left-title" id="class-rule">이런분들이 가입하시면 좋아요</p>
			</div>
			<div class="comm-right-box">
				<p class="class-right-content">Lorem ipsum dolor sit amet
					consectetur adipisicing elit. Totam ad sint soluta dicta, autem
					laborum, magnam id molestiae blanditiis inventore pariatur
					excepturi voluptas repellendus ratione ea eligendi cumque quibusdam
					odit?</p>
			</div>

		</section>

		<section class="class-info-comm">
			<div class="comm-left-box">
				<p class="class-left-title">꼭! 지켜주세요</p>
			</div>
			<div class="comm-right-box">
				<p class="class-right-content">Lorem ipsum dolor sit amet
					consectetur adipisicing elit. Totam ad sint soluta dicta, autem
					laborum, magnam id molestiae blanditiis inventore pariatur
					excepturi voluptas repellendus ratione ea eligendi cumque quibusdam
					odit?</p>
			</div>

		</section>

		<section class="class-info-comm">
			<div class="comm-left-box">
				<p class="class-left-title" id="class-graph">저희 모임장소입니다.</p>
			</div>
			<div class="comm-right-box">
				<p class="class-right-content">Lorem ipsum dolor sit amet
					consectetur adipisicing elit. Totam ad sint soluta dicta, autem
					laborum, magnam id molestiae blanditiis inventore pariatur
					excepturi voluptas repellendus ratione ea eligendi cumque quibusdam
					odit?</p>
			</div>

		</section>


		<section class="class-info-comm">
			<div class="comm-left-box">
				<p class="class-left-title" id="class-review">스터디원 리뷰</p>
			</div>

			<div class="comm-right-box">
				<p style="display: flex; justify-content: flex-end;">리뷰작성하기</p>
				<div class="shop-detail-reblybox">
					<div class="enroll-reply" style="display: flex;">
						<input type="text" id="detail-inputbox" name="reply-input"
							placeholder="댓글을 입력하세요">
						<button type="button" class="btn btn-secondary">등록</button>
					</div>
				</div>

			</div>

			<hr style="margin: 0; height: 10px; background-color: #D3CBF4;">



		</section>

	</div>
	<!-- 오른쪽 sticky 클래스정보 -->
	<div class="class-detail-right-container">
		<div class="card" id="quickmenu"
			style="width: 410px; height: 450px; border-radius: 30px; position: fixed; margin-left: 50px; ">
			<div class="card-body" id="sticky-content">
				<div class="card-text">
					<h5 class="card-title">Special title5 treatment</h5>
					<p class="card-text">With supporting text below as a natural
						lead-in to additional content dsaldkjasldjsakldjqwlijlwq</p>
				</div>
				<div class="sticky-button-area">
					<button type="button" class="btn btn-primary btn-m"
						style="margin-right: 10px;">좋아요</button>
					<button type="button" class="btn btn-secondary btn-m" onclick="location.href='${pageContext.request.contextPath}/group/groupJoin.do';">가입신청</button>
				</div>
			</div>
		</div>


	</div>

</div>

﻿
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
