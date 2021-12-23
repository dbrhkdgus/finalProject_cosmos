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
				<li class="tab-link ${type=='application-group'? 'current' : ''}" data-tab="tab-1">신청그룹</li>
				<li class="tab-link ${type=='join-group'? 'current' : ''}" data-tab="tab-2">나의스터디그룹</li>
				<li class="tab-link ${type=='liked-group'? 'current' : ''}" data-tab="tab-3">관심그룹</li>
			</ul>
			
<!--신청그룹 tab  -->

                <div class="member-group-list-outer tab-content ${type=='application-group'? 'current' : ''}" id="tab-1">
                	<div class="membergroup-list d-flex flex-column align-items-center">
		        		<c:choose> 
							<c:when test="${myNotJoinedGroupList == null}">
								<br>
								<p>가입신청한 그룹이 없습니다.</p>
							</c:when> 
							<c:otherwise>
								<br>
								<p>그룹장의 가입 허가를 기다리는 중입니다.</p>
							</c:otherwise> 
						</c:choose> 
		                <c:forEach var="myNJG" items="${myNotJoinedGroupList}">
			               	  <div class="card mb-3" style="max-width: 800px;" onclick="location.href='${pageContext.request.contextPath}/group/groupDetail.do?groupNo=${myNJG.groupNo}'">
			                    <div class="row g-0">
			                      <div class="col-md-4">
				                	<c:forEach var="attach" items="${attachList}">
				                		<c:if test="${(myNJG.groupNo == attach.groupNo) && (attach.imgFlag == 'Y')}">
				                			<img class="img-fluid rounded-start" src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}">
				                		</c:if>
				                	</c:forEach>
			                        
			                      </div>
			                      <div class="col-md-8">
			                        <div class="card-body">
			                        	<c:forEach var="allGroup" items="${groupList}">
					                		<c:if test="${myNJG.groupNo == allGroup.groupNo}">
					                			<h5 class="card-title">${allGroup.groupName}</h5>
					                		</c:if>
				                		</c:forEach>
				                		
				                		<c:forEach var="allGroup" items="${groupList}">
				                			<c:if test="${myNJG.groupNo == allGroup.groupNo}">
						                		<c:forEach var="cate" items="${caOneList}">
							                		<c:if test="${allGroup.categoryNo == cate.category1No}">
							                			<p class="card-text">${cate.category1Name}</p>
							                		</c:if>
						                		</c:forEach>
				                			</c:if>
				                		</c:forEach>
			                          	
			                          <p class="card-text">
			                          	<small class="text-muted">
			                          		<c:choose> 
												<c:when test="${fn:contains(myNJG.role, 'G')}">
													그룹장
												</c:when> 
												<c:when test="${fn:contains(myNJG.role, 'M')}">
													매니져
												</c:when> 
												<c:otherwise>
													일반회원
												</c:otherwise> 
											</c:choose> 
			                          	</small>
			                          </p>
			                        </div>
			                      </div>
			                    </div>
			                  </div>
		                </c:forEach>
	                </div>   
                </div>
<!--나의스터디그룹-->

                <div class="member-group-list-outer tab-content ${type=='join-group'? 'current' : ''}" id="tab-2">
                	<div class="membergroup-list d-flex flex-column align-items-center">
		             	<c:forEach var="myGroup" items="${myGroupList}">
			               	  <div class="card mb-3" style="max-width: 800px;" onclick="location.href='${pageContext.request.contextPath}/group/groupDetail.do?groupNo=${myGroup.groupNo}'">
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
				                		
				                		<c:forEach var="allGroup" items="${groupList}">
				                			<c:if test="${myGroup.groupNo == allGroup.groupNo}">
						                		<c:forEach var="cate" items="${caOneList}">
							                		<c:if test="${allGroup.categoryNo == cate.category1No}">
							                			<p class="card-text">${cate.category1Name}</p>
							                		</c:if>
						                		</c:forEach>
				                			</c:if>
				                		</c:forEach>
			                          	
			                          <p class="card-text">
			                          	<small class="text-muted">
			                          		<c:choose> 
												<c:when test="${fn:contains(myGroup.role, 'G')}">
													그룹장
												</c:when> 
												<c:when test="${fn:contains(myGroup.role, 'M')}">
													매니져
												</c:when> 
												<c:otherwise>
													일반회원
												</c:otherwise> 
											</c:choose> 
			                          	</small>
			                          </p>
			                        </div>
			                        <div>
			                      	  <button>입장하기</button>
			                        </div>
			                      </div>
			                    </div>
			                  </div>
		                </c:forEach>
		                 
			        </div>
			        <div class="membergroup-list d-flex flex-column align-items-center">
	        		<br><br>
	        		<p>관리자 심사 대기중인 그룹입니다.</p>
			        	<c:forEach var="myNAG" items="${myNotAllowedGroupList}">
			               	  <div class="card mb-3" style="max-width: 800px;">
			                    <div class="row g-0">
			                      <div class="col-md-4">
				                	<c:forEach var="attach" items="${attachList}">
				                		<c:if test="${(myNAG.groupNo == attach.groupNo) && (attach.imgFlag == 'Y')}">
				                			<img class="img-fluid rounded-start" src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}">
				                		</c:if>
				                	</c:forEach>
			                        
			                      </div>
			                      <div class="col-md-8">
			                        <div class="card-body">
			                        	<c:forEach var="allGroup" items="${groupList}">
					                		<c:if test="${myNAG.groupNo == allGroup.groupNo}">
					                			<h5 class="card-title">${allGroup.groupName}</h5>
					                		</c:if>
				                		</c:forEach>
				                		
				                		<c:forEach var="allGroup" items="${groupList}">
				                			<c:if test="${myNAG.groupNo == allGroup.groupNo}">
						                		<c:forEach var="cate" items="${caOneList}">
							                		<c:if test="${allGroup.categoryNo == cate.category1No}">
							                			<p class="card-text">${cate.category1Name}</p>
							                		</c:if>
						                		</c:forEach>
				                			</c:if>
				                		</c:forEach>
			                          	
			                          <p class="card-text">
			                          	<small class="text-muted">
			                          		<c:choose> 
												<c:when test="${fn:contains(myNAG.role, 'G')}">
													그룹장
												</c:when> 
												<c:when test="${fn:contains(myNAG.role, 'M')}">
													매니져
												</c:when> 
												<c:otherwise>
													일반회원
												</c:otherwise> 
											</c:choose> 
			                          	</small>
			                          </p>
			                        </div>
			                      </div>
			                    </div>
			                  </div>
		                </c:forEach>
			        </div>
                </div>       
         
<!--관심그룹 tab  -->

                <div class="member-group-list-outer tab-content ${type=='liked-group'? 'current' : ''}" id="tab-3">
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