<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>

        <div class="container" >
                <div class="my-group-list">
                        <a href="" style="color: #000;"><h2>신청그룹</h2></a>
                        <a href="" style="color: #000;"><h2>나의스터디그룹</h2></a>
                        <a href="" style="color: #000;"><h2>관심그룹</h2></a>
            </div>
                    

                <div class="member-group-list-outer">
	                <c:forEach var="myGroup" items="${myGroupList}">
		               	  <div class="card mb-3" style="max-width: 800px;">
		                    <div class="row g-0">
		                      <div class="col-md-4">
			                	<c:forEach var="attach" items="${attachList }">
			                		<c:if test="${(myGroup.groupNo == attach.groupNo) && (attach.imgFlag == 'Y')}">
			                			<img class="img-fluid rounded-start" src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}">
			                		</c:if>
			                	</c:forEach>
		                        
		                      </div>
		                      <div class="col-md-8">
		                        <div class="card-body">
		                          <h5 class="card-title">Card title</h5>
		                          <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
		                          <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
		                        </div>
		                      </div>
		                    </div>
		                  </div>
	                </c:forEach>

                  

                  
                </div>
            </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
