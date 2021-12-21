<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="그룹 생성" name="title" />
</jsp:include>
<script type="text/javascript">
window.addEventListener("load", function(){
	$.ajax({
		url:"<%= request.getContextPath() %>/group/groupCategoryOne.do?${_csrf.parameterName}=${_csrf.token}",
		method: "GET",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success(data){
			const $CATEdiv = $(`<select class="form-select" id="selectCateOne" aria-label="Default select example"></select>`);
			const htmlfix = `<option selected disabled>상위 카테고리</option>`;
			$CATEdiv.append(htmlfix);
			$.each(data, (k, v) => {
				let html = `<option value=\${k}>\${v}</option>`;
				$CATEdiv.append(html);
			});
			$("#fCate").html($CATEdiv);
		},
		error(xhr,textStatus,err){
			console.log(xhr,textStatus,err);
		}
	});
});
$(()=>{
	$("#selectCateOne").on("change",function() {
		const cateOneNo = $("#selectCateOne option:selected").val();
		console.log(cateOneNo);
	});
});


window.addEventListener("load", function(){
	$.ajax({
		url:"<%= request.getContextPath() %>/group/groupCategoryTwo.do?${_csrf.parameterName}=${_csrf.token}",
		method: "GET",
		dataType: "json",
		data: {categoryOneNo : "1"},
		success(data){
			console.log(data);
		},
		error(xhr,textStatus,err){
			console.log(xhr,textStatus,err);
		}
	});
});
</script>

	<main class="my-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div class="card-header">스터디 그룹 생성</div>
						<div class="card-body">
							<form name="my-form"
								action="${pageContext.request.contextPath}/group/insertGroup.do?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
								
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
									<div class="col-md-6 group-text-input" id="fCate">
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
										<input type="text" id="study-title" class="form-control" name="giTitle">
									</div>
								</div>

								<div class="form-group row">
									<label for="phone_number"
										class="col-md-4 col-form-label text-md-right">배너 이미지</label>
									<div class="col-md-6 group-text-input">
										<input class="form-control" type="file" id="upFile" name="upFile">
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
												placeholder="Leave a comment here" id="giContent1" name="giContent"
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
												placeholder="Leave a comment here" id="giContent2" name="giContent"
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
												placeholder="Leave a comment here" id="giContent3" name="giContent"
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
		
		
		$(() => {
			$("[name=upFile]").change((e) => {
				// 1.파일명 가져오기
				const file = $(e.target).prop("files")[0];
				const filename = file?.name; // optional chaining 객체가 undefined경우에도 오류가 나지 않는다.
				console.dir(e.target);
				console.log(filename);
				
				// 2.label에 설정하기
				const $label = $(e.target).next();
				if(file != undefined)
					$label.html(filename);
				else
					$label.html("파일을 선택하세요.");
				
			});
			
			
		});
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>