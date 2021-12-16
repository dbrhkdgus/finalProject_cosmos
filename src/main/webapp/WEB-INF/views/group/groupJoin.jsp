<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="그룹가입" name="title"/>
</jsp:include>
<!-- 바디 body-->
<main class="my-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">그룹 가입 신청</div>
					<div class="card-body">
						<form name="my-form" onsubmit="return validform()" action="success.php" method="POST">
							<div>
								<p>모임의 원활한 활동을 위한 필요한 질문입니다. 작성해주세요.</p>
							</div>


							<div class=" group-text-input">
								<label for="permanent_address"
									class="col-md-15 col-form-label text-md-left">Lorem
									ipsum dolor sit amet consectetur adipisicing elit. Ducimus
									veniam voluptatum sit voluptates recusandae, vel, molestias
									cumque ad temporibus explicabo commodi nulla quibusdam a!
									Voluptatibus sunt deserunt nulla adipisci facilis?</label>
								<div class="group-text-input form-floating col-md-6">
									<textarea class="form-control"
										placeholder="Leave a comment here" id="floatingTextarea2"
										style="height: 100px; width: 200%; resize: none;"></textarea>
								</div>
							</div>

							<div class=" group-text-input">
								<label for="permanent_address"
									class="col-md-15 col-form-label text-md-left">Lorem
									ipsum dolor sit amet consectetur adipisicing elit. Ducimus
									veniam voluptatum sit voluptates recusandae, vel, molestias
									cumque ad temporibus explicabo commodi nulla quibusdam a!
									Voluptatibus sunt deserunt nulla adipisci facilis?</label>
								<div class="group-text-input form-floating col-md-6">
									<textarea class="form-control"
										placeholder="Leave a comment here" id="floatingTextarea2"
										style="height: 100px; width: 200%; resize: none;"></textarea>
								</div>
							</div>

							<br>
							<br>
							<div class="group-join-notice">
								<ul>
									<li>가입신청이 수락되면 알려드립니다.</li>
									<li>활동하는 동안 원활한 운영을 위해 아이디, 활동내역, 연령대 등 필수개인정보만 모임관리자에게
										공개됩니다 동의를 거부하시면 가입이 불가능합니다.</li>
								</ul>
							</div>
							<br>

							<div class="col-md-6 group-create-button float-center" style="margin: auto;">
								<button type="submit" class="btn btn-primary">가입하기</button>
							</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
