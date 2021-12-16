<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
        <div class="main-container">
        <div class="main-group1" >
        <h2>[백엔드]Spring뽀개기</h2>
        <br>
        <span>청춘의 피는 끓는다 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온 동력은 바로 이것이다 이성은 투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가</span>
        </div>
    
      <!--메인페이지 공지사항-->
        <div class="main-group2" >
            <h3>공지사항</h3>
          <ul>
              <li>공지사항</li>
              <li>공지사항</li>
              <li>공지사항</li>
          </ul>
        </div>
    
        <!-- 메인페이지 달력-->
           <div class="main-group3">
                <h3>Calendar</h3>
                <img class="image" src="resources/달력.PNG" alt="">
               
            </div>
        </div>


<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

