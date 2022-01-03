<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 차트 관련 js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://raw.githubusercontent.com/google/palette.js/master/palette.js"></script>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="투표" name="title"/>
</jsp:include>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="groupMemberCnt" value="${fn:length(myGroupMemberList)}" />

 <div class="groupware-vote-outter">
  	<div class="present-vote-box">
  		<div class="present-vote">
	  		
	  		<c:if test="${not empty presentVoteInfo }">
	
	  				<c:forEach var="presentVote" items="${presentVoteInfo }" >
						<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" /> 
						<fmt:formatDate value="${presentVote.voteDeadline}" pattern="yyyyMMdd" var="deadline" /> 
	  					<c:choose>
			  				<c:when test="${nowDate <= deadline }">
		  						<div class="vote-view">
					  				<form id="sendVoteFrm" name="sendVoteFrm" action="">
					  				<input type="hidden" name="voteNo" value="${presentVote.voteNo }" />
					  				<input type="hidden" name="voteQuestionNo" value="${presentVote.voteQuestionNo }" />
							  			<div class="present-vote-title mb-2">
							  				<div class="isAnsweredVote">
							  					<c:if test="${voteAnswer == 'Y' }">
								  					<span id="isSendedVote" style="float: right;">[제출완료]</span>
							  					</c:if>
							  				</div>
							  				<h3 class="vote-title">${presentVote.voteTitle }</h3>
							  				<h6 class="vote-sub-title"><span>${presentVote.memberName}</span>님의 투표제안입니다.</h6>
							  				<h6 class="vote-sub-title">투표 마감일 : <span><fmt:formatDate value="${presentVote.voteDeadline}" pattern="MM-dd"/></span>까지</h6>
							  			</div>
							  			<div class="vote-question-box">
							  				<div class="vote-question">
								  				<p class="vote-question-title text-secondary">${presentVote.voteQuestionTitle }</p>
								  				<c:forEach var="presentOption" items="${presentVoteOption }">
								  					<%-- ${presentOption } --%>
									  				<input type="${presentVote.voteQuestionType}" name="voteAnswer" value="${presentOption.voteOption }" required="required"/> ${presentOption.voteOption }
									  				
								  				</c:forEach>
							  				</div>
							  				<c:forEach var="arrMaker" items="${presentVoteOptionForChart }">
									  				<c:set var="optionArr" value="${optionArr += '\"' += arrMaker.voteOption += '\", '  }"/>
									  				<c:set var="answerCntArr" value="${answerCntArr += arrMaker.answerCnt += ', '  }"/>
							  				</c:forEach>
									  		<c:set var = "length1" value = "${fn:length(optionArr)}"/>
    									    <c:set var = "optionArr" value = "${fn:substring(optionArr, 0, length1-2)}" />
									  		<c:set var = "length2" value = "${fn:length(answerCntArr)}"/>
    									    <c:set var = "answerCntArr" value = "${fn:substring(answerCntArr, 0, length2-2)}" />
    									   
							  			</div>
					  				</form>
				  				</div>
				  				<div class="analytics-view" >
  									 <canvas id="pie-chart" width="800" height="200"></canvas> 
  									
  								</div>
  								<c:if test="${not empty optionArr && not empty answerCntArr}">
							  		<script>
								  		/* analytics-view */
								  		new Chart(document.getElementById("pie-chart"), {
								  		    type: 'pie',
								  		    data: {
								  		      labels: [
								  		    	
								  		    	${optionArr }
								  		    	  
								  		    	  ],
								  		      datasets: [{
								  		        label: "Population (millions)",
								  		      backgroundColor: [ // 배경 색
								                  'rgba(255, 99, 132, 0.5)', // red
								                  'rgba(255, 159, 64, 0.5)', // orange
								                  'rgba(255, 206, 86, 0.5)', // yellow
								                  'rgba(75, 192, 192, 0.5)', // green
								                  'rgba(54, 162, 235, 0.5)', //blue
								                  'rgba(0, 0, 128, 0.5)' //navy
								             		 ],

								  		        data: [
								  		        	
								  		        	${answerCntArr }
								  		        	
								  		        	]
								  		      }]
								  		    },
								  		    options: {
								  		    	maintainAspectRatio: false,
								  		    	legend: { position: 'left', display: true },
		
								  		      title: {
								  		        display: true,
								  		        text: '${presentVote.voteTitle }'
								  		      }
								  		    }
								  		});

							  		</script>
  								</c:if>
  								<c:if test="${empty optionArr && empty answerCntArr}">
  									<c:forEach var="option" items="${optionList }">
  										<c:set var="optionArr" value="${optionArr += '\"' += option += '\", '  }"/>
									  	<c:set var="answerCntArr" value="${answerCntArr += 0 += ', '  }"/>
  									</c:forEach>
  									<c:set var = "length1" value = "${fn:length(optionArr)}"/>
    								<c:set var = "optionArr" value = "${fn:substring(optionArr, 0, length1-2)}" />
									<c:set var = "length2" value = "${fn:length(answerCntArr)}"/>
    								<c:set var = "answerCntArr" value = "${fn:substring(answerCntArr, 0, length2-2)}" />
  									<script>
								  		/* analytics-view */
								  		new Chart(document.getElementById("pie-chart"), {
								  		    type: 'pie',
								  		    data: {
								  		      labels: [
								  		    	
								  		    		${optionArr }
								  		    	  
								  		    	  ],
								  		      datasets: [{
								  		        label: "Population (millions)",
								  		        backgroundColor: [ 'rgba(255, 99, 132, 0.5)', // red
									                  'rgba(255, 159, 64, 0.5)', // orange
									                  'rgba(255, 206, 86, 0.5)', // yellow
									                  'rgba(75, 192, 192, 0.5)', // green
									                  'rgba(54, 162, 235, 0.5)', //blue
									                  'rgba(0, 0, 128, 0.5)' //navy
									                  ],
								  		        data: [
								  		        	
								  		        	${answerCntArr }
								  		        	
								  		        	]
								  		      }]
								  		    },
								  		    options: {
								  		    	maintainAspectRatio: false,
								  		    	legend: { position: 'left', display: true },
		
								  		      title: {
								  		        display: true,
								  		        text: '${presentVote.voteTitle }'
								  		      }
								  		    }
								  		});
							  		</script>
  								
  								</c:if>
			  				</c:when>
			  				<c:otherwise>
			  					<div class="present-vote-title mb-2">
						  				<h3 class="vote-title">현재 진행중인 투표가 없습니다.</h3>
						  		</div>
			  				</c:otherwise>
	  					</c:choose>
	  				</c:forEach>
		  			
	  			</c:if>
	  			<c:if test="${empty presentVoteInfo }">
	  				<div class="present-vote-title mb-2">
						<h3 class="vote-title">진행중인 투표가 없습니다.</h3>
					</div>
	  			
	  			</c:if>

  		</div>
  		<div class="present-vote-control-box">
  		<button id="btn-create-vote" class="vote-controll-btn">투표 생성하기</button>
  		<button id="btn-send-vote" class="vote-controll-btn">투표 제출하기</button>
  		<button id="btn-analytics-view" class="vote-controll-btn">투표 통계보기</button>
  		<button id="btn-vote-view" class="vote-controll-btn">투표 보기</button>
  		</div>
  	
  	</div>
  	<div class="old-vote-box">
  		<div class="vote-in-progress">
  			<div class="vote-in-progress-title">
  				<p class="ml-3 mt-2">진행중인 다른 투표</p>
  			</div>
  			
  			<div class="vote-in-progress-table">
  			<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">투표 주제</th>
				      <th scope="col">마감일</th>
				      <th scope="col">투표율</th>
				    </tr>
				  </thead>
				  <tbody>
		  			<c:forEach var="otherVotes" items="${groupVoteInfoList}">
		  				<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" /> 
						<fmt:formatDate value="${otherVotes.voteDeadline}" pattern="yyyyMMdd" var="otherDeadline" />
		  				<c:if test="${nowDate <= otherDeadline  }">
		  					<tr class="tr">
						      <th scope="row">${otherVotes.voteTitle }</th>
						      <td><span><fmt:formatDate value="${otherVotes.voteDeadline}" pattern="MM-dd"/></span> 까지</td>
						      
							      <c:if test="${otherVotes.answeredMemberCnt != 0 }">
								      <td><fmt:formatNumber type="percent" value="${otherVotes.answeredMemberCnt/groupMemberCnt}"  pattern="0.0%"/></td>
							      </c:if>
							      <c:if test="${otherVotes.answeredMemberCnt==0 }">
								      <td>0%</td>
							      </c:if>
						      
						      
						    </tr>
						      <input type="hidden" name="voteNo" value="${otherVotes.voteNo }" />
		  				</c:if>
		  			</c:forEach>
  					</tbody>
  				</table>
  			</div>
  		</div>
  		<div class="vote-closed-box" >
  			<div class="vote-closed-title">
  				<p class="ml-3 mt-2">마감된 투표</p>
  			</div>
  			<div class="vote closed-table">
  			<table class="table table-hover">
  					<thead>
  						<tr>
					      <th scope="col">투표 주제</th>
					      <th scope="col">종료일</th>
					      <th scope="col">투표율</th>
  						</tr>
  					</thead>
  					<tbody>
		  			<c:forEach var="otherVotes" items="${groupVoteInfoList }">
		  				<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" /> 
						<fmt:formatDate value="${otherVotes.voteDeadline}" pattern="yyyyMMdd" var="otherDeadline" />
		  				<c:if test="${nowDate > otherDeadline  }">
		  						<tr class="old-tr">
		  							<th scope="row">${otherVotes.voteTitle }</th>
		  							<td><span><fmt:formatDate value="${otherVotes.voteDeadline}" pattern="MM-dd"/></span> 까지</td>
			  						  <c:if test="${otherVotes.answeredMemberCnt != 0 }">
									      <td><fmt:formatNumber type="percent" value="${otherVotes.answeredMemberCnt/groupMemberCnt}"  pattern="0.0%"/></td>
								      </c:if>
								      <c:if test="${otherVotes.answeredMemberCnt==0 }">
									      <td>0%</td>
								      </c:if>
		  						</tr>
		  						<input type="hidden" name="voteNo" value="${otherVotes.voteNo }" />
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
	              <input id="voteQuestionType" type="checkbox" name="voteQuestionType" value="checkbox"/>
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
              <div class="vote_modal_question_add_option_box" id="add-option-input">
              	  <input type="radio" name="voteQuestionOptionCheckFoo" class="mr-2"/>
	              <input type="text" class="form-control validate" style="width: 50%;" disabled placeholder="옵션 추가하기"/>
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
/* view 전환 */
$("#btn-vote-view").hide();
$(".analytics-view").hide();
$("#btn-analytics-view").click((e)=>{
	$("#btn-analytics-view").hide();
	$("#btn-vote-view").show();
	$(".analytics-view").show();
	$(".vote-view").hide();

});
$("#btn-vote-view").click((e)=>{
	$("#btn-vote-view").hide();
	$("#btn-analytics-view").show();
	$(".analytics-view").hide();
	$(".vote-view").show();
	
});



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
	  	  
	if($(voteQuestionType).prop("checked")){
		$(".vote_modal_question_option_box").append(`<div class="vote_modal_question_option option-\${optionCnt+1}">
	            <input type="checkbox" name="voteQuestionOptionCheck" class="mr-2"/>
	            <input id="input-\${optionCnt+1}" type="text" name="voteQuestionOption" class="form-control validate" style="width: 50%;" placeholder="옵션 \${optionCnt+1}"/>
	            <span class="btn-delete-option delete-option-\${optionCnt+1}" style="margin-left: 5px; margin-bottom: 15px; cursor: pointer;">x</span>
	        </div>`);
	}else{		
		$(".vote_modal_question_option_box").append(`<div class="vote_modal_question_option option-\${optionCnt+1}">
	            <input type="radio" name="voteQuestionOptionCheck" class="mr-2"/>
	            <input id="input-\${optionCnt+1}" type="text" name="voteQuestionOption" class="form-control validate" style="width: 50%;" placeholder="옵션 \${optionCnt+1}"/>
	            <span class="btn-delete-option delete-option-\${optionCnt+1}" style="margin-left: 5px; margin-bottom: 15px; cursor: pointer;">x</span>
	        </div>`);
	}
	
	var script = document.createElement("script");
	script.innerHTML = `
			/* 포커스 이동 */
				 var optionCnt = $(".vote_modal_question_option").length;
				  optionCnt *= 1;
				 var showTarget = ".delete-option-" + (optionCnt-1);
				 var focusTarget = "#input-" + optionCnt;
				 $(focusTarget).focus();
			/* 옵션 제거 */
			$(".btn-delete-option").click((e)=>{
				$(e.target).parent().remove();
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

/* 투표 제출 */
$("#btn-send-vote").click((e)=>{
	console.log("클릭됨")
	var form = $('#sendVoteFrm')[0];
    var formData = new FormData(form);
     $.ajax({
        url : "${pageContext.request.contextPath}/gw/vote/answerVote.do",
        type : 'POST',
        data : formData,
        contentType : false,
        processData : false,
        headers: {
			"${_csrf.headerName}" : "${_csrf.token}"
	 	},
	 	success(data){
	 		if(data > 0){
	 			alert("투표가 제출되었습니다.");
	 			location.reload();
	 		}else if(data == 0){
	 			alert("이미 투표가 제출되었습니다.")
	 		}else{
	 			alert("선택한 답변이 없습니다.");
	 		}
	 	},
	 	error : console.log
    });  

});
/* 다른 투표 table tr 클릭시 */
$(".tr").click((e)=>{
	var voteNo = $(e.target).parent().next().val();
	location.href="${pageContext.request.contextPath}/gw/vote/vote.do?groupNo=${currGroupNo}&voteNo="+voteNo;

});
/* 지난 투표 table tr 클리시 */
$(".old-tr").click((e)=>{
	var voteNo = $(e.target).parent().next().val();
	location.href="${pageContext.request.contextPath}/gw/vote/voteHistory.do?groupNo=${currGroupNo}&voteNo="+voteNo;
});
</script>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

