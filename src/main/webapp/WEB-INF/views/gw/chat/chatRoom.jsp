<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<%-- <fmt:requestEncoding value="utf-8"/>  --%>
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>

  <div class="workspace-box drop-zone" >
    <div class="chat-content">
	        <c:if test="${not empty messageList }">
		        <c:forEach var="message" items="${messageList }">
		        	<c:forEach var="user" items="${chatUserList }">
		        		<c:if test="${message.chatUserNo == user.chatUserNo }">
				        <div class="chat-profile-container">
				          <div class="chat-user-profile">
					          <c:choose>
					          	<c:when test="${fn:startsWith(user.renamedFilename,'http')}">
									<img class="btn-profile chat-user-profile-img" src="${user.renamedFilename}" alt=""/>
									<input type="hidden" id="chat-profile-memberId" value="${user.memberId }" />
								</c:when>
								<c:otherwise>
					            <img class="btn-profile chat-user-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${user.renamedFilename}" alt="">
					          	<input type="hidden" id="chat-profile-memberId" value="${user.memberId }" />
					            </c:otherwise>
					          </c:choose>
				          </div>
				          <div class="chat-message-box">
				            <div class="chat-message-sender">
				              <span><strong>${user.memberName }</strong></span>
				              <span><fmt:formatDate value="${message.chatMessageAt}" pattern="HH:mm"/></span>
				            </div>
				            <div class="chat-message-content">
				              <p>${message.chatMessageContent}</p>
				              <div class="chatFile">
				              		<c:if test="${message.attachNo != '' }">
					              		<img src="${pageContext.request.contextPath }/resources/upFile/chatRoom/${message.chatFileRenamedFilename}" alt="" style="width:30%; height:30%; margin-left:25%; cursor: pointer;" onclick="modalView('${message.chatFileRenamedFilename}');"/>
				              		</c:if>
				              </div>
				            </div>
				          </div>
				        </div>
				        
		        		</c:if>
		        	</c:forEach>
		        </c:forEach>
	        </c:if>
        </div>
        	
		    <div class="chat-input-box">
		    <div class="drop-img-preview">
		    	<img id="preview" style="height: 100%" src="" alt="" />
		    	<span id="preview-btn-x"style="position: absolute; margin-right: 5px; cursor: pointer;" onclick="deletePreview()">X</span>
		    </div>
		      <div class="chat-txt border-top" contentEditable='true'>
		        <input id="chatMessageContent" type="text" class="form-control" name="chatMessageContent">
		      </div>
		      <div class="btn-group">
		        <i class="fa fa-meh-o" aria-hidden="true"></i>
		        <!-- <button type="button" class="btn btn-white" data-original-title="" title="">
		        </button> -->
		          <i class="fa fa-paperclip"></i>
		      </div>
		      <button id="btn-message-send" class="btn btn-danger" data-original-title="" title="">Send</button>
		    </div> 
        <form id="file-form"action="" method="POST" enctype="multipart/form-data">
		 	<input type="file" id="file" name ="file" style="display: none;">
        </form>
        
      </div>
<!-- Footer-->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>
    <!-- 그룹원 리스트(축약버전) (오른쪽) -->
    
     <div class="test-member-list-small bg-light">
      <div class="online-member-list">
		<c:forEach var="user" items="${chatUserList }">
	        <div class="test-member-profile">
	          <div class="member-profile-img-box btn-profile2">
	            <c:choose>
	          	<c:when test="${fn:startsWith(user.renamedFilename,'http')}">
					<img class="member-profile-img" src="${profile}" alt="" style="width: 150px"/>
					<input type="hidden" name="profile_owner" value="${user.memberId }"/>
				</c:when>
				<c:otherwise>
	            	<img class="member-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${user.renamedFilename}" alt="">
	            	<input type="hidden" name="profile_owner" value="${user.memberId }"/>
	            </c:otherwise>
	          </c:choose>
	          </div>
	        </div>
		</c:forEach>
        
        

      </div>


      <div class="offline-member-list">
  
        <div class="test-member-profile">
          <div class="member-profile-img-box">
            <img class="offline member-profile-img" src="https://i.pinimg.com/564x/9e/60/60/9e6060db90687be57c52ca5c5566c487.jpg" alt="">
          </div>
        </div>

      </div>
    </div>

