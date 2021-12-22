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
        	<ul class="tabs my-group-list">
				<li class="tab-link current" data-tab="tab-1">신청그룹</li>
				<li class="tab-link" data-tab="tab-2">나의스터디그룹</li>
				<li class="tab-link" data-tab="tab-3">관심그룹</li>
			</ul>
			
<!--신청그룹 tab  -->

                <div class="member-group-list-outer tab-content current" id="tab-1">
                	<div class="membergroup-list d-flex flex-column align-items-center">
	                	<p>신청그룹 탭</p>
		                <c:forEach var="myGroup" items="${myGroupList}">
			               	  <div class="card mb-3" style="max-width: 800px;">
			                    <div class="row g-0">
			                      <div class="col-md-4">
				                	<c:forEach var="attach" items="${attachList}">
				                		<c:if test="${(myGroup.groupNo == attach.groupNo) && (attach.imgFlag == 'Y')}">
				                			<img class="img-fluid rounded-start" src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}">
				                		</c:if>
				                	</c:forEach>
			                        
			                      </div>
			                      <div class="col-md-8">
			                        <div class="card-body">
			                        	<c:forEach var="allGroup" items="${groupList}">
					                		<c:if test="${myGroup.groupNo == allGroup.groupNo}">
					                			<h5 class="card-title">${allGroup.groupName}</h5>
					                		</c:if>
				                		</c:forEach>
			                          	<%-- <c:forEach var="cate1" items="${caOneList}">
					                		<c:if test="${myGroup.groupNo == allGroup.groupNo}">
					                			<h5 class="card-title">${allGroup.groupName}</h5>
					                		</c:if>
				                		</c:forEach> --%>
			                          <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			                          <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
			                        </div>
			                      </div>
			                    </div>
			                  </div>
		                </c:forEach> 
	                </div>   
                </div>
<!--나의스터디그룹-->

                <div class="member-group-list-outer tab-content" id="tab-2">
                	<div class="membergroup-list d-flex flex-column align-items-center">
		                <p>나의스터디그룹 탭</p>
			                <c:forEach var="myGroup" items="${myGroupList}">
				               	  <div class="card mb-3" style="max-width: 800px;">
				                    <div class="row g-0">
				                      <div class="col-md-4">
					                	<c:forEach var="attach" items="${attachList}">
					                		<c:if test="${(myGroup.groupNo == attach.groupNo) && (attach.imgFlag == 'Y')}">
					                			<img class="img-fluid rounded-start" src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}">
					                		</c:if>
					                	</c:forEach>
				                        
				                      </div>
				                      <div class="col-md-8">
				                        <div class="card-body">
				                        	<c:forEach var="allGroup" items="${groupList}">
						                		<c:if test="${myGroup.groupNo == allGroup.groupNo}">
						                			<h5 class="card-title">${allGroup.groupName}</h5>
						                		</c:if>
					                		</c:forEach>
				                          	<%-- <c:forEach var="cate1" items="${caOneList}">
						                		<c:if test="${myGroup.groupNo == allGroup.groupNo}">
						                			<h5 class="card-title">${allGroup.groupName}</h5>
						                		</c:if>
					                		</c:forEach> --%>
				                          <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				                          <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
				                        </div>
				                      </div>
				                    </div>
				                  </div>
			                </c:forEach>    
			          </div>  
                </div>       
         
<!--관심그룹 tab  -->

                <div class="member-group-list-outer tab-content" id="tab-3">
                	<div class="membergroup-list d-flex flex-column align-items-center">
		                <p>관심그룹 탭</p>
			                <c:forEach var="myGroup" items="${myGroupList}">
				               	  <div class="card mb-3" style="max-width: 800px;">
				                    <div class="row g-0">
				                      <div class="col-md-4">
					                	<c:forEach var="attach" items="${attachList}">
					                		<c:if test="${(myGroup.groupNo == attach.groupNo) && (attach.imgFlag == 'Y')}">
					                			<img class="img-fluid rounded-start" src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}">
					                		</c:if>
					                	</c:forEach>
				                        
				                      </div>
				                      <div class="col-md-8">
				                        <div class="card-body">
				                        	<c:forEach var="allGroup" items="${groupList}">
						                		<c:if test="${myGroup.groupNo == allGroup.groupNo}">
						                			<h5 class="card-title">${allGroup.groupName}</h5>
						                		</c:if>
					                		</c:forEach>
				                          	<%-- <c:forEach var="cate1" items="${caOneList}">
						                		<c:if test="${myGroup.groupNo == allGroup.groupNo}">
						                			<h5 class="card-title">${allGroup.groupName}</h5>
						                		</c:if>
					                		</c:forEach> --%>
				                          <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				                          <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
				                        </div>
				                      </div>
				                    </div>
				                  </div>
			                </c:forEach>
			         </div>           
                </div>
            </div>
<script>
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>