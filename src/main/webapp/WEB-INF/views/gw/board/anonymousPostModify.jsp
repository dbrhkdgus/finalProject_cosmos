<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MANAGER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">

<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="게시글 수정" name="title"/>
</jsp:include>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="member"/>
</sec:authorize>
<script src="${pageContext.request.contextPath }/resources/js/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/summernote-lite.css">

<div class="workspace-box">
<div class="p-5">
  <!-- form 안에 에디터를 사용하는 경우 (보통 이경우를 많이 사용하는듯)-->

<div class="container">
  
  <form
		name="anonymousFrm"   
		enctype="multipart/form-data" 
		action="${pageContext.request.contextPath }/gw/board/anonymousPostModify.dto?${_csrf.parameterName}=${_csrf.token}"
		method="POST" 
		>
		<div class="input-group mb-3 mx-auto">
			<span class="input-group-text" id="inputGroup-sizing-default">제목</span>
			<input id="title" name="postTitle" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${post.postTitle}"/>
			<input type="hidden" name="memberId" value="${member.id }" />
			<input type="hidden" name="memberName" value="${member.memberName }" />
			<input type="hidden" name="boardNo" value="${boardNo}" />
			<input type="hidden" name="groupNo" value="${groupNo}"/>
			<input type="hidden" name="postNo" value="${post.postNo}"/>

		</div>
		<textarea id="summernote" name="postContent">${post.postContent}</textarea>
		<div class="input-group mb-3" style="padding:0px; padding-top: 5px;">
			  
		</div>
		
	</form>
	<div class="d-grid gap-2 col-6 mx-auto">
		<button id="btn-send" class="btn btn-primary" type="button">수정하기</button>
		<button id="btn-cancel" class="btn btn-primary" type="button">취소하기</button>
	</div>
</div>
</div>
  <script>

$(document).ready(function() {
    //여기 아래 부분
    $('#summernote').summernote({
    	height: 300,                 // 에디터 높이
		minHeight: 300,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		spellCheck: false,
		callbacks: {	//여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				uploadSummernoteImageFile(files[0],this);
			},
			onPaste: function (e) {
				var clipboardData = e.originalEvent.clipboardData;
				if (clipboardData && clipboardData.items && clipboardData.items.length) {
					var item = clipboardData.items[0];
					if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
						e.preventDefault();
					}
				}
			}
		},
		toolbar: [
		    // [groupName, [list of button]]
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    //['insert', ['picture','link']],
		    ['view', ['fullscreen', 'help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
    
    function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	};
	$("#btn-send").click((e)=>{
		if($(title).val() != null && $(title).val() != ''){
		}else{
			alert("제목을 입력해주세요.");
			return;
		}
		if($(summernote).val() != null && $(summernote).val() != ''){	
		}else{
			alert("내용을 입력해주세요.");
			return;
		}
		
		$(document.anonymousFrm).submit();
	});
	$("#btn-cancel").click((e)=> {
		location.href="${pageContext.request.contextPath }/gw/board/board.do?boardNo="+${boardNo}+"&groupNo="+${groupNo}
	})

	
});


  </script>
</div>
<script>
window.addEventListener("load", function(){
	$("#dropdownBoard").removeClass("collapsed");
	$("#board-collapse").addClass("show");
	});
</script>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>
</sec:authorize>
