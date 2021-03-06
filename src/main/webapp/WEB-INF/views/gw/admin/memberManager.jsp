<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MANAGER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>

<style>
button {
  padding: 0;
  border: none;
  font: inherit;
  color: inherit;
  background-color: transparent;
  cursor: pointer;
}

button:focus {
  outline: 0;
}
.fas,
.far {
  padding-right: 5px;
}

.button-delete-member >i{
 color:red;
}
.button-update-member>i{
 color:#0E7FA6;
}
.button-delete-member:hover {
  color: red;
}
.button-delete-member:active {
  text-shadow: 2px 2px 8px #FF0000;
}
.button-update-member:hover {
  color: #0E7FA6;
}
.button-update-member:active {
  text-shadow: 2px 2px 8px #0E7FA6;
}
</style>
<div class="workspace-box">

	<div class="study-join-admin-box">
		<div class="study-member-table">
			<h4 style="font-weight:bold; margin-bottom:30px;">멤버 관리</h4>

			<table class="table table-sm text-center" id="acceptedMemeber">
				<thead>
					<tr style="font-size :1.2rem;">
						<th >번호</th>
						<th >닉네임</th>
						<th >역할</th>
						<th >가입일</th>
						<th  colspan="1" width="20%">관리</th>

					</tr>
				</thead>
				<tbody>

					<c:forEach var="memberList" items="${memberList }">
						<c:forEach var="maInfo" items="${memberAuthorityInfoList }"
							varStatus="vs">
							<c:if test="${memberList.id eq maInfo.memberId}">
								<c:set var="j" value="${j+1}" />
								<c:set var="member" value="${currGroupNo }MEMBER"/>
								<c:set var="manager" value="${currGroupNo }MANAGER"/>
								<c:set var="master" value="${currGroupNo }MASTER"/>
								<form name="createBoardRoomFrm" method="post" action="${pageContext.request.contextPath }/gw/admin/memberUpdate.do?${_csrf.parameterName}=${_csrf.token}">
								<tr>
									<td>${j}</td>
									<td>${memberList.nickname}</td>
									<td class="col-md-2">

									
									<select
											class="boardType form-select" name="memberRole" required>

												<option value="MEMBER"
													<c:if test="${fn:contains(maInfo.authority , member)}"> selected</c:if>>일반회원</option>
												<option value="MANAGER"
													<c:if test="${fn:contains(maInfo.authority , manager)}"> selected</c:if>>매니저</option>
												<option value="MASTER"
													<c:if test="${fn:contains(maInfo.authority , master)}"> selected</c:if>
													 <c:if test="${apploginRole ne 'G'}"> disabled="disabled"</c:if>
													 disabled="disabled">그룹장</option>
										</select>
										</td> 
										
										
										
									<td><fmt:formatDate value="${maInfo.joinRegDate}"
											pattern="yy-MM-dd" /></td>
									<td>
									<c:if test="${not (fn:contains(maInfo.authority , master ))}">
									<button type="submit" class="button-delete-member" name="gwDeleteMember" value="${acceptList.memberId}" onclick='return submit2(this.form);'>
									<i class="far fa-trash-alt"></i>멤버추방</button>  
									</c:if>
										<!-- <span style="font-weight:bold;">|</span> -->
										<c:if test="${!(fn:contains(maInfo.authority , master ))}">
										<button type="submit" class="button-update-member"><i class="fas fa-user-edit"></i>권한수정</button>
										</c:if>
										</td>
									<input type="hidden" name="memberId" value="${maInfo.memberId}" />
									<input type="hidden" name="groupNo" value="${groupNo}" />
								</tr>
							 </form>
							</c:if>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="study-join-table">
			<h4 style="font-weight:bold; margin-bottom:30px;">그룹 가입 요청</h4>
			<form:form id="checkValidList"
				action="${pageContext.request.contextPath }/gw/admin/groupAccept.do"
				method="post">
				<table class="table table-sm text-center">
					<thead>
						<tr>
							<th>번호</th>
							<th>닉네임</th>
							<th>질문답변</th>
							<th>가입신청일</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="memberList" items="${memberList}">
							<c:forEach var="watingList"
								items="${waitingApplocationGroupList }" varStatus="vs">
								<c:if test="${memberList.id eq watingList.memberId}">

									<c:set var="i" value="${i+1}" />
									<tr>
										<td>${i}</td>
										<td>${memberList.nickname}</td>
										<td>${watingList.answer }</td>
										<td><fmt:formatDate value="${watingList.joinRegDate}"
												pattern="yy-MM-dd" /></td>
										<td><input type="checkbox" name="checkValid" id=""
											value="${memberList.id}"></td>
									</tr>

								</c:if>
							</c:forEach>
						</c:forEach>
					</tbody>
				</table>
		</div>
		<div class="study-join-buttons text-center">

			<button type="button" class="btn btn-primary" value="Y"
				name="checkYN" id="checkY">가입 승인</button>
			<button type="button" class="btn btn-secondary" value="N"
				name="checkYN" id="checkN">가입 거절</button>
		</div>
		<input type="hidden" name="groupNo" value="${groupNo}">
		</form:form>
	</div>

</div>
<script>

//그룹웨어 멤버 추방
  function submit2(frm) { 
	  if (confirm("정말 추방하시겠습니까??") == true){    //확인

		    frm.action='${pageContext.request.contextPath }/gw/admin/memberDelete.do?${_csrf.parameterName}=${_csrf.token}'; 
		    frm.submit(); 
		    return true; 

		 }else{   //취소

		     return false;

		 }  
  } 
//가입승인
function refreshMemList(){
    location.reload();
}
$("[id='checkY']").click((e) => {
    e.preventDefault();
    
let rowNum = $("input[name='checkValid']:checked").length;
var idList = [];

for(i=0; i<rowNum; i++) {
    let id= $("input[name='checkValid']:checked").eq(i).val()
       idList.push(id); 
};    
    var idString = idList.toString();        
    console.log(idString);    
 
        $.ajax({
            url: `${pageContext.request.contextPath}/gw/admin/groupAccept.do?groupNo=${groupNo}`,
            dataType: "json", //돌려받는거
            traditional : true,
            data:  {
                "idList": idString                
            },
            contentType: "application/json; charset=utf-8", //주는타입
            success(data){
                alert(data.msg);
                refreshMemList();
        },
        error: console.log
      }) 
});    
        
  
//가입거절
  
  function refreshMemList(){
        location.reload();
    }
  $("[id='checkN']").click((e) => {
        e.preventDefault();
        
    let rowNum = $("input[name='checkValid']:checked").length;
    var idList = [];
   
    for(i=0; i<rowNum; i++) {
        let id= $("input[name='checkValid']:checked").eq(i).val()
           idList.push(id); 
    };    
        var idString = idList.toString();        
        console.log(idString);    
     
            $.ajax({
                url: `${pageContext.request.contextPath}/gw/admin/groupRefuse.do?groupNo=${groupNo}`,
                dataType: "json", //돌려받는거
                traditional : true,
                data:  {
                    "idList": idString                
                },
                contentType: "application/json; charset=utf-8", //주는타입
                success(data){
                    alert(data.msg);
                    refreshMemList();
            },
            error: console.log
          }) 
  });    
</script>

<script>
window.addEventListener("load", function(){
	$("#dropdownAdmin").removeClass("collapsed");
	$("#account-collapse").addClass("show");
	});
</script>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>
</sec:authorize>