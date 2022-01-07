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
    width: 65%; display: inline;
  }
  .selectBar{
    width: 31%;
  }
  #selectCategory{
    display: none;
  }
  #selectDate{
    display: none;
  }
  #table_list tr{
  	cursor: pointer;
  }
</style>

      <div class="container mt-5">
        <div class="col-12 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <h2 class="tm-block-title">문의 목록</h2>
            <p class="text-white">검색 카테고리</p>
            <!-- 검색어 전송 -->
            <div>
              <form name="searchForm" action="${pageContext.request.contextPath}/admin/searchQuestion.do">
              	<table class="table mb-3 table-striped ">
              		<thread>
              			<tr>
              				<th class="col-3">검색어</th>
              				<td class="d-flex">
              					<select name="searchType" id="" class="mr-2">
					                <option value="que_no"
					                <c:if test="${searchType eq 'que_no'}">selected</c:if>
					                >문의 번호</option>
					                <option value="que_title"
					                <c:if test="${searchType eq 'que_title'}">selected</c:if>
					                >문의사항명</option>
					                <option value="member_id"
					                <c:if test="${searchType eq 'member_id'}">selected</c:if>
					                >아이디</option>
					                <option value="memberName"
					                	<c:if test="${searchType eq 'memberName'}">selected</c:if>>이름
					                </option>     
					                <option value="nickname"
					                <c:if test="${searchType eq 'nickname'}">selected</c:if>
					                >닉네임</option>
					            </select>
					        <input name="searchKeyword" id="searchKeyword" type="text"
					        	<c:if test="${not empty searchKeyword}">value="${searchKeyword}"</c:if>
					        >
					        </td>
					        
              			</tr>
              			<tr>
              				<th>기간</th>
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
              				<th>답변 완료 여부</th>
              				<td>
					         	 <label for="allMember"><span class="text-white genderText">전체</span></label>
					        	 <input type="radio" name="answerComplete" id="allMember" value="" class="mr-5"
					         	 	<c:if test="${empty answerComplete or answerComplete==''}">checked</c:if>					        	 
					        	 />
					         	 <label for="blackMember"><span class="text-white genderText">처리 중</span></label>
					        	 <input type="radio" name="answerComplete" id="blackMember" value="N" class="mr-5"
					         	 	<c:if test="${answerComplete eq 'N'}">checked</c:if>
					        	 />
					         	 <label for="nonBlackMember"><span class="text-white genderText">답변 완료</span></label>
					        	 <input type="radio" name="answerComplete" id="nonBlackMember" value="Y"
					         	 	<c:if test="${answerComplete eq 'Y'}">checked</c:if>					        	 
					        	 />              					
              				</td>
              			</tr>

              			
              		</thread>
              	</table>
              

	         
	             <button id="searchBtn" class="btn btn-primary col rounded mt-3 mb-5" ><span class="font-weight-bold">검 색</span></button>
              </form>
            </div>
            <!-- 회원목록 테이블 -->
            <div class="row tm-content-row  mt-5 w-200">
              <table id="table_list" class="table mb-3 mt-1 text-center">
                <thead>
                  <tr>
				      <th class="col-1" scope="col">NO</th>
				      <th class="col-2.5" scope="col">카테고리</th>
				      <th class="col-4" scope="col">제목</th>
				      <th class="col-2" scope="col">작성자</th>
				      <th scope="col-1">날짜</th>
				      <th scope="col-1.5">상태</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="que" items="${list}">
	                <tr onclick="location.href='${pageContext.request.contextPath}/main/qaDetail.do?queNo=${que.queNo}'">
	                	<th>${que.queNo}</th>
	                	<td>${que.queCategory}</td>
	                	<td>
	                	${que.queTitle }
	                	</td>
	                	<td>${que.memberId }</td>
	                	<td><fmt:formatDate value="${que.regDate}" pattern="yy-MM-dd"/> </td>
	                	<td class="answer">
	                		<c:if test="${que.status eq 'false'}">미처리</c:if>
	                		<c:if test="${que.status eq 'true'}"><span style="color: black;"><span style="font-weight: bold; color: #00c403">답변 완료</span></span></c:if>
	                	</td>
	                	
	                </tr>
                </c:forEach>
                  </tr>
                </tbody>
              </table>

              <div style="margin: auto">${pagebar}</div>
            </div>
          </div>
          
        </div>
      </div>

<script>
  function openView(inquiryNo){
    const width = 0;
    const height = 0;
    const x = (screen.availWidth - width) / 2 + screen.availLeft;
    const y = (screen.availHeight - height) / 2 + screen.availTop;
    const url = `${pageContext.request.contextPath}/admin/QnA_Popup.jsp`;
    open(url, 'popup', `width=400, height=400, left=\${x}, top=\${y}`);
  };

  function search2(){
    if($(search1).val() == "category"){
      console.log("카테고리");

      $(searchKeyword).prop("style", "display: none");
      $(selectCategory).prop("style", "display: inline");
      $(selectDate).prop("style", "display: none");

    } else if($(search1).val() == "regDate"){
      console.log("날짜");
      $(selectDate).prop("style", "display: inline-flex; align-items: center; color: white");
      $(searchKeyword).prop("style", "display: none");
      $(selectCategory).prop("style", "display: none");

    } else{
      console.log("카테고리/날짜 제외");
      $(searchKeyword).prop("style", "display: inline");
      $(selectCategory).prop("style", "display: none");
      $(selectDate).prop("style", "display: none");
    }
  }
</script>

<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>