<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MANAGER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">
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
				          <div class="chat-message-box" style="cursor: pointer;" >
					          <c:if test="${loginMember.id == user.memberId }">
					          	<div class="btn-delete-chat-message">
					          		<span data-chat-message-no="${message.chatMessageNo }" style="float: right; margin-right: 10px; cursor: pointer;">x</span>
					          	</div>
					          </c:if>
				            <div class="chat-message-sender">
				              <span><strong>${user.nickname }</strong></span>
				              <span><fmt:formatDate value="${message.chatMessageAt}" pattern="HH:mm"/></span>
				            </div>
				            <div class="chat-message-content">
				            <c:if test="${message.chatMessageTypeNo == 2}">
				              <a href="${message.chatMessageContent}">${message.chatMessageContent}</a>
				            </c:if>
				            <c:if test="${message.chatMessageTypeNo != 2 && !message.chatMessageContent.startsWith('```')}">
				              <p>${message.chatMessageContent}</p>
				            </c:if>
				            <c:if test="${message.chatMessageContent.startsWith('```') && message.chatMessageContent.endsWith('```')}">
				            <c:set var="msg" value="${fn:replace(message.chatMessageContent, '```', '')}"/>
				              <div>
  								<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly style="resize: none;">${msg}</textarea>
				              </div>
				            </c:if>
				              <div class="chatFile">
				              		<c:if test="${message.attachNo != '' }">
					              		<img src="${pageContext.request.contextPath }/resources/upFile/chatRoom/${message.chatFileRenamedFilename}" alt="" style="width:30%; height:30%; margin-left:25%; cursor: pointer;" onclick="imgZooom('${message.chatFileRenamedFilename}')"/>
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
	<!-- ????????? ????????? (????????????) -->
	 <div class="test-member-list bg-light">
	 	<div class="memberList-size-controll-box mb-3" style="cursor: pointer;">
		 	<svg id="arrow-to-smaller" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
			  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
			</svg> <span class="ml-3">????????? ?????????</span>
	 	</div>
          <div class="online-member-list">
<!--             <div class="on-off-text">
              <p class="on-text">????????? - 3</p>
            </div> -->
    		<c:forEach var="user" items="${chatUserList }">
    		 <div class="test-member-profile">
            <div class="member-profile-img-box btn-profile2">
	           <c:choose>
		          	<c:when test="${fn:startsWith(user.renamedFilename,'http')}">
						<img class="member-profile-img" src="${user.renamedFilename}" alt="" style="width: 30px"/>
						<input type="hidden" name="profile_owner" value="${user.memberId }"/>
					</c:when>
					<c:otherwise>
		            	<img class="member-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${user.renamedFilename}" alt="">
		            	<input type="hidden" name="profile_owner" value="${user.memberId }"/>
		            </c:otherwise>
	          </c:choose>
		    </div>
              <span>${user.nickname }</span>
              </div>
		    </c:forEach>
            
    
          </div>
    
    
<!--           <div class="offline-member-list">
             <div class="on-off-text">
              <p class="off-text">???????????? - 1</p>
            </div>
            <div class="test-member-profile">
              <div class="member-profile-img-box">
                <img class="offline member-profile-img" src="https://i.pinimg.com/564x/9e/60/60/9e6060db90687be57c52ca5c5566c487.jpg" alt="">
              </div>
                <span>?????????</span> 
            </div>
    
          </div> -->
        </div>


    <!-- ????????? ?????????(????????????) (?????????) -->
     <div class="test-member-list-small bg-light">
         <div class="memberList-size-controll-box mb-3" style="cursor: pointer;">
			<svg id="arrow-to-bigger" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
			  <path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
			</svg>
	 	</div>
      <div class="online-member-list">
		<c:forEach var="user" items="${chatUserList }">
	        <div class="test-member-profile">
	          <div class="member-profile-img-box btn-profile2">
	            <c:choose>
	          	<c:when test="${fn:startsWith(user.renamedFilename,'http')}">
					<img class="member-profile-img" src="${user.renamedFilename}" alt="" style="width: 30px"/>
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
<style>

