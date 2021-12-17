<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항" name="title"/>
</jsp:include>
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
	    <tr>
	      <th scope="row">1</th>
	      <td>Mark</td>
	      <td>Otto</td>
	      <td>2021-12-15</td>
	      <td>@mdo</td>
	    </tr>
	    <tr>
	      <th scope="row">2</th>
	      <td>Jacob</td>
	      <td>Thornton</td>
	      <td>2021-12-15</td>
	      <td>@fat</td>
	    </tr>
	    <tr>
	      <th scope="row">3</th>
	      <td>Larry the Bird</td>
	      <td>@twitter</td>
	      <td>2021-12-15</td>
	      <td>@twitter</td>
	    </tr>
	    <tr>
	      <th scope="row">4</th>
	      <td>Larry the Bird</td>
	      <td>@twitter</td>
	      <td>2021-12-15</td>
	      <td>@twitter</td>
	    </tr>
	    <tr>
	      <th scope="row">5</th>
	      <td>Larry the Bird</td>
	      <td>@twitter</td>
	      <td>2021-12-15</td>
	      <td>@twitter</td>
	    </tr>
	    <tr>
	      <th scope="row">6</th>
	      <td>Larry the Bird</td>
	      <td>@twitter</td>
	      <td>2021-12-15</td>
	      <td>@twitter</td>
	    </tr>
	    <tr>
	      <th scope="row">7</th>
	      <td>Larry the Bird</td>
	      <td>@twitter</td>
	      <td>2021-12-15</td>
	      <td>@twitter</td>
	    </tr>
	  </tbody>
	</table>
	<button type="button" class="btn btn-primary float-right" onclick="location.href='${pageContext.request.contextPath}/main/noticeForm.do';">작성하기(관리자만)</button>
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
