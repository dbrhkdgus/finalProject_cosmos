<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize
	access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">

	<fmt:requestEncoding value="utf-8" />
	<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
		<jsp:param value="" name="title" />
	</jsp:include>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="loginMember" />
	</sec:authorize>

	<div class="groupware-saved-outter">

		<div class="groupware-saved-title p-4 mb-4">
			<h3>저장된 항목</h3>
		</div>


		<form enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/gw/fileBoard/fileBoardSearch.do?"
			method="get">
			<div class="test-board-search d-flex float-right">
				<select name="searchType" class="form-select search-select"
					id="form-select-search" style="width: 38%;"
					aria-label="Default select example">
					<option value="all" ${searchType == 'all' ? "selected":'' }>
						전체보기</option>
					<option value="img" ${searchType == 'img' ? "selected":'' }>이미지</option>
					<option value="document"
						${searchType == 'document' ? "selected":'' }>문서</option>
					<option value="zip" ${searchType == 'zip' ? "selected":'' }>압축파일</option>
					<option value="code" ${searchType == 'code' ? "selected":'' }>코드파일</option>
					<option value="etc" ${searchType == 'etc' ? "selected":'' }>기타</option>
				</select>

				<div class="input-group mb-3 search-input">
					<input type="hidden" name="boardNo" value="${boardNo}" /> <input
						type="hidden" name="groupNo" value="${groupNo}" /> <input
						type="text" class="form-control" name="searchKeyword"
						value="${searchKeyword }" placeholder="작성자 또는 제목검색"
						aria-describedby="button-addon2">
					<button class="btn btn-primary">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>



			<div class="file-total-div">
		<!--  -->
		<%-- <c:if test="${not empty fileBoardList}"> --%>
		<c:forEach var="post" items="${fileBoardList}" varStatus="status">
			<%--  <c:set var="count" value="${count + 1}" /> --%>

				<div class="groupware-saved-card-box mb-4" style="width: 40%; ">
					<div class="card" style="box-shadow: 2px 3px 6px #ccc;">
						<div class="card-header">
							<span class="font-weight-bold">No.${fn:length(fileBoardList)- status.count+1}</span>
							<span>${post.postTitle}</span>
						</div>
						<div class="card-body">
							<div class="groupware-saved-inner">

								<div class="groupware-saved-user-name-fileType ml-3">
									<c:forEach items="${idnicknameList}" var="list"
										varStatus="status">
										<c:if test="${list.id eq post.memberId}">
											<span class="mb-0 font-weight-bold">${list.nickName}</span>
											<span class="text-secondaryr ml-3">
										</c:if>
									</c:forEach>
									<span class="groupware-istoday"><fmt:formatDate
											value="${post.postRegDate}" pattern="yy-MM-dd" /></span>
									<p class="mb-0 ml-1 text-secondary">${post.boardCategory}<svg
											xmlns="http://www.w3.org/2000/svg" width="9" height="9"
											fill="currentColor" class="bi bi-chevron-bar-down"
											viewBox="0 0 16 16">
                      <path fill-rule="evenodd"
												d="M3.646 4.146a.5.5 0 0 1 .708 0L8 7.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708zM1 11.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5z" />
                    </svg>
									</p>
								</div>
							</div>

							<c:forEach var="attach" items="${attach}" varStatus="status">
								<c:if test="${post.attachNo eq attach.attachNo}">
									<div class="groupware-saved-file-info mt-2">
										<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
											fill="currentColor" class="bi bi-file-earmark-zip"
											viewBox="0 0 16 16">
                  <path
												d="M5 7.5a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v.938l.4 1.599a1 1 0 0 1-.416 1.074l-.93.62a1 1 0 0 1-1.11 0l-.929-.62a1 1 0 0 1-.415-1.074L5 8.438V7.5zm2 0H6v.938a1 1 0 0 1-.03.243l-.4 1.598.93.62.929-.62-.4-1.598A1 1 0 0 1 7 8.438V7.5z" />
                  <path
												d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1h-2v1h-1v1h1v1h-1v1h1v1H6V5H5V4h1V3H5V2h1V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z" />
                </svg>
										<a href="${pageContext.request.contextPath}/gw/fileBoard/fileDown.do?attachNo=${post.attachNo}">
											<p class="mb-0 ml-3">${attach.originalFilename}</p></a>
									</div>
								</c:if>
							</c:forEach>

						</div>
					</div>
				</div>
		</c:forEach>
		</div>





	<div class="test-board-pagebar">${pagebar}</div>

	</div>




	<script>
/* $("#button-addon2").click((e)=>{
    const searchType = $("select[name=searchType]").val();
    const searchKeyword = $("input[name=searchKeyword]").val();
    location.href=`${pageContext.request.contextPath}/gw/fileBoard/fileBoard.do?boardNo=${boardNo}&groupNo=${groupNo}&searchType=\${searchType}&searchKeyword=\${searchKeyword}`; 
   
}); */
</script>
	<script>
window.addEventListener("load", function(){
	$("#dropdownBoard").removeClass("collapsed");
	$("#board-collapse").addClass("show");
	});
</script>
	<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

</sec:authorize>