</style>    
<!-- ????????? ?????? ????????? -->
<div class="modal fade" id="img-zoom-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <img src="" alt="" id="img-zoom" />
    </div>
  </div>
</div>
  </section>
</main>
<div class="subscribe">

</div>
<c:if test="${expend == 'Y' }">
<script>
	$(".test-member-list-small").hide();
	$(".chat-input-box").removeClass('chat-input-box-sizing');
</script>
</c:if>
<c:if test="${expend == 'N' }">
<script>
	$(".test-member-list").hide();
	$(".chat-input-box").addClass('chat-input-box-sizing');
</script>
</c:if>
<!-- jquery.form.js  -->
<!-- <script src="http://malsup.github.com/jquery.form.js"></script> -->
<script>
//????????? ????????? (??????/??????) ??????


$(".memberList-size-controll-box").click((e)=>{
	$(".test-member-list-small").toggle();
	$(".test-member-list").toggle();
	$(".chat-input-box").toggleClass('chat-input-box-sizing');
	
	$.ajax({
		url: `${pageContext.request.contextPath}/gw/updateExpendCheck.do`,
		success(data){
		},
		error: console.log
	});
});


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
                // input file ????????? ????????? ???????????? ??????
                $file.files = files
                //showFiles($file.files)
                
            }
            
            $file.addEventListener("change", function(e) {
                showFiles(e.target.files)
            })

            // ???????????? ????????? ????????? ???????????? ???
            dropZone.addEventListener("dragenter", function(e) {
                e.stopPropagation()
                e.preventDefault()

            	console.log("??????");
                //toggleClass("dragenter")

            })

            // ???????????? ????????? dropZone ????????? ???????????? ???
            dropZone.addEventListener("dragleave", function(e) {
                e.stopPropagation()
                e.preventDefault()

            	console.log("?????????");
                //toggleClass("dragleave")

            })

            // ???????????? ????????? dropZone ????????? ????????? ?????? ???
            dropZone.addEventListener("dragover", function(e) {
                //e.stopPropagation()
            	console.log("???????????????"); //???????????? ??????
                e.preventDefault()

                //toggleClass("dragover")

            })

            // ???????????? ????????? ??????????????? ???
            dropZone.addEventListener("drop", function(e) {
                e.preventDefault()

                //toggleClass("drop")

                var files = e.dataTransfer && e.dataTransfer.files
                
                if (files != null) {
                    if (files.length < 1) {
                        alert("?????? ????????? ??????")
                        return
                    }
                    selectFile(files)
                } else {
                    alert("ERROR")
                }

				// drop file img preview
                if (document.getElementById('file').files && document.getElementById('file').files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#preview").attr('src', e.target.result);
                    };
                    reader.readAsDataURL(document.getElementById('file').files[0]);
                };
                $("#preview-btn-x").show();
            });

            
        })();
//drop img preview ?????????
$("#preview-btn-x").hide();
function deletePreview(){
	$("#preview").attr('src', "");
	$("#preview-btn-x").hide();
	$('#file-form')[0].reset();
};

// ????????? ?????? ?????? ??????
function imgZooom(chatFileRenamedFilename){	
	$("#img-zoom-modal").modal('show').css({
	    'margin-top': function (e) { //vertical centering
	        return -($(e.target).height() / 2);
	    },
	    'margin-left': function (e) { //Horizontal centering
	        return -($(e.target).width() / 2);
	    }
	});
	$("#img-zoom").attr('src',`${pageContext.request.contextPath }/resources/upFile/chatRoom/\${chatFileRenamedFilename}`);
}


// ????????? ????????? ??????
 $(".workspace-box").scrollTop($(".workspace-box")[0].scrollHeight); 
