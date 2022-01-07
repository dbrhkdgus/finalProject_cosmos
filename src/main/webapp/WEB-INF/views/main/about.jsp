<%@ page language="java" contentType="text/html; charset=UTF-8"
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




				<div class="aboutdetail leftbox active ">
					<input type="hidden" value="" class="input-val" />
					<div class="left image ">
						<img
							src="${pageContext.request.contextPath }/resources/images/facebook.png"
							alt="" id="bigImg">
						<p>
							<mark>멤버1</mark>
						</p>
					</div>
					<div class="left content about-detail-content">Lorem ipsum
						dolor sit amet, consectetur adipisicing elit. Officia dignissimos
						rem sequi amet necessitatibus nostrum enim. Incidunt iste
						reprehenderit nostrum asperiores fugiat blanditiis delectus
						voluptate qui sequi sed. Voluptatibus harum.</div>
				</div>




				<div class="aboutdetail leftbox">
					<input type="hidden" value="" class="input-val" />
					<div class="left image">
						<img
							src="${pageContext.request.contextPath }/resources/images/github.png"
							alt="" id="bigImg">
						<p>
							<mark>멤버2</mark>
						</p>
					</div>
					<div class="left content about-detail-content">Lorem ipsum
						dolor sit amet, consectetur adipisicing elit. Officia dignissimos
						rem sequi amet necessitatibus nostrum enim. Incidunt iste
						reprehenderit nostrum asperiores fugiat blanditiis delectus
						voluptate qui sequi sed. Voluptatibus harum.</div>
				</div>


				<div class="aboutdetail leftbox">
					<div class="left image">
						<input type="hidden" value="" class="input-val" /> <img
							src="${pageContext.request.contextPath }/resources/images/facebook.png"
							alt="" id="bigImg">
						<p>
							<mark>멤버3</mark>
						</p>
					</div>
					<div class="left content about-detail-content">Lorem ipsum
						dolor sit amet, consectetur adipisicing elit. Officia dignissimos
						rem sequi amet necessitatibus nostrum enim. Incidunt iste
						reprehenderit nostrum asperiores fugiat blanditiis delectus
						voluptate qui sequi sed. Voluptatibus harum.</div>
				</div>

			</div>
			<div class="aboutdetail leftbox">
				<input type="hidden" value="" class="input-val" />
				<div class="left image">
					<img
						src="${pageContext.request.contextPath }/resources/images/github.png"
						alt="" id="bigImg">
					<p>
						<mark>멤버4</mark>
					</p>
				</div>
				<div class="left content about-detail-content">Lorem ipsum
					dolor sit amet, consectetur adipisicing elit. Officia dignissimos
					rem sequi amet necessitatibus nostrum enim. Incidunt iste
					reprehenderit nostrum asperiores fugiat blanditiis delectus
					voluptate qui sequi sed. Voluptatibus harum.</div>
			</div>

			<div class="aboutdetail leftbox">
				<input type="hidden" value="" class="input-val" />
				<div class="left image">
					<img
						src="${pageContext.request.contextPath }/resources/images/facebook.png"
						alt="" id="bigImg">
					<p>
						<mark>멤버5</mark>
					</p>
				</div>
				<div class="left content about-detail-content">Lorem ipsum
					dolor sit amet, consectetur adipisicing elit. Officia dignissimos
					rem sequi amet necessitatibus nostrum enim. Incidunt iste
					reprehenderit nostrum asperiores fugiat blanditiis delectus
					voluptate qui sequi sed. Voluptatibus harum.</div>
			</div>

			<div class="aboutdetail leftbox">
				<input type="hidden" value="" class="input-val" />
				<div class="left image">
					<img
						src="${pageContext.request.contextPath }/resources/images/github.png"
						alt="" id="bigImg">
					<p>
						<mark>멤버6</mark>
					</p>
				</div>
				<div class="left content about-detail-content">Lorem ipsum
					dolor sit amet, consectetur adipisicing elit. Officia dignissimos
					rem sequi amet necessitatibus nostrum enim. Incidunt iste
					reprehenderit nostrum asperiores fugiat blanditiis delectus
					voluptate qui sequi sed. Voluptatibus harum.</div>
			</div>

			<div class="aboutdetail leftbox">
				<input type="hidden" value="" class="input-val" />
				<div class="left image">
					<img
						src="${pageContext.request.contextPath }/resources/images/facebook.png"
						alt="" id="bigImg">
					<p>
						<mark>멤버7</mark>
					</p>
				</div>
				<div class="left content about-detail-content">Lorem ipsum
					dolor sit amet, consectetur adipisicing elit. Officia dignissimos
					rem sequi amet necessitatibus nostrum enim. Incidunt iste
					reprehenderit nostrum asperiores fugiat blanditiis delectus
					voluptate qui sequi sed. Voluptatibus harum.</div>
			</div>



			<div class="aboutdetail rightouter">

				<div class="aboutdetail rightinner" name="멤버1" id="member1">
					<img
						src="https://i.ibb.co/L1pCTTN/tmp-1613290479805.jpg"
						alt="">
					<button type="button" class="rightBtn">멤버1</button>
				</div>

				<div class="aboutdetail rightinner" id="member1">
					<img
						src="https://i.ibb.co/bsF7PgZ/LeeJP.png"
						alt="">
					<button type="button" class="rightBtn">멤버2</button>
				</div>

				<div class="aboutdetail rightinner">
					<img
						src="https://i.ibb.co/Pj7sHTX/goo.gif"
						alt="">
					<button type="button" class="rightBtn">멤버3</button>
				</div>

				<div class="aboutdetail rightinner">
					<img
						src="https://i.ibb.co/vkrrfhm/Ke.jpg"
						alt="">
					<button type="button" class="rightBtn">멤버4</button>
				</div>

				<div class="aboutdetail rightinner">
					<img
						src="${pageContext.request.contextPath }/resources/images/facebook.png"
						alt="">
					<button type="button" class="rightBtn">멤버5</button>
				</div>

				<div class="aboutdetail rightinner">
					<img
						src="${pageContext.request.contextPath }/resources/images/github.png"
						alt="">
					<button type="button" class="rightBtn">멤버6</button>
				</div>

				<div class="aboutdetail rightinner">
					<img
						src="${pageContext.request.contextPath }/resources/images/facebook.png"
						alt="">
					<button type="button" class="rightBtn">멤버7</button>
				</div>


			</div>

		</div>
	</div>


</section>
<script>
            var i =0;
             const $name = $(".input-val").val(); 
			while(i<=5){
				if($(".input-val").eq(i).val()== $name){
					const $leftinner = $(".leftbox");
					 $leftinner.css("display" ,"none");
	                 $leftinner.eq(i).css("display","flex");
				}
            	
			i++	
			}
  
            	
            	
                 $(".rightBtn").click((e)=>{
                   const $index = $(e.target).parent().index();
                    const $leftinner = $(".leftbox");
                    $leftinner.css("display" ,"none");
                    $leftinner.eq($index).css("display","flex");

 
                });
                 
    	    
                
            
                </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