<div class="modal fade" id="fileViewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <img class="modalFileView" src="${pageContext.request.contextPath }/resources/upFile/chatRoom/${message.chatFileRenamedFilename}" alt="" />
    </div>
  </div>
</div>


  </section>
</main>
<div class="subscribe">

</div>
<!-- jquery.form.js  -->
<!-- <script src="http://malsup.github.com/jquery.form.js"></script> -->
<script>
function modalView(Filename){
	console.log(Filename);
	$("#fileViewModal").modal('show');
	$("#fileViewModal").modal.find('.modalFileView').val(Filename);
	
}

$("#preview-btn-x").hide();
// drag & drop
         (function() {
            
            var $file = document.getElementById("file")
            var dropZone = document.querySelector(".drop-zone")

            
            
           var showFiles = function(files) {
                dropZone.innerHTML = ""
                for(var i = 0, len = files.length; i < len; i++) {
                    dropZone.innerHTML += "<p>" + files[i].name + "</p>"
                }
            }

            var selectFile = function(files) {
                // input file 영역에 드랍된 파일들로 대체
                $file.files = files
                //showFiles($file.files)
                
            }
            
            $file.addEventListener("change", function(e) {
                showFiles(e.target.files)
            })

            // 드래그한 파일이 최초로 진입했을 때
            dropZone.addEventListener("dragenter", function(e) {
                e.stopPropagation()
                e.preventDefault()

            	console.log("진입");
                //toggleClass("dragenter")

            })

            // 드래그한 파일이 dropZone 영역을 벗어났을 때
            dropZone.addEventListener("dragleave", function(e) {
                e.stopPropagation()
                e.preventDefault()

            	console.log("벗어남");
                //toggleClass("dragleave")

            })

            // 드래그한 파일이 dropZone 영역에 머물러 있을 때
            dropZone.addEventListener("dragover", function(e) {
                //e.stopPropagation()
            	console.log("머무르는중"); //미친듯이 찍음
                e.preventDefault()

                //toggleClass("dragover")

            })

            // 드래그한 파일이 드랍되었을 때
            dropZone.addEventListener("drop", function(e) {
                e.preventDefault()

                //toggleClass("drop")

                var files = e.dataTransfer && e.dataTransfer.files
                
                if (files != null) {
                    if (files.length < 1) {
                        alert("폴더 업로드 불가")
                        return
                    }
                    selectFile(files)
                } else {
                    alert("ERROR")
                }

				// drop file img preview
                if (document.getElementById('file').files && document.getElementById('file').files[0]) {
                	console.log("test");
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#preview").attr('src', e.target.result);
                    };
                    reader.readAsDataURL(document.getElementById('file').files[0]);
                };
                $("#preview-btn-x").show();
            });

            
        })();

//drop img preview 지우기
function deletePreview(){
	$("#preview").attr('src', "");
	$("#preview-btn-x").hide();
	$('#file-form')[0].reset();
};



// 스크롤 최하단 유지
 $(".workspace-box").scrollTop($(".workspace-box")[0].scrollHeight); 
