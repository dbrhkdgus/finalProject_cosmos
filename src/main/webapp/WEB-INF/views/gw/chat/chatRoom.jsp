<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
  <div class="workspace-box" >
    <div class="chat-content">

        <!-- 채팅1 시작 -->
        <c:choose>
	        <c:when test="${not empty messageList }">
		        <div class="chat-profile-container">
		          <div class="chat-user-profile">
		            <img class="chat-user-profile-img" src="https://i.pinimg.com/564x/9e/60/60/9e6060db90687be57c52ca5c5566c487.jpg" alt="">
		          </div>
		          <div class="chat-message-box">
		            <div class="chat-message-sender">
		              <span><strong>홍길동</strong></span>
		              <span>11:10</span>
		            </div>
		            <div class="chat-message-content">
		              <p>가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하</p>
		            </div>
		          </div>
		        </div>
	        </c:when>
	        <c:otherwise>
		        <div class="chat-message-content">
			              <p>새로운 채팅을 시작해보세요!</p>
			    </div>
	        </c:otherwise>
        </c:choose>
        <!-- 채팅1  끝 -->
        
 
       
        </div>
        
		    <div class="chat-input-box">
		
		      <div class="chat-txt border-top">
		        <input type="text" class="form-control" name="chatMessageContent">
		      </div>
		      <div class="btn-group">
		        <i class="fa fa-meh-o" aria-hidden="true"></i>
		        <!-- <button type="button" class="btn btn-white" data-original-title="" title="">
		        </button> -->
		          <i class="fa fa-paperclip"></i>
		      </div>
		      <button id="btn-message-send" class="btn btn-danger" data-original-title="" title="">Send</button>
		    </div> 
        
        
      </div>
<!-- jquery.form.js  -->
<script src="http://malsup.github.com/jquery.form.js"></script>
<script>
$("#btn-message-send").click((e)=>{
	
/* 	$.ajax({
		url:"${pageContext.request.contextPath}/gw/chat/chatEnroll.do",
		
	}); */
});
</script>
      


<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>
