<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="그룹 상세 정보" name="title"/>
</jsp:include>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753f0f237470af5e83541545d143b9c3&libraries=services,clusterer,drawing"></script>
﻿<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('서울특별시 강서구 화곡동 897-14', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">모임장소</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});  


//좋아요 기능
	$(".fa-heart").click((e)=>{

		let $target = $(e.target);
		let $groupNo = $target.data("groupNo");
		
		$.ajax({
			url: `${pageContext.request.contextPath}/group/groupLikeSearch.do`,
			dataType: "json",
			type: "GET",
			data: {'groupNo' : $groupNo},
			success(jsonStr){
				console.log(jsonStr);
				const likeValid = jsonStr["likeValid"];
				const likeCnt = jsonStr["likeCnt"];
				//member 본인의 likeValid가 1이라면 속이 찬 하트, 0이면 속이 빈 하트
				if(likeValid == 1){
					$target
						.removeClass("far")
						.addClass("fas");
				}else{
					$target
						.removeClass("fas")
						.addClass("far");
				}
				$target.html(`<span>\${likeCnt}</span>`);
			},
			error(xhr, textStatus, err){
                console.log(xhr, textStatus, err);
                    alert("로그인후 이용가능합니다");
                 //   location.href="${pageContext.request.contextPath}/member/memberLogin.do";                 
            }
		});
	});
</script>

<!-- detail시작부분 -->
<div class="class-detail-wrap">
	<!-- 왼쪽 클래스 정보 -->
	<div class="class-detail-left-container">
		<section class="class-info-first">
			<div class="class-info-title"width: 700px;>
				<h6 style="background-color: #F0E3F7; width: fit-content;">
				<c:if test="${fn:contains(group.groupClose, 'N')}">스터디원 모집중!</c:if>
				<c:if test="${fn:contains(group.groupClose, 'Y')}">스터디원 모집마감</c:if></h6>
				<h1 class="c-title">${giConn.giTitle}</h1>
				<div class="leader-profile">
					<div class="group-leader-info">
						<span id="group-leader-name">${attach.memberId}</span>
					</div>
				</div>
			</div>
			<div class="class-img-box">
				<img class="class-img" src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}" style="height: 400px;overflow: hidden;object-fit: cover;" alt="클래스배너 이미지">
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
		<c:forEach var="groupInfo" items="${groupInfoList}">
					<section class="class-info-comm">
						<div class="comm-left-box">
			<c:choose>
				<c:when test="${groupInfo.giSubTitle eq '1'}">
							<p class="class-left-title" id="class-summary">스터디소개</p>
				</c:when>
				<c:when test="${groupInfo.giSubTitle eq '2'}">
							<p class="class-left-title" id="class-rule">이런분들이 가입하시면 좋아요!</p>
				</c:when>
				<c:when test="${groupInfo.giSubTitle eq '3'}">
							<p class="class-left-title" id="class-summary">스터디는 이렇게 진행됩니다!</p>
				</c:when>
				<c:when test="${groupInfo.giSubTitle eq '4'}">
							<p class="class-left-title" id="class-summary">꼭! 지켜주세요!</p>
				</c:when>
			</c:choose>
						</div>
						<div class="comm-right-box">
							<p class="class-right-content">${groupInfo.giContent}</p>
						</div>
					</section>
		</c:forEach>
		
		<section class="class-info-comm">
			<div class="comm-left-box">
				<p class="class-left-title" id="class-graph">저희 모임장소입니다!</p>
				
			</div>
			<div id="map" style= "width: 500px; height: 500px; margin-left: 10% ">
				
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
					<h3 class="card-title" style="font-weight: bolder;">${group.groupName}</h3>
					<h5 class="card-text">대분류 : ${cate.category1Name}</h5>
					<c:forEach var="cate" items="${cateTwoList}">
					<p class="card-text">${cate.category2Name}</p>
					</c:forEach>
				</div>
				<div class="sticky-button-area">
				<!--far 빈하트 fas 꽉찬 하트  -->
				
				<!--로그인이 안되어있을 때   -->
					 <sec:authorize access="isAnonymous()"> 
				            <i class="far fa-heart"  data-group-no="${group.groupNo }"><span>${group.groupLikeCount }</span></i>
				     </sec:authorize> 
				<!--로그인 되어있을 때  -->
					    <sec:authorize access="isAuthenticated()">

					    	<c:if test= ${map.likeValid == 0 }>
					    		<i class="far fa-heart"  data-group-no="${group.groupNo }"><span>${group.groupLikeCount }</span></i>
			     			</c:if>
					         <i class="fas fa-heart"  data-group-no="${group.groupNo }"><span>${group.groupLikeCount }</span></i>
					    </sec:authorize> 
					<button type="button" class="btn btn-secondary btn-m" onclick="location.href='${pageContext.request.contextPath}/group/groupJoin.do?groupNo=${group.groupNo}';">가입신청</button>
				</div>
			</div>
		</div>


	</div>

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
