<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항" name="title"/>
</jsp:include>
<c:if test="${not empty msg}">
	<script>
		alert("${msg}");
	</script>
</c:if>
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
	  <input type="text" id="searchKeyword" class="form-control" placeholder="검색어를 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
	  <button class="btn btn-outline-secondary" type="button" onclick="searchNotice();">검색</button>
	</div>
</div>
	<table class="table text-center">
	  <thead>
	    <tr>
	      <th scope="col">NO</th>
	      <th class="w-90" scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">날짜</th>
	      <th scope="col">조회수</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach items="${list}" var="notice">
			<tr data-no="${notice.noticeNo}">
				<td>${notice.noticeNo}</td>
				<td><a href="#">${notice.noticeTitle}</a></td>
				<td>${notice.memberId}</td>
				<td><fmt:formatDate value="${notice.regDate}" pattern="yy-MM-dd"/></td>
				<td>${notice.readCount}</td>
			</tr>
		</c:forEach>
	  </tbody>
	</table>
	<sec:authorize access="hasRole('ADMIN')">
	<button type="button" class="btn btn-primary float-right" onclick="goNoticeForm();">작성하기</button>
	</sec:authorize>
	${pagebar}
</div>
<script>
function searchNotice(){
	const $keyword = $("#searchKeyword").val();
	console.log($keyword);
	location.href=`${pageContext.request.contextPath}/main/searchNotice.do?searchKeyword=`+$keyword;
};
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
