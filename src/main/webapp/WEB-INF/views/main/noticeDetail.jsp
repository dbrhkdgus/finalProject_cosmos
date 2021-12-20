<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항 상세보기" name="title"/>
</jsp:include>
<style>
div#board-container{width: 80%;}
input, button, textarea {margin-bottom:15px;}
button { overflow: hidden; }
/* 부트스트랩 : 파일라벨명 정렬*/
div#board-container label.custom-file-label{text-align:left;}
</style>
<div id="board-container" class="mx-auto">
	<div class="text-center" style="display: flex; justify-content: space-between; width: 100%;">
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col">제목</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${notice.noticeTitle}</td>
				</tr>
			</tbody>
		</table>
	</div>
		<span class="text-right">작성자 : ${notice.memberId}</span>
	<div class="card text-center">
		<div class="card-body">
			<img src="${pageContext.request.contextPath }/resources/upFile/notice/${attach.renamedFilename}" alt="" style="width: 50%" /> ${notice.noticeContent}
		</div>
	</div>
	<table class="table text-center">
		<thead>
			<tr>
				<th scope="col">날짜</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><fmt:formatDate value="${notice.regDate}" pattern="yy-MM-dd" /></td>
				<td>${notice.readCount}</td>
			</tr>
		</tbody>
	</table>

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
