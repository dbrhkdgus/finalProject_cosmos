<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MANAGER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
  <div class="workspace-box" >
    <div class="chat-content">
      <div class="chat-content-container">

        <!-- 채팅1 시작 -->
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
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Labore ea iusto possimus culpa soluta recusandae? Repellendus ad ea sunt asperiores dolores repudiandae sequi iure architecto, quibusdam ipsum veritatis vero error.
            </div>
          </div>
        </div>
        <!-- 채팅1  끝 -->
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
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Labore ea iusto possimus culpa soluta recusandae? Repellendus ad ea sunt asperiores dolores repudiandae sequi iure architecto, quibusdam ipsum veritatis vero error.
            </div>
          </div>
        </div>
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
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Labore ea iusto possimus culpa soluta recusandae? Repellendus ad ea sunt asperiores dolores repudiandae sequi iure architecto, quibusdam ipsum veritatis vero error.
            </div>
          </div>
        </div>
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
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Labore ea iusto possimus culpa soluta recusandae? Repellendus ad ea sunt asperiores dolores repudiandae sequi iure architecto, quibusdam ipsum veritatis vero error.
            </div>
          </div>
        </div>  
      </div>

      
    </div>
    <div class="chat-input-box">

      <div class="chat-txt border-top">
        <input type="text" class="form-control">
      </div>
      <div class="btn-group">
        <i class="fa fa-meh-o" aria-hidden="true"></i>
        <!-- <button type="button" class="btn btn-white" data-original-title="" title="">
        </button> -->
          <i class="fa fa-paperclip"></i>
      </div>
      <button class="btn btn-danger" data-original-title="" title="">Send</button>
    </div>
  </div>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

</sec:authorize>