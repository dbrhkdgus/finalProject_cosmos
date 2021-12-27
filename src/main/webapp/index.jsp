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
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>
		<!-- Page content-->
<div id="main-box" class="container">
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
					<li class="popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=2">웹개발</a></li>
					<li class="popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=3">프론트</a></li>
					<li class="popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=4">백엔드</a></li>
					<li class="popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=1">풀스택</a></li>
					<li class="popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=5">모바일 앱 개발</a></li>
					<li class="popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=6">프로그래밍 언어</a></li>
					<li class="popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=7">알고리즘</a></li>
					<li class="popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=8">데이터베이스</a></li>
					<li class="popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=9">게임개발</a></li>
					
				</ul>
				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" style="display:flex; margin-left:10px;">
	          		<input type="search" class="form-control form-control-dark" placeholder="찾고있는 스터디그룹을 검색해보세요!" aria-label="Search">
	          		<button type="button" class="btn btn-info" style="margin-left:10px; background-color:#2458BF ; color:white;"><i class="fas fa-search"></i></button>
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
					<li class="login-popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=2">웹개발</a></li>
					<li class="login-popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=3">프론트</a></li>
					<li class="login-popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=4">백엔드</a></li>
					<li class="login-popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=1">풀스택</a></li>
					<li class="login-popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=5">모바일 앱 개발</a></li>
					<li class="login-popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=6">프로그래밍 언어</a></li>
					<li class="login-popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=7">알고리즘</a></li>
					<li class="login-popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=8">데이터베이스</a></li>
					<li class="login-popular"><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=9">게임개발</a></li>
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
				<div class="index-member-group d-flex justify-content-around">

				<form action="${pageContext.request.contextPath}/member/memberGroupList.do">
				<button>신청 그룹</button>
				<input type="hidden" value="application-group" name="type">
				</form>
				
				<form action="${pageContext.request.contextPath}/member/memberGroupList.do">
				<button>가입 그룹</button>
				<input type="hidden" value="join-group" name="type">
				</form>

				<form action="${pageContext.request.contextPath}/member/memberGroupList.do">
				<button>관심 그룹</button>
				<input type="hidden" value="liked-group" name="type">
				</form>
				

				 
				</div>
			</div>
		</div>
		</sec:authorize>
			
		
		<!-- Categories widget-->
	</div>
		
	<hr />

	<h2>BEST</h2>
	<div id="best-box" class="index-group-list" style="height: 430px;">


		
		
		
		
		


	</div>
	<br />
	<hr />
	<h2>NEW</h2>
		<div id="new-box" class="index-group-list" style="height: 430px;">

		
	
		
	

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
var script = document.createElement("script");
script.innerHTML = 
	"$(document).ready(function(){$('.single-item').slick(); $('.index-group-list').slick({ slidesToShow: 3,	slidesToScroll: 1});});";


