﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="COSMOS" name="title" />
</jsp:include>
<!-- Page content-->
<!-- Portfolio Start -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/sakura/jquery-sakura.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/jquery-sakura.css" rel="stylesheet" />
<section id="portfolio" class="portfolio section-space-padding">
	<div class="container">


		<div class="about">
			<div class="underlined-text">
				<p class="underlined first">개성공단</p>
				<br />
				<p class="underlined second">멤버소개</p>

			</div>
		</div>

		<div class="outer d-flex">
			<div class="about content"></div>
			<div class="aboutdetail outer">

				<div class="aboutdetail leftbox active" id="ygh">
					<div class="left image ">
						<img
							src="https://i.ibb.co/L1pCTTN/tmp-1613290479805.jpg"
							alt="" id="bigImg">
						<p>
							<mark>유광현</mark>
						</p>
					</div>
					<div class="left content about-detail-content">
						<p>약 한달간의 파이널 프로젝트의 끝이 보이네요 😎 
							<br />그동안 노는 시간, 밥먹는 시간 모든 시간을 할애해 코스모스에 매달렸습니다. 
							<br />함께 달려온 개성공단팀 분들께 축하와 고생했다는 말을 해주고 싶습니다. 
						</p>
						<p>이제 취업을 위해 달려나가려고합니다! 
						<br />문득, 하던 일을 그만두고 코딩에 입문하던 때가 떠오르네요.
						<br />아직도 그때의 재미와 즐거움을 잘 지켜나가고 있습니다.
						<br />첫 일터에서 보다 많은 지식과 경험을 쌓고 싶습니다.
						</p>
						
						<p>고생 많이 한 우리 개성공단팀! 
						<br />멋진 개발자가 되어 다시 만납시다! 
						<br />고생 많았어요~!! 😀				
						</p>
					
					</div>
				</div>




				<div class="aboutdetail leftbox" id="ljp">
					<input type="hidden" value="" class="input-val" />
					<div class="left image">
						<img
							src="https://i.ibb.co/bsF7PgZ/LeeJP.png"
							alt="" id="bigImg">
						<p>
							<mark>이진표</mark>
						</p>
					</div>
					<div class="left content about-detail-content">Lorem ipsum
						dolor sit amet, consectetur adipisicing elit. Officia dignissimos
						rem sequi amet necessitatibus nostrum enim. Incidunt iste
						reprehenderit nostrum asperiores fugiat blanditiis delectus
						voluptate qui sequi sed. Voluptatibus harum.</div>
				</div>


				<div class="aboutdetail leftbox" id="kgj">
					<div class="left image">
						<input type="hidden" value="" class="input-val" /> <img
							src="https://i.ibb.co/Pj7sHTX/goo.gif"
							alt="" id="bigImg">
						<p>
							<mark>강구진</mark>
						</p>
					</div>
					<div class="left content about-detail-content">
					<p>이번 프로젝트에선 수많은 API을 사용해볼 수 있는 좋은 기회였습니다.</p>
					<p>다들 고생 많았고</p>
					<p>마지막까지 화이팅!</p>
					<p>모두들 좋은 직장에서 다시만나길</p>
					<img src="https://i.ibb.co/5YGCJ39/99b983892094b5c6d2fc3736e15da7d1.gif" alt="" style="width: 100px;"/>
					</div>
				</div>

			<div class="aboutdetail leftbox" id="keh">
				<input type="hidden" value="" class="input-val" />
				<div class="left image">
					<img
						src="https://i.ibb.co/W0gmXdB/image.png"
						alt="" id="bigImg">
					<p>
						<mark>김은희</mark>
					</p>
				</div>
				<div class="left content about-detail-content">Lorem ipsum
					dolor sit amet, consectetur adipisicing elit. Officia dignissimos
					rem sequi amet necessitatibus nostrum enim. Incidunt iste
					reprehenderit nostrum asperiores fugiat blanditiis delectus
					voluptate qui sequi sed. Voluptatibus harum.</div>
			</div>

			<div class="aboutdetail leftbox" id="bjy">
				<input type="hidden" value="" class="input-val" />
				<div class="left image">
					<img
						src="https://i.ibb.co/pXFVSyV/22.png"
						alt="" id="bigImg">
					<p>
						<mark>백지영</mark>
					</p>
				</div>
				<div class="left content about-detail-content">Lorem ipsum
					dolor sit amet, consectetur adipisicing elit. Officia dignissimos
					rem sequi amet necessitatibus nostrum enim. Incidunt iste
					reprehenderit nostrum asperiores fugiat blanditiis delectus
					voluptate qui sequi sed. Voluptatibus harum.</div>
			</div>

			<div class="aboutdetail leftbox" id="yjw">
				<input type="hidden" value="" class="input-val" />
				<div class="left image">
					<img
						src="https://i.ibb.co/TKHN7sX/2022-01-07-224948.png"
						alt="" id="bigImg">
					<p>
						<mark>유지우</mark>
					</p>
				</div>
				<div class="left content about-detail-content">
				<p>파이널 프로젝트를 진행하면서 마음대로 되지 않아서</p> 
				<p>힘들고 지칠때도 있었지만</p> 
				<p>다들 열심히 하시는 모습에 많이 배웠던 것 같아요!!</p> 
				<p>앞으로도 게을리 하지 않고 공부해서</p>
				<p> 좋은 개발자로 성장해나가고 싶습니다.</p> 
				<p>다들 주말, 공휴일 반납해가면서 프로젝트하느라 너무 수고하셨고</p> 
				<p>좋은직장에 취직해서 만났으면 좋겠습니다.  화이팅🥰🥰</p> 
				
				</div>
			</div>

			<div class="aboutdetail leftbox" id="lyh">
				<input type="hidden" value="" class="input-val" />
				<div class="left image">
					<img
						src="https://i.ibb.co/zFPDML6/Kakao-Talk-20220108-115342250.jpg"
						alt="" id="bigImg">
					<p>
						<mark>이윤희</mark>
					</p>
				</div>
				<div class="left content about-detail-content">Lorem ipsum
					dolor sit amet, consectetur adipisicing elit. Officia dignissimos
					rem sequi amet necessitatibus nostrum enim. Incidunt iste
					reprehenderit nostrum asperiores fugiat blanditiis delectus
					voluptate qui sequi sed. Voluptatibus harum.</div>
			</div>

			</div>


			<div class="aboutdetail rightouter">

				<div class="aboutdetail rightinner" name="멤버1" id="member1">
					<img
						src="https://i.ibb.co/L1pCTTN/tmp-1613290479805.jpg"
						alt="">
					<button type="button" class="rightBtn" data-member="ygh">유광현</button>
				</div>

				<div class="aboutdetail rightinner" id="member1">
					<img
						src="https://i.ibb.co/bsF7PgZ/LeeJP.png"
						alt="">
					<button type="button" class="rightBtn" data-member="ljp">이진표</button>
				</div>

				<div class="aboutdetail rightinner">
					<img
						src="https://i.ibb.co/Pj7sHTX/goo.gif"
						alt="">
					<button type="button" class="rightBtn" data-member="kgj">강구진</button>
				</div>

				<div class="aboutdetail rightinner">
					<img
						src="https://i.ibb.co/W0gmXdB/image.png"
						alt="">
					<button type="button" class="rightBtn"data-member="keh">김은희</button>
				</div>

				<div class="aboutdetail rightinner">
					<img
						src="https://i.ibb.co/pXFVSyV/22.png"
						alt="">
					<button type="button" class="rightBtn" data-member="bjy">백지영</button>
				</div>

				<div class="aboutdetail rightinner">
					<img
						src="https://i.ibb.co/TKHN7sX/2022-01-07-224948.png"
						alt="">
					<button type="button" class="rightBtn" data-member="yjw">유지우</button>
				</div>

				<div class="aboutdetail rightinner">
					<img
						src="https://i.ibb.co/zFPDML6/Kakao-Talk-20220108-115342250.jpg"
						alt="">
					<button type="button" class="rightBtn" data-member="lyh">이윤희</button>
				</div>


			</div>

		</div>
	</div>


</section>
<script>
$(".rightBtn").click((e)=>{
	var member = $(e.target).data("member");
	var target = "#"+member;
	$(target).addClass("active").siblings().removeClass("active");

});
window.addEventListener("load", function(){
    $('body').sakura();
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
