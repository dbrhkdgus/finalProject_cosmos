<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
				<button type="button" class="btn-category" style="margin-bottom: 5%;">카테고리</button>
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
				<button type="button" class="btn-category" style="margin-bottom:5%;">카테고리</button>
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
				<div class="index-member-box">
					<img id="index-profile" src="${pageContext.request.contextPath }/resources/images/facebook.png" alt="" />					
					<div class="index-member-info">
					<a href="${pageContext.request.contextPath }/member/memberUpdate.do" ><p style="font-size: 20px;">&nbsp;<sec:authentication property="principal.memberName"/>님 </p></a>
					<form:form action="${pageContext.request.contextPath }/member/memberLogout.do" method="POST">
						<input type = "submit" id="loginOut" value="로그아웃" />
					</form:form>	
					
					
					</div>
					<div class="index-member">
						<svg id="btn-DM-modal" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16" style="cursor: pointer; color: #5288F2;">
						  <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
						</svg>
						
						<input type="hidden" class="loginMemberId" value="${loginMember.id }"/>
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
<div class="modal fade" id="gwDMModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">DM</h4>
        <button type="button" class="close close-dm-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	      <div class="dm-modal-body modal-body mx-3">
	        <div class="md-form mb-5">
	          	<div class="dm-profile-container mb-3">
	          	
		          
		        

		        </div>
		        
	        </div>
	        
	      </div>
<!-- 	       <div class="modal-body mx-3">
	       
	        <div class="modal-dm-input-box">
		
		      <div class="modal-dm-txt border-top">
		        <input id="dm-chatMessageContent" type="text" class="form-control" name="chatMessageContent">
		      </div>
		      <div class="btn-group">
		        <i class="fa fa-meh-o" aria-hidden="true"></i>
		        <button type="button" class="btn btn-white" data-original-title="" title="">
		        </button>
		          <i class="fa fa-paperclip"></i>
		      </div>
		      <button id="btn-dm-message-send" class="btn btn-danger" data-original-title="" title="">Send</button>
		      <input type="hidden" name="dm-memberId" value="" />
		      
		    </div> 
	       </div> -->

      <div class="modal-footer d-flex justify-content-center">
        <button class="btn close-dm-modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<div class="dmScript">

</div>


<sec:authorize access="isAuthenticated()">
<script>
window.addEventListener("load", function(){
	$.ajax({
		url : "${pageContext.request.contextPath }/gw/chat/newDMCheck.do",
		success(data){
			if(data > 0){
				$(".index-member").append(`<div class="notification-dot notification-pulse"></div>`);
			}
		},
		error : console.log
	
	
	});
	var mail = document.getElementById("mail-num");



});
</script>
</sec:authorize>
<script>
window.addEventListener("load", function(){
	var id = $(loginMemberId).val();
	$.ajax({
         type:"post",
         url:"${pageContext.request.contextPath}/member/profileCheck.do",
         data:{id: id},
         headers: {
				"${_csrf.headerName}" : "${_csrf.token}"
		 },
         success(res){
			// console.log(res);
			 if(/^http/.test(res)){
				 $("#index-profile").attr('src', `\${res}`)				
			 }else{
				 
				$("#index-profile").attr('src', `${pageContext.request.contextPath}/resources/upFile/profile/\${res}`)						    					
			 }
		},
		error:console.log
     });
});
</script>


<script>
/* dm modal 제어 */
$("#btn-DM-modal").click((e)=>{
	$("input[name=dm-memberId]").val($(e.target).siblings().val());
	var $memberId = $(e.target).next().val();
	console.log($memberId);
	$(".dm-profile-container").text('');
	var script = document.createElement("script");
	script.innerHTML = `
	function DMPopup(sender) {
		var $sender = sender;
        window.name = "DM";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
        openWin = window.open("${pageContext.request.contextPath}/gw/chat/DMPopup.do?sender="+$sender,
        		"childForm", "width=350, height=500, resizable = yes, scrollbars = yes"); 
		$("#gwDMModal").modal('hide');
    }
	
	`;
	script.innerHTML += 'function writeDM2(data){DMPopup(data)}';
	
//////////////////////////////////////////////////////////////////////////////////////		
	$.ajax({
		url: `${pageContext.request.contextPath}/gw/chat/indexDMList.do`,
		dataType: "json",
		success(data){
			console.log(data); 
			$.each(data, (k,v)=>{
				if(v.dmSender == $memberId){
				$(".dm-profile-container").append(``);
				}else{
				console.log(v.dmSender);
				$(".dm-profile-container").append(`
						<div class="dm-message-content-box-lv1" onclick="DMPopup('\${v.dmSender}')" style="cursor : pointer;">
					        <div class="dm-\${v.dmSender}-profile dm-user-profile">
							 

					        </div>
					        <div class="dm-message-box">
							    <div class="dm-message-sender">
									<span><strong>\${v.dmSenderNickname}</strong></span>
									<span>\${v.dmMessageAt}</span>
								</div>
							    <div class="dm-message-content">
							    	<p>\${v.dmContent}</p>
							    </div>
					        </div>
			            </div>	
						
						`);
					 if(/^http/.test(v.dmSenderProfileRenamedFilename)){
						var target = ".dm-" + v.dmSender + "-profile"
						$(target).append(`<img class="dm-user-profile-img" src="\${v.dmSenderProfileRenamedFilename}" alt="">`);
					}else{
						var target = ".dm-" + v.dmSender + "-profile"
						$(target).append(`<img class="dm-user-profile-img" src="${pageContext.request.contextPath}/resources/upFile/profile/\${v.dmSenderProfileRenamedFilename}" alt="">`);
						
					}
				}
			});
			$(".dmScript").append(script);
		},
		error: console.log
	});
	$("#gwDMModal").modal('show');
});
$(".close-dm-modal").click((e)=>{
	$(".dm-profile-container").text('');
	$("#gwDMModal").modal('hide');
	$(".notification-dot").remove();

});



