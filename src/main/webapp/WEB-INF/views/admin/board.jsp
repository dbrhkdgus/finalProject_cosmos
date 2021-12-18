<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/ad_header.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>

<style>
  #searchKeyword{
    width: 75%; display: inline;
  }
  .selectBar{
    width: 20%;
  }
</style>

      <div class="container mt-5">
        <div class="col-12 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <h2 class="tm-block-title">게시물 관리</h2>
            <div>
              <label for="searchKeyword"><span class="text-white">그룹명: </span></label>
              <input id="searchKeyword"  type="text" class="form-control mb-5 mr-3 col-3" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="개성공단">

              <select class="custom-select selectBar mr-1">
                <option value="0">전체</option>
                <option value="1">작성자Id</option>
                <!-- 등록일은 두 기간을 설정해서 그 사이 기간이 나올 수 있도록 -->
                <option value="2">등록일</option>
                <!-- 게시판 명은 그룹마다 숫자나 이름 다를 수도 있어서, 해당 옵션 클릭시 서브옵션으로 해당 모임 게시판명이 나와야할 것임 -->
                <option value="2">게시판명</option>

              </select>
              <input id="searchKeyword"  type="text" class="form-control mb-5 mr-3 col-4" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
              <button class="btn btn-primary" type="submit" style="border-radius: 5%; border-color: cornflowerblue; background-color: cornflowerblue;">검색</button>
            </div>
            
            <!-- 회원목록 테이블 -->
            <div class="row tm-content-row">
              <table class="table mb-3">
                <thead>
                  <tr>
                    <th scope="col">게시글 번호</th>
                    <th scope="col">게시판명</th>
                    <th scope="col">분류</th>
                    <th scope="col">작성자</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성일</th>
                    <th scope="col">삭제여부</th>
                  </tr>
                </thead>
                <tbody>
                  <!--해당 페이지에서 뭔가 조치를 취하기 보다는 클릭시 해당 게시물로 바로 이동 -->
                  <tr>
                    <td>102</td>
                    <td>자유게시판</td>
                    <td>회의록</td>
                    <td>honggd</td>
                    <td>12/24 회의록</td>
                    <td>2021/12/15</td>
                    <td>X</td>
                  </tr>
                  <tr>
                    <tr>
                      <td>101</td>
                      <td>자유게시판</td>
                      <td>회의록</td>
                      <td>honggd</td>
                      <td>12/24 회의록</td>
                      <td>2021/12/15</td>
                      <td>X</td>
                    </tr>
                  </tr>              
                  <tr>
                    <tr>
                      <td>99</td>
                      <td>자유게시판</td>
                      <td>회의록</td>
                      <td>honggd</td>
                      <td>12/24 회의록</td>
                      <td>2021/12/15</td>
                      <td>X</td>
                    </tr>
                  </tr>              
                  <tr>
                    <td>50</td>
                    <td>자유게시판</td>
                    <td>회의록</td>
                    <td>honggd</td>
                    <td>12/24 회의록</td>
                    <td>2021/12/15</td>
                    <td>X</td>
                  </tr>              
                  <tr>
                    <td>20</td>
                    <td>자유게시판</td>
                    <td>회의록</td>
                    <td>honggd</td>
                    <td>12/24 회의록</td>
                    <td>2021/12/15</td>
                    <td>X</td>
                  </tr>              
                  <tr>
                    <td>2</td>
                    <td>자유게시판</td>
                    <td>회의록</td>
                    <td>honggd</td>
                    <td>12/24 회의록</td>
                    <td>2021/12/15</td>
                    <td>X</td>
                  </tr>
                </tbody>
              </table>
              <nav aria-label="Page navigation example" style="margin: auto;">
                <ul class="pagination">
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
          </div>
          
        </div>
  

      </div>


<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>