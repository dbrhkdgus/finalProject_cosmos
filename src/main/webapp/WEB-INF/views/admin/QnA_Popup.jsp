<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Accounts - Product Admin Template</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  <style>
    #searchKeyword{
      width: 75%; display: inline;
    }
    .selectBar{
      width: 20%;
    }
  </style>
  
  </head>

  <body>
<!-- 매테리얼 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">

<style>
#view-title {display:flex; height:60px;}
#view-title div {display:inline-flex; justify-content:center; align-items:center; margin:0 auto;}
#view-title div:first-child span {font-size:12px; color:#8e929f;}
#view-title div:nth-child(2) span {font-size:19px; font-weight:500;}
#view-title div:last-child span {font-size:12px; color:#efbc1f;}
hr {background-color:#8e929f;}
#view-content div {padding:10px 30px;}
#view-content div span {border:1px solid #eceef2; padding:5px 10px; font-size:14px;}
#view-content div span:nth-child(1) {text-align:center; background-color:#eceef2;}
#content-answer {background-color:#eceef2; height:100px; overflow:scroll;}
#content-answer p:last-child {font-size:12px; color:#8e929f; margin:0;}
#askBoardAnswerFrm textarea {font-size:14px;}
#askBoardAnswerFrm textarea:focus-visible {outline:none;}
#askBoardAnswerFrm a {background-color:#212529; color:#eceef2; padding:5px 10px; border:0; border-radius:0 0 0.2rem 0.2rem; font-size:.9rem;}
#askBoardCancelFrm a {background-color:#ffd749; color:#212529; padding:5px 10px; border:0; border-radius:0 0 0.2rem 0.2rem; font-size:.9rem;}
</style>
	
	<div class="container">
		<div class="row">
		
			<!-- 접수상태, 문의번호, 문의날짜 -->
			<div id="view-title" class="container">
				<div class="col-3">
					<span>2021-11-11</span>
				</div>
				<div class="col-6">
					<span>문의번호 : 5</span>
				</div>
				<div class="col-3">
					<span>처리 중</span>
				</div>
			</div>
			
			<hr>
			
			<div id="view-content" class="container">
				<!-- 작성자 -->
				<div id="writer" class="col-12 list-group">
					<span class="list-group-item col-12">작성자</span><span class="list-group-item col-12">kh1231</span>
				</div>
				<div id="category" class="col-12 list-group list-group-horizontal">
					<span class="list-group-item col-12">분류</span><span class="list-group-item col-12">결제</span>
				</div>
			 

				<!-- 제목 -->
				<div id="title" class="col-12 list-group list-group-horizontal">
					<span class="list-group-item">제목</span><span class="list-group-item">프리미엄 관련 질문드립니다.</span>
				</div>
				<!-- 문의 사항 -->
				<div id="content" class="list-group col-12">
					<span class="list-group-item col-12">문의 사항</span>
					<span class="list-group-item col-12">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit quos sint aliquid rem saepe itaque, repellendus incidunt. Assumenda et earum, mollitia sequi esse commodi culpa animi. Vero dolorum rerum illum.
					Unde exercitationem temporibus, nostrum magnam repellat iure eaque assumenda accusamus dolores, obcaecati atque optio labore incidunt vero quod quibusdam neque, molestias quia officia voluptas magni aliquid consectetur consequuntur ullam! Placeat?
					Nostrum quas sequi doloribus dicta numquam possimus id illum, libero optio, quo fuga facere dolore veritatis esse consectetur repellendus ad. Eaque aliquam reiciendis a magni earum nemo quod iure labore!</span>
				<!-- 답변이 있을경우에만 답변과 답변날짜 출력 -->
					<!-- <span id="content-answer" class="list-group-item col-12">
						<p>이런이런 답변을 해드렸습니다 Lorem ipsum dolor sit, amet consectetur adipisicing elit. Amet deleniti veniam magnam odit suscipit animi laborum optio molestiae dicta quas explicabo, ea consequatur neque repudiandae iste at dolores nostrum. Delectus.
						Eaque officiis vero dolorum at consequuntur dolorem similique nobis, laborum labore impedit ab eos quibusdam saepe distinctio blanditiis atque amet! Quia animi in distinctio. Nemo odit mollitia quisquam rem unde. 답변이 도움이 되셨나요?</p>
						<p>2011-11-12 &nbsp; 관리자 admin</p>
					</span> -->
				
					<!--  <form id="askBoardAnswerFrm" name="askBoardAnswerFrm" method="post">
						<input type="hidden" name="inquiryNo" value="<%= askBoard.getInquiryNo() %>"/>
						<textarea style="background-color: darkgrey;" class="list-group-item col-12" name="answer" id="answer" rows="5">답변 드립니다. 추가적으로 문의사항이 있으시면 언제든 문의 게시판을 활용해주세요. 감사합니다.</textarea>
						<input type="hidden" name="adminId" value="<%= loginMember != null ? loginMember.getMemberId() : "" %>
						<a class="btn list-group-item col-12 " href="javascript:askBoardAnswerEnroll();">답변 등록</a>
					</form>  -->

					<!-- <a class="btn list-group-item col-12" href="javascript:deleteNoticeBoard();">삭제</a>	 -->

				</div>
			</div>
			
		</div>
	</div>
	<br/>
<script>

/* 
 * 상세페이지에서 답변등록버튼 클릭하면, 수정여부 확인후 팝업창이 닫히며 부모창에 액션을 전달하는 구조
 * 팝업창 데이터를 부모창에 넘기면서 페이지 액션 submit을 주기위해 target을 설정해서 사용했다.
 * 1) 팝업창에서 답변등록버튼 클릭하면, updateAskBoard() 스크립트 호출
 * 2) form에 데이터가 target으로 이동하며 페이지 액션 발생
 */
const askBoardAnswerEnroll = () => {
	if(confirm("답변을 등록하시겠습니까?")){
		//부모창의 이름을 설정
		window.opener.name = "parentPage";
		//타겟을 부모창으로 설정
		document.askBoardAnswerFrm.target = "parentPage";
		//부모창에 호출될 url
		document.askBoardAnswerFrm.action = "#";
		document.askBoardAnswerFrm.submit(); //폼 submit
		self.close(); //팝업창을 스스로 닫도록 하는 코드
	}
};

</script>
  </body>

</html>

