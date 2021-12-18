<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
  <div class="voice-chat-workspace" >
    <div class="voice-chat-box">
      <div class="voice-chat-thumbnail-container">

        <!-- 화면공유 1 시작 -->
        <div class="voice-chat-display-share">
          <div class="voice-chat-display-box">
            <img class="voice-chat-display" src="https://cdn.discordapp.com/attachments/912943660943962177/920648113855807571/unknown.png" alt="">
          </div>
        </div>
        <!-- 화면공유 1 끝 -->

        <!-- 음성채팅 참가자 썸네일 1 시작-->
        <div class="voice-chat-participant">
          <div class="voice-chat-thumbnail-box">
            <img 
            	class="voice-chat-thumbnail" 
            	src="https://i.pinimg.com/564x/99/51/63/9951637d5cf332dfbdbe9d3dfabec361.jpg"
            	
            	alt="">
          </div>
        </div>
        <!-- 음성채팅 참가자 썸네일 1 끝-->
        


      </div>
      <div class="voice-chat-icon-box">
        
        <li><img class="voice-chat-icon" src="https://i.ibb.co/nRsqHLk/video-camera.png" alt=""></li>
        <li><img class="voice-chat-icon" src="https://i.ibb.co/7kP0gHK/no-video.png" alt=""></li>
        <li><img class="voice-chat-icon" src="https://i.ibb.co/zSdbxd2/sharing.png" alt=""></li>
        <li><img class="voice-chat-icon" src="https://i.ibb.co/5L3zHyK/cross.png" alt=""></li>
        <li><img class="voice-chat-icon" src="https://i.ibb.co/QPsSkZ7/voice.png" alt=""></li>
        <li><img class="voice-chat-icon" src="https://i.ibb.co/ssCqPnc/mute.png" alt=""></li>
        <li><img class="voice-chat-icon" src="https://i.ibb.co/1rvhbjV/call.png" alt=""></li>
        <li><img class="voice-chat-icon" src="https://i.ibb.co/cgFP77g/logout.png" alt=""></li>
      </div>
    </div>
      
    
  </div>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

