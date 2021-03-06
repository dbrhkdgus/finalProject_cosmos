<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="그룹 상세 정보" name="title"/>
</jsp:include>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<style>
.nav-up { top: 100px;}


</style>
<script>
var didScroll;
var lastScrollTop = 0;
var delta = 5;
var navbarHeight = $('header').outerHeight();
$(window).scroll(function(event){
	didScroll = true;
});
setInterval(function() {
	if (didScroll) {
		hasScrolled();
		didScroll = false;
	}
}, 250);
function hasScrolled() {
	var st = $(this).scrollTop();
	if(Math.abs(lastScrollTop - st) <= delta) return;
	if (st > lastScrollTop && st > navbarHeight){ 
		$('#quickmenu').removeClass('nav-down').addClass('nav-up');
		} else {
		if(st + $(window).height() < $(document).height()) {
			$('#quickmenu').removeClass('nav-up').addClass('nav-down');
		}
	}
	lastScrollTop = st;
};

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
						<span id="group-leader-name">${member.nickname}</span>
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
			<div class="d-flex flex-column">
			<div class="comm-right-box">
				<p class="class-right-content">${group.groupLocation}</p>
			</div>
			<div id="map" style= "width: 500px; height: 500px; margin-left: 10% ">
			</div>
				
			</div>
		</section>
			
		<section class="class-info-comm">
			<div class="comm-left-box">
				<p class="class-left-title" id="class-review">스터디원 리뷰</p>
			</div>
			<div class="comm-right-box">
					<div class="card" style="width: 30rem; border: none;">
					<div class="shop-detail-reblybox">
			<sec:authorize access="hasAnyRole('ROLE_GW${group.groupNo}MEMBER','ROLE_GW${group.groupNo}MASTER', 'ROLE_ADMIN')">
					<p style="display: flex; justify-content: flex-end;">리뷰작성하기</p>
						<div class="group-reply-enroll" style="display: flex;">
						<form:form action="${pageContext.request.contextPath }/group/insertGroupeReply.do" method="post">
						<input type="hidden" value="${group.groupNo}" name ="groupNo">
							<input type="text" id="detail-inputbox" name="content"
								placeholder="댓글을 입력하세요">
							<button type="submit" class="btn btn-secondary">등록</button>
						</form:form>
						</div>
			</sec:authorize>
					</div>
					<div class="card text-center" style="border: none;">
						<div class="reply-outer ">
							<form:form
								action="${pageContext.request.contextPath }/group/deleteGroupReply.do"
								method="post">
								<c:forEach items="${replyList}" var="reply">
									<div class="d-flex bd-highlight"
										style="text-align-last: start;">
										<div class="p-2 bd-highlight">${reply.memberId}:</div>
										<div class="p-2 flex-grow-1 bd-highlight">${reply.content}</div>
										<div class="p-2 bd-highlight" style="font-size: 10px;">
											<fmt:formatDate value="${reply.regDate}" pattern="yy-MM-dd" />
											<c:if
												test="${reply.memberId eq loginMember.id || fn:contains(loginMember.authorities, 'ROLE_ADMIN')}">
												<button class="btn" type="submit" id="button-addon2"
													style="margin-bottom: 0px; font-size: 10px">댓글삭제</button>
											</c:if>
											<input type="hidden" value="${group.groupNo}" name="groupNo">
											<input type="hidden" value="${reply.replyNo}" name="replyNo">
										</div>
									</div>
								</c:forEach>
							</form:form>
						</div>
					</div>
				</div>
			</div>
			<hr style="margin: 0; height: 10px; background-color: #D3CBF4;">
		</section>
	</div>
	<!-- 오른쪽 sticky 클래스정보 -->
	<div class="class-detail-right-container">
		<div class="card" id="quickmenu"
			style="width: 410px; height: 300px; border-radius: 30px; position: fixed; margin-left: 50px; ">
			<div class="card-body" id="sticky-content">
				<div class="card-text">
					<h3 class="card-title mb-5" style="font-weight: bolder; ">${group.groupName}</h3>
					<h5 class="card-text" style="background-color:#CCE6FD; text-align:center; width:fit-content; ">[${cate.category1Name}]</h5>
					
						<c:forEach var="cate" items="${cateTwoList}">
						<span class="card-text cate-plus">#${cate.category2Name}</span>
						</c:forEach>
					
					


				</div>
				<div class="sticky-button-area">
					 <sec:authorize access="isAnonymous()"> 
				            <i class="far fa-heart"  data-group-no="${group.groupNo }"><span>${group.groupLikeCount }</span></i>
				     </sec:authorize> 
				<!--로그인 되어있을 때 likeValid가 0이면 빈하트 / likeValid가 1이면 하튼데 -->
					 <sec:authorize access="isAuthenticated()">	
					 <c:set var="flag" value="N"/> 
	                      <c:forEach var="git" items="${groupInterestList}" >
	                          <c:if test="${git.memberId == loginMember.id && group.groupNo == git.groupNo}"> 
	                          		<c:set var="flag" value="Y"/>                                                 
	                                  <i class="fas fa-heart"  data-group-no="${group.groupNo }"><span>${group.groupLikeCount }</span></i>  
	                          </c:if>
	                      </c:forEach>
	                      <c:if test="${flag == 'N'}">
	                      	<i class="far fa-heart"  data-group-no="${group.groupNo }"><span>${group.groupLikeCount }</span></i>
	                      </c:if>
	  					  <c:if test="${member.id != loginMember.id }">
		                      <i class="far fa-comment"  data-GM-id="${member.id }" onclick="DMPopup2('${member.id}')"><span>DM</span></i>			    	
	  					  </c:if>
					<c:set var="flag2" value="N" />
					<c:forEach var="alg" items="${ALGroupList}">
						<c:if test="${alg.memberId == loginMember.id}">
							<c:if test="${fn:contains(alg.groupAccept, 'N')}">
								<button type="button" class="btn btn-secondary btn-m  ml-3" style="color:black; border:none; background-color:#CCE6FD;"  disabled>승인 대기중</button>
							</c:if>
							<c:if test="${fn:contains(alg.groupAccept, 'Y')}">
								<button type="button" class="btn btn-secondary btn-m  ml-3"  style="color:black; border:none; background-color:#CCE6FD;" 
								onclick="location.href='${pageContext.request.contextPath}/gw/gw.do?groupNo=${group.groupNo}';">
								그룹웨어 입장하기
								</button>
							</c:if>
							
							<c:set var="flag2" value="Y" />
						</c:if>
					</c:forEach>
					<c:if test="${fn:contains(group.groupClose, 'Y')}">
								<button type="button" class="btn btn-secondary btn-m  ml-3"  style="color:black; border:none; background-color:#CCE6FD;"  disabled>모집 마감</button>
								<c:set var="flag2" value="Y" />
							</c:if>
					<c:if test="${flag2 == 'N'}">
						<button type="button" class="btn btn-secondary btn-m ml-3" onclick="location.href='${pageContext.request.contextPath}/group/groupJoin.do?groupNo=${group.groupNo}';"  style="color:black; border:none; background-color:#CCE6FD;">가입신청</button>
					</c:if>
					  </sec:authorize>
				</div>
			</div>
		</div>


	</div>

</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753f0f237470af5e83541545d143b9c3&libraries=services,clusterer,drawing"></script>
﻿<script>
//DM popup
function DMPopup2(sender) {
		var $sender = sender;
        window.name = "DM";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
        openWin = window.open("${pageContext.request.contextPath}/gw/chat/DMPopup2.do?sender="+$sender,
        		"childForm", "width=350, height=500, resizable = yes, scrollbars = yes"); 
    };
    
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

geocoder.addressSearch(`${group.groupLocation}`, function(result, status) {


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


/* 좋아요 버튼 클릭시 사용자 좋아요 여부에 따른 버튼 이벤트 */
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
        }
	});
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>