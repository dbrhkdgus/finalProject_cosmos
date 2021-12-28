<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>

<head>
    <title>Zoom WebSDK</title>
    <meta charset="utf-8" />
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/2.1.1/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/2.1.1/css/react-select.css" />
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="origin-trial" content="">
</head>

<body>
    <script src="https://source.zoom.us/2.1.1/lib/vendor/react.min.js"></script>
    <script src="https://source.zoom.us/2.1.1/lib/vendor/react-dom.min.js"></script>
    <script src="https://source.zoom.us/2.1.1/lib/vendor/redux.min.js"></script>
    <script src="https://source.zoom.us/2.1.1/lib/vendor/redux-thunk.min.js"></script>
    <script src="https://source.zoom.us/2.1.1/lib/vendor/lodash.min.js"></script>
    <script src="https://source.zoom.us/zoom-meeting-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/zoomAPI/tool.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/zoomAPI/vconsole.min.js"></script>
    <%-- <script src="${pageContext.request.contextPath }/resources/js/zoomAPI/meeting.js"></script> --%>

    <script>
    window.addEventListener('DOMContentLoaded', function(event) {
    	  console.log('DOM fully loaded and parsed');
    	  websdkready();
    	});

    	function websdkready() {
    	  var testTool = window.testTool;
    	  // get meeting args from url
    	  var tmpArgs = testTool.parseQuery();
    	  var meetingConfig = {
    	    apiKey: tmpArgs.apiKey,
    	    meetingNumber: tmpArgs.mn,
    	    userName: (function () {
    	      if (tmpArgs.name) {
    	        try {
    	          return testTool.b64DecodeUnicode(tmpArgs.name);
    	        } catch (e) {
    	          return tmpArgs.name;
    	        }
    	      }
    	      return (
    	        "CDN#" +
    	        tmpArgs.version +
    	        "#" +
    	        testTool.detectOS() +
    	        "#" +
    	        testTool.getBrowserInfo()
    	      );
    	    })(),
    	    passWord: tmpArgs.pwd,
    	    leaveUrl: "${pageContext.request.contextPath }/gw/voiceChat/close.do",
    	    role: parseInt(tmpArgs.role, 10),
    	    userEmail: (function () {
    	      try {
    	        return testTool.b64DecodeUnicode(tmpArgs.email);
    	      } catch (e) {
    	        return tmpArgs.email;
    	      }
    	    })(),
    	    lang: tmpArgs.lang,
    	    signature: tmpArgs.signature || "",
    	    china: tmpArgs.china === "1",
    	  };

    	  // a tool use debug mobile device
    	  if (testTool.isMobileDevice()) {
    	    vConsole = new VConsole();
    	  }
    	  console.log(JSON.stringify(ZoomMtg.checkSystemRequirements()));

    	  // it's option if you want to change the WebSDK dependency link resources. setZoomJSLib must be run at first
    	  // ZoomMtg.setZoomJSLib("https://source.zoom.us/2.1.1/lib", "/av"); // CDN version defaul
    	  if (meetingConfig.china)
    	    ZoomMtg.setZoomJSLib("https://jssdk.zoomus.cn/2.1.1/lib", "/av"); // china cdn option
    	  ZoomMtg.preLoadWasm();
    	  ZoomMtg.prepareJssdk();
    	  function beginJoin(signature) {
    	    ZoomMtg.init({
    	      leaveUrl: meetingConfig.leaveUrl,
    	      webEndpoint: meetingConfig.webEndpoint,
    	      disableCORP: !window.crossOriginIsolated, // default true
    	      // disablePreview: false, // default false
    	      success: function () {
    	        console.log(meetingConfig);
    	        console.log("signature", signature);
    	        ZoomMtg.i18n.load(meetingConfig.lang);
    	        ZoomMtg.i18n.reload(meetingConfig.lang);
    	        ZoomMtg.join({
    	          meetingNumber: meetingConfig.meetingNumber,
    	          userName: meetingConfig.userName,
    	          signature: signature,
    	          apiKey: meetingConfig.apiKey,
    	          userEmail: meetingConfig.userEmail,
    	          passWord: meetingConfig.passWord,
    	          success: function (res) {
    	            console.log("join meeting success");
    	            console.log("get attendeelist");
    	            ZoomMtg.getAttendeeslist({});
    	            ZoomMtg.getCurrentUser({
    	              success: function (res) {
    	                console.log("success getCurrentUser", res.result.currentUser);
    	              },
    	            });
    	          },
    	          error: function (res) {
    	            console.log(res);
    	          },
    	        });
    	      },
    	      error: function (res) {
    	        console.log(res);
    	      },
    	    });

    	    ZoomMtg.inMeetingServiceListener('onUserJoin', function (data) {
    	      console.log('inMeetingServiceListener onUserJoin', data);
    	    });
    	  
    	    ZoomMtg.inMeetingServiceListener('onUserLeave', function (data) {
    	      console.log('inMeetingServiceListener onUserLeave', data);
    	    });
    	  
    	    ZoomMtg.inMeetingServiceListener('onUserIsInWaitingRoom', function (data) {
    	      console.log('inMeetingServiceListener onUserIsInWaitingRoom', data);
    	    });
    	  
    	    ZoomMtg.inMeetingServiceListener('onMeetingStatus', function (data) {
    	      console.log('inMeetingServiceListener onMeetingStatus', data);
    	    });
    	  }

    	  beginJoin(meetingConfig.signature);
    	};

    </script>
</body>

</html>
