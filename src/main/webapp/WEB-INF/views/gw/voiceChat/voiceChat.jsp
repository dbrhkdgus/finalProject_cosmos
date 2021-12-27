<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="Zoom" name="title"/>
</jsp:include>
<link type="text/css" rel="stylesheet" href="https://source.zoom.us/2.1.1/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="https://source.zoom.us/2.1.1/css/react-select.css"/>
<style>

.sdk-select {height: 34px;border-radius: 4px;}
.websdktest button {float: right;margin-left: 5px;}
#nav-tool {margin-bottom: 0px;z-index: 99999;}
.container{z-index: 99999;display: flex;justify-content: center;}
#show-test-tool {position: absolute;top: 100px;left: 0;display: block;z-index: 0;}
#display_name {width: 250px;}
#websdk-iframe {width: 700px;height: 500px;border: 1px;border-color: red;border-style: dashed;position: fixed;top: 50%;left: 50%;transform: translate(-50%, -50%);left: 50%;margin: 0;}
body{width: none !important;height: none !important;}

</style>

  <div class="voice-chat-workspace">
    <nav id="nav-tool">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">화상 채팅</a>
        </div>
        <div id="navbar" class="websdktest">
            <form class="navbar-form navbar-right" id="meeting_form">
                <div class="form-group">
                    <input type="hidden" name="display_name" id="display_name" value="2.1.1#CDN" maxLength="100"
                        placeholder="Name" class="form-control" required>
                </div>
                <div class="form-group">
                    <input type="hidden" name="meeting_number" id="meeting_number" value="" maxLength="200"
                        style="width:150px" placeholder="Meeting Number" class="form-control" required>
                </div>
                <div class="form-group">
                    <input type="hidden" name="meeting_pwd" id="meeting_pwd" value="" style="width:150px"
                        maxLength="32" placeholder="Meeting Password" class="form-control">
                </div>
                <div class="form-group">
                    <input type="text" name="meeting_email" id="meeting_email" value="" style="width:150px"
                        maxLength="32" placeholder="Email option" class="form-control">
                </div>

                <div class="form-group">
                    <select id="meeting_role" class="sdk-select">
                        <option value=0>회의참석자</option>
                        <option value=1>회의주최자</option>
                        <option value=5>회의보조</option>
                    </select>
                </div>
                <div class="form-group">
                    <select id="meeting_china" class="sdk-select">
                        <option value=0>Global</option>
                    </select>
                </div>
                <div class="form-group">
                    <select id="meeting_lang" class="sdk-select">
                        <option value="ko-KO">한국어</option>
                        <option value="en-US">English</option>
                    </select>
                </div>

                <input type="hidden" value="" id="copy_link_value" />
                <button type="submit" class="btn btn-primary" id="join_meeting">접속</button>
                <!-- <button type="submit" class="btn btn-primary" id="clear_all">삭제</button> -->
                <!-- <button type="button" link="" onclick="window.copyJoinLink('#copy_join_link')"
                    class="btn btn-primary" id="copy_join_link">링크 주소 만들기</button> -->


            </form>
        </div>
        <!--/.navbar-collapse -->
    </div>
	</nav>
	
	
<!-- 	<div id="show-test-tool">
	    <button type="submit" class="btn btn-primary" id="show-test-tool-btn"
	        title="show or hide top test tool">숨기기</button>
	</div> -->
  </div>
<!-- <script>
    document.getElementById('show-test-tool-btn').addEventListener("click", function (e) {
        var textContent = e.target.textContent;
        if (textContent === 'Show') {
            document.getElementById('nav-tool').style.display = 'block';
            document.getElementById('show-test-tool-btn').textContent = 'Hide';
        } else {
            document.getElementById('nav-tool').style.display = 'none';
            document.getElementById('show-test-tool-btn').textContent = 'Show';
        }
    })
</script> -->

<script src="https://source.zoom.us/2.1.1/lib/vendor/react.min.js"></script>
<script src="https://source.zoom.us/2.1.1/lib/vendor/react-dom.min.js"></script>
<script src="https://source.zoom.us/2.1.1/lib/vendor/redux.min.js"></script>
<script src="https://source.zoom.us/2.1.1/lib/vendor/redux-thunk.min.js"></script>
<script src="https://source.zoom.us/2.1.1/lib/vendor/lodash.min.js"></script>
<script src="https://source.zoom.us/zoom-meeting-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/zoomAPI/tool.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/zoomAPI/vconsole.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/zoomAPI/index.js"></script>

<script>
window.addEventListener('load', function() {
$('body').css('background-color','');
$('body').css('height','');
$('body').css('width','');
});
</script>

<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

