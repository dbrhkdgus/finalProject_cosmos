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
						<form name="memberEnrollFrm" method="POST" action="${pageContext.request.contextPath }/member/memberEnroll.do?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
							<div class="form-group row" style="display: flex; justify-content: center; margin: 45px;">
									<img id="profile" src="https://cdn-icons-png.flaticon.com/512/64/64572.png" alt="" style="width: 150px"	/>
							</div>
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
										<input type="text" 
		                           class="form-control" 
		                           placeholder="4글자이상"
		                           name="id" 
		                           id="memberId"
		                           value=""
		                           required>
		                           <span class="guide ok">이 아이디는 사용가능합니다.</span>
		                           <span class="guide error">이 아이디는 이미 사용중입니다.</span>
	                           <input type="hidden" id="idValid" value="0">
								</div>
								
							</div>


							<div class="form-group row">
								<label for="present_address"
									class="col-md-4 col-form-label text-md-right">비밀번호</label>
								<div class="col-md-6 group-text-input">
									<input type="password" id="password" class="form-control" name="password" value="">
								</div>
							</div>


							<div class="form-group row">
								<label for="present_address"
									class="col-md-4 col-form-label text-md-right">비밀번호 확인</label>
								<div class="col-md-6 group-text-input">
									<input type="password" id="password" class="form-control" value="">
								</div>
							</div>
							
							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">이름</label>
								<div class="col-md-6 group-text-input">
									<input type="text" id="name" class="form-control"
										name="memberName">
								</div>
							</div>

							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">닉네임</label>
								<div class="col-md-6 group-text-input">
									<input type="text" id="nickname" class="form-control"
										name="nickname">
								</div>
							</div>

							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">이메일</label>
								<div class="col-md-6 group-text-input">
									<div class="input-group mb-3">
										<input type="text" class="form-control" 
											aria-label="Username" required="required" name="emailId" id="emailId">
											 <span class="input-group-text">@</span>
										<input type="text" class="form-control" 
											aria-label="Server" required="required" name="email-server" id="emailServer">
										<input type="hidden" id="memberEmail" name="memberEmail"/>
									</div>
								</div>
							</div>
							
							

							<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">연락처</label>
								<div class="col-md-6 group-text-input">
									<input type="text" id="phone_number" class="form-control"
										name="phone">
								</div>
							</div>



							<div class="form-group row">
								<label for="gender"
									class="col-md-4 col-form-label text-md-right">성별</label>
								<div class="col-md-6 group-text-input gender-radio">
									<div class="form-check">
										<input class="form-check-input" type="radio"
											name="memberGender" id="flexRadioDefault1" value="F"> <label
											class="form-check-label" for="flexRadioDefault1" > 여성
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
										name="birthday" value="">
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
$(".guide").hide();
$(memberId).keyup((e) => {
    const $id = $(e.target);
    const $error = $(".guide.error");
    const $ok = $(".guide.ok");
    const $idValid = $(idValid);

    if($id.val().length < 4){
        $(".guide").hide();
        $idValid.val(0);
        return;
    }
    $.ajax({
        url: `${pageContext.request.contextPath}/member/checkIdDuplicate1.do`,
        data: {
            id: $id.val()
        },
        success(data){
            console.log(data);
            const {available} = data;
            if(available){
                $ok.show();
                $error.hide();
                $idValid.val(1); 
            }
            else {
                $ok.hide();
                $error.show();
                $idValid.val(0);
            }
        },
        error: console.log
    });
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

$("#passwordCheck").blur(function(){
	var $password = $("#password"),
	$passwordCheck = $("$passwordCheck");
	if($password.val() != $passwordCheck.val()){
		alert("패스워드가 일치하지 않습니다.");
		$password.select();
	}
});

 $(document.memberEnrollFrm).submit(function(){

	var $id = $("#memberId");
	if(/^\w{4,}$/.test($id.val()) == false) {
		alert("아이디는 최소 4자리이상이어야 합니다.");
		$id.focus();
		return false;
	}
	
	if($(idValid).val() == 0){
		$id.focus();
		return false; 
	}
	
	
	return true;
}); 

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
