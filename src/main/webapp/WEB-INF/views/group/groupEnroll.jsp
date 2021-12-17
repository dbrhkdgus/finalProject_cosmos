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
							<form name="my-form" onsubmit="return validform()"
								action="success.php" method="POST">
								<div class="form-group row">
									<label for="full_name"
										class="col-md-4 col-form-label text-md-right">그룹명</label>
									<div class="col-md-6 group-text-input">
										<input type="text" id="group-name" class="form-control"
											name="full-name">
									</div>
								</div>


								<div class="form-group row">
									<label for="full_name"
										class="col-md-4 col-form-label text-md-right">상위 카테고리</label>
									<div class="col-md-6 group-text-input">
										<select class="form-select"
											aria-label="Default select example">
											<option selected>상위 카테고리</option>
											<option value="1">One</option>
											<option value="2">Two</option>
											<option value="3">Three</option>
										</select>
									</div>
								</div>

								<div class="form-group row">
									<label for="full_name"
										class="col-md-4 col-form-label text-md-right">하위 카테고리</label>
									<div class="col-md-6 group-text-input">
										<select class="form-select"
											aria-label="Default select example">
											<option selected>하위 카테고리</option>
											<option value="1">One</option>
											<option value="2">Two</option>
											<option value="3">Three</option>
										</select>
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
										<input type="text" id="member-number" class="form-control">
									</div>
								</div>

								<div class="form-group row">
								<label for="permanent_address"
									class="col-md-4 col-form-label text-md-right">프리미엄여부</label>
								<div class="col-md-6 group-text-input gender-radio">
									<div class="form-check">
										<input class="form-check-input" type="radio"
											name="flexR`adioDefault" id="flexRadioDefault1"> <label
											class="form-check-label" for="flexRadioDefault1"> 유료
										</label>
									</div>

									<div class="form-check">
										<input class="form-check-input" type="radio"
											name="flexR`adioDefault" id="flexRadioDefault1"> <label
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
											name="permanent-address">
									</div>
								</div>
								
								<div class="form-check text-center">
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
									<label for="flexCheckDefault"> &nbsp;조회에서 제외되는 비밀그룹으로 생성하기 </label>
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

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>