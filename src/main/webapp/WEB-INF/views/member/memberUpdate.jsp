<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>


<main class="my-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">회원 정보수정</div>
					<div class="card-body">
						<form:form name="memberUpdateFrm" method="POST" action="${pageContext.request.contextPath }/member/memberUpdate.do?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
							<div class="form-group row profile-box" style="display: flex; justify-content: center; margin: 45px; position: relative;">
								<c:if test="${not empty profile }">
									<c:choose>
										<c:when test="${fn:startsWith(profile.renamedFilename,'http')}">
											<img id="profile" src="${profile.renamedFilename}" alt="" style="width: 150px"/>
										</c:when>
										<c:otherwise>
											<img id="profile" src="${pageContext.request.contextPath }/resources/upFile/profile/${profile.renamedFilename}" alt="" style="width: 150px"/>
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${empty profile }">
									<img id="profile" src="https://cdn-icons-png.flaticon.com/512/64/64572.png" alt="" style="width: 150px"	/>
								</c:if>
								<div class="deleteProfile">
									<span data-tooltip-text="기본 프로필 이미지로 설정합니다.">x</span>								
								</div>
								
							</div>
							
							<c:if test="${not fn:startsWith(profile.renamedFilename,'http')}">
								<div class="form-group row">
										<label for="phone_number"
											class="col-md-4 col-form-label text-md-right">프로필 이미지</label>
										<div class="col-md-6 group-text-input">
											<input class="form-control" type="file" id="upFile" name="upFile" accept=".jpg,.jpeg,.png,.gif,.bmp">
										</div>
								</div>
								
								<div class="form-group row">
									<label for="full_name"
										class="col-md-4 col-form-label text-md-right">아이디</label>
									<div class="col-md-6 group-text-input">
										<input type="text" id="member-id" class="form-control"
											name="id" value="${loginMember.id }" readonly="readonly">
									</div>
								</div>
	
	
								<div class="form-group row curr-pwd-box">
									<label for="present_address"
										class="col-md-4 col-form-label text-md-right">현재 비밀번호</label>
									<div class="col-md-6 group-text-input">
										<input type="password"  class="form-control" name="currpassword" placeholder="비밀번호를 변경 또는 회원탈퇴를 하려면 현재 비밀번호를 입력하세요." >
									</div>
								</div>
								
								<div class="form-group row new-pwd-box">
									<label for="present_address"
										class="col-md-4 col-form-label text-md-right">새로운 비밀번호</label>
									<div class="col-md-6 group-text-input">
										<input type="password" id="password" class="form-control" name="password" value="">
									</div>
								</div>
	
	
								<div class="form-group row new-pwd-box">
									<label for="present_address"
										class="col-md-4 col-form-label text-md-right">비밀번호 확인</label>
									<div class="col-md-6 group-text-input">
										<input type="password" id="passwordCheck" class="form-control">
									</div>
								</div>

							</c:if>
							<c:if test="${fn:startsWith(profile.renamedFilename,'http')}">
							<input type="hidden" name="id" value="${loginMember.id }" />
							<input type="hidden" name="password" value="" />
							<input class="form-control" type="file" id="upFile" name="upFile" accept=".jpg,.jpeg,.png,.gif,.bmp" style="display: none;">
							</c:if>
							
							
							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">이름</label>
								<div class="col-md-6 group-text-input">
									<input type="text" id="name" class="form-control"
										name="memberName" value="${loginMember.memberName }">
								</div>
							</div>

							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">닉네임</label>
								<div class="col-md-6 group-text-input">
									<input type="text" id="nickname" class="form-control"
										name="nickname" value="${loginMember.nickname}">
								</div>
							</div>

							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">이메일</label>
								<div class="col-md-6 group-text-input">
									<div class="input-group mb-3">
										<input type="text" class="form-control" 
											aria-label="Username" required="required" name="emailId" id="emailId" value="${fn:substringBefore(loginMember.memberEmail, '@')}">
											 <span class="input-group-text">@</span>
										<input type="text" class="form-control" 
											aria-label="Server" required="required" name="email-server" id="emailServer" value="${fn:substringAfter(loginMember.memberEmail, '@')}">
										<input type="hidden" id="memberEmail" name="memberEmail"/>
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
											name="memberGender" id="flexRadioDefault2" value="F"> <label
											class="form-check-label" for="flexRadioDefault2" > 여성
										</label>
									</div>

									<div class="form-check">
										<input class="form-check-input" type="radio"
											name="memberGender" id="flexRadioDefault1" value="M" checked="checked"> <label
											class="form-check-label" for="flexRadioDefault1"> 남성
										</label>
									</div>
								</div>
							</div>


							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">생년월일</label>
								<div class="col-md-6 group-text-input">
									<input type="date" id="birthday" class="form-control"
										name="birthday" value="1999-01-01">
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


							<div class="col-md-6 offset-md-4 group-create-button" style="justify-content: space-around;">
								<button type="submit" class="btn btn-primary">정보수정</button>
								<button id="delete-member" type="button" class="btn btn-primary">회원탈퇴</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<script>
$(".deleteProfile").click((e)=>{
	if(confirm("기본 프로필로 바꾸시겠습니까?")){
		
		let data ={
				id:$("input[name=id]").val()
			};
		console.log(JSON.stringify(data));
			$.ajax({
		         type:"get",
		         url:"${pageContext.request.contextPath}/member/setDefaultImg.do",
		         data:{
		        	 id:$("input[name=id]").val()
		         },
		         headers: {
						"${_csrf.headerName}" : "${_csrf.token}"
				 },
		         success(res){
						
						location.reload();
				},
				error:console.log
		     });
	}
});
$(upFile).change(function(){
    setImageFromFile(this, '#profile');
    upFile = $(upFile).val();
});

function setImageFromFile(input, expression) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(expression).attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    };
};

$(".new-pwd-box").hide();
$("#delete-member").hide();
$("input[name=currpassword]").blur((e)=>{
	let data ={
		id : $("input[name=id]").val(),
		password : $(e.target).val()
	};

	
	$.ajax({
         type:"post",
         url:"${pageContext.request.contextPath}/member/pwdCheck.do",
         data:JSON.stringify(data), //object -> json
         contentType:"application/json; charset=utf-8",
         dataType:"json",
         headers: {
				"${_csrf.headerName}" : "${_csrf.token}"
		 },
         success(res){
				console.log(res);
				if(res){
					$(".new-pwd-box").show();
					$("#delete-member").show();
					$("input[name=currpassword]").attr('readonly',true);
				}else{
					
				}
		},
		error:console.log
     });
	
	
});

$("#passwordCheck").blur(function(){
	var $password = $("#password"),
	$passwordCheck = $("#passwordCheck");
	if($password.val() != $passwordCheck.val()){
		alert("패스워드가 일치하지 않습니다.");
		$password.select();
	}
});
/* 회원 탈퇴 */
$("#delete-member").click((e)=>{
	if(confirm("코스모스에서 모든 회원 정보가 삭제됩니다. 탈퇴하시겠습니까?")){
		
		$.ajax({
			url : "${pageContext.request.contextPath}/member/deleteMember.do",
			method : "post",
			data : {
				id : "${loginMember.id }"
			},
			headers: {
				"${_csrf.headerName}" : "${_csrf.token}"
			 },
			success(res){
				 if(res > 0){
					alert("회원 탈퇴처리 되었습니다.");
					location.href = "${pageContext.request.contextPath}/";					 
				 }
				
			},
			error : console.log
		});
	}
});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
