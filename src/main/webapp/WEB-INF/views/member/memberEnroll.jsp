<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>

<main class="my-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">회원가입</div>
					<div class="card-body">
						<form name="memberEnrollFrm" method="POST">
							<div class="form-group row">
								<label for="full_name"
									class="col-md-4 col-form-label text-md-right">아이디</label>
								<div class="col-md-6 group-text-input">
									<input type="text" id="member-id" class="form-control"
										name="memberId" value="gogd">
								</div>
							</div>


							<div class="form-group row">
								<label for="present_address"
									class="col-md-4 col-form-label text-md-right">비밀번호</label>
								<div class="col-md-6 group-text-input">
									<input type="password" id="password" class="form-control" name="password" value="1234">
								</div>
							</div>


							<div class="form-group row">
								<label for="present_address"
									class="col-md-4 col-form-label text-md-right">비밀번호 확인</label>
								<div class="col-md-6 group-text-input">
									<input type="password" id="password" class="form-control" value="1234">
								</div>
							</div>
							
							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">이름</label>
								<div class="col-md-6 group-text-input">
									<input type="text" id="name" class="form-control"
										name="memberName" value="고길동">
								</div>
							</div>

							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">닉네임</label>
								<div class="col-md-6 group-text-input">
									<input type="text" id="nickname" class="form-control"
										name="nickname" value="고길동nick">
								</div>
							</div>

							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">이메일</label>
								<div class="col-md-6 group-text-input">
									<div class="input-group mb-3">
										<input type="text" id="email1" class="form-control" placeholder="Username"
											aria-label="Username" name="email1" value="gogd"> <span class="input-group-text">@</span>
										<input type="text" id="email2" class="form-control" placeholder="Server"
											aria-label="Server" name="email2" value="naver.com">
										<input type="hidden" name="memberEmail"/>
									</div>
								</div>
							</div>

							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">연락처</label>
								<div class="col-md-6 group-text-input">
									<input type="text" id="phone_number" class="form-control"
										name="phone" value="01011112222">
								</div>
							</div>



							<div class="form-group row">
								<label for="gender"
									class="col-md-4 col-form-label text-md-right">성별</label>
								<div class="col-md-6 group-text-input gender-radio">
									<div class="form-check">
										<input class="form-check-input" type="radio"
											name="gender" id="flexRadioDefault1"> <label
											class="form-check-label" for="flexRadioDefault1" value="F"> 여성
										</label>
									</div>

									<div class="form-check">
										<input class="form-check-input" type="radio"
											name="gender" id="flexRadioDefault1"> <label
											class="form-check-label" for="flexRadioDefault1" value="M"> 남성
										</label>
									</div>
								</div>
							</div>


							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">생년월일</label>
								<div class="col-md-6 group-text-input">
									<input type="date" id="birthday" class="form-control"
										name="birthday" value="2020-01-01">
								</div>
							</div>

							<div class="form-group row">
								<label for="full_name"
									class="col-md-4 col-form-label text-md-right">직업</label>
								<div class="col-md-6 group-text-input">
									<select class="form-select" aria-label="Default select example" name="memberJob">
										<option selected>직업</option>
										<option value="프론트 개발자" selected>프론트 개발자</option>
										<option value="백엔드 개발자">백엔드 개발자</option>
										<option value="취업 준비생">취업 준비생</option>
									</select>
								</div>
							</div>


							<div class="col-md-6 offset-md-4 group-create-button">
								<button type="submit" class="btn btn-primary">회원가입</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<script>
$("#passwordCheck").blur(function(){
	var $password = $("#password"),
	$passwordCheck = $("$passwordCheck");
	if($password.val*() != $passwordCheck.val()){
		alert("패스워드가 일치하지 않습니다.");
		$password.select();
	}
});

$("[name=memberEnrollFrm]").submit(function(){
	$("#memberEmail").val() = $("#email1")+$("#email2");
	
	var $id = $("#id");
	if(/^\w{4,}$/.test($id.val()) == false) {
		alert("아이디는 최소 4자리이상이어야 합니다.");
		$id.focus();
		return false;
	}
	
	
	
	return true;
});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
