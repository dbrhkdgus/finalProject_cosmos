<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="투표" name="title"/>
</jsp:include>
<c:set var="now" value="<%=new java.util.Date()%>" />

 <div class="groupware-vote-outter">
  	<div class="present-vote-box" style="background: Beige;">
  		<div class="present-vote" style="background: FloralWhite">
  			<c:if test="${not empty presentVoteInfo }">

  				<c:forEach var="presentVote" items="${presentVoteInfo }">
					<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" /> 
					<fmt:formatDate value="${presentVote.voteDeadline}" pattern="yyyyMMdd" var="deadline" /> 
  					<c:choose>
		  				<c:when test="${nowDate <= deadline }">
				  			<div class="present-vote-title mb-2">
				  				<h3 class="vote-title">${presentVote.voteTitle }</h3>
				  				<h6 class="vote-sub-title"><span>${presentVote.memberName}</span>님의 투표제안입니다.</h6>
				  				<h6 class="vote-sub-title">투표 마감일 : <span><fmt:formatDate value="${presentVote.voteDeadline}" pattern="MM-dd"/></span>까지</h6>
				  			</div>
				  			<div class="vote-question-box">
				  				<div class="vote-question">
					  				<p class="vote-question-title text-secondary">${presentVote.voteQuestionTitle }</p>
					  				<c:forEach var="presentOption" items="${presentVoteOption }">
						  				<input type="${presentVote.voteQuestionType}" name="question1-radio"/> ${presentOption.voteOption }
					  				</c:forEach>
				  				</div>
				  				
				  			</div>
		  				</c:when>
		  				<c:otherwise>
		  					<div class="present-vote-title mb-2">
				  				<h3 class="vote-title">현재 진행중인 투표가 없습니다.</h3>
				  			</div>
		  				</c:otherwise>
  					</c:choose>
  				</c:forEach>
  			</c:if>
  		</div>
  		<div class="present-vote-control-box">
  		<button id="btn-create-vote" class="vote-controll-btn">투표 생성하기</button>
  		<button class="vote-controll-btn">투표 제출하기</button>
  		<button class="vote-controll-btn">투표 수정하기</button>
  		</div>
  	</div>
  	<div class="old-vote-box">
  		<div class="vote-in-progress" style="background: Beige">
  			<div class="vote-in-progress-title">
  				<p class="ml-3 mt-2">진행중인 다른 투표</p>
  			</div>
  			
  			<div class="vote-in-progress-table">
  				<table>
  					<thead>
  						<tr>
  							<th>제목</th>
  							<th colspan="3">마감일</th>
  							<th>투표율</th>
  						</tr>
  					</thead>
  					<tbody>
  			<c:forEach var="otherVotes" items="${groupVoteInfoList }">
  				<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" /> 
				<fmt:formatDate value="${otherVotes.voteDeadline}" pattern="yyyyMMdd" var="otherDeadline" />
  				<c:if test="${nowDate <= otherDeadline  }">
  						<tr>
  							<td>${otherVotes.voteTitle }</td>
  							<td><span><fmt:formatDate value="${otherVotes.voteDeadline}" pattern="MM-dd"/></span> 까지</td>
  							<td>67%</td>
  						</tr>
  				</c:if>
  			</c:forEach>
  					</tbody>
  				</table>
  			</div>
  		</div>
  		<div class="vote-closed-box" style="background: Beige">
  			<div class="vote-closed-title">
  				<p class="ml-3 mt-2">마감된 투표</p>
  			</div>
  			<div class="vote closed-table">
  			<table>
  					<thead>
  						<tr>
  							<th>제목</th>
  							<th colspan="3">종료일</th>
  							<th>투표율</th>
  						</tr>
  					</thead>
  					<tbody>
		  			<c:forEach var="otherVotes" items="${groupVoteInfoList }">
		  				<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" /> 
						<fmt:formatDate value="${otherVotes.voteDeadline}" pattern="yyyyMMdd" var="otherDeadline" />
		  				<c:if test="${nowDate > otherDeadline  }">
		  						<tr>
		  							<td>${otherVotes.voteTitle }</td>
		  							<td><span><fmt:formatDate value="${otherVotes.voteDeadline}" pattern="MM-dd"/></span> 까지</td>
		  							<td>67%</td>
		  						</tr>
		  				</c:if>
		  			</c:forEach>
  					</tbody>
  				</table>
  			</div>
  		</div>
  	</div>
