<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
      <div class="groupware-saved-outter">
        <div class="groupware-saved-title p-4 mb-4">
          <h3>저장된 항목</h3>
        </div>
        <div class="groupware-saved-card-box mb-4">
          
          <div class="card" style="width: 90%; box-shadow: 2px 3px 6px #ccc;">
            <div class="card-header">
              <span class="font-weight-bold">#그룹채팅방</span>
            </div>
            <div class="card-body">
              <div class="groupware-saved-inner">
                
                <div class="groupware-saved-user-info">
                  <div class="member-profile-img-box text-center">
                    <img class="member-profile-img"
                    src="https://i.pinimg.com/564x/99/51/63/9951637d5cf332dfbdbe9d3dfabec361.jpg" alt="">
                  </div>
                </div>
                <div class="groupware-saved-user-name-fileType ml-3">
                  <span class="mb-0 font-weight-bold">홍길동</span><span class="text-secondaryr ml-3"> <span class="groupware-istoday">오늘 </span>오후
                  3:56</span>
                    <p class="mb-0 ml-1 text-secondary">zip<svg xmlns="http://www.w3.org/2000/svg" width="9" height="9"
                      fill="currentColor" class="bi bi-chevron-bar-down" viewBox="0 0 16 16">
                      <path fill-rule="evenodd"
                      d="M3.646 4.146a.5.5 0 0 1 .708 0L8 7.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708zM1 11.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5z" />
                    </svg></p>
                  </div>
                </div>
                <div class="groupware-saved-file-info mt-2">
                  <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"
                  class="bi bi-file-earmark-zip" viewBox="0 0 16 16">
                  <path
                  d="M5 7.5a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v.938l.4 1.599a1 1 0 0 1-.416 1.074l-.93.62a1 1 0 0 1-1.11 0l-.929-.62a1 1 0 0 1-.415-1.074L5 8.438V7.5zm2 0H6v.938a1 1 0 0 1-.03.243l-.4 1.598.93.62.929-.62-.4-1.598A1 1 0 0 1 7 8.438V7.5z" />
                  <path
                  d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1h-2v1h-1v1h1v1h-1v1h1v1H6V5H5V4h1V3H5V2h1V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z" />
                </svg>
                <p class="mb-0 ml-3">originalFilename</p>
              </div>
            </div>
          </div>
        </div>
        <div class="groupware-saved-card-box mb-4">
          
          <div class="card" style="width: 90%; box-shadow: 2px 3px 6px #ccc;">
            <div class="card-header">
              <span class="font-weight-bold">#그룹채팅방</span>
            </div>
            <div class="card-body">
              <div class="groupware-saved-inner">
                
                <div class="groupware-saved-user-info">
                  <div class="member-profile-img-box text-center">
                    <img class="member-profile-img"
                    src="https://i.pinimg.com/564x/99/51/63/9951637d5cf332dfbdbe9d3dfabec361.jpg" alt="">
                  </div>
                </div>
                <div class="groupware-saved-user-name-fileType ml-3">
                  <span class="mb-0 font-weight-bold">홍길동</span><span class="text-secondaryr ml-3"> <span class="groupware-istoday">오늘 </span>오후
                  3:56</span>
                    <p class="mb-0 ml-1 text-secondary">zip<svg xmlns="http://www.w3.org/2000/svg" width="9" height="9"
                      fill="currentColor" class="bi bi-chevron-bar-down" viewBox="0 0 16 16">
                      <path fill-rule="evenodd"
                      d="M3.646 4.146a.5.5 0 0 1 .708 0L8 7.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708zM1 11.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5z" />
                    </svg></p>
                  </div>
                </div>
                <div class="groupware-saved-file-info mt-2">
                  <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"
                  class="bi bi-file-earmark-zip" viewBox="0 0 16 16">
                  <path
                  d="M5 7.5a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v.938l.4 1.599a1 1 0 0 1-.416 1.074l-.93.62a1 1 0 0 1-1.11 0l-.929-.62a1 1 0 0 1-.415-1.074L5 8.438V7.5zm2 0H6v.938a1 1 0 0 1-.03.243l-.4 1.598.93.62.929-.62-.4-1.598A1 1 0 0 1 7 8.438V7.5z" />
                  <path
                  d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1h-2v1h-1v1h1v1h-1v1h1v1H6V5H5V4h1V3H5V2h1V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z" />
                </svg>
                <p class="mb-0 ml-3">originalFilename</p>
              </div>
            </div>
          </div>
        </div>
        <div class="groupware-saved-card-box mb-4">
          
          <div class="card" style="width: 90%; box-shadow: 2px 3px 6px #ccc;">
            <div class="card-header">
              <span class="font-weight-bold">#그룹채팅방</span>
            </div>
            <div class="card-body">
              <div class="groupware-saved-inner">
                
                <div class="groupware-saved-user-info">
                  <div class="member-profile-img-box text-center">
                    <img class="member-profile-img"
                    src="https://i.pinimg.com/564x/99/51/63/9951637d5cf332dfbdbe9d3dfabec361.jpg" alt="">
                  </div>
                </div>
                <div class="groupware-saved-user-name-fileType ml-3">
                  <span class="mb-0 font-weight-bold">홍길동</span><span class="text-secondaryr ml-3"> <span class="groupware-istoday">오늘 </span>오후
                  3:56</span>
                    <p class="mb-0 ml-1 text-secondary">zip<svg xmlns="http://www.w3.org/2000/svg" width="9" height="9"
                      fill="currentColor" class="bi bi-chevron-bar-down" viewBox="0 0 16 16">
                      <path fill-rule="evenodd"
                      d="M3.646 4.146a.5.5 0 0 1 .708 0L8 7.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708zM1 11.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5z" />
                    </svg></p>
                  </div>
                </div>
                <div class="groupware-saved-file-info mt-2">
                  <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"
                  class="bi bi-file-earmark-zip" viewBox="0 0 16 16">
                  <path
                  d="M5 7.5a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v.938l.4 1.599a1 1 0 0 1-.416 1.074l-.93.62a1 1 0 0 1-1.11 0l-.929-.62a1 1 0 0 1-.415-1.074L5 8.438V7.5zm2 0H6v.938a1 1 0 0 1-.03.243l-.4 1.598.93.62.929-.62-.4-1.598A1 1 0 0 1 7 8.438V7.5z" />
                  <path
                  d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1h-2v1h-1v1h1v1h-1v1h1v1H6V5H5V4h1V3H5V2h1V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z" />
                </svg>
                <p class="mb-0 ml-3">originalFilename</p>
              </div>
            </div>
          </div>
        </div>
        
        </div>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

