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
		<div class="box_login login_main">
		<img src="https://t4.ftcdn.net/jpg/03/75/58/15/360_F_375581544_r5aDqkhnhrqy15AdaqKXUI30MMtL8IIq.jpg" width="41%" alt="welcome coupon">
            <h3 class="tit text-center" >Cosmos 회원가입</h3>
			<div class="API-outer">
			<div class="box_btn">
				<a class="btn" href="${pageContext.request.contextPath}/member/memberEnroll.do">이메일 회원가입</a>
			</div>                
			 <div id = "naver_id_login"></div>
			 	<div class="kakao-login"><a href="javascript:kakaoLogin();"><img src="https://i.ibb.co/3Fkxghp/kakao-login-medium-narrow.png" alt="카카오계정 로그인" /></a></div>
       	 	<div class="g-signin2" data-onsuccess="onSignIn"></div>
		</div>
				
    	</div>
 					<form name="loginForm" class="form-signin" method="request"
					action="">
					
						<input type="hidden" name="id" val="" />
						<input type="hidden" name="memberName" val="" />
						<input type="hidden" name="gender" val="" />
						<input type="hidden" name="_birthDay" val="" />
						<input type="hidden" name="profile_img" val="" />
					
				</form>
    	
    </div>
    
    
	<!-- 카카오 스크립트 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>

	Kakao.init('753f0f237470af5e83541545d143b9c3'); //발급받은 키 중 javascript키를 사용해준다.
	//console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오
	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log("여기", response);
	        	  $("input[name=id]").val(response.id);
	        	  console.log($("input[name=id]").val());
	        	  $("input[name=gender]").val(response.kakao_account.gender == 'male' ? 'M' : 'F');
	        	  console.log($("input[name=gender]").val());
	        	  $("input[name=_birthDay]").val(response.kakao_account.birthday);
	        	  console.log( $("input[name=_birthDay]").val());
	        	  $("input[name=memberName]").val(response.kakao_account.profile.nickname);
	        	  console.log($("input[name=memberName]").val());
	        	  $("input[name=profile_img]").val(response.kakao_account.profile.thumbnail_image_url);
	        	  console.log($("input[name=profile_img]").val());
	        	  
	        	  $(document.loginForm).attr('action',"${pageContext.request.contextPath}/member/memberLoginKakaoMoreInfo.do");
	        	  console.log(document.loginForm.action);
	        	  
	        	  $(document.loginForm).submit();
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  };
	</script>
        

    

    
    
</body>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>