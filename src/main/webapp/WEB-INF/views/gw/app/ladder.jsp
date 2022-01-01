<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<link rel="import" href="http://www.polymer-project.org/components/paper-ripple/paper-ripple.html">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/ladder/ladder_style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/ladder/ladder_meterial.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
	<div class="app-outter">
		<div class="app-title-container">
			<div class="landing" id="landing">
		       <div class="start-form">
		            <div class="landing-form">
		                <div class="group">      
		                  <input type="text" name="member" required>
		                  <span class="highlight"></span>
		                  <span class="bar"></span>
		                  <label>참여자 수</label>
		                    <div  id="button" class="button raised green">
		                      <div  class="center" fit>START</div>
		                      <paper-ripple fit></paper-ripple>
		                    </div>
		                </div>
		            </div>
		       </div>
		    </div>
		    <div id="ladder" class="ladder">
		        <div class="dim"></div>
		         <canvas class="ladder_canvas" id="ladder_canvas"></canvas>
		    </div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/resources/js/ladder/ladder.js"></script>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>
