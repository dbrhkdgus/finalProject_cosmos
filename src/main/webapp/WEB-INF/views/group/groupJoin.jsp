<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
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
					<div class="card-header"><h2>그룹 가입 신청</h2></div>
					<div class="card-body">
						<form:form name="my-form" id="groupJoinFrm" action="${pageContext.request.contextPath}/group/groupJoinFrm.do" method="POST">
						<input type="hidden" name="groupNo" value="${group.groupNo}"/>
						<input type="hidden" name="memberId" value="<sec:authentication property="principal.id"/>"/>
							<div>
								<h4>모임의 원활한 활동을 위한 필요한 질문입니다. 작성해주세요.</h4>
							</div>

							<div class=" group-text-input">
								<label for="permanent_address"
									class="col-md-15 col-form-label text-md-left">욕설 및 불법 프로그램등 법적 문제를 야기할 수 있는 행위시 관리자, 그룹장, 매니저에 의해 즉시 추방 및 홈페이지 이용 불가처리 됨을 동의 하십니까?<br />(작성예시 : 동의합니다(특수문자 작성 금지))</label>
								<div class="group-text-input form-floating col-md-6">
									<textarea class="form-control" name="answer"
										placeholder="Leave a comment here" id="floatingTextarea2"
										style="height: 100px; width: 200%; resize: none;"></textarea>
								</div>
							</div>
							<br /><br />
							<div>
								<h4>그룹웨어 기본 이용 약관입니다.</h4>
							</div>
								<div class=" group-text-input">
									<label for="permanent_address"
										class="col-md-15 col-form-label text-md-left">1. 목적</label>
									<div class="group-text-input col-md-6">
										<textarea class="form-control"
											placeholder="COSMOS(이하”회사”라고 합니다.)에서 제공하는 StudyGroupware 서비스 (이하 ”서비스”)를 사용하는 경우 이 서비스 약관이 적용됩니다.
서비스를 사용하려면 본 서비스 약관 (”계약”)을 준수하는 데 동의 해야 합니다.
이 계약의 모든 조건에 동의하지 않으면 서비스를 사용할 수 없습니다.
StudyGroupware 개인정보 보호정책은 본 이용약관에 포함되어 있습니다.
본 계약은 인터넷 브라우저, 스마트 폰, 태블릿 또는 기타 모바일 장치를 통해 액세스하는 경우를 포함하여 귀하의 서비스 사용에 적용됩니다.
StudyGroupware 의 사용자로 본 서비스에 가입함으로써 귀하는 아래의 내용에 동의를 합니다.
(a) 귀하는 해당 법인 및 계열사를 대신하여 본 계약의 조건에 동의하고 (b) 본 계약에서 ”귀하”에 대한 언급은 해당 법인, 계열사 및 모든 직원, 컨설턴트 및 대리인을 지칭합니다.
귀하는 귀하의 계정에서 발생하는 모든 서비스 활동에 대한 책임이 있습니다."
											id="floatingTextarea"
											style="height: 100px; width: 200%; resize: none;"></textarea>
									</div>
								</div>
								<div class=" group-text-input">
									<label for="permanent_address"
										class="col-md-15 col-form-label text-md-left">2. 약관의 명시, 효력 및 개정</label>
									<div class="group-text-input col-md-6">
										<textarea class="form-control"
											placeholder="1) 회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
2) 회사는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
3) 회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 일십오(15)일 전부터 적용일 이후 상당한 기간 동안, 개정 내용이 회원에게 불리한 경우에는 그 적용일자 삼십(30)일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 공지하고 기존 회원에게는 회사가 부여한 이메일 주소로 개정약관을 발송하여 고지합니다.
4) 회사가 전항에 따라 회원에게 통지하면서 공지∙고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다. 회원이 개정약관에 동의하지 않을 경우 회원은 제17조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다."
											id="floatingTextarea"
											style="height: 100px; width: 200%; resize: none;"></textarea>
									</div>
								</div>
								<div class=" group-text-input">
									<label for="permanent_address"
										class="col-md-15 col-form-label text-md-left">3. 서비스</label>
									<div class="group-text-input col-md-6">
										<textarea class="form-control"
											placeholder="1) StudyGroupware 서비스에는 StudyGroupware를 사용하기 위해 추가로 구독하는 서비스가 포함 될 수 있습니다.
