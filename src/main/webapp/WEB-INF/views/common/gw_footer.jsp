<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<!-- Footer-->
<c:set var="authorityFlag" value="N"/>
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MANAGER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">
<c:set var="authorityFlag" value="Y"/>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>
	<!-- 그룹원 리스트 (확장버전) -->
	 <div class="test-member-list bg-light">
	 	<!-- <button style="width: 100%">controll</button> -->
	 	<div class="memberList-size-controll-box mb-3" style="cursor: pointer;margin-top: 17px; margin-left: 22px;">
		 	<i class="fas fa-angle-double-right" style=" font-size: 1.3rem;"></i> <span class="ml-3" style=" font-size: 1.3rem;">그룹멤버</span>
	 	</div>

          <div class="online-member-list mt-4">
<!--             <div class="on-off-text">
              <p class="on-text">온라인 - 3</p>
            </div> -->
    		<c:forEach var="member" items="${myGroupMemberList }">
    		 <div class="test-member-profile">
            <div class="member-profile-img-box">
              <c:choose>
	          	<c:when test="${fn:startsWith(member.renamedFilename,'http')}">
					<img class="btn-profile3 btn-profile member-profile-img" src="${member.renamedFilename}" alt="" style="width: 1px; zoom : 30;"/>
					<input type="hidden" name="profile_owner" value="${member.id}" />
				</c:when>
				<c:otherwise>
	            	<img class="btn-profile3 member-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${member.renamedFilename}" alt="">
					<input type="hidden" name="profile_owner" value="${member.id}" />
	            </c:otherwise>
	          </c:choose>
	          

		    </div>
              <span>${member.nickname }</span>
              </div>
		    </c:forEach>
            <!-- 테스트 -->
    
          </div>
    
    
<!--           <div class="offline-member-list">
            <div class="on-off-text">
              <p class="off-text">오프라인 - 1</p>
            </div>
      
            <div class="test-member-profile">
              <div class="member-profile-img-box">
                <img class="offline member-profile-img" src="https://i.pinimg.com/564x/9e/60/60/9e6060db90687be57c52ca5c5566c487.jpg" alt="">
              </div>
                <span>홍길동</span> 
            </div>
    
          </div> -->
        </div>
	
    <!-- 그룹원 리스트(축약버전) (오른쪽) -->
     <div class="test-member-list-small bg-light">
     	 <div class="memberList-size-controll-box mb-3" style="cursor: pointer; margin-top: 17px; margin-left: 22px;">
			<i class="fas fa-angle-double-left" style=" font-size: 1.3rem;"></i>
	 	</div>
      <div class="online-member-list mt-4">
		<c:forEach var="member" items="${myGroupMemberList }">
	        <div class="test-member-profile">
	          <div class="member-profile-img-box">
	          <c:choose>
	          	<c:when test="${fn:startsWith(member.renamedFilename,'http')}">
					<img class="btn-profile3 btn-profile member-profile-img" src="${member.renamedFilename}" alt="" style="width: 1px; zoom : 30;"/>
					<input type="hidden" name="profile_owner" value="${member.id}" />
				</c:when>
				<c:otherwise>
	            	<img class="btn-profile3 member-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${member.renamedFilename}" alt="">
					<input type="hidden" name="profile_owner" value="${member.id}" />
	            </c:otherwise>
	          </c:choose>
	          </div>
	        </div>
		</c:forEach>
      </div>


<!--       <div class="offline-member-list">
  
        <div class="test-member-profile">
          <div class="member-profile-img-box">
            <img class="offline member-profile-img" src="https://i.pinimg.com/564x/9e/60/60/9e6060db90687be57c52ca5c5566c487.jpg" alt="">
          </div>
        </div>

      </div>-->
    </div>  
<div class="subscribe">

</div>
  </section>
</main>
<script>
// 그룹원 리스트 (확장/축소) 제어
$(".test-member-list-small").hide();


$(".memberList-size-controll-box").click((e)=>{
	$(".test-member-list-small").toggle();
	$(".test-member-list").toggle();
	
});

