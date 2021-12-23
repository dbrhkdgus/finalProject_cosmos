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
            <h2 class="tm-block-title">승인 대기 목록</h2>
            
            <!-- 그룹목록 테이블 -->
            <div class="row tm-content-row">
              <table class="table mb-3">
                <thead>
                  <tr>
                    <th scope="col">그룹번호</th>
                    <th scope="col">그룹명</th>
                    <th scope="col">그룹장</th>
                    <th scope="col">생성일</th>
                    <th scope="col">카테고리</th>
                    <th scope="col">유/무료</th>
                    <th scope="col">그룹정원</th>
                    <th scope="col">비밀여부</th>
                  </tr>
                </thead>
                <tbody>
	                <c:forEach var="notA" items="${notApprovedAG}">
	                  <tr class="selectOne">
	                    <td>${notA.groupNo}</td>
	                    <c:forEach var="allGroup" items="${groupList}">
	                    	<c:if test="${notA.groupNo == allGroup.groupNo}">
	                    		<td>${allGroup.groupName}</td>
	                    	</c:if>
	                    </c:forEach>
	                    <td>${notA.memberId}</td>
	                    <c:forEach var="allGroup" items="${groupList}">
	                    	<c:if test="${notA.groupNo == allGroup.groupNo}">
	                    		<td><fmt:formatDate value="${allGroup.groupEnrollDate}" pattern="yyyy/MM/dd"/></td>
	                    	</c:if>
	                    </c:forEach>
	                    <c:forEach var="allGroup" items="${groupList}">
                			<c:if test="${notA.groupNo == allGroup.groupNo}">
		                		<c:forEach var="cate" items="${caOneList}">
			                		<c:if test="${allGroup.categoryNo == cate.category1No}">
			                			<td>${cate.category1Name}</td>
			                		</c:if>
		                		</c:forEach>
                			</c:if>
                		</c:forEach>
	                    <c:forEach var="allGroup" items="${groupList}">
	                    	<c:if test="${notA.groupNo == allGroup.groupNo}">
			                    <td>
			                    	<c:choose> 
										<c:when test="${fn:contains(allGroup.groupCharge, 'P')}">
											유료
										</c:when> 
										<c:otherwise>
											무료
										</c:otherwise> 
									</c:choose> 
			                    </td>
			                    <td>${allGroup.groupPool}</td>
			                    
			                    <td>
			                    	<c:choose> 
										<c:when test="${fn:contains(allGroup.groupPrivate, 'L')}">
											비밀그룹
										</c:when> 
										<c:otherwise>
											공개그룹
										</c:otherwise> 
									</c:choose>
			                    </td>
	                    	</c:if>
	                    </c:forEach>
	                  </tr>
	                  
	                </c:forEach>
                </tbody>
              </table>
              <div style="margin: auto">${pagebar}</div>
              
              <!-- <nav aria-label="Page navigation example" style="margin: auto;">
                <ul class="pagination">
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav> -->
            </div>
          </div>
          
        </div>
  
        <!-- row -->
        <div class="row tm-content-row">
          <div class="tm-block-col tm-col-avatar">
            <div class="tm-bg-primary-dark tm-block tm-block-avatar">
              <h2 class="tm-block-title">그룹 프로필 사진</h2>
              <div class="tm-avatar-container">
                <img
                  id="profileImg"
                  src="${pageContext.request.contextPath}/resources/images/avatar.png"
                  alt="Avatar"
                  class="tm-avatar img-fluid mb-4"
                />
                
              </div>
              
            </div>
          </div>
          <div class="tm-block-col tm-col-account-settings">
            <div class="tm-bg-primary-dark tm-block tm-block-settings">
              <h2 class="tm-block-title">모임 정보</h2>
              <form action="${pageContext.request.contextPath}/admin/approveGroup.do?${_csrf.parameterName}=${_csrf.token}" id="frm" class="tm-signup-form row" method="POST" enctype="multipart/form-data">
                <div class="form-group col-lg-12">
                  <input type="hidden" id="groupNo" name="groupNo"/>
                  <label for="groupName">그룹명</label>
                  <input
                    id="groupName"
                    name="groupName"
                    type="text"
                    class="form-control validate"
                    disabled
                  />
                </div>
                
                <div class="form-group col-lg-6">
                  <label for="hostId">그룹장</label>
                  <input
                    id="hostId"
                    name="hostId"
                    type="text"
                    class="form-control validate"
                    disabled
                  />
                </div>
                
                <div class="form-group col-lg-6">
                  <label for="enrollDate">생성일</label>
                  <input
                    id="enrollDate"
                    name="enrollDate"
                    type="date"
                    class="form-control validate"
                    disabled
                  />
                </div>
                
                <div class="form-group col-lg-6">
                  <label for="category">카테고리</label>
                  <input
                    id="category"
                    name="category"
                    class="form-control validate"
                    disabled
                  />
                </div>

                <div class="form-group col-lg-6">
                  <label for="groupCharge">유/무료</label>
                  <input
                    id="groupCharge"
                    name="groupCharge"
                    class="form-control validate"
                    disabled
                  />
                </div>
                                
                <div class="form-group col-lg-6">
                  <label for="groupPool">그룹정원</label>
                  <input
                    id="groupPool"
                    name="groupPool"
                    class="form-control validate"
                    disabled
                  />
                </div>
                
                <div class="form-group col-lg-6">
                  <label for="groupPrivate">비밀여부</label>
                  <input
                    id="groupPrivate"
                    name="groupPrivate"
                    class="form-control validate"
                    disabled
                  />
                </div>
                
                <div class="form-group col-lg-6">
                  <label class="tm-hide-sm">&nbsp;</label>
                  <button
                  	id=""
                    type="button"
                    onclick="document.getElementById('frm').submit();"
                    class="btn btn-primary btn-block text-uppercase"
                    
                  >승인하기
                  </button>
                </div>
                <div class="form-group col-lg-6">
                  <label class="tm-hide-sm">&nbsp;</label>
                  <button
                    id="blackListBtn"
                    type="button"
                    class="btn btn-danger btn-block text-uppercase"
                  >
                      거절하기
                  </button>
                </div>
              </form>
          </div>
        </div>
      </div>
