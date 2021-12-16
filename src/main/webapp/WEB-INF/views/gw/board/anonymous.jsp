<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
 <div class="test-notice-outter">
  <div class="test-board-title-container">
    <div class="test-my-title">
      <h1>익명 게시판</h1>
    </div>
    <div class="test-board-search">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
      </svg>
      <input type="text">
      <input type="button" value="검색">
    </div>
  </div>
  <table class="table file-board-table">
    <thead>
      <tr>
        <th>No</th>
        <th colspan="2">제목</th>
        <th>작성일</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td colspan="2" class="text-left">이거슨 익명게시판</td>
        <td>12-10</td>
        <td></td>
      </tr>
      <tr>
        <td>2</td>
        <td colspan="2" class="text-left">이거슨 익명게시판</td>
        <td>12-10</td>
        <td></td>
      </tr>
      <tr>
        <td>3</td>
        <td colspan="2" class="text-left">이거슨 익명게시판</td>
        <td>12-10</td>
        <td></td>
      </tr>
      <tr>
        <td>4</td>
        <td colspan="2" class="text-left">이거슨 loginMember가 쓴 글</td>
        <td>12-10</td>
        <td class="text-left"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
          <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
          <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
        </svg></td>
      </tr>
      <tr>
        <td>5</td>
        <td colspan="2" class="text-left">이거슨 익명게시판</td>
        <td>12-10</td>
        <td></td>
      </tr>
      <tr>
        <td>6</td>
        <td colspan="2" class="text-left">이거슨 익명게시판</td>
        <td>12-10</td>
        <td></td>
      </tr>

    </tbody>
  </table>
  <div class="d-grid gap-2 d-md-flex justify-content-md-end mr-2 ">
    <button class="btn btn-primary me-md-2" type="button">글쓰기</button>
  </div>
  <div class="test-board-pagebar">
    
    <nav aria-label="Page navigation example test-board-pagebar">
      <ul class="pagination">
        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">Next</a></li>
      </ul>
    </nav> 
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

