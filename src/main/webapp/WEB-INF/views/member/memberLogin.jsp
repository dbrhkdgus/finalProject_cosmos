<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/styles.css" />
<script>
<c:if test="${not empty msg}">
alert("${msg}");
</c:if>

$(() => {
	$(loginModal)
		.modal()
		.on("hide.bs.modal", (e) => {
			location.href = '${empty header.referer ? pageContext.request.contextPath : header.referer}';
		});
		
});

</script>
</head>
<body>
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog align-middle"
			style="width: 22rem;">
			<div class="modal-content" style="margin-top: 10px;">
			<div class="float-right">
				<button type="button" class="close pull-right float-right"
					data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
				<h2 class="modal-title text-center" style="color: #113366;">COSMOS</h2>
			
			<div class="modal-body">
				<form name="loginForm" class="form-signin" method="POST"
					onSubmit="${pageContext.request.contextPath}/member/memberLogin.do">
					<h5 class="form-signin-heading text-center">로그인</h5>
					<label for="inputEmail" class="sr-only">Your ID</label>
					<input type="text" id="uid" class="form-control" placeholder="Your ID" required autofocus name="id"><BR>
						<label for="inputPassword" class="sr-only">Password</label>
						<input type="password" id="upw" class="form-control" placeholder="Password" name="password" required ><br>
					<div class="checkbox">
						<label> <input type="checkbox" value="remember-me">
							기억하기
						</label>
					</div>
					<div class="mx-auto d-block">
						<button id="btn-Yes" class="btn btn-lg btn-outline-success btn-block" type="button" style="color: #04CF5C;">NAVER login</button>
						<button id="btn-Yes" class="btn btn-lg btn-outline-warning btn-block" type="button">카카오 login</button>
						<button id="btn-Yes" class="btn btn-lg btn-outline-primary btn-block" type="button" style="color: #000000;">google login</button>
						<button id="btn_Yes_Basic" class="btn btn-lg btn-outline-info btn-block" type="button" style=" font-weight: bold; background: linear-gradient(to right top, #000BA9, #52E3FF); color: transparent; -webkit-background-clip: text; margin-bottom: 3%;">COSMOS login</button>
					<div class="float-right">
						<button id="btn-Yes" class="btn btn-lg btn-outline-primary" type="button">회원가입</button>
						<button id="btn-Yes" class="btn btn-lg btn-outline-secondary" type="button">취소</button>
					</div>
					</div>
				</form>

			</div>
			</div>
		</div>
	</div>
	<div class="modal"></div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
		
	
	<script>
	$(btn_Yes_Basic).click((e)=>{
		console.log("로그인 버튼 클릭!");
		$("[name=loginForm]").submit();
		
	});
	
	</script>
</body>
</html>