(추가 유료 기능, 추가 유료 서비스 등) 이러한 추가 서비스 중 일부에는 해당 추가 서비스 사용에 적용되는 특정 추가 조건이 있으며 이러한 추가 조건은 본 계약의 일부가 됩니다."
											id="floatingTextarea"
											style="height: 100px; width: 200%; resize: none;"></textarea>
									</div>
								</div>
								<div class=" group-text-input">
									<label for="permanent_address"
										class="col-md-15 col-form-label text-md-left">4. 지적 재산권</label>
									<div class="group-text-input col-md-6">
										<textarea class="form-control"
											placeholder=")  당사자들간에 StudyGroupware는 (a) 소프트웨어 및 서비스에 대한 모든 지적 재산권을 포함하여 (b) 귀하의 사용과 관련된 모든 거래 및 성능 데이터에 대한 모든 권리, 소유권 및 이권을 소유하고 보유합니다.  StudyGroupware는 비즈니스 목적 (소프트웨어 사용 최적화 및 제품 마케팅 포함)을 위해 그러한 모든 거래 및 성능 데이터를 수집, 사용 및 공개 할 수 있습니다.
단, 그러한 사용이 귀하의 신원, 귀하의 기밀 정보 또는 귀하의 개인 식별 정보를 공개하지 않습니다.
2) 귀하는 귀하의 데이터에 대한 모든 권리, 소유권 및 소유권을 보유합니다. "
											id="floatingTextarea"
											style="height: 100px; width: 200%; resize: none;"></textarea>
									</div>
								</div>
								<div class=" group-text-input">
									<label for="permanent_address"
										class="col-md-15 col-form-label text-md-left">5. 광고를 위한 권리</label>
									<div class="group-text-input col-md-6">
										<textarea class="form-control"
											placeholder="1) 귀하와 StudyGroupware이 달리 동의하지 않는 한, 기간 동안 StudyGroupware은 귀하의 이름을 StudyGroupware의 고객 및 서비스 가입자로 공개 할 수 있으며 귀하는 StudyGroupware에 귀하의 이름, 회사 및 로고를 StudyGroupware에 표시 할 권리를 부여합니다.
귀하가 StudyGroupware에 제공 할 수 는 브랜딩 가이드 라인에 따라 마케팅 자료 및 StudyGroupware의 공개 웹사이트에 있습니다."
											id="floatingTextarea"
											style="height: 100px; width: 200%; resize: none;"></textarea>
									</div>
								</div>
								<div class=" group-text-input">
									<label for="permanent_address"
										class="col-md-15 col-form-label text-md-left">6. 사용자 콘텐츠</label>
									<div class="group-text-input col-md-6">
										<textarea class="form-control"
											placeholder="  1) 웹 사이트의 특정 기능을 통해 사용자는 댓글 또는 콘텐츠를 제출, 업로드, 게시, 공유 또는 표시 (이하 ”게시”) 할 수 있을뿐만 아니라 사용자 댓글 영역, 게시판, StudyGroupware을 통해 다른 사람과 상호 작용할 수 있습니다. 