//????????? ?????? ????????? ?????? ?????? (?????? ???????????? ???????????? ??????)
if($(".chat-content").children().length == 0){
	$(".chat-content").append(`<div class="chat-message-box">
            <p>????????? ????????? ??????????????????!</p>
          </div>
        </div>`);
}
///chat/chatId
//1. Stomp Client ?????? ??????(websocket)

	const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
	const stompClient = Stomp.over(ws);
	
	// 2. ????????????
	stompClient.connect({}, (frame) =>{
		console.log("Stomp Connected : ", frame);
		
	// 3. ????????????
	// ????????? ??????
	stompClient.subscribe(`/chat/${chatRoomNo}`, (chatMessageContent) =>{
		var script = document.createElement("script");
		script.innerHTML = `$(".workspace-box").scrollTop($(".workspace-box")[0].scrollHeight); `;
		/* console.log("chatMessageContent : ", chatMessageContent); */
		const obj = JSON.parse(chatMessageContent.body);
		 console.log(obj);
		 const {nickname, msg, profileRenamedFilename, messageAt, logTime, chatFile, msgTypeNo} = obj;
		 
		 if(chatFile != null){
			 var target = chatFile.split(".")[0];			 
		 }else{
			 var target = "foo";
		 }
		 if(msgTypeNo == 99){
			 location.reload();
		 }
		if(msgTypeNo == 2){
		$(".chat-content").append(`<div class="chat-profile-container">
		      <div class="chat-user-profile">
	          </div>
	          <div class="chat-message-box">
	            <div class="chat-message-sender">
	              <span><strong>\${nickname}</strong></span>
	              <span>\${logTime}</span>
	            </div>
	            <div class="chat-message-content">
	              <a>\${msg}</a>
	              <div class="\${target}">
	              </div>
	            </div>
	          </div>
	        </div>`);
		}
		else if(msgTypeNo != 2){
			if(!msg.startsWith("```")){
		$(".chat-content").append(`<div class="chat-profile-container">
		      <div class="chat-user-profile">
	          </div>
	          <div class="chat-message-box">
	            <div class="chat-message-sender">
	              <span><strong>\${nickname}</strong></span>
	              <span>\${logTime}</span>
	            </div>
	            <div class="chat-message-content">
	              <p>\${msg}</p>
	              <div class="\${target}">
	              </div>
	            </div>
	          </div>
	        </div>`); 
			}else if(msg.startsWith("```") && msg.endsWith("```")){
				let $msg = msg.replaceAll("```","");
				$(".chat-content").append(`<div class="chat-profile-container">
					      <div class="chat-user-profile">
				          </div>
				          <div class="chat-message-box">
				            <div class="chat-message-sender">
				              <span><strong>\${nickname}</strong></span>
				              <span>\${logTime}</span>
				            </div>
				            <div class="chat-message-content">
						        <div>
									<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly>\${$msg}</textarea>
						        </div>
				              <div class="\${target}">
				              </div>
				            </div>
				          </div>
				        </div>`); 
			}
		}
		
		if(profileRenamedFilename.startsWith('http')){
			$(".chat-user-profile").append(`<img class="chat-user-profile-img" src="\${profileRenamedFilename}" alt="" style="height : 40px; width : 40px;"/>`);
			
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
	//dm ??????
	stompClient.subscribe(`/dm/${loginMember.id}`, (chatMessageContent) =>{
		/* console.log("chatMessageContent : ", chatMessageContent); */
		const obj = JSON.parse(chatMessageContent.body);
		 //dmWriter(obj);
		 
		 loadDM(obj);

	});
	
	

	
});
/* DM modal ?????? */
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

/* dm ????????? ?????? ?????? */
$("#btn-dm-message-send").click((e) =>{
	var receiver = $(e.target).siblings("input").val();

	var today = new Date();
	var hours = today.getHours(); // ???
	var minutes = today.getMinutes();  // ???
	const obj = {
		sender : "${loginMember.id}",
		receiver : receiver,
		msg : $("#dm-chatMessageContent").val(),
		msgTypeNo : 1
	};
		
	stompClient.send(`/app/dm/\${$("input[name=dm-memberId]").val()}`, {}, JSON.stringify(obj));
	setTimeout(function() { loadDM(obj)}
	, 90);
	
	
	$("#dm-chatMessageContent").val(''); // #message ?????????
});
// ?????? ????????? ????????????
$("#btn-message-send").click((e) =>{
	if($(file).prop('files').length == 0){
		if($("#chatMessageContent").val() == '') return;
		
	};
	var today = new Date();
	var hours = today.getHours(); // ???
	var minutes = today.getMinutes();  // ???
	var obj = {};
	var type = $("#chatMessageContent").val().indexOf('http') == '0' ? '2' : '1';
	console.log(type);
	
 	if($(file).prop('files').length == 0){
 		var $first = $(chatMessageContent).val().replaceAll("&","&amp;");
 		var $second = $first.replaceAll("<","&lt;");
 		var $third = $second.replaceAll(">","&gt;");
 		var $fourth = $third.replaceAll("(","&#40;");
 		var $fifth = $fourth.replaceAll(")","&quot;");
 		var $sixth = $fifth.replaceAll("\"","&#x27;");
 		var $seventh = $sixth.replaceAll("\'","&#x2F;");
 		var $eighth = $seventh.replaceAll("/","&#41;");
 		console.log($eighth);
	 	obj = {
			chatRoomNo : "${chatRoomNo}",
			memberId : "${loginMember.id}",
			msg : $eighth,
			logTime : hours + ":" + minutes,
			msgTypeNo : type
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
						chatFile : data,
						msgTypeNo : 2
						};
		        $('#file-form')[0].reset();
		        $('#preview').attr('src','');
		        $('#preview-btn-x').hide();
		 	},
		 	error : console.log
	    });  
	};
	
	
	setTimeout(function() {stompClient.send("/app/chat/${chatRoomNo}", {}, JSON.stringify(obj))}
	, 500);

	
	
	
	$(chatMessageContent).val(''); // #message ?????????
});
/* DM DB ?????? ajax */
function loadDM(obj){
	$(".dm-profile-container").text('');
	const {receiver, sender, senderNickname, msg, profileRenamedFilename, messageAt, logTime} = obj;
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
/* ????????? ?????? ?????? show // hide ?????? */
$(".btn-delete-chat-message").hide();
$(".chat-message-content").hover(function(e){
	$(e.target).parents(".chat-message-box").children(".btn-delete-chat-message").show();
	
}, function(e){
	$(".btn-delete-chat-message").hide();
	
});

$(".chat-message-sender").hover(function(e){
	$(e.target).parents(".chat-message-box").children(".btn-delete-chat-message").show();
	
}, function(e){
	$(".btn-delete-chat-message").hide();
	
});

/* ????????? ?????? */
$(".btn-delete-chat-message").click((e)=>{
	if(confirm("?????? ???????????? ?????????????????????????")){
		var chatMessageNo = $(e.target).data('chatMessageNo');
		$.ajax({
			url : "${pageContext.request.contextPath}/gw/chat/deleteChatMessage.do",
			data : {
				chatMessageNo : chatMessageNo
			},
			success(res){
				if(res > 0){
					alert("???????????? ?????????????????????.");
				 	obj = {
							msgTypeNo : 99
						};
					stompClient.send("/app/chat/${chatRoomNo}", {}, JSON.stringify(obj))
				};
			},
			error : console.log
		});
	};
	
});
</script>


  </body>
<script>
window.addEventListener("load", function(){
	$("#dropdownChat").removeClass("collapsed");
	$("#chatting-collapse").addClass("show");
	});
</script>
</html>
</sec:authorize>
      




