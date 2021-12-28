<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<div class="groupware-board-enroll-outter">
  <!-- form 안에 에디터를 사용하는 경우 (보통 이경우를 많이 사용하는듯)-->
<h2 class="text-center mt-3">게시글 작성</h2>
<div class="container">
  <form method="post">
      <div class="input-group mb-3 w-50 mx-auto">
          <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
          <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="제목을 입력해 주세요.">
      </div>
      <textarea id="summernote" name="editordata"></textarea>
  </form>
  <div class="d-grid gap-2 col-6 mx-auto">
      <button class="btn btn-primary" type="submit">작성 완료</button>
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
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

