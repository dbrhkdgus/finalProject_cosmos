<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<style>
@import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css');

*,
*:after,
*:before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.clearfix:before,
.clearfix:after {
	content: " ";
	display: table;
}

.clearfix:after {
	clear: both;
}


h1 {
	color: #ccc;
	text-align: center;
}

a {
  color: #ccc;
  text-decoration: none;
  outline: none;
}

/*Fun begins*/
.tab_container {
	width: 90%;
	margin: 0 auto;
	position: relative;
	background: #f6f9fa;
}

.tab-input, section {
  clear: both;
  padding-top: 10px;
  display: none;
}

.tab-label {
  font-weight: 700;
  font-size: 15px;
  display: block;
  float: left;
  width: 33.3%;
  padding: 1.5em;
  color: #757575;
  cursor: pointer;
  text-decoration: none;
  text-align: center;
  background: #f0f0f0;
}

#tab1:checked ~ #content1,
#tab2:checked ~ #content2,
#tab3:checked ~ #content3 {
  display: block;
  padding: 20px;
  background: #fff;
  color: #999;
  border-bottom: 2px solid #f0f0f0;
}

.tab_container .tab-content p,
.tab_container .tab-content h3 {
  -webkit-animation: fadeInScale 0.7s ease-in-out;
  -moz-animation: fadeInScale 0.7s ease-in-out;
  animation: fadeInScale 0.7s ease-in-out;
}
.tab_container .tab-content h3  {
  text-align: center;
}

.tab_container [id^="tab"]:checked + label {
  background: #fff;
  box-shadow: inset 0 3px #5288F2;
}

.tab_container [id^="tab"]:checked + label .fa {
  color: #5288F2;
}

.tab-label .fa {
  font-size: 1.3em;
  margin: 0 0.4em 0 0;
}

/*Media query*/
@media only screen and (max-width: 900px) {
  label span {
    display: none;
  }
  
  .tab_container {
    width: 98%;
  }
}

/*Content Animation*/
@keyframes fadeInScale {
  0% {
  	transform: scale(0.9);
  	opacity: 0;
  }
  
  100% {
  	transform: scale(1);
  	opacity: 1;
  }
}

.no_wrap {
  text-align:center;
  color: #5288F2;
}
.link {
  text-align:center;
}