window.addEventListener("load", function(){
	$.ajax({
		url:"<%= request.getContextPath() %>/main/mainStudyGroupInfo.do",
		method: "GET",
		data: {groupSelectType: "best"},
		dataType: "json",
		success(data){
			$.each(data, (k,v)=>{
				console.log(data);
				$("#best-box").append(`
						<div class="card mb-4 search-card" style="width: 350px; height: 420px;">
	                        <a href="${pageContext.request.contextPath}/group/groupDetail.do?groupNo=\${v.groupNo}">
	                            	<img class="card-img-top" 
	                            	style = "width: 410px; height: 250px;"
	                            	src="${pageContext.request.contextPath }/resources/upFile/group/\${v.renamedFilename}"
	                                    alt="..." />
	                        </a>
	                        <div class="index-group-card-body card-body mb-0" style="height:150px">
	                            <div class="small text-muted d-flex justify-content-between align-items-center">
		                            <div>
		                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-circle-fill" viewBox="0 0 16 16">
										  <circle cx="8" cy="8" r="8"/>
										</svg>
		                                <span>
		                                모집중(\${v.numOfMember}/\${v.groupPool})
		                                </span>
	                        		</div>
	                        		<div>
                    					<p class="card-text">\${v.category1Name}</p>
                    					
                    				</div>
	                            </div>
	                            
	                            <h2 class="card-title h4" style="margin: 0.2rem 0 0.2rem 0;">\${v.groupName}</h2>
                            	<p class="card-text" style="margin-bottom: 5px;">\${v.giTitle }</p>
	                        	<p class="card-text" style="margin-bottom: 5px;">\${v.category2Name}</p>
	                        
	                        <div class="search-inner-button">
	                        <!--좋아요 기능구현 해보는중  -->
		                        <div class="like-button-outer">
			                       <sec:authorize access="isAnonymous()">
			                           		<i class="far fa-heart"  data-group-no="\${v.groupNo}"><span>\${v.groupLikeCount}</span></i>
			                       </sec:authorize>
			                         <sec:authorize access="isAuthenticated()">
			                         		${v.bool eq "true"}
			                         		console.log(${v.bool eq "true"})
			                         		<c:if test="\${\${v.bool} eq true}"> 
			                           			<i class="fas fa-heart"  data-group-no="\${v.groupNo}"><span>\${v.groupLikeCount}</span></i>
			                         		</c:if>
			                         		<c:if test="\${\${v.bool} eq false}"> 
			                         			<i class="far fa-heart"  data-group-no="\${v.groupNo}"><span>\${v.groupLikeCount}</span></i>
			                         		</c:if>
			                         		\${v.bool==true}
			                         		<c:choose>
			                         			<c:when test="${v.bool==true}">
			                         				<i class="fas fa-heart"  data-group-no="\${v.groupNo}"><span>\${v.groupLikeCount}</span></i>
			                         			</c:when>
			                         			<c:otherwise>
			                         				<i class="far fa-heart"  data-group-no="\${v.groupNo}"><span>\${v.groupLikeCount}</span></i>
			                         			</c:otherwise>
			                         		</c:choose>
			                         		
			                         		
>>>>>>> branch 'master' of https://github.com/dbrhkdgus/finalProject_cosmos.git
			                         </sec:authorize>
			                     </div>
                        	</div>
	                     </div>
	                   </div>
					
	                    
						`);
			});

			
		},
		error(xhr,textStatus,err){
			console.log(xhr,textStatus,err);
		}
	});
});
window.addEventListener("load", function(){
	$.ajax({
		url:"<%= request.getContextPath() %>/main/mainStudyGroupInfo.do",
		method: "GET",
		data: {groupSelectType: "new"},
		dataType: "json",
		success(data){
			$.each(data, (k,v)=>{
				$("#new-box").append(`
						<div class="card mb-4 search-card" style="width: 350px; height: 420px;">
	                        <a href="${pageContext.request.contextPath}/group/groupDetail.do?groupNo=\${v.groupNo}">
	                            	<img class="card-img-top" 
	                            	style = "width: 410px; height: 250px;"
	                            	src="${pageContext.request.contextPath }/resources/upFile/group/\${v.renamedFilename}"
	                                    alt="..." />
	                        </a>
	                        <div class="index-group-card-body card-body mb-0" style="height:150px">
	                            <div class="small text-muted d-flex justify-content-between align-items-center">
		                            <div>
		                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-circle-fill" viewBox="0 0 16 16">
										  <circle cx="8" cy="8" r="8"/>
										</svg>
		                                <span>
		                                모집중(\${v.numOfMember}/\${v.groupPool})
		                                </span>
	                        		</div>
	                        		<div>
	                					<p class="card-text">\${v.category1Name}</p>
	                				</div>
	                            </div>
	                            <h2 class="card-title h4" style="margin: 0.2rem 0 0.2rem 0;">\${v.groupName}</h2>
                            	<p class="card-text" style="margin-bottom: 5px;">\${v.giTitle }</p>
                            	<p class="card-text" style="margin-bottom: 5px;">\${v.category2Name}</p>
    	                        
    	                        <div class="search-inner-button">
    	                        <!--좋아요 기능구현 해보는중  -->
    		                        <div class="like-button-outer">
    			                       <sec:authorize access="isAnonymous()">
    			                           		<i class="far fa-heart"  data-group-no="\${v.groupNo}"><span>\${v.groupLikeCount}</span></i>
    			                       </sec:authorize>
    			                         <sec:authorize access="isAuthenticated()">
    			                         		<c:choose>
    			                         			<c:when test="\${v.bool == true}">
    			                         				<i class="fas fa-heart"  data-group-no="\${v.groupNo}"><span>\${v.groupLikeCount}</span></i>
    			                         			</c:when>
    			                         			<c:otherwise>
    			                         				<i class="far fa-heart"  data-group-no="\${v.groupNo}"><span>\${v.groupLikeCount}</span></i>
    			                         			</c:otherwise>
    			                         		</c:choose>
    			                         		
    			                         		
    			                         </sec:authorize>
    			                     </div>
                            	</div>
    	                     </div>
    	                   </div>
					
						`);
			});
			$("#main-box").append(script); 
			
		},
		error(xhr,textStatus,err){
			console.log(xhr,textStatus,err);
		}
	});
});


</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
