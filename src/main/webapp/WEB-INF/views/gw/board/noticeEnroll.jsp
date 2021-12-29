<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="공지사항 작성" name="title"/>
</jsp:include>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="member"/>
</sec:authorize>
<script src="${pageContext.request.contextPath }/resources/js/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/summernote-lite.css">

<div class="workspace-box">

<div class="groupware-board-enroll-outter">
  <!-- form 안에 에디터를 사용하는 경우 (보통 이경우를 많이 사용하는듯)-->
<div class="container">
  <form
		name="boardFrm"   
		enctype="multipart/form-data" 
		action="${pageContext.request.contextPath }/gw/board/noticeEnroll.do?${_csrf.parameterName}=${_csrf.token}" method="post"
		method="POST" 
		>
      <div class="input-group mb-3 mx-auto">
			<span class="input-group-text" id="inputGroup-sizing-default">제목</span>
			<input id="title" name="postTitle" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="제목을 입력해 주세요.">
			<input type="hidden" name="memberId" value="${member.id }" />
			<input type="hidden" name="memberName" value="${member.memberName }" />
			<input type="hidden" name="boardNo" value="${boardNo}" />
			<input type="hidden" name="groupNo" value="${groupNo}"/>
		</div>
		<textarea id="summernote" name="postContent"></textarea>
		<div class="input-group mb-3" style="padding:0px; padding-top: 5px;">
			<div class="input-group-prepend" style="padding:0px;">
			    <span class="input-group-text">첨부파일1</span>
			  </div>
			  <div class="custom-file">
			    <input type="file" class="custom-file-input" name="upFile"  >
			    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
			</div>
		</div>
		
	</form>
	<div class="d-grid gap-2 col-6 mx-auto">
		<button id="btn-send" class="btn btn-primary" type="button">작성 완료</button>
	</div>
</div>
<script>

$(document).ready(function() {
    //여기 아래 부분
    $('#summernote').summernote({
          height: 300,                 // 에디터 높이
          minHeight: 100,             // 최소 높이
          maxHeight: 500,             // 최대 높이
          focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
          lang: "ko-KR",                    // 한글 설정
          placeholder: '문의사항을 작성해 주세요.'    //placeholder 설정

    });
});

$('.summernote').summernote({
          toolbar: [
                // [groupName, [list of button]]
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                ['color', ['forecolor','color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['insert',['picture','link','video']],
                ['view', ['fullscreen', 'help']]
              ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
      });

  </script>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

