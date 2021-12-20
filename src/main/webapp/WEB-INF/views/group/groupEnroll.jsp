<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="그룹 생성" name="title" />
</jsp:include>
	<main class="my-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div class="card-header">스터디 그룹 생성</div>
						<div class="card-body">
							<form name="my-form"
								action="${pageContext.request.contextPath}/group/insertGroup.do" method="POST">
								<div class="form-group row">
									<label for="full_name"
										class="col-md-4 col-form-label text-md-right">그룹명</label>
									<div class="col-md-6 group-text-input">
										<input type="text" id="group-name" class="form-control"
											name="groupName">
									</div>
								</div>


								<div class="form-group row">
									<label for="full_name"
										class="col-md-4 col-form-label text-md-right">상위 카테고리</label>
									<div class="col-md-6 group-text-input">
										<select class="form-select"
											aria-label="Default select example">
											<option selected>상위 카테고리</option>
											<option value="1">웹 개발</option>
											<option value="2">프론트엔드</option>
											<option value="3">백엔드</option>
										</select>
									</div>
								</div>
	
								<div class="form-group row">
									<label for="full_name"
										class="col-md-4 col-form-label text-md-right">하위 카테고리</label>
									<div class="col-md-6 group-text-input">
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
										  <label class="form-check-label" for="inlineCheckbox1">JAVA</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
										  <label class="form-check-label" for="inlineCheckbox2">HTML/CSS</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
										  <label class="form-check-label" for="inlineCheckbox3">JavaScript</label>
										</div>
									</div>
								</div>
								
								<div class="form-group row">
									<label for="present_address"
										class="col-md-4 col-form-label text-md-right">모집글 제목</label>
									<div class="col-md-6 group-text-input">
										<input type="text" id="study-title" class="form-control">
									</div>
								</div>

								<div class="form-group row">
									<label for="phone_number"
										class="col-md-4 col-form-label text-md-right">배너 이미지</label>
									<div class="col-md-6 group-text-input">
										<input class="form-control" type="file" id="formFileMultiple"
											multiple>
									</div>
								</div>

								<div class="form-group row">
									<label for="present_address"
										class="col-md-4 col-form-label text-md-right">모집정원</label>
									<div class="col-md-6 group-text-input">
										<input type="text" id="member-number" name="groupPool" class="form-control">
									</div>
								</div>

								<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">프리미엄여부</label>
								<div class="col-md-6 group-text-input gender-radio">
									<div class="form-check">
										<input class="form-check-input" type="radio"
											name="groupCharge" id="flexRadioDefault1" value="P"> <label
											class="form-check-label" for="flexRadioDefault1"> 유료
										</label>
									</div>

									<div class="form-check">
										<input class="form-check-input" type="radio"
											name="groupCharge" id="flexRadioDefault1" value="F"> <label
											class="form-check-label" for="flexRadioDefault1"> 무료
										</label>
									</div>
								</div>
							</div>


								<div class="form-group row">
									<label for="permanent_address"
										class="col-md-4 col-form-label text-md-right">위치</label>
									<div class="col-md-6 group-text-input">
										<input type="text" id="location" class="form-control"
											name="groupLocation">
									</div>
								</div>
								
								<div class="form-check text-center">
									<input class="form-check-input" type="checkbox" id="groupPrivate" name="groupPrivate" value="L">
									<label for="groupPrivate"> &nbsp;조회에서 제외되는 비밀그룹으로 생성하기 </label>
								</div>
								
								<div class="form-group row">
									<label for="permanent_address"
										class="col-md-4 col-form-label text-md-right">스터디를
										소개해주세요!</label>
									<div class="col-md-6 group-text-input">
										<div class="group-text-input form-floating col-md-6">

											<textarea class="form-control"
												placeholder="Leave a comment here" id="floatingTextarea2"
												style="height: 100px; width: 200%; resize: none;"></textarea>

										</div>
									</div>
								</div>

								<div class="form-group row">
									<label for="permanent_address"
										class="col-md-4 col-form-label text-md-right">이런 분들이
										들으면 좋아요!</label>
									<div class="col-md-6 group-text-input">
										<div class="group-text-input form-floating col-md-6">

											<textarea class="form-control"
												placeholder="Leave a comment here" id="floatingTextarea2"
												style="height: 100px; width: 200%; resize: none;"></textarea>

										</div>
									</div>
								</div>

								<div class="form-group row">
									<label for="permanent_address"
										class="col-md-4 col-form-label text-md-right">이런 분들이
										들으면 좋아요!</label>
									<div class="col-md-6 group-text-input">
										<div class="group-text-input form-floating col-md-6">

											<textarea class="form-control"
												placeholder="Leave a comment here" id="floatingTextarea2"
												style="height: 100px; width: 200%; resize: none;"></textarea>

										</div>
									</div>
								</div>


								<div class="col-md-6 offset-md-4 group-create-button">
									<button type="submit" class="btn btn-primary">그룹생성</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>

	<script>
		/* function YnCheck(obj) {
			var checked = obj.checked;
			if(checked) {
				obj.value="L";
			} else {
				obj.value="U";
			}
		}
		
		var checkYn="${data.groupPrivate}";
		if(checkYn=="L") {
			$("#groupPrivate").prop("checked", true);
		} else {
			$("#groupPrivate").prop("checked", false);
		}
		if($("#groupPrivate").is(':checked')==true) {
			data.set("groupPrivate", "L");
		} else {
			data.set("groupPrivate", "U");
		} */
	 
		var charged = document.getElementByName('groupCharge');
		var isCharged;
		for(var i = 0; i < charged.length; i++) {
			if(charged[i].checked) {
				isCharged = charged[i].value;
			}
		}
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