블로그 및 유사한 사용자 영역 (이러한 의견 및 콘텐츠를 통칭하여 ”사용자 콘텐츠” 라고함). 사용자 콘텐츠에는 고객 지원을 통해 또는 다른 방법으로 서비스에 대해 귀하가 StudyGroupware에 제공한 모든 의견이나 리뷰가 포함됩니다. 
2) 귀하는 귀하가 게시하는 모든 사용자 콘텐츠의 산출물을 사용, 복제, 표시, 수행, 배포의 취소가 불가능하고 영구적인 비 독점적 양도 가능, 재 라이선스 가능, 양도 가능, 로열티가 없는 전 세계 권한 및 라이선스를 StudyGroupware에 부여합니다."
											id="floatingTextarea2"
											style="height: 100px; width: 200%; resize: none;"></textarea>
									</div>
								</div>
								<div class=" group-text-input">
									<label for="permanent_address"
										class="col-md-15 col-form-label text-md-left">7. 공급 사업자의 면책 등</label>
									<div class="group-text-input col-md-6">
										<textarea class="form-control"
											placeholder="1) StudyGroupware는 본 서비스에 포함된 콘텐츠 및 서비스의 특정한 기능 또는 효용성과 관련된 모든 약속 또는 보증을 부인하며, 본 서비스는 있는 그대로 제공합니다.
2) StudyGroupware는 다음 각호에 정의한 손해에 대하여 어떠한 책임도 부담하지 않습니다.
가)   본 서비스 사용으로 인한 귀하에게 발생하는 신체적 상해
나)   제 3자에 의해 귀하의 계정 또는 서버에 승인되지 않는 접속 및 이용을 원인으로 발생하는 손해
다)   제 3자에 의한 서비스 방해로 발생한 손해
라)   제 3자에 의한 버그, 바이러스 등 기타 유사한 공격으로 발생한 손해
마)   본서비스를 통한 근로시간, 잔여연차등 정산에 대한 오차나 착오로 발생된 손해"
											id="floatingTextarea"
											style="height: 100px; width: 200%; resize: none;"></textarea>
									</div>
								</div>
								<div class=" group-text-input">
									<label for="permanent_address"
										class="col-md-15 col-form-label text-md-left">8. 일반 조항</label>
									<div class="group-text-input col-md-6">
										<textarea class="form-control"
											placeholder="1) 관할법원
StudyGroupware와 귀하간에 발생한 분쟁으로 소송이 제기되는 경우에는 서울중앙지방법원을 관할법원으로 합니다.  외국사업자의 경우에는 대한민국 법원이 국제재판관할권을 가집니다.
2) 준거법
이 계약의 성립, 효력, 해석 및 이행과 관련해서는 대한민국 법을 적용합니다."
											id="floatingTextarea"
											style="height: 100px; width: 200%; resize: none;"></textarea>
									</div>
								</div>
							<br>
							<br>
							<div class="group-join-notice">
								<ul>
									<li>활동하는 동안 원활한 운영을 위해 아이디, 활동내역 등 필수정보만 모임관리자에게
										공개됩니다 동의를 거부하시면 가입이 불가능합니다.</li>
								</ul>
								<div style="display: flex;justify-content: center;">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="inlineRadioOptions" id="policies1" value="Y">
										<label class="form-check-label" for="policies1">동의합니다.</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="inlineRadioOptions" id="policies2" value="N">
										<label class="form-check-label" for="policies2">동의하지않습니다.</label>
									</div>
								</div>
							</div>
							<br>

							<div class="col-md-6 group-create-button float-center" style="margin: auto;">
								<button type="submit" onclick="submitProcess();" class="btn btn-primary">가입하기</button>
							</div>
					</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
$("[name=my-form]").submit(function(){
	var $id = $("#floatingTextarea2");
	if(/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,}\$/.test($id.val()) == false) {
		alert("답변을 작성하셔야 합니다.");
		$id.focus();
		return false;
	}
	if(($("input[name=inlineRadioOptions]:checked").val() != "Y") == true) {
		alert("약관에 동의하지 않으면 가입이 불가능 합니다.");
		$("input[name=inlineRadioOptions]").focus();
		return false;
	}
	
	return true;
});
</script>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
