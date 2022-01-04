<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<div class="workspace-box">
	<div class="TDL-title-container">
		<div class="container">
			<div class="TDL-title">
				<h2>ToDoList(${loginMember.memberName}의 할일목록)</h2>
			</div>
			<div style="width: 20%;float: right;margin-bottom: 5px;">
				<select class="form-select" id="sort-select" aria-label="Default select example">
				  <option value="0" selected>전체</option>
				  <option value="1">해야할일</option>
				  <option value="2">완료한일</option>
				</select>
				<input type="hidden" class="groupNo" value="${currGroupNo } "/>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th class="w-10 text-center" scope="col">번호</th>
						<th class="w-40 text-center" scope="col" colspan="2">내용</th>
						<th class="w-10 text-center" scope="col">등록일</th>
						<th class="w-10 text-center" scope="col">완료 여부</th>
						<th class="w-10 text-center" scope="col"></th>
					</tr>
				</thead>
				<tbody class="tbody-form">
					<c:forEach var="tdl" items="${tdlList}" varStatus="vs">
						<tr>
							<th class="w-10 text-center" scope="row">${vs.index+1 }</th>
							<td class="w-40 text-center" colspan="2">${tdl.tdlContent }</td>
							<td class="w-10 text-center"><fmt:formatDate value="${tdl.tdlCreateDate }" pattern="yyyy-MM-dd"/></td>
							<td class="w-10 text-center">
								<div>
									<c:if test="${fn:contains(tdl.tdlChecked, 'N')}">
											<p>미완료</p>
									</c:if>
									<c:if test="${fn:contains(tdl.tdlChecked, 'Y')}">
											<p>완료</p>
									</c:if>
								</div>
							</td>
							<td class="w-10 text-center">
								<div>
									<c:if test="${fn:contains(tdl.tdlChecked, 'N')}">
											<button type="button" class="btn btn-outline-primary btn-TDLComplete" onclick="TDLComplete(${tdl.tdlNo },${tdl.groupNo })">완료하기</button>
									</c:if>
									<c:if test="${fn:contains(tdl.tdlChecked, 'Y')}">
											<button type="button" class="btn btn-outline-primary btn-TDLCancel" onclick="TDLCancel(${tdl.tdlNo },${tdl.groupNo })">취소</button>
									</c:if>
									<input type="hidden" class="hiddenTDLNo" value="${tdl.tdlNo }"/>
									<input type="hidden" class="hiddenGroupNo" value="${tdl.groupNo }"/>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="float: right;margin-bottom: 5px;">
				<button type="button" class="btn btn-outline-primary btn-createTDL">할일 추가</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="createTDLModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">ToDoList추가하기</h4>
        <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form name="createTDLFrm" method="post" action="${pageContext.request.contextPath }/gw/app/insertTDL.do">
	      <div class="modal-body mx-3">
	        <div class="md-form mb-5">
	          <label  for="TDLContent">ToDoList</label>
	          <input type="text" id="TDLContent" name="tdlContent" class="form-control validate" placeholder="내용작성">
	        </div>
	      </div>
	      <input type="hidden" name="groupNo" value="${currGroupNo}" />
	      <input type="hidden" name="memberId" value="${loginMember.id}" />
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-createTDL-submit">추가</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div>
<script>
var tbody = document.querySelector(".tbody-form")
$(".modal-member-box").hide();

