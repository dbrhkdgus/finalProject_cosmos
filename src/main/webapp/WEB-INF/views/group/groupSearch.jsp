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
                      <a class="nav-link ${ca1No == 0 ? 'active':'' }" aria-current="page" href="${pageContext.request.contextPath }/group/groupSearch.do">ALL</a>
                    </li>
                <c:forEach var="c1" items="${caOneList }">
                    <li class="nav-item" style="margin: 0;">
                      <a class="nav-link ${ca1No == c1.category1No ? 'active':'' }" aria-current="page" href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=${c1.category1No}">
                     	<input type="hidden" value="${c1.category1No }" />
                     	${c1.category1Name }
                      </a>
                      
                    </li>
                </c:forEach>
                  </ul>
            </div>
            <div class="search-child-category">
                 <ul class="child-category-all" id="c2">
                    <c:if test="${ca2NoList != null }">
                    	<c:forEach var="ca2" items="${ca2NoList }"> 
                    		<li><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=${ca1No}&ca2No=${ca2.category2No}">${ca2.category2Name}</a></li>
                    	</c:forEach>
                    </c:if>
                </ul> 
            </div>
            <hr style="height: 0.5px; color: #8B6AD3; margin-bottom: 50px;">
            <div class="search-outer">
                <!-- 서치 메뉴 정렬및 검색기능  -->
                <div class="search-outer-top">
	                    <div class="search-outer-top left">
		                    <p style="margin-bottom:20px;" id="class-amount">${totalContent }개의 클래스</p>
		                    <sec:authorize access="isAuthenticated()">
		                    	<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/group/groupEnroll.do';">그룹 생성</button>
	                    	</sec:authorize>
	                    </div>
	                    
		                <form action="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=${ca1No}&ca2No=${ca2No}" method="get">
	                    <div class="search-outer-top right">
	       
		                    <select name="searchType" class="form-select search-select" aria-label="Default select example">
		                      <option value="groupName" ${searchType == 'groupName' ? "selected":'' }>스터디 그룹명 검색 </option>
		                      <option value="location" ${searchType == 'location' ? "selected":'' }>스터디 지역 검색</option>
		                      <option value="pop" ${searchType == 'pop' ? "selected":'' }>인기순으로 보기</option>
		                      <option value="new" ${searchType == 'new' ? "selected":'' }>최신 그룹순으로 보기</option>
		                    </select>
		                    <div class="input-group mb-3 search-input">
		                        <input type="text" class="form-control" name="searchKeyword" value="${searchKeyword }" placeholder="스터디그룹을 찾아보세요"  aria-describedby="button-addon2">
		                        <button class="btn btn-outline-secondary" type="button" id="button-addon2" >검색</button>
		                      </div>
              		      </form>
	                    </div>
                      
                </div>
                <c:choose>
				<c:when test="${not empty groupList}">
                <!-- Blog entries-->
                  <div class="col-lg-8" style="display: contents;">
                    
                    <!-- Nested row for non-featured blog posts-->
                    <div class="search-outer">
                    <c:forEach var="group" items="${groupList }" varStatus="vs">
							
	                    	<c:if test="${vs.count %3 == 1}">
	                        	<div class="search-inner">
	                    	</c:if> 
	                            <!-- Blog post-->
									<div class="card mb-4 search-card" style="width: 350px; height: 460px;">
		                                <a href="${pageContext.request.contextPath}/group/groupDetail.do?groupNo=${group.groupNo}">
		                                <c:forEach var="attach" items="${attachList }">
			                                <c:if test="${group.groupNo == attach.groupNo }">
			                                	<img class="card-img-top" 
			                                	style = "width: 348px; height: 300px;"
			                                	src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}"
			                                        alt="..." />
			                                </c:if>
			                                </c:forEach>
		                                </a>
		                                <div class="search-card-body card-body">
		                                    <div class="small text-muted">${group.groupEnrollDate }</div>
		                                    <h2 class="card-title h4" style="margin: 0.5rem 0 0.5rem 0;">${group.groupName }</h2>
		                                     <c:forEach var="gi" items="${giList }">
			                                <c:if test="${group.groupNo == gi.groupNo }">
			                                	<p class="card-text" style="margin-bottom: 5px;">${gi.giTitle }</p>
			                                </c:if>
			                                </c:forEach>
								<div class="search-inner-button">
									<a class="btn btn-primary d-inline" id="search-more-btn"
										href="${pageContext.request.contextPath}/group/groupDetail.do?groupNo=${group.groupNo}">
										더보기→</a>
		                                <!--좋아요 기능구현 해보는중  -->
									<div class="like-button-outer">
										<sec:authorize access="isAnonymous()">
											<i class="far fa-heart" data-group-no="${group.groupNo }"><span>${group.groupLikeCount }</span></i>
										</sec:authorize>
										<sec:authorize access="isAuthenticated()">
											<i class="fas fa-heart" data-group-no="${group.groupNo }"><span>${group.groupLikeCount }</span></i>
										</sec:authorize>
									</div>
								</div>
							</div>
						</div>
							<c:if test="${vs.count %3 == 0}">
	                       		</div>
	                    	</c:if>
						
						
                        
                    </c:forEach>

                            
                        </div>
					</c:when>
					<c:otherwise>
						아무고토 없음
					</c:otherwise>

                </c:choose>


                            
                        </div>
                    </div>
                    ${pagebar }
                </div>
            </div>
        </div>
 <script>
 $("#button-addon2").click((e)=>{
	 const searchType = $("select[name=searchType]").val();

	 const searchKeyword = $("input[name=searchKeyword]").val();
	location.href=`${pageContext.request.contextPath}/group/groupSearch.do?ca1No=${ca1No}&ca2No=${ca2No}&searchType=\${searchType}&searchKeyword=\${searchKeyword}`; 
 });
