<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<script type = "text/javascript" src = "https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>


<body>
	<div class="container">
    	<div class="API-outer">
       	 <div id = "naver_id_login"></div>
			<div class="kakao-login"><a href="javascript:kakaoLogin();"><img src="https://i.ibb.co/3Fkxghp/kakao-login-medium-narrow.png" alt="카카오계정 로그인" /></a></div>
       	 	<div class="g-signin2" data-onsuccess="onSignIn"></div>
    	<button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do';">사이트 회원가입</button>
    	</div>
    </div>
    
    
    <!--  카카오 로그인 API  script-->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        window.Kakao.init('753f0f237470af5e83541545d143b9c3');
        
        function kakaoLogin() {
            window.Kakao.Auth.login({
                // scope: 'profile, account_email, gender, age_range, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account)
                        }
                    });
                    // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
        </script>
        

<!-- 구글 로그인 스크립트 -->
<script>

    //처음 실행하는 함수
    function init() {
        gapi.load('auth2', function() {
            gapi.auth2.init();
            options = new gapi.auth2.SigninOptionsBuilder();
            options.setPrompt('select_account');
            // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
            options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
            // 인스턴스의 함수 호출 - element에 로그인 기능 추가
            // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
            gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
        })
    }
    
    function onSignIn(googleUser) {
        var access_token = googleUser.getAuthResponse().access_token
        $.ajax({
            // people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
            url: 'https://people.googleapis.com/v1/people/me'
            // key에 자신의 API 키를 넣습니다.
            , data: { key:'AIzaSyDtBs-vOsqfLVNt0jTMZt63J6XMdaQGQhk', 'access_token': access_token}
            , method:'GET'
        })
        .done(function(e){
            //프로필을 가져온다.
            var profile = googleUser.getBasicProfile();
            console.log(profile)
        })
        .fail(function(e){
            console.log(e);
        })
    }
    function onSignInFailure(t){		
        console.log(t);
    }
    </script>
   
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    
    
    <!--네이버 로그인 API script  -->
    
    <script type="text/javascript">
 
         var naver_id_login = new naver_id_login("t6ywrFn9RAlIgZNsmGII", "http://localhost:9090");    // Client ID, CallBack URL 삽입
                                            // 단 'localhost'가 포함된 CallBack URL
         var state = naver_id_login.getUniqState();
        
         naver_id_login.setButton("white", 4, 40);
         naver_id_login.setDomain("http://localhost:9090");    //  URL
         naver_id_login.setState(state);
         naver_id_login.setPopup();
         naver_id_login.init_naver_id_login();
 
</script>
    
    
</body>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>