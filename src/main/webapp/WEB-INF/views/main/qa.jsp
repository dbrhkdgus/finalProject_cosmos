<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="문의사항" name="title"/>
</jsp:include>
<div class="container">
<div>
	<h2 class="text-center">문의사항</h2>
	<div class="input-group mb-3 w-25 float-right">
	  <input type="text" class="form-control" placeholder="검색어를 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
	  <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
	</div>
</div>
	<table class="table text-center">
	  <thead>
	    <tr>
	      <th scope="col">NO</th>
	      <th scope="col">카테고리</th>
	      <th class="w-50" scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">날짜</th>
	      <th scope="col">상태</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th scope="row">7</th>
	      <td>기타</td>
	      <td>출력시마스킹처리방법사용 ==>>></td>
	      <td>유**</td>
	      <td>2021-12-15</td>
	      <td>미답변(N)</td>
	    </tr>
	    <tr>
	      <th scope="row">6</th>
	      <td>오류</td>
	      <td>출력시마스킹처리방법사용 ==>>></td>
	      <td>이**</td>
	      <td>2021-12-15</td>
	       <td>미답변(N)</td>
	    </tr>
	    <tr>
	      <th scope="row">5</th>
	      <td>신고</td>
	      <td>출력시마스킹처리방법사용 ==>>></td>
	      <td>이**</td>
	      <td>2021-12-15</td>
	       <td>미답변(N)</td>
	    </tr>
	    <tr>
	      <th scope="row">4</th>
	      <td>게시판</td>
	      <td>출력시마스킹처리방법사용 ==>>></td>
	      <td>유**</td>
	      <td>2021-12-15</td>
	       <td>미답변(N)</td>
	    </tr>
	    <tr>
	      <th scope="row">3</th>
	      <td>그룹</td>
	      <td>출력시마스킹처리방법사용 ==>>></td>
	      <td>김**</td>
	      <td>2021-12-15</td>
	       <td>미답변(N)</td>
	    </tr>
	    <tr>
	      <th scope="row">2</th>
	      <td>화상채팅</td>
	      <td>출력시마스킹처리방법사용 ==>>></td>
	      <td>백**</td>
	      <td>2021-12-15</td>
	      <td>미답변(N)</td>
	    </tr>
	    <tr>
	      <th scope="row">1</th>
	      <td>그룹웨어</td>
	      <td>출력시마스킹처리방법사용 ==>>></td>
	      <td>강**</td>
	      <td>2021-12-14</td>
	       <td>답변완료(Y)</td>
	    </tr>
	  </tbody>
	</table>
	<button type="button" class="btn btn-primary float-right">작성하기</button>
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
