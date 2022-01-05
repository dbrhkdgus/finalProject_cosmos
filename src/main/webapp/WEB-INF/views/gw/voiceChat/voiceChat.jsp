<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<fmt:requestEncoding value="utf-8"/> 
<head>
    <title>WebSDK</title>
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/2.1.1/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/2.1.1/css/react-select.css" />
    
</head>
<body>
<style>
.sdk-select {height: 34px;border-radius: 4px;}
.websdktest button {float: right;margin-left: 5px;}
#nav-tool {position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);z-index: 99999;}
.container{z-index: 99999;display: flex;justify-content: center;}
#show-test-tool {position: absolute;top: 100px;left: 0;display: block;z-index: 0;}
#display_name {width: 250px;}
#websdk-iframe {width: 700px;height: 500px;border: 1px;border-color: red;border-style: dashed;position: fixed;top: 50%;left: 50%;transform: translate(-50%, -50%);left: 50%;margin: 0;}
body{width: none !important;height: none !important;}
</style>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>
    <nav id="nav-tool" class="navbar">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">화상 채팅</a>
        </div>
        <div id="navbar" class="websdktest">
            <form class="navbar-form navbar-right" id="meeting_form">
                <div class="form-group">
                    <input type="hidden" name="display_name" id="display_name" value="${loginMember.nickname }" maxLength="100"
                        placeholder="Name" class="form-control" required readonly>
                </div>
                <div class="form-group">
                    <input type="hidden" name="meeting_number2" id="meeting_number" value='${roomInfo.zoomId }' maxLength="200"
                        style="width:150px" placeholder="" class="form-control" required readonly>
                </div>
                <div class="form-group">
                    <input type="hidden" name="meeting_pwd2" id="meeting_pwd" value='${roomInfo.zoomPassword }' style="width:150px"
                        maxLength="32" placeholder="" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <input type="text" name="meeting_email" id="meeting_email" value="" style="width:150px"
                        maxLength="32" placeholder="Email 선택사항" class="form-control">
                </div>
                <div class="form-group">
                    <select id="meeting_role" class="sdk-select">
                        <option value=0>회의참석자</option>
                        <option value=1>회의주최자</option>
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

                <button type="submit" class="btn btn-primary" id="join_meeting">접속</button>
            </form>
        </div>
    </div>
	</nav>

<script src="https://source.zoom.us/2.1.1/lib/vendor/react.min.js"></script>
<script src="https://source.zoom.us/2.1.1/lib/vendor/react-dom.min.js"></script>
<script src="https://source.zoom.us/2.1.1/lib/vendor/redux.min.js"></script>
<script src="https://source.zoom.us/2.1.1/lib/vendor/redux-thunk.min.js"></script>
<script src="https://source.zoom.us/2.1.1/lib/vendor/lodash.min.js"></script>
<script src="https://source.zoom.us/zoom-meeting-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/zoomAPI/tool.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/zoomAPI/vconsole.min.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/zoomAPI/index.js"></script> --%>
<script>
const urlStr = window.location.href;
const urlParameter = window.location.search;
let params = new URLSearchParams(urlStr.search);
params.delete('roomNo');
console.log(urlStr);
console.log(urlParameter);
console.log(params);

window.addEventListener('DOMContentLoaded', function(event) {
	  console.log('DOM fully loaded and parsed');
	  websdkready();
	});

	function websdkready() {
	  var testTool = window.testTool;
	  if (testTool.isMobileDevice()) {
	    vConsole = new VConsole();
	  }
	  console.log("checkSystemRequirements");
	  console.log(JSON.stringify(ZoomMtg.checkSystemRequirements()));

	  ZoomMtg.preLoadWasm();

	  var API_KEY = "ua1hutGgSeqC1Uo8PdTjwQ";
	  var API_SECRET = "9TATzljhOhPC1nT6guYaJvVBg87lYgfNYsQN";

	  /* document.getElementById("display_name").value =
		    "CDN" +
		    ZoomMtg.getJSSDKVersion()[0] +
		    testTool.detectOS() +
		    "#" +
		    testTool.getBrowserInfo(); */
	  
	  document
	    .getElementById("meeting_lang")
	    .addEventListener("change", function (e) {
	      testTool.setCookie(
	        "meeting_lang",
	        document.getElementById("meeting_lang").value
	      );
	      testTool.setCookie(
	        "_zm_lang",
	        document.getElementById("meeting_lang").value
	      );
	    });

	  // click join meeting button
	  document
	    .getElementById("join_meeting")
	    .addEventListener("click", function (e) {
	      e.preventDefault();
	      var meetingConfig = testTool.getMeetingConfig();
	      if (!meetingConfig.mn || !meetingConfig.name) {
	        alert("Meeting number or username is empty");
	        return false;
	      }
	      testTool.setCookie("meeting_number", meetingConfig.mn);
	      testTool.setCookie("meeting_pwd", meetingConfig.pwd);

	      var signature = ZoomMtg.generateSignature({
	        meetingNumber: meetingConfig.mn,
	        apiKey: API_KEY,
	        apiSecret: API_SECRET,
	        role: meetingConfig.role,
	        success: function (res) {
	          console.log(res.result);
	          meetingConfig.signature = res.result;
	          meetingConfig.apiKey = API_KEY;
	          var joinUrl = "${pageContext.request.contextPath }/gw/voiceChat/meeting.do?" + testTool.serialize(meetingConfig);
	          console.log(joinUrl);
	          window.open(joinUrl, "_blank");
	        },
	      });
	      window.close();
	    });

	  function copyToClipboard(elementId) {
	    var aux = document.createElement("input");
	    aux.setAttribute("value", document.getElementById(elementId).getAttribute('link'));
	    document.body.appendChild(aux);  
	    aux.select();
	    document.execCommand("copy");
	    document.body.removeChild(aux);
	  }
	}

</script>
<style>
#zmmtg-root{
background-color: white !important;
}
</style>
</body>
</html>
