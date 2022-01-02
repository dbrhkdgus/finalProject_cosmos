<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<div class="workspace-box">

	<div class="study-join-admin-box">
		<div class="study-member-table">
			<h4>그룹원 관리</h4>

			<table class="table table-sm text-center" id="acceptedMemeber">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>역할</th>
						<th>가입일</th>
						<th colspan="2" style="width: 27.5%;">관리</th>

					</tr>
				</thead>
				<tbody>
					<form:form name="createBoardRoomFrm" method="post"
						action="${pageContext.request.contextPath }/gw/admin/memberUpdate.do">
						<c:forEach var="memberList" items="${memberList }">
							<c:forEach var="acceptList"
								items="${acceptApplocationGroupList }" varStatus="vs">
								<c:if test="${memberList.id eq acceptList.memberId}">
									<c:set var="j" value="${j+1}" />
									<tr>
										<td>${j}</td>
										<td>${memberList.nickname}</td>
										<td class="col-md-2"><select
											class="boardType form-select" name="memberRole" required>
												<option value="P"
													<c:if test="${fn:contains(acceptList.role , 'P' )}"> selected</c:if>>일반회원</option>
												<option value="M"
													<c:if test="${fn:contains(acceptList.role , 'M' )}"> selected</c:if>>매니저</option>
												<option value="M"
													<c:if test="${fn:contains(acceptList.role , 'G' )}"> selected</c:if> />그룹장
												</option>
										</select></td>
										<%-- <c:if test="${fn:contains(acceptList.role, 'G')}">
			             	 <td>그룹장</td>
			              </c:if>
			              <c:if test="${fn:contains(acceptList.role, 'P')}">
			              	<td>일반멤버</td>
			              </c:if>
			              <c:if test="${fn:contains(acceptList.role, 'M')}">
			             	 <td>그룹장</td>
			              </c:if> --%>
										<td><fmt:formatDate value="${acceptList.joinRegDate}"
												pattern="yy-MM-dd" /></td>
										<!--    <td>2020-12-16</td> -->
										<td>
											<div class="">
												<!--      <label for="boardType">권한 부여하기</label> -->

											</div> <input type="hidden" name="groupNo" value="${groupNo}" />
										</td>
										<td><input type='button' class="btn btn-danger"
											name="gwDeleteMember" value="멤버추방"
											name="${acceptList.memberId}"
											onclick='return submit2(this.form);'>
											<button type="submit" class="btn btn-secondary">수정</button></td>
									</tr>
									<input type="hidden" name="memberRole"value="${acceptList.role}">
								</c:if>
							</c:forEach>
						</c:forEach>
					</tbody>
				</table>
				</form:form>
			</div>
		<div class="study-join-table">
			<h4>그룹 가입 요청</h4>
			<form:form id="checkValidList"
				action="${pageContext.request.contextPath }/gw/admin/groupAccept.do"
				method="post">
				<table class="table table-sm text-center">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
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



//멤버수정 모달창
 $(".gwMemberUpdate-Btn").click((e)=>{
     $("#gwMeberUpdateModal").modal('show');
 });
 
 
 $(".close-modal").click((e)=>{
     $("#gwMeberUpdateModal").modal('hide');
 }); 

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


<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>