//저장된 채팅 내역이 없는 경우 (처음 만들엉진 채팅방인 경우)
if($(".chat-content").children().length == 0){
	$(".chat-content").append(`<div class="chat-message-box">
            <p>새로운 채팅을 시작해보세요!</p>
          </div>
        </div>`);
}
///chat/chatId
//1. Stomp Client 객체 생성(websocket)

	const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
	const stompClient = Stomp.over(ws);
	
	// 2. 연결요청
	stompClient.connect({}, (frame) =>{
		console.log("Stomp Connected : ", frame);
		
	// 3. 구독요청
	// 채팅방 구독
	stompClient.subscribe(`/chat/${chatRoomNo}`, (chatMessageContent) =>{
		var script = document.createElement("script");
		script.innerHTML = `$(".workspace-box").scrollTop($(".workspace-box")[0].scrollHeight); `;
		/* console.log("chatMessageContent : ", chatMessageContent); */
		const obj = JSON.parse(chatMessageContent.body);
		 console.log(obj); 
		 const {memberName, msg, profileRenamedFilename, messageAt, logTime, chatFile} = obj;
		 
		 if(chatFile != null){
			 var target = chatFile.split(".")[0];			 
		 }else{
			 var target = "foo";
		 }
		$(".chat-content").append(`<div class="chat-profile-container">
		      <div class="chat-user-profile">
		
	          </div>
	          <div class="chat-message-box">
	            <div class="chat-message-sender">
	              <span><strong>\${memberName}</strong></span>
	              <span>\${logTime}</span>
	            </div>
	            <div class="chat-message-content">
	              <p>\${msg}</p>
	              <div class="\${target}">
	              	
	              </div>
	            </div>
	          </div>
	        </div>`); 
	
		if(profileRenamedFilename.startsWith('http')){
			$(".chat-user-profile").append(`<img class="chat-user-profile-img" src="\${profileRenamedFilename}" alt="" style="height : 40px; width : 40px;"/> `);
			
		}else{
			$(".chat-user-profile").append(`<img class="chat-user-profile-img" src="${pageContext.request.contextPath}/resources/upFile/profile/\${profileRenamedFilename}" alt="">`);
		}
		if(chatFile != null){
			var target2 = "." + target
			console.log(target);
			$(target2).append(`<img src="${pageContext.request.contextPath}/resources/upFile/chatRoom/\${chatFile}" alt="" style="width:30%; height:30%; margin-left:25%; cursor:pointer;"/>`);
		}
		$(".subscribe").append(script);
	});
	//dm 구독
	stompClient.subscribe(`/dm/${loginMember.id}`, (chatMessageContent) =>{
		/* console.log("chatMessageContent : ", chatMessageContent); */
		const obj = JSON.parse(chatMessageContent.body);
		 //dmWriter(obj);
		 
		 loadDM(obj);

	});
	
	

	
});
/* DM modal 제어 */
$(".btn-profile").click((e)=>{
	$("input[name=dm-memberId]").val($(e.target).siblings().val());
	const obj = {
			sender : "${loginMember.id}",
			receiver : $(e.target).siblings().val()
		};
	 loadDM(obj);
	 var script = document.createElement("script");
	 script.innerHTML = `$(".dm-modal-body").scrollTop($(".dm-modal-body")[0].scrollHeight);`;
	 $(".subscribe").append(script);

	$("#gwDMModal").modal('show');
    
 
});

$(".btn-profile2").click((e)=>{

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
$(".close-dm-modal").click((e)=>{
	$(".dm-profile-container").text('');
	 $(".subscribe").text('\n\n');
	$("#gwDMModal").modal('hide');

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
// 채팅 메시지 발송처리
$("#btn-message-send").click((e) =>{
	if($(file).prop('files').length == 0){
		if($("#chatMessageContent").val() == '') return;
		
	};
	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes();  // 분
	var obj = {};
	
	console.log();
	
 	if($(file).prop('files').length == 0){
	 	obj = {
			chatRoomNo : "${chatRoomNo}",
			memberId : "${loginMember.id}",
			msg : $(chatMessageContent).val(),
			logTime : hours + ":" + minutes,
		};
	 	
	}else{
		var form = $('#file-form')[0];
	    var formData = new FormData(form);
	 
	    $.ajax({
	        url : "${pageContext.request.contextPath}/gw/chat/uploadImg.do",
	        type : 'POST',
	        data : formData,
	        contentType : false,
	        processData : false,
	        headers: {
				"${_csrf.headerName}" : "${_csrf.token}"
		 	},
		 	success(data){
		 		obj = {
						chatRoomNo : "${chatRoomNo}",
						memberId : "${loginMember.id}",
						msg : $(chatMessageContent).val(),
						logTime : hours + ":" + minutes,
						chatFile : data
						};
		        $('#file-form')[0].reset();
		 	},
		 	error : console.log
	    });  
	};
	
	
	setTimeout(function() {stompClient.send("/app/chat/${chatRoomNo}", {}, JSON.stringify(obj))}
	, 500);

	
	
	
	$(chatMessageContent).val(''); // #message 초기화
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
				$(".dm-profile-container").append(`<div class="dm-message-content-box">
			          	
				          <div class="dm-user-profile">
				            <img class="dm-user-profile-img" src="${pageContext.request.contextPath}/resources/upFile/profile/\${v.dmSenderProfileRenamedFilename}" alt="">
				          </div>
				          
				          <div class="dm-message-box">
				          
				            <div class="dm-message-sender">
				              <span><strong>\${v.dmSenderName}</strong></span>
				              <span>\${v.dmMessageAt}</span>
				            </div>
				            
				            <div class="dm-message-content">
				              <p>\${v.dmContent}</p>
				            </div>
				            
				          </div>
			        </div>	
						
						`);
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

      




