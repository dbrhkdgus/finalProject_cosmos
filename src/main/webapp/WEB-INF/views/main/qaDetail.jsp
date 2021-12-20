<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="문의사항 상세보기" name="title"/>
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
					<td>${que.queTitle} <span class="mr-5 text-secondary"><fmt:formatDate value="${que.regDate}" pattern="yy-MM-dd" /></span></td>
				</tr>
			</tbody>
		</table>
	</div>
		<span class="text-right">작성자 : ${que.memberId}</span>
	<div class="card text-center">
		<div class="card-body">
			<img src="${pageContext.request.contextPath }/resources/upFile/question/${att.renamedFilename}" alt="" style="width: 50%" /> ${que.queContent}
		</div>
	</div>
	<br />
	
		<div class="input-group mb-3">
		  <input type="text" class="form-control" placeholder="댓글을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
		  <button class="btn btn-outline-secondary" type="button" id="button-addon2" style="margin-bottom: 0px;">댓글작성</button>
		</div>
		
	<!--댓글유무분기처리  -->
	<div class="card text-center">
		<div class="reply-outer d-flex">
		<p id="reply-writer">작성자 :</p>
		<p id="reply-content">내용</p>
		</div>
	</div>
	

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