///chat/chatId
//1. Stomp Client 객체 생성(websocket)

	const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
	const stompClient = Stomp.over(ws);
	
	// 2. 연결요청
	stompClient.connect({}, (frame) =>{
		console.log("Stomp Connected : ", frame);
		
	// 3. 구독요청
	stompClient.subscribe(`/dm/${loginMember.id}`, (message) =>{
		console.log("message : ", message);
		const obj = JSON.parse(message.body);
		console.log(obj);
		const {memberId, msg} = obj;
		$(".index-member").append(`<div class="notification-dot notification-pulse"></div>`);
	});
	
});

/* $(sendBtn).click((e) =>{
	const obj = {
		chatId : "${chatId}",
		memberId : "${loginMember.id}",
		msg : $(message).val(),
		logTime : Date.now()
	};
	
	stompClient.send("/app/chat/${chatId}", {}, JSON.stringify(obj));
	$(message).val(''); // #message 초기화
}); */

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
			const {numOfMember, groupPool} = data;
			$.each(data, (k,v)=>{
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
		                            <div class="best-\${v.groupNo}">
											

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
			                         		<c:if test="\${\${v.bool} eq true}"> 
			                           			<i class="fas fa-heart"  data-group-no="\${v.groupNo}"><span>\${v.groupLikeCount}</span></i>
			                         		</c:if>
			                         		<c:if test="\${\${v.bool} eq false}"> 
			                         			<i class="far fa-heart"  data-group-no="\${v.groupNo}"><span>\${v.groupLikeCount}</span></i>
			                         		</c:if>
			                         		<c:choose>
			                         			<c:when test="${v.bool==true}">
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
	 			 if(v.numOfMember == v.groupPool){
	 				var target = ".best-" + v.groupNo
				 	$(target).append(`
	                    	<svg xmlns="http://www.w3.org/2000/svg" color="red" width="10" height="10" fill="currentColor" class="bi bi-circle-fill" viewBox="0 0 16 16">
							  <circle cx="8" cy="8" r="8"/>
							</svg>
	                      <span>
	                      모집마감(\${v.numOfMember}/\${v.groupPool})
	                      </span>
							`);
				}else{
					var target = ".best-" + v.groupNo
					$(target).append(`
							<svg xmlns="http://www.w3.org/2000/svg" color="Chartreuse" width="10" height="10" fill="currentColor" class="bi bi-circle-fill" viewBox="0 0 16 16">
							  <circle cx="8" cy="8" r="8"/>
							</svg>
	                      <span>
	                  		모집중(\${v.numOfMember}/\${v.groupPool})
	                      </span>
							`);
				};
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
		                            <div class="new-\${v.groupNo}">
									
	
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
				 if(v.numOfMember == v.groupPool){
		 				var target = ".new-" + v.groupNo
					 	$(target).append(`
		                    	<svg xmlns="http://www.w3.org/2000/svg" color="red" width="10" height="10" fill="currentColor" class="bi bi-circle-fill" viewBox="0 0 16 16">
								  <circle cx="8" cy="8" r="8"/>
								</svg>
		                      <span>
		                      모집마감(\${v.numOfMember}/\${v.groupPool})
		                      </span>
								`);
					}else{
						var target = ".new-" + v.groupNo
						$(target).append(`
								<svg xmlns="http://www.w3.org/2000/svg" color="Chartreuse" width="10" height="10" fill="currentColor" class="bi bi-circle-fill" viewBox="0 0 16 16">
								  <circle cx="8" cy="8" r="8"/>
								</svg>
		                      <span>
		                  		모집중(\${v.numOfMember}/\${v.groupPool})
		                      </span>
								`);
					};
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