$(".btn-createTDL-submit").click((e)=>{
	 $(document.createTDLFrm).submit();
 });
 $(".btn-createTDL").click((e)=>{
	 $("#createTDLModal").modal('show');
 });
 $(".close-modal").click((e)=>{
	 $("#createTDLModal").modal('hide');
 });
 $("#sort-select").change((e)=>{
	 const $groupNo = $(e.target).next().val();
	 tbody.innerHTML = "";
	 $.ajax({
			url: `${pageContext.request.contextPath}/gw/app/reCalculate.do`,
			data: {
				'groupNo' : $groupNo,
				'check' : $("#sort-select option:selected").val()
				},
			type: "GET",
			dataType: "json",
			headers: {
				"${_csrf.headerName}" : "${_csrf.token}"
		 	},
			success(data){
		 		console.log(data);
		 		$.each(data, (k,v)=>{
		 			const $trTag = $(`<tr></tr>`);
		 			console.log(v.tdlCreateDate);
		 			console.log(new Date(v.tdlCreateDate));
		 			var date = new Date(v.tdlCreateDate);
		 			const formatDate = (date)=>{
		 				let formatted_date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()
		 				 return formatted_date;
		 				}
		 			console.log(formatDate(date));
		 			let html2 = '';
		 			let html3 = '';
		 			let html1 = `<th class="w-10 text-center" scope="row">${k+1}</th>
		 						<td class="w-40 text-center" colspan="2">\${v.tdlContent }</td>
		 						<td class="w-10 text-center">\${formatDate(date)}</td>`
		 				if(v.tdlChecked == 'N'){
		 					html2 = `<td class="w-10 text-center"><div><p>미완료</p></div></td>`
		 				}else{
		 					html2 = `<td class="w-10 text-center"><div><p>완료</p></div></td>`
		 				}
		 				if(v.tdlChecked == 'N'){
		 					html3 = `<td class="w-10 text-center">
		 						<div>
		 							<button type="button" class="btn btn-outline-primary btn-TDLComplete" onclick="TDLComplete(\${v.tdlNo },\${v.groupNo })">완료하기</button>
		 							<input type="hidden" class="hiddenTDLNo" value="\${v.tdlNo }"/>
									<input type="hidden" class="hiddenGroupNo" value="\${v.groupNo }"/>
								</div>
							</td>`
		 				}else{
		 					html3 = `<td class="w-10 text-center">
		 						<div>
		 							<button type="button" class="btn btn-outline-primary btn-TDLCancel" onclick="TDLCancel(\${v.tdlNo },\${v.groupNo })">취소</button>
		 							<input type="hidden" class="hiddenTDLNo" value="\${v.tdlNo }"/>
									<input type="hidden" class="hiddenGroupNo" value="\${v.groupNo }"/>
								</div>
							</td>`
		 				}
		 			$trTag.append(html1);
		 			$trTag.append(html2);
		 			$trTag.append(html3);
		 			$(".tbody-form").append($trTag);
		 		});
			},
			error(xhr,textStatus,err){
				alert("잠시후 다시 시도해 주세요.");
			}
		});
 });
 function TDLComplete(a,b) {
	 $.ajax({
			url: `${pageContext.request.contextPath}/gw/app/updateTDL.do`,
			data: {
				'tdlNo' : a,
				'groupNo' : b,
				'check' : 'Y'
				},
			type: "GET",
			dataType: "text",
			success(data){
				location.reload();
			},
			error(xhr,textStatus,err){
				alert("수정 실패 잠시후 다시 시도해 주세요.");
			}
		});
 };
/*  $(".btn-TDLComplete").click((e)=>{
	 const $hiddenTDLNo = $(e.target).next();
	 const $hiddenGroupNo = $hiddenTDLNo.next();
	 const $tdlNo = $hiddenTDLNo.val();
	 const $groupNo = $hiddenGroupNo.val();
	 $.ajax({
			url: `${pageContext.request.contextPath}/gw/app/updateTDL.do`,
			data: {
				'tdlNo' : $tdlNo,
				'groupNo' : $groupNo,
				'check' : 'Y'
				},
			type: "GET",
			dataType: "text",
			success(data){
				location.reload();
			},
			error(xhr,textStatus,err){
				alert("수정 실패 잠시후 다시 시도해 주세요.");
			}
		});
 }); */
 function TDLCancel(a,b){
	 $.ajax({
			url: `${pageContext.request.contextPath}/gw/app/updateTDL.do`,
			data: {
				'tdlNo' : a,
				'groupNo' : b,
				'check' : 'N'
				},
			type: "GET",
			dataType: "text",
			success(data){
				location.reload();
			},
			error(xhr,textStatus,err){
				alert("수정 실패 잠시후 다시 시도해 주세요.");
			}
		});
 };
/*  $(".btn-TDLCancel").click((e)=>{
	 const $hiddenTDLNo = $(e.target).next();
	 const $hiddenGroupNo = $hiddenTDLNo.next();
	 const $tdlNo = $hiddenTDLNo.val();
	 const $groupNo = $hiddenGroupNo.val();
	 $.ajax({
			url: `${pageContext.request.contextPath}/gw/app/updateTDL.do`,
			data: {
				'tdlNo' : $tdlNo,
				'groupNo' : $groupNo,
				'check' : 'N'
				},
			type: "GET",
			dataType: "text",
			success(data){
				location.reload();
			},
			error(xhr,textStatus,err){
				alert("수정 실패 잠시후 다시 시도해 주세요.");
			}
		});
 }); */
</script>

<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>
</sec:authorize>