/*  $("li",".search-parent-category").click((e)=>{ */
/* 	  console.log($(e.target).parent().siblings());  */
/*  	 $(e.target).parent().siblings().children("a").removeClass("active"); 
	 $(e.target).addClass("active");
	const data = $(e.target).children("input").val();
	$.ajax({
		url : `${pageContext.request.contextPath}/group/category2Search?${_csrf.parameterName}=${_csrf.token}`,
		data : {ca1No : data},
		method : "get",
		dataType : "json",
		success(res){
			console.log(res);
			$(c2).html("");
			$.each(res, (k,v) =>{
			$(c2).append( `<li><a href="${pageContext.request.contextPath}/group/groupSearch.do?ca1No=\${data}&ca2No=\${k}">\${v}</a></li>`);
				
			});
		},
		error(xhr,textStatus,err){
			console.log
		}
	}); */
<%-- 	$.ajax({
		url:"<%= request.getContextPath() %>/group/groupCategoryTwo.do?${_csrf.parameterName}=${_csrf.token}",
		method: "GET",
		dataType: "json",
		data: {categoryOneNo : $(this).val()},
		success(data){
			const $CATETWOdiv = $(`<div class="group-text-input">`);
			$.each(data, (k, v) => {
				let html = `<div class="form-check form-check-inline"><input class="form-check-input" type="checkbox" name="cateCheckBox" id="inlineCheckbox\${k}" value=\${k}><label class="form-check-label" for="inlineCheckbox\${k}">\${v}</label></div>`;
				$CATETWOdiv.append(html);
			});
				$CATETWOdiv.append(`</div>`);
			$("#sCate").html($CATETWOdiv);
		},
		error(xhr,textStatus,err){
			console.log(xhr,textStatus,err);
		}
	}); --%>
/*  }); */
 /* 좋아요 버튼 클릭시 사용자 좋아요 여부에 따른 버튼 이벤트 */
	$(".fa-heart").click((e)=>{

		let $target = $(e.target);
		let $groupNo = $target.data("groupNo");
		
		$.ajax({
			url: `${pageContext.request.contextPath}/group/groupLikeSearch.do`,
			dataType: "json",
			type: "GET",
			data: {'groupNo' : $groupNo},
			success(jsonStr){
				console.log(jsonStr);
				const likeValid = jsonStr["likeValid"];
				const likeCnt = jsonStr["likeCnt"];
				//member 본인의 likeValid가 1이라면 속이 찬 하트, 0이면 속이 빈 하트
				if(likeValid == 1){
					$target
						.removeClass("far")
						.addClass("fas");
				}else{
					$target
						.removeClass("fas")
						.addClass("far");
				}
				$target.html(`<span>\${likeCnt}</span>`);
			},
			error(xhr, textStatus, err){
                console.log(xhr, textStatus, err);
                    alert("로그인후 이용가능합니다");
            }
		});
	});
	
 </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