//chat/chatId
//1. Stomp Client 객체 생성(websocket)

	const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
	const stompClient = Stomp.over(ws);
	
	// 2. 연결요청
	stompClient.connect({}, (frame) =>{
		console.log("Stomp Connected : ", frame);
		
	// 3. 구독요청
	stompClient.subscribe(`/dm/${loginMember.id}`, (chatMessageContent) =>{
		/* console.log("chatMessageContent : ", chatMessageContent); */
		const obj = JSON.parse(chatMessageContent.body);
		 //dmWriter(obj);
		 
		 loadDM(obj);

	});
	});
</script>
<script>
$(".btn-profile3").click((e)=>{
	var receiver = $(e.target).next().val();
 	$("input[name=dm-memberId]").val(receiver);
	console.log(receiver);
	const obj = {
			sender : "${loginMember.id}",
			receiver : receiver
		};
	 loadDM(obj);
	 var script = document.createElement("script");
	 script.innerHTML = `$(".dm-modal-body").scrollTop($(".dm-modal-body")[0].scrollHeight);`;
	 $(".subscribe").append(script); 

	$("#gwDMModal").modal('show');
     
});

/* dm 메시지 전송 처리 */
$("#btn-dm-message-send").click((e) =>{
	var receiver = $(e.target).siblings("input").val();

	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes();  // 분
	const obj = {
		sender : "${loginMember.id}",
		receiver : receiver,
		msg : $("#dm-chatMessageContent").val()
	};
		
	stompClient.send(`/app/dm/\${$("input[name=dm-memberId]").val()}`, {}, JSON.stringify(obj));
	setTimeout(function() { loadDM(obj)}
	, 90);
	
	
	$("#dm-chatMessageContent").val(''); // #message 초기화
});





$(".close-dm-modal").click((e)=>{
	$(".dm-profile-container").text('');
	 $(".subscribe").text('\n\n');
	$("#gwDMModal").modal('hide');

});
/* DM DB 조회 ajax */
function loadDM(obj){
	$(".dm-profile-container").text('');
	const {receiver, sender, senderName, msg, profileRenamedFilename, messageAt, logTime} = obj;
	$.ajax({
		url: `${pageContext.request.contextPath}/gw/chat/loadDM.do`,
		data: {
			sender: sender,
			receiver: receiver
		},
		dataType: "json",
		success(data){

			$.each(data, (k,v)=>{
				var date = new Date(v.dmMessageAt);
				
				var formatDate = (current_datetime)=>{
				    let formatted_date = current_datetime.getHours() + ":" + current_datetime.getMinutes();
				    return formatted_date;
				}
				
				$(".dm-profile-container").append(`<div class="dm-message-content-box">
			          	
				          <div class="dm-user-profile">
				          
				          </div>
				          
				          <div class="dm-message-box">
				          
				            <div class="dm-message-sender">
				              <span><strong>\${v.dmSenderNickname}</strong></span>
				              <span>\${formatDate(date)}</span>
				            </div>
				            
				            <div class="dm-message-content">
				              <p>\${v.dmContent}</p>
				            </div>
				            
				          </div>
			        </div>	
						
						`);
				 if(v.dmSenderProfileRenamedFilename.startsWith('http')){
						$(".dm-user-profile").append(`<img class="dm-user-profile-img" src="\${v.dmSenderProfileRenamedFilename}" alt="">`);
					}else{
						$(".dm-user-profile").append(`<img class="dm-user-profile-img" src="${pageContext.request.contextPath}/resources/upFile/profile/\${v.dmSenderProfileRenamedFilename}" alt="">`);
						
					} 
			});
			var script = document.createElement("script");
			 script.innerHTML = `$(".dm-modal-body").scrollTop($(".dm-modal-body")[0].scrollHeight);`;
			 $(".subscribe").append(script);
			
		},
		error: console.log
	});
}
</script>

  </body>
</html>
</sec:authorize>
<script>
if("${authorityFlag}" == 'N'){
	alert("접근권한이 없습니다");
	location.href = "${pageContext.request.contextPath}/";
	
}
</script>