</div>
<!-- 투표 생성 모달창 -->
<div class="modal fade" id="createVoteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">투표 생성하기</h4>
        <button type="button" class="close close-vote-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form name="createVoteFrm" method="post" action="${pageContext.request.contextPath }/gw/vote/createVote.do?${_csrf.parameterName}=${_csrf.token}">
      
          <div class="modal-body mx-3">
            <div class="md-form mb-3">
              <label  for="voteTitle">투표 제목</label>
              <input type="text" name="voteTitle" class="form-control validate mb-3" placeholder="새로운 주제의 투표 생성">
              <label  for="voteTitle">투표 마감일</label>
              <input type="date" id='currentDate' name="voteDeadline" class="form-control validate">
              <hr style="margin-top: 5px;margin-bottom: 0px;"/>
            </div>
            <div class="md-form mb-3">
              <label  for="voteQuestioniTitle">질문을 입력하세요.</label>
              <div class="vote_modal_question_box">
	              <input type="text" name="voteQuestionTitle" class="form-control validate" style="width: 80%;" placeholder="(예) 정모 날짜를 선택하세요."/>
	              <input id="voteQuestionType" type="checkbox" name="voteQuestionType" value="checkBox"/>
	              <label  for="voteQuestioniTitle">복수응답</label>
		          <hr />
              </div>
            </div>
            <div class="md-form mb-5 vote_modal_question_option_outter">
              <div class="vote_modal_question_option_box mb-2">
	              <div class="vote_modal_question_option">
			        <input type="checkbox" name="voteQuestionOptionCheck" class="mr-2"/>
		            <input type="text" name="voteQuestionOption" class="form-control validate" style="width: 50%;" placeholder="옵션 1"/>
	              </div>
              </div>
              <div class="vote_modal_question_add_option_box">
              	  <input type="radio" name="voteQuestionOptionCheckFoo" class="mr-2"/>
	              <input id="add-option-input" type="text" class="form-control validate" style="width: 50%;" placeholder="옵션 추가하기"/>
		          <input type="hidden" class="optionCnt" value="1" />
              </div>
            </div>
          </div>
          <input type="hidden" name="groupNo" value="${currGroupNo }" />
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-createVote">생성</button>
        <button class="btn close-vote-modal">취소</button>
      </div>
    </div>
  </div>
</div>
<div class="script">

</div>
<script>
/* 투표생성 모달창 제어 */
$("#btn-create-vote").click((e)=>{
	/* 투표마감일 기본값 세팅 */
	document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
	$(".vote_modal_question_option_box").html(`<div class="vote_modal_question_option">
            <input type="radio" name="voteQuestionOptionCheck" class="mr-2"/>
	        <input type="text" name="voteQuestionOption" class="form-control validate" style="width: 50%;" placeholder="옵션 1"/>
  	</div>`);
	$("#createVoteModal").modal('show');
});

$(".close-vote-modal").click((e)=>{
	$(document.createVoteFrm).each( function () {
		this.reset();
	});

	$("#createVoteModal").modal('hide');
});


  
/* 라디오/체크박스 선택 */
	$('#voteQuestionType').change((e)=>{
		if($(voteQuestionType).prop("checked")){
	        $("input[name=voteQuestionOptionCheck]").attr('type', 'checkbox');

		}else{
			$("input[name=voteQuestionOptionCheck]").attr('type', 'radio');
			
		}
	});

	/* 옵션 추가 */
  $("#add-option-input").click((e)=>{
	  var optionCnt = $(".vote_modal_question_option").length;
	  optionCnt *= 1;
	  
	  console.log($(voteQuestionType).prop("checked"));
	if($(voteQuestionType).prop("checked")){
		$(".vote_modal_question_option_box").append(`<div class="vote_modal_question_option option-\${optionCnt+1}">
	            <input type="checkbox" name="voteQuestionOptionCheck" class="mr-2"/>
	            <input type="text" name="voteQuestionOption" class="form-control validate" style="width: 50%;" placeholder="옵션 \${optionCnt+1}"/>
	            <span class="btn-delete-option delete-option-\${optionCnt+1}" style="margin-left: 5px; margin-bottom: 15px; cursor: pointer;">x</span>
	        </div>`);
	}else{		
		$(".vote_modal_question_option_box").append(`<div class="vote_modal_question_option option-\${optionCnt+1}">
	            <input type="radio" name="voteQuestionOptionCheck" class="mr-2"/>
	            <input type="text" name="voteQuestionOption" class="form-control validate" style="width: 50%;" placeholder="옵션 \${optionCnt+1}"/>
	            <span class="btn-delete-option delete-option-\${optionCnt+1}" style="margin-left: 5px; margin-bottom: 15px; cursor: pointer;">x</span>
	        </div>`);
	}
	
	var script = document.createElement("script");
	script.innerHTML = `/* 옵션 제거 */
			$(".btn-delete-option").click((e)=>{
				$(e.target).parent().remove();
				 var optionCnt = $(".vote_modal_question_option").length;
				  optionCnt *= 1;
				 var showTarget = ".delete-option-" + optionCnt;
				 $(showTarget).show(); 
			
		});`;
	 $(".script").append(script);
	 var hideTarget = ".delete-option-" + optionCnt;
	 $(hideTarget).hide(); 
	
	
	$(e.target).next().val(optionCnt + 1);
  });
/* 투표 생성 */
$(".btn-createVote").click((e)=>{
	$(document.createVoteFrm).submit();
});
</script>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

