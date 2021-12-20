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

	<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>


</head>

		
	<main class="my-form">
		
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">소셜계정 추가 정보입력</div>
					<div class="card-body">
							<div class="API-enroll-form">
							<h2>추가 정보 입력</h2>
							<h3>소셜 계정 연결이 완료되었습니다.아래 추가정보를 입력해 주세요</h2>
							</div>
							<form 
							name="memberAPIEnrollFrm" 
							action="${pageContext.request.contextPath}/member/memberAPImoreInfoEnroll.do" 
							method="post"
							onsubmit="">	
								<div class="form-group row">
								<label for="permanent_address"
									class="col-md-3 col-form-label text-md-right">이름</label>
								<div class="col-md-6 group-text-input">
									<input type="text" id="name" class="form-control"
										name="name" placeholder="${kakaoMember.memberName}"
										value="${kakaoMember.memberName}">
								</div>
							</div>

							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-3 col-form-label text-md-right">닉네임</label>
								<div class="col-md-6 group-text-input">
									<input type="text" id="nickname" class="form-control"
										name="permanent-address" placeholder="선택사항입니다">
								</div>
							</div>

							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-3 col-form-label text-md-right">이메일</label>
								<div class="col-md-6 group-text-input">
									<div class="input-group mb-3">
										<input type="text" class="form-control" 
											aria-label="Username" required="required" name="emailId" id="emailId">
											 <span class="input-group-text">@</span>
										<input type="text" class="form-control" 
											aria-label="Server" required="required" name="email-server" id="emailServer">
									</div>
								</div>
								<p class="required" style="width: 185px; color:#666; font-size: 14px; line-height: 35px;">필수입력 항목입니다</p>
								<div id="errMsg" style="color: red; font-size: 14px;text-align: center; margin-left: 100px;"></div>								
							</div>

							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-3 col-form-label text-md-right">연락처</label>
								<div class="col-md-6 group-text-input" required="required" >
									<input type="text" id="phone" class="form-control"
										name="phone" placeholder="'-'을 제외한 숫자만 입력해주세요.">
								</div>
								<p class="required" style="width: 185px; color:#666; font-size: 14px; line-height: 35px;">필수입력 항목입니다</p>
								<div id="errMsg" style="color: red; font-size: 14px;text-align: center; margin-left: 100px;"></div>								
							</div>



							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-3 col-form-label text-md-right">성별</label>
								<div class="col-md-6 group-text-input gender-radio">
									<div class="form-check">
											
										<input class="form-check-input" type="radio"
											name="gender" id="flexRadioDefault1"
											value="F"
											<c:if test="${kakaoMember.memberGender eq 'F'}">checked</c:if>> 
											<label
											class="form-check-label" for="flexRadioDefault1"> 여성
											
										</label>
										
									</div>

									<div class="form-check">
										<input class="form-check-input" type="radio"
										value="M"
										<c:if test="${kakaoMember.memberGender eq 'M'}">checked</c:if>
											name="gender" id="flexRadioDefault1"> <label
											class="form-check-label" for="flexRadioDefault1"
											> 남성
										</label>
									</div>
								</div>
							</div>


							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-3 col-form-label text-md-right">생년월일</label>
							<div class="col-md-6 group-text-input d-flex">
							<select id="birthYear" name="birthYear" class="form-control" required="required" >
								<option value="">년</option>
								<c:forEach var="i" begin="1950" end="2022">
								    <option value="${i}">${i}</option>
								</c:forEach>
								</select>
								
								<select id="birthMonth" name="birthMonth" class="form-control" required="required">
								<option value="">월</option>
								<c:forEach var="i" begin="1" end="12">
								<option  value="<fmt:formatNumber value='${i}' pattern="00" />" ${i eq fn:substring(_birthDay,0,2)? "selected" : ""}><fmt:formatNumber value='${i}' pattern="00"/></option>								</c:forEach>
								</select>
								 
								<select id="birthDate" name="birthDate" class="form-control" required="required">
								<option value="">일</option>
								<c:forEach var="i" begin="1" end="31">
								    <option  value="<fmt:formatNumber value='${i}' pattern="00" />" ${i eq fn:substring(_birthDay,2,4)? "selected" : ""}><fmt:formatNumber value='${i}' pattern="00"/></option>
								</c:forEach>
								</select>
								</div>
								<p class="required" style="width: 185px; color:#666; font-size: 14px; line-height: 35px;">필수입력 항목입니다</p>
							</div>
							
							
						 
							<div class="form-group row">
								<label for="full_name"
									class="col-md-3 col-form-label text-md-right">직업</label>
								<div class="col-md-6 group-text-input">
									<select class="form-select" aria-label="Default select example" name="job">
										<option selected  value=null>직업선택</option>
										<option value="개발자">개발자</option>
										<option value="학생">학생</option>
										<option value="직장인">직장인</option>
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
		
		
	<script>
	document.memberAPIEnrollFrm.onsubmit = e => {
	 
	  var phone_rule =  /^[0-9]/g;
	  var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  var email_id = $("#emailId").val();
	  var email_server =$("#emailServer").val();
	  var phone =$("#phone").val();
	  var mail ="";
	 
	 
	  if(!phone){
	      alert("연락처를 입력해주세요");
	    $("#phone").focus();
	    return false;
	  }
	  if(!email_id){
	      alert("이메일을 입력해주세요");
	    $("#emailId").focus();
	    return false;
	  }
	  if(!email_server){
	      alert("도메인을 입력해주세요");
	    $("#emailServer").focus();
	    return false;
	  }
	  
	  mail = email_id+"@"+email_server;
	  $("#mail").val(mail);  
	  
	  if(!email_rule.test(mail)){
	      alert("이메일을 형식에 맞게 입력해주세요.");
	    return false;
	  }

	  if(!phone_rule.test(phone)){
	      alert("연락처는 숫자만 입력가능합니다.");
	    return false;
	  }
	  
	 
	}
	</script>

</main>
	
</html>

