<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>${param.title}</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://kit.fontawesome.com/76afde4c0b.js" crossorigin="anonymous"></script>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- Favicon-->
<!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/css/index.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!--구글로그인 API  -->
 <meta name ="google-signin-client_id" content="611668923155-aqcahiheiq1rb5jijp442dgdgoicbe5j.apps.googleusercontent.com">

<c:if test="${not empty msg}">
<script>
	alert("${msg}");
</script>
</c:if>
<!-- Failed to load resource: the server responded with a status of 404 () 오류 해결용 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<style>
.headerBtnText{
	font-size: ;
}
</style>

</head>
    <body>
        <header class="header"style="box-shadow: 12px -7px 22px #ccc; margin-bottom: 50px; font-family: 'SBAggroB'; font-size: 20px; disflex:fixed;">
            <!-- Responsive navbar-->
            <nav class="navbar navbar-expand-lg">
                <div class="container" id="headerContainer">
                    <div id="navbar">
                        <div class="nav-logo">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath }/resources/images/cosmoslogo_black.png" class="nav-logo-img" alt="">
                            </a>
                        </div>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mb-2 mb-lg-0" style="margin-left:20px;">
                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/group/groupSearch.do">Search</a></li>
                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/main/qa.do">문의사항</a></li>
                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/main/noticeList.do">공지사항</a></li>
                            </ul>
                        </div>
                    </div>
                <div id="login-form-div">
                  
                    <div class="card-body">
                        <div class="login-form">
                            <%-- 로그인하지 않았을때 --%>
			 				<sec:authorize access="isAnonymous()">
	                            <button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/member/memberLogin.do';">로그인</button>
	                            <button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/member/memberAPIEnroll.do';">회원가입</button>
							</sec:authorize>
						    <%-- 로그인했을때 --%>
						    <sec:authorize access="isAuthenticated()">
						    	<sec:authentication property="principal" var="loginMember"/>
							    	
							    	<div class="btn-group">

							    		<img  id="header-profile" src="" alt="" style="width: 40px"/>	
									  <button type="button" class="btn btn-outline-info dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="border: 0px">
										
									    ${not empty loginMember.nickname ? loginMember.nickname : loginMember.memberName }
									    <input type="hidden" id="loginMemberId" value="${loginMember.id }" />
									  </button>
									  
						    <sec:authorize access="hasRole('ADMIN')">
									  <ul class="dropdown-menu">
						    	
						    	
						    			<li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/main.do" style="color: black; font-size:14px; ">사이트관리</a></li>
							    		<li><hr class="dropdown-divider"></li>
									    <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/memberUpdate.do" style="color: black; font-size:14px; ">내 정보 수정</a></li>
									  </ul>
													    	
						    	
						    </sec:authorize>
						    			<ul class="dropdown-menu">
						    	
							    	
							    			<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberGroupList.do" style="color: black; font-size:14px;">가입한 그룹</a></li>
										    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberGroupList.do" style="color: black; font-size:14px; ">가입신청그룹</a></li>
										    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberGroupList.do" style="color: black; font-size:14px; ">관심 그룹</a></li>
								    						    	
							    	
							    
										    
										    <li><hr class="dropdown-divider"></li>
										    <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/memberUpdate.do" style="color: black; font-size:14px; ">내 정보 수정</a></li>
									  </ul>
									</div>
						    		<span class="fs-6 ">님 안녕하세요.</span>
						    	<form:form method="POST" action="${pageContext.request.contextPath}/member/memberLogout.do" id="memberLogoutFrm" class="d-inline">
						    	<button 
							    	class="btn btn-outline-success " 
							    	type="submit" style="border: none;font-size: 10px;transform: translate(10px, 3px);">로그아웃
							    </button>
						    	</form:form>
						    <script>
						    	var id = $(loginMemberId).val();
						    		$.ajax({
						    	         type:"post",
						    	         url:"${pageContext.request.contextPath}/member/profileCheck.do",
						    	         data:{id: id},
						    	         headers: {
						    					"${_csrf.headerName}" : "${_csrf.token}"
						    			 },
						    	         success(res){
						    				 console.log(res);
						    				 if(/^http/.test(res)){
						    					 $("#header-profile").attr('src', `\${res}`)				
						    				 }else{
						    					 
												$("#header-profile").attr('src', `${pageContext.request.contextPath}/resources/upFile/profile/\${res}`)						    					
						    				 }
						    			},
						    			error:console.log
						    	     });
								
						    </script>
						   </sec:authorize>		
						  		                        
                            
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </header>

