<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="그룹 검색" name="title"/>
</jsp:include>
		<!-- Page header with logo and tagline-->
        <!-- Page content-->
        <div class="container">
            <div class="search-parent-category">
                <ul class="nav nav-tabs">
                    <li class="nav-item" style="margin: 0;">
                      <a class="nav-link active" aria-current="page" href="#">ALL</a>
                    </li>
                    <li class="nav-item" style="margin: 0;">
                      <a class="nav-link" href="#">웹개발</a>
                    </li>
                    <li class="nav-item" style="margin: 0;">
                      <a class="nav-link" href="#">프론트엔드</a>
                    </li>
                    <li class="nav-item" style="margin: 0;">
                      <a class="nav-link href="#">백엔드</a>
                    </li>
                    <li class="nav-item" style="margin: 0;">
                        <a class="nav-link href="#">풀스택</a>
                      </li>
                      <li class="nav-item" style="margin: 0;">
                        <a class="nav-link href="#">모바일 앱 개발</a>
                      </li>
                      <li class="nav-item" style="margin: 0;">
                        <a class="nav-link href="#">프로그래밍 언어</a>
                      </li>
                      <li class="nav-item" style="margin: 0;">
                        <a class="nav-link href="#">알고리즘</a>
                      </li>
                      <li class="nav-item" style="margin: 0;">
                        <a class="nav-link href="#">데이터베이스</a>
                      </li>
                       <li class="nav-item" style="margin: 0;">
                        <a class="nav-link href="#">게임개발</a>
                      </li>
                  
                  </ul>
            </div>
            <div class="search-child-category">
                 <ul class="child-category-all">
                    <li><a href="">웹개발</a></li>
                    <li><a href="">프론트엔드</a></li>
                    <li><a href="">백엔드</a></li>
                    <li><a href="">풀스택</a></li>
                    <li><a href="">모바일 앱 개발</a></li>
                    <li><a href="">프로그래밍 언어</a></li>
                    <li><a href="">알고리즘</a></li>
                    <li><a href="">데이터베이스</a></li>
                </ul> 
            </div>
            <hr style="height: 0.5px; color: #8B6AD3; margin-bottom: 50px;">
            <div class="search-outer">
                <!-- 서치 메뉴 정렬및 검색기능  -->
                <div class="search-outer-top">
                    
                    <div class="search-outer-top left">
                    <p style="margin-bottom:20px;" id="class-amount">100개의 클래스</p>
                    <sec:authorize access="isAuthenticated()">
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/group/groupEnroll.do';">그룹 생성</button>
                    </sec:authorize>
                    </div>
                    
                    <div class="search-outer-top right">
                    <select class="form-select search-select" aria-label="Default select example">
                      <option selected>Open this select menu</option>
                      <option value="1">One</option>
                      <option value="2">Two</option>
                      <option value="3">Three</option>
                    </select>
                    <div class="input-group mb-3 search-input">
                        <input type="text" class="form-control" placeholder="강의를 찾아보세요"  aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
                      </div>
                    </div>
                      
                </div>

                <!-- Blog entries-->
                  <div class="col-lg-8" style="display: contents;">
                    
                    <!-- Nested row for non-featured blog posts-->
                    <div class="search-outer">
                    <c:forEach var="group" items="${groupList }" varStatus="vs">
						
	                    	<c:if test="${vs.count %3 == 1}">
	                        	<div class="search-inner">
	                    	</c:if> 
	                            <!-- Blog post-->
									<div class="card mb-4 search-card">
		                                <a href="${pageContext.request.contextPath}/group/groupDetail.do?groupNo=${group.groupNo}">
		                                <c:forEach var="attach" items="${attachList }">
			                                <c:if test="${group.groupNo == attach.groupNo }">
			                                	<img class="card-img-top" src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}"
			                                        alt="..." />
			                                </c:if>
			                                </c:forEach>
		                                </a>
		                                <div class="card-body">
		                                    <div class="small text-muted">${group.groupEnrollDate }</div>
		                                    <h2 class="card-title h4">${group.groupName }</h2>
		                                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque,
		                                        nulla.</p>
		                                    <a class="btn btn-primary" href="#!">Read more →</a>
		                                </div>
		                            </div>
							<c:if test="${vs.count %3 == 0}">
	                       		</div>
	                    	</c:if>
						
						
                        
                    </c:forEach>

                            
                        </div>




                            
                        </div>
                    </div>
                    ${pagebar }
                </div>
            </div>
        </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

