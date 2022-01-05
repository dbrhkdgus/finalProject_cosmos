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
            <h2 class="tm-block-title">모임 목록</h2>
            <p class="text-white">검색 카테고리</p>
            <div>
              <form name="searchForm" action="${pageContext.request.contextPath}/admin/searchMembers.do">
              	<table class="table mb-3 table-striped ">
              		<thread>
              			<tr>
              				<th style="border-right: solid 1px #3e464f" class="col-2 text-center">검색어</th>
              				<td class="d-flex">
              					<select name="searchType" id="" class="mr-2">
					                <option value="groupName">모임명</option>
					                <option value="groupNo">모임 번호</option>  
					            </select>
					        <input name="searchKeyword" id="searchKeyword" type="text"
					        	<c:if test="${not empty searchKeyword}">value="${searchKeyword}"</c:if>
					        >
					        </td>
					        
              			</tr>
              			<tr>
              				<th style="border-right: solid 1px #465b70"  class="text-center">등록 기간</th>
              				<td class="d-flex">
              					<input class="dateSize" type="date" name="searchRegDateStart" id="searchRegDateStart" 
              						<c:if test="${not empty searchRegDateStart}">value="${searchRegDateStart}"</c:if>
              					/>&nbsp~&nbsp
              					
	         					<input class="dateSize" type="date" name="searchRegDateEnd" id="searchRegDateEnd" 
              						<c:if test="${not empty searchRegDateEnd}">value="${searchRegDateEnd}"</c:if>	         					
	         					/>
              				</td>
              			</tr>
 
              			<tr>
	              			<th style="border-right: solid 1px #3e464f" class="text-center">카테고리</th>
	              				<td>
	              					<select name="categoryNo" id="categoryNo">
		              					<option value="">전체</option>
		              					<c:forEach items="${CategoryOneList }" var="category">
		              					<option value="${category.category1No}">${category.category1Name}</option>
		              					</c:forEach>

	              					</select>              				
	              				</td>
	              			</tr>
              			<tr>
              			<tr>
              				<th style="border-right: solid 1px #465b70" class="text-center" >모집 	여부</th>
              				<td>
					         	 <label for="allGroup"><span class="text-white genderText">전체</span></label>
					        	 <input type="radio" name="groupClose" id="allGroup" value="" class="mr-5"
					         	 	<c:if test="${empty groupClose or groupClose==''}">checked</c:if>					        	 
					        	 />
					         	 <label for="openGroup"><span class="text-white genderText">모집 중</span></label>
					        	 <input type="radio" name="groupClose" id="openGroup" value="N" class="mr-5"
					         	 	<c:if test="${groupClose eq 'N'}">checked</c:if>
					        	 />
					         	 <label for="closeGroup"><span class="text-white genderText">모집 마감</span></label>
					        	 <input type="radio" name="groupClose" id="closeGroup" value="Y"
					         	 	<c:if test="${groupClose eq 'Y'}">checked</c:if>					        	 
					        	 />              					
              				</td>
              			</tr>

              			
              		</thread>
              	</table>
              

	         
	             <button id="searchBtn" class="btn btn-primary col rounded mt-3 mb-5" type="button"><span class="font-weight-bold">검 색</span></button>
              </form>
            </div>
            <!-- 회원목록 테이블 -->
            <div class="row tm-content-row">
              <table class="table mb-3 text-center">
                <thead>
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">그룹명</th>
                    <th scope="col">생성일</th>
                    <th scope="col">유/무료</th>
                    <th scope="col">모집여부</th>
                    <th scope="col">정원</th>
                    <th scope="col">비밀여부</th>
                    <th scope="col">좋아요 수</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${allGroupList}" var="group">
                <tr>
                	<td>${group.groupNo}</td>
                	<td>${group.groupName }</td>
                	<td><fmt:formatDate value="${group.groupEnrollDate }" pattern="yy-MM-dd"/> </td>
                	<td>${group.groupCharge }</td>
                	<td>${group.groupClose }</td>
                	<td>${group.groupPool }</td>
                	<td>${group.groupPrivate }</td>
                	<td>${group.groupLikeCount }</td>
                </tr>
                
                </c:forEach>
                 
                </tbody>
              </table>
              <div style="margin: auto">
			${pagebar }
              </div>
            </div>
          </div>
          
        </div>
  
        <!-- row -->
        <div class="row tm-content-row">
          <div class="tm-block-col tm-col-avatar">
            <div class="tm-bg-primary-dark tm-block tm-block-avatar">
              <h2 class="tm-block-title">그룹 대표 사진</h2>
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