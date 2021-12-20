<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항" name="title"/>
</jsp:include>
<script>
function goNoticeForm(){
	location.href = "${pageContext.request.contextPath}/main/noticeForm.do";
}

$(()=>{
	$("tr[data-no]").click((e) => {
		const $tr = $(e.target).parents("tr");
		const no = $tr.data("no");
		location.href = `${pageContext.request.contextPath}/main/noticeDetail.do?no=\${no}`;
	});
});
</script>
<div class="container">
<div>
	<h2 class="text-center">공지사항</h2>
	<div class="input-group mb-3 w-25 float-right">
	  <input type="text" class="form-control" placeholder="검색어를 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
	  <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
	</div>
</div>
	<table class="table text-center">
	  <thead>
	    <tr>
	      <th scope="col">NO</th>
	      <th class="w-50" scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">날짜</th>
	      <th scope="col">조회수</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach items="${list}" var="notice">
			<tr data-no="${notice.noticeNo}">
				<td>${notice.noticeNo}</td>
				<td>${notice.noticeTitle}</td>
				<td>${notice.memberId}</td>
				<td><fmt:formatDate value="${notice.regDate}" pattern="yy-MM-dd"/></td>
				<td>${notice.readCount}</td>
			</tr>
		</c:forEach>
	  </tbody>
	</table>
	<c:if test="${loginMember.memberId eq 'admin' && not empty loginMember}">
	<button type="button" class="btn btn-primary float-right" onclick="goNoticeForm();">작성하기(관리자만)</button>
	</c:if>
	${pagebar}
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
