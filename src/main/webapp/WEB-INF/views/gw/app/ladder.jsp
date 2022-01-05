<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<link rel="import" href="http://www.polymer-project.org/components/paper-ripple/paper-ripple.html">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/ladder/ladder_style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/ladder/ladder_meterial.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/ladder/ladder.js"></script>
<style>
@import url(https://fonts.googleapis.com/css?family=BenchNine:700);
#snip1535 {background-color: #c47135;border: none;color: #ffffff;cursor: pointer;display: inline-block;font-family: 'BenchNine', Arial, sans-serif;font-size: 1em;font-size: 22px;line-height: 1em;margin: 15px 40px;outline: none;padding: 12px 40px 10px;position: relative;text-transform: uppercase;font-weight: 700;
}
#snip1535:before, #snip1535:after {border-color: transparent;-webkit-transition: all 0.25s;transition: all 0.25s;border-style: solid;border-width: 0;content: "";height: 24px;position: absolute;width: 24px;
}
#snip1535:before {border-color: #c47135;border-right-width: 2px;border-top-width: 2px;right: -5px;top: -5px;
}
#snip1535:after {border-bottom-width: 2px;border-color: #c47135;border-left-width: 2px;bottom: -5px;left: -5px;
}
#snip1535:hover, #snip1535.hover {background-color: green;
}
#snip1535:hover:before, #snip1535.hover:before, #snip1535:hover:after, #snip1535.hover:after {height: 100%;width: 100%;
}
</style>   
	<div class="workspace-box">
			<div class="landing" id="landing">
		       <div class="start-form">
		            <div class="landing-form">
		              <div style="display: flex;justify-content: center;font-size: 40px;">
						<h2 style="color: red;text-shadow: 1px 1px 0 blue;font: bold;">사</h2>
						<h2 style="color: orange;text-shadow: 1px 1px 0 blue;font: bold;">다</h2>
						<h2 style="color: yellow;text-shadow: 1px 1px 0 blue;font: bold;">리</h2>
						<h2 style="color: lightGreen;text-shadow: 1px 1px 0 blue;font: bold;">타</h2>
						<h2 style="color: blue;text-shadow: 1px 1px 0 blue;font: bold;">기</h2>
						<br />
					  </div>
		                <div class="group">      
		                  <input type="text" name="member" required>
		                  <span class="highlight"></span>
		                  <span class="bar"></span>
		                  <label>참여자 수</label>
		                    <div  id="button" class="button">
		                      <div id="snip1535" class="center" fit>START</div>
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
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>
</sec:authorize>