</style>
        	<div class="tab_container">
        	
				<input class="tab-input" id="tab1" type="radio" name="tabs" ${type=='application-group'? 'checked' : ''}>
				<label class="tab-label" for="tab1"><i class="fa fa-spinner"></i><span>?????? ??????</span></label>
	
				<input class="tab-input" id="tab2" type="radio" name="tabs" ${type=='join-group'? 'checked' : ''}>
				<label class="tab-label" for="tab2"><i class="fa fa-pencil-square-o"></i><span>?????? ??????</span></label>
	
				<input class="tab-input" id="tab3" type="radio" name="tabs" ${type=='liked-group'? 'checked' : ''}>
				<label class="tab-label" for="tab3"><i class="fa fa-hand-holding-heart"></i><span>?????? ??????</span></label>



			<section id="content1" class="tab-content">
                <div class="member-group-list-outer tab-content ${type=='application-group'? 'current' : ''}" id="tab-1">
                	<div class="membergroup-list d-flex flex-column align-items-center">
		        		<c:choose> 
							<c:when test="${empty myNotJoinedGroupList}">
								<br>
								<p>??????????????? ????????? ????????????.</p>
							</c:when> 
							<c:otherwise>
								<br>
								<p>???????????? ?????? ????????? ???????????? ????????????.</p>
							</c:otherwise> 
						</c:choose> 
		                <c:forEach var="myNJG" items="${myNotJoinedGroupList}">
			               	  <div class="card mb-3" style="width: 500px;" onclick="location.href='${pageContext.request.contextPath}/group/groupDetail.do?groupNo=${myNJG.groupNo}'">
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
													?????????
												</c:when> 
												<c:when test="${fn:contains(myNJG.role, 'M')}">
													?????????
												</c:when> 
												<c:otherwise>
													????????????
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
			</section>

			<section id="content2" class="tab-content">
				<div class="member-group-list-outer tab-content ${type=='join-group'? 'current' : ''}" id="tab-2">
                	<div class="membergroup-list d-flex flex-column align-items-center">
		             	<c:forEach var="myGroup" items="${myGroupList}">
			               	  <div class="card mb-3" style="max-width: 500px;" >
			                    <div class="row g-0">
			                      <div class="col-md-4">
				                	<c:forEach var="attach" items="${attachList}">
				                		<c:if test="${(myGroup.groupNo == attach.groupNo) && (attach.imgFlag == 'Y')}">
				                			<img class="img-fluid rounded-start" src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}" onclick="location.href='${pageContext.request.contextPath}/group/groupDetail.do?groupNo=${myGroup.groupNo}'">
				                		</c:if>
				                	</c:forEach>
			                        
			                      </div>
			                      <div class="col-md-8">
			                        <div class="card-body" onclick="location.href='${pageContext.request.contextPath}/group/groupDetail.do?groupNo=${myGroup.groupNo}'">
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
													?????????
												</c:when> 
												<c:when test="${fn:contains(myGroup.role, 'M')}">
													?????????
												</c:when> 
												<c:otherwise>
													????????????
												</c:otherwise> 
											</c:choose> 
			                          	</small>
			                          </p>
			                        </div>
			                        <div>
			                        <button onclick="location.href='${pageContext.request.contextPath}/gw/gw.do?groupNo=${myGroup.groupNo }'" class="btn btn-outline-primary" style="float:right;">????????????</button>
			                      	  <%-- <button onclick="location.href='${pageContext.request.contextPath}/gw/gw.do?groupNo=${myGroup.groupNo }'">????????????</button> --%>
			                        </div>
			                      </div>
			                    </div>
			                  </div>
		                </c:forEach>
		                 
			        </div>
			        <div class="membergroup-list d-flex flex-column align-items-center">
	        		<c:if test="${empty myGroupList}">
		                	<div class="membergroup-list d-flex flex-column align-items-center">
			                	<p style="margin-top: 20%">????????? ????????? ????????????.</p>
			                </div>
		            </c:if>
	        		
			        	<c:forEach var="myNAG" items="${myNotAllowedGroupList}">
			        	<hr style="width: 100%;" />
			        		<p>????????? ?????? ???????????? ???????????????.</p>
			               	  <div class="card mb-3" style="max-width:500px;">
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
													?????????
												</c:when> 
												<c:when test="${fn:contains(myNAG.role, 'M')}">
													?????????
												</c:when> 
												<c:otherwise>
													????????????
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
			</section>

			<section id="content3" class="tab-content">
			<div class="member-group-list-outter tab-content" id="tab-3">
                	<div class="membergroup-list d-flex flex-column align-items-center">
		                <c:forEach var="myIntergroup" items="${myInterestedGroupList}">
			               	  <div class="card mb-3" style="width: 500px;">
			                    <div class="row g-0">
			                      <div class="col-md-4">
				                	<c:forEach var="attach" items="${attachList}">
				                		<c:if test="${(myIntergroup.groupNo eq attach.groupNo) && (attach.imgFlag eq 'Y')}">
				                			<img class="img-fluid rounded-start" src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}" onclick="location.href='${pageContext.request.contextPath}/group/groupDetail.do?groupNo=${myIntergroup.groupNo}'">
				                		</c:if>
				                	</c:forEach>
			                        
			                      </div>
			                       <div class="col-md-8">
			                        <div class="card-body">
				                        <div class="sect01">
		  									<div class="line-box">
		   								
		 									   <button type="button" class="btn-close" aria-label="Close" style="float:right"></button>
		  									</div>
										</div>
										
			               
			                        	<c:forEach var="allGroup" items="${groupList}">
					                		<c:if test="${myIntergroup.groupNo eq allGroup.groupNo}">
					                			<h5 class="card-title">${allGroup.groupName}</h5>
 									   			<input type="hidden" class="groupNo" value="${allGroup.groupNo}" />
					               
					                		</c:if>
					                		
				                		</c:forEach>
				                		
				                		<c:forEach var="allGroup" items="${groupList}">
				                			
				                			
				                			<c:if test="${myIntergroup.groupNo eq allGroup.groupNo}">
						                		<c:forEach var="cate" items="${caOneList}">
							                		<c:if test="${allGroup.categoryNo eq cate.category1No}">
							                			<p class="card-text">${cate.category1Name}</p>
							                		</c:if>
						                		</c:forEach>
				                			</c:if>
				                				
				                		</c:forEach>
              						    
			                        </div>
			                      </div>
			                    </div>
			                  </div>
		                    </c:forEach>
		                </div>
		                <c:if test="${empty myInterestedGroupList}">
			                <div class="membergroup-list d-flex flex-column align-items-center">
			                	<p style="margin-top: 2%">?????? ????????? ????????????.</p>
			                </div>
		                </c:if>
	                </div>   
			</section>
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

$(".btn-close").click((e)=>{
	$.ajax({
		url:"${pageContext.request.contextPath}/member/delete.do",
		type:'POST',
		data:{
			groupNo: $(e.target).parent().parent().siblings("input").val()
		},
		headers: {
            "${_csrf.headerName}" : "${_csrf.token}"
     	},
		success(data){
			console.log(data);
			alert(`\${data.msg}`);
			
		},
		error(xhr){
			location.reload();
		}
	}); 
	
	
	
});

</script>
			

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>         
