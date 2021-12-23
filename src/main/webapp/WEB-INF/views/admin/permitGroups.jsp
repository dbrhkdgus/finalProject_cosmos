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
    .disabled{
      
    }
    .form-control.validate[disabled]{
      background-color: #4E657A;
    }
  </style>

<div class="container mt-5">
        <div class="col-12 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <h2 class="tm-block-title">심사 대기 목록</h2>
            <!-- <p class="text-white">검색 카테고리</p>
            <div>
              <select class="custom-select selectBar mr-3">
                <option value="0">전체</option>
                <option value="1">모임명</option>
                <option value="2">생성일</option>
                <option value="3">유/무료</option>
                <option value="4">비밀 여부</option>
              </select>
              <input id="searchKeyword"  type="text" class="form-control mb-5" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
            </div> -->
            <!-- 회원목록 테이블 -->
            <div class="row tm-content-row">
              <table class="table mb-3">
                <thead>
                  <tr>
                    <th scope="col">그룹번호</th>
                    <th scope="col">그룹장</th>
                    <th scope="col">그룹명</th>
                    <th scope="col">카테고리</th>
                    <th scope="col">유/무료</th>
                    <th scope="col">생성일</th>
                    <th scope="col">비밀여부</th>
                    <th scope="col">승인하기</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>개성공단</td>
                    <td>2021/11/11</td>
                    <td>무료</td>
                    <td>모집 중</td>
                    <td>10/10</td>
                    <td>공개</td>
                    <td>90</td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td>개성공단</td>
                    <td>2021/11/11</td>
                    <td>무료</td>
                    <td>모집 중</td>
                    <td>10/10</td>
                    <td>공개</td>
                    <td>90</td>
                  </tr>              <tr>
                    <td>1</td>
                    <td>개성공단</td>
                    <td>2021/11/11</td>
                    <td>무료</td>
                    <td>모집 중</td>
                    <td>10/10</td>
                    <td>공개</td>
                    <td>90</td>
                  </tr>              <tr>
                    <td>1</td>
                    <td>개성공단</td>
                    <td>2021/11/11</td>
                    <td>무료</td>
                    <td>모집 중</td>
                    <td>10/10</td>
                    <td>공개</td>
                    <td>90</td>
                  </tr>              <tr>
                    <td>1</td>
                    <td>개성공단</td>
                    <td>2021/11/11</td>
                    <td>무료</td>
                    <td>모집 중</td>
                    <td>10/10</td>
                    <td>공개</td>
                    <td>90</td>
                  </tr>              <tr>
                    <td>1</td>
                    <td>개성공단</td>
                    <td>2021/11/11</td>
                    <td>무료</td>
                    <td>모집 중</td>
                    <td>10/10</td>
                    <td>공개</td>
                    <td>90</td>
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
  
        <!-- row -->
        <div class="row tm-content-row">
          <div class="tm-block-col tm-col-avatar">
            <div class="tm-bg-primary-dark tm-block tm-block-avatar">
              <h2 class="tm-block-title">그룹 프로필 사진</h2>
              <div class="tm-avatar-container">
                <img
                  src="${pageContext.request.contextPath}/resources/images/avatar.png"
                  alt="Avatar"
                  class="tm-avatar img-fluid mb-4"
                />
                <a href="#" class="tm-avatar-delete-link">
                  <i class="far fa-trash-alt tm-product-delete-icon"></i>
                </a>
              </div>
              
            </div>
          </div>
          <div class="tm-block-col tm-col-account-settings">
            <div class="tm-bg-primary-dark tm-block tm-block-settings">
              <h2 class="tm-block-title">모임 정보</h2>
              <form action="" class="tm-signup-form row">
                <div class="form-group col-lg-6">
                  <label for="name">그룹명</label>
                  <input
                    id="name"
                    name="name"
                    type="text"
                    class="form-control validate"
                    value="개성공단"
                    disabled
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="email">생성일</label>
                  <input
                    id="enrollDate"
                    name="enrollDate"
                    type="date"
                    class="form-control validate"
                    value="2021-12-15"
                    disabled
                  />
                </div>

                <div class="form-group col-lg-6">
                  <label for="password2">유/무료</label>
                  <input
                    id="charge"
                    name="charge"
                    class="form-control validate"
                    value="유료"
                    disabled
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="phone">모집 여부</label>
                  <input
                    id="groupClose"
                    name="groupClose"
                    class="form-control validate"
                    value="모집 중"
                    disabled
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="phone">정원</label>
                  <input
                    id="groupPool"
                    name="groupPool"
                    class="form-control validate"
                    value="7/7"
                    disabled
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="phone">비밀 여부</label>
                  <input
                    id="groupPrivate"
                    name="groupPrivate"
                    class="form-control validate"
                    value="미설정"
                    disabled
                  />
                </div>
                <div class="form-group col-lg-12">
                  <label for="phone">좋아요 수</label>
                  <input
                    id="likeCount"
                    name="likeCount"
                    type="number"
                    class="form-control validate"
                    value="200000000"
                    disabled
                  />
                </div>
                
                <!-- 멤버-그룹 연결 테이블 join 해야함. -->
                <div class="form-group col-lg-12">
                  <label for="phone">참여 인원</label>
                  <input
                    id="memberList"
                    name="memberList"
                    class="form-control validate"
                    value="kh1231, honggd, sinsa, Michol, Ttochi, Duli, gogd"
                    disabled
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label class="tm-hide-sm">&nbsp;</label>
                  <button
                    type="button"
                    class="btn btn-primary btn-block text-uppercase"
                  >
                      그룹 접속
                  </button>
                </div>
                <div class="form-group col-lg-6">
                  <label class="tm-hide-sm">&nbsp;</label>
                  <button
                    id="blackListBtn"
                    type="button"
                    class="btn btn-danger btn-block text-uppercase"
                  >
                      블랙리스트 등록
                  </button>
                </div>
              </form>
          </div>
        </div>
      </div>

<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>