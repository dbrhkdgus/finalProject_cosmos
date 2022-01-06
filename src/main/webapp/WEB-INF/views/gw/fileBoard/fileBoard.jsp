<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">
    <fmt:requestEncoding value="utf-8"/>
    <jsp:include page="/WEB-INF/views/common/gw_header.jsp">
        <jsp:param value="" name="title"/>
    </jsp:include>
    <sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal" var="loginMember"/>
    </sec:authorize>
    <div class="groupware-saved-outter">
        <div class="groupware-saved-title p-4 mb-4" style="text-align: center; margin-top: 20px; display: flex;
    justify-content: center;" >
            <h3 style="font-weight: bold; background-color:#D7ECFB; width:fit-content;">저장된 항목</h3>
        </div>
        
        <form enctype="multipart/form-data" action="${pageContext.request.contextPath}/gw/fileBoard/fileBoardSearch.do?" method="get">
            <div class="test-board-search float-right d-flex" style="margin-right: 50px;">
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mr-2 ">
   <a href="${pageContext.request.contextPath}/gw/fileBoard/fileEnroll.do?boardNo=${boardNo}&groupNo=${groupNo} "> <button class="btn btn-primary me-md-2" type="button">글쓰기</button></a>
  </div>
  			
                <select name="searchType" class="form-select search-select" id="form-select-search" style="width: 38%;" aria-label="Default select example">
                    <option value="all" ${searchType=='all' ? "selected" :'' }>
                        전체보기</option>
                    <option value="img" ${searchType=='img' ? "selected" :'' }>이미지</option>
                    <option value="document" ${searchType=='document' ? "selected" :'' }>문서</option>
                    <option value="zip" ${searchType=='zip' ? "selected" :'' }>압축파일</option>
                    <option value="code" ${searchType=='code' ? "selected" :'' }>코드파일</option>
                    <option value="etc" ${searchType=='etc' ? "selected" :'' }>기타</option>
                </select>
                <div class="input-group mb-3 search-input">
                    <input type="hidden" name="boardNo" value="${boardNo}"/>
                    <input type="hidden" name="groupNo" value="${groupNo}"/>
                    <input type="text" class="form-control" name="searchKeyword" value="${searchKeyword }" placeholder="작성자 또는 제목검색" aria-describedby="button-addon2">
                        <button class="btn btn-primary">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
             
     		 </div>
            </form>
            
            <div
                class="file-total-div">
                <%-- <c:if test="${not empty fileBoardList}"> --%>
                
                <c:forEach
                    var="post" items="${fileBoardList}" varStatus="status">
                    <%--  <c:set var="count" value="${count + 1}" /> --%>
                    <div class="groupware-saved-card-box mb-4" style="width: 45%; margin-top: 0.7rem!important;">
                        <div class="card" style="box-shadow: 2px 3px 6px #ccc;">
                            <div class="card-header d-flex" style="    justify-content: space-between;">
                            	<div class="left-card-header">
                                <span class="font-weight-bold" style="color:black; font-size:15px;">No.${fn:length(fileBoardList)- status.count+1}</span>
                                <span style="font-size:19px; ">&nbsp;${post.postTitle}</span>
                                </div>
		                                <c:if test="${loginMember.id eq post.memberId}">
		                            <form  action="${pageContext.request.contextPath}/gw/fileBoard/deletefilePost.do?postNo=${post.postNo}" method="GET">
		                              <c:forEach var="attach" items="${attach}" varStatus="status">
		                                      <c:if test="${post.attachNo eq attach.attachNo}">                 
		                                        <button id="fileBoard-delete" style="border:none; background-color: transparent; font-size: 17px;" ><i class="far fa-times-circle"></i></button>
		                                        <input type="hidden" value="${groupNo}" name ="groupNo">
		                                        <input type="hidden" value="${post.postNo}"  name="postNo">
		                                        <input type="hidden" value="${boardNo}" name = "boardNo">                            
		                                        <input type="hidden" value="${attach.attachNo}" name = "attachNo">                            
		                                     </c:if>
		                              </c:forEach>
		                            </form>
		                        </c:if>
                            </div>
                            <div class="card-body">
                                <div class="groupware-saved-inner" >
                                    <div class="groupware-saved-user-name-fileType ml-3">
                                        <c:forEach items="${idnicknameList}" var="list" varStatus="status">
                                            <c:if test="${list.id eq post.memberId}">
                                                <span class="mb-0 font-weight-bold" style="font-size:20px;">${list.nickName}</span>
                                            </c:if>
                                        </c:forEach>
                                <c:forEach var="attach" items="${attach}" varStatus="status">
                                    <c:if test="${post.attachNo eq attach.attachNo}">
                                        <div class="groupware-saved-file-info mt-2" style="height: 70px; margin-left: 50px;">
                                      
                                        <c:if test="  ${post.boardCategoryNo = 5}">
                                        hello
                                        </c:if>
                                        	<!--이미지5 문서6 압축파일7 코드8 기타9  -->
                                        	<c:choose>
                                        		<c:when test="${fn:contains(post.boardCategoryNo , 5 )} ">
                                           			<img alt="" src="https://i.ibb.co/bBL0yKW/img-514.png" class="file-board-icon">
                                        		</c:when>
                                        		<c:when test="${fn:contains(post.boardCategoryNo , 6 )} ">
                                           			<img alt="" src="https://i.ibb.co/MR7FWnW/txt-514.png"  class="file-board-icon">
                                        		</c:when>
                                        		<c:when test="${fn:contains(post.boardCategoryNo , 7 )}  ">
                                           			<img alt="" src="https://i.ibb.co/r6pNh1x/zip-514.png"  class="file-board-icon">
                                        		</c:when>
                                        		<c:when test="${fn:contains(post.boardCategoryNo , 8 )} ">
                                           			<img alt="" src="https://i.ibb.co/wR1LyGb/CODE.png"  class="file-board-icon">
                                        		</c:when>
                                        		<c:otherwise>
                                           			<img alt="" src="https://i.ibb.co/XCx31BJ/ETC.png"  class="file-board-icon">
                                        		</c:otherwise>
                                        	</c:choose>
                                            <a href="${pageContext.request.contextPath}/gw/fileBoard/fileDown.do?attachNo=${post.attachNo}">
                                                <p class="mb-0 ml-3">${attach.originalFilename}</p>
                                            </a>
                                        </div>
                                    </c:if>
                                </c:forEach>
                                     </div>
                             
                                </div>
                                        <div class="file-board-card-last" style="display: flex; justify-content: flex-end;">
	                                        <span class="mb-0 ml-1 text-secondary">${post.boardCategory} &nbsp;</span>
	                                        <span class="groupware-istoday"><fmt:formatDate value="${post.postRegDate}" pattern="yy-MM-dd"/></span>
                                     	</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <div class="test-board-pagebar">
                ${pagebar}
            </div>
        </div>
        <script>
            window.addEventListener("load", function () {
                $("#dropdownBoard").removeClass("collapsed");
                $("#board-collapse").addClass("show");
            });
        </script>
        <jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>
    </sec:authorize>