<script>      
/*클릭한 그룹 정보 불러오기*/
$(".selectOne").click((e)=>{
	
	/* 테이블 내 그룹 데이터 담긴 행을 클릭시, 해당 행 그룹 데이터를 비동기로 호출한다. */
	var notApprovedG = e.target.parentNode.children[0].innerText;
	
	$.ajax({
		url: `${pageContext.request.contextPath}/admin/selectOneNAG.do`,
		data: {
			groupNo: notApprovedG
		},
		dataType: "json",
		success: function(data){
			console.log(data);
			console.log(data.nag.groupName);
			$("#groupNo").val(data.nag.groupNo);
			$("#groupName").val(data.nag.groupName);
			$("#hostId").val(data.nag.hostId);
			$("#enrollDate").val(data.nag.groupEnrollDate);
			$("#category").val(data.nag.category1Name);
			if(data.nag.groupCharge == "P"){
				$("#groupCharge").val("유료")
			}else{
				$("#groupCharge").val("무료")
			}
			$("#groupPool").val(data.nag.groupPool);
			if(data.nag.groupPrivate == "L"){
				$("#groupPrivate").val("비밀그룹")
			}else{
				$("#groupPrivate").val("공개그룹")
			}

			/* 비동기로 이미지 불러오기 */
			document.getElementById('profileImg').src = `${pageContext.request.contextPath}/resources/upFile/group/`+data.nag.renamedFilename;
			
		},
		error: console.log
	});
});
</script>
<jsp:include page="/WEB-INF/views/common/ad_footer.jsp">
	<jsp:param value="COSMOS" name="title"/>
</jsp:include>