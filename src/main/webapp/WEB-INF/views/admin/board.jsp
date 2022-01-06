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
              <select class="custom-select selectBar mr-1" id="selectTagGroupNo">
                <option value="All">전체 그룹</option>
                <c:forEach var="group" items="${groupList }">
                <option value="${group.groupNo }" <c:if test="${groupNo eq group.groupNo}">selected</c:if>>${group.groupName }</option>
                </c:forEach>
              </select>
              <select class="custom-select selectBar mr-1" id="selectTagBoardType">
                <option value="All">게시판 전체</option>
                <c:forEach var="type" items="${adminBoardTypeList }">
                <option value="${type.boardType }"<c:if test="${boardType eq type.boardType}">selected</c:if>>${type.boardTypeName }</option>
                </c:forEach>
              </select>
              
              <select class="custom-select selectBar mr-1" id="selectTagInputSearchType">
                <option value="All"<c:if test="${searchType eq 'All'}">selected</c:if>>전체</option>
                <option value="ById"<c:if test="${searchType eq 'ById'}">selected</c:if>>작성자Id</option>
                <option value="ByTitle"<c:if test="${searchType eq 'ByTitle'}">selected</c:if>>제목</option>
              </select>
              <input id="searchKeyword"  type="<c:if test="${not empty searchKeyword}">text</c:if><c:if test="${empty searchKeyword}">hidden</c:if>" class="form-control mb-5 mr-3 col-3" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="<c:if test="${not empty searchKeyword}">${searchKeyword}</c:if>">
              <button class="btn btn-primary" type="button" style="border-radius: 5%; border-color: cornflowerblue; background-color: cornflowerblue;" onclick="submitValueCheck();">검색</button>
            </div>
            <br />
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
                  </tr>
                </thead>
                <tbody>
                  <!--해당 페이지에서 뭔가 조치를 취하기 보다는 클릭시 해당 게시물로 바로 이동 -->
                  <c:forEach var="list" items="${adminBoardList }">
	                  <tr>
	                    <td>${list.postNo }</td>
	                    <td>${list.boardName }</td>
	                    <td>${list.boardTypeName }</td>
	                    <td>${list.nickname }</td>
	                    <c:if test="${list.boardType eq 'A'}">
	                    <td><a href="${pageContext.request.contextPath}/gw/board/anonymousDetail.do?postNo=${list.postNo}" style="color:white;">${list.postTitle }</a></td>
	                    </c:if>
	                    <c:if test="${list.boardType eq 'F'}">
	                    <td><a href="${pageContext.request.contextPath}/gw/fileBoard/fileBoard.do?boardNo=${list.boardNo}&groupNo=${list.groupNo}" style="color:white;">${list.postTitle }</a></td>
	                    </c:if>
	                    <c:if test="${list.boardType eq 'N' || list.boardType eq 'B'}">
	                    <td><a href="${pageContext.request.contextPath}/gw/board/boardDetail.do?postNo=${list.postNo}" style="color:white;">${list.postTitle }</a></td>
	                    </c:if>
	                    <td><fmt:formatDate value="${list.postRegDate }" pattern="yyyy-MM-dd"/></td>
	                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <div style="margin: auto">${pagebar}</div>
          </div>
          
        </div>
  

      </div>
<script>
$(() => {
	$("select[id=selectTagInputSearchType]").change((e)=>{
		const $value = $("#selectTagInputSearchType option:selected").val();
		if($value == 'All'){
			$('#searchKeyword').attr('type', 'hidden');
			$('#searchKeyword').val('');
		}else{
			$('#searchKeyword').attr('type', 'text');	
		}
	});
});

function submitValueCheck(){
	const groupNoValue = $("#selectTagGroupNo option:selected").val();
	const boardTypeValue = $("#selectTagBoardType option:selected").val();
	const searchTypeValue = $("#selectTagInputSearchType option:selected").val();
	const searchKeywordValue = $("#searchKeyword").val();
	console.log(groupNoValue);
	console.log(boardTypeValue);
	console.log(searchTypeValue);
	console.log(searchKeywordValue);
	if(searchTypeValue != 'All' && searchKeywordValue == ''){
		alert("검색어를 입력해야 합니다.");
		$("#searchKeyword").focus();
		return;
	}
	console.log('allpass');
	location.href=`${pageContext.request.contextPath}/admin/searchBoard.do?groupNo=`+groupNoValue+`&boardType=`+boardTypeValue+`&searchType=`+searchTypeValue+`&searchKeyword=`+searchKeywordValue;
	
};

</script>

<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>