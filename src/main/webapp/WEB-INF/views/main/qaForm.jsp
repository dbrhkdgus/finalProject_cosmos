<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="문의사항 작성" name="title" />
</jsp:include>

<script src="${pageContext.request.contextPath }/resources/js/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/summernote-lite.css">

<!-- form 안에 에디터를 사용하는 경우 (보통 이경우를 많이 사용하는듯)-->
<h2 class="text-center">문의 사항 작성</h2>
<div class="container">
	<form name="queFrm" action="${pageContext.request.contextPath }/main/queEnroll.do" method="post">
		<div class="input-group mb-3 mx-auto">
			<div class="dropdown float-left mx-auto d-block">
			  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
			    카테고리를 선택해 주세요.
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
			    <li><button class="dropdown-item" type="button">불편사항</button></li>
			    <li><button class="dropdown-item" type="button">그룹 생성/휴먼 처리</button></li>
			    <li><button class="dropdown-item" type="button">불량 그룹/사용자 신고</button></li>
			    <li><button class="dropdown-item" type="button">그룹웨어 관련</button></li>
			    <li><button class="dropdown-item" type="button">채팅 관련</button></li>
			    <li><button class="dropdown-item" type="button">기타 문의</button></li>
			  </ul>
			</div>
			<span class="input-group-text" id="inputGroup-sizing-default">제목</span>
			<input id="title" name="queTitle" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="제목을 입력해 주세요.">
			<input type="hidden" name="queCategory" value="" />
		</div>
		<textarea id="summernote" name="queContent"></textarea>
	</form>
	<div class="d-grid gap-2 col-6 mx-auto">
		<button id="btn-send" class="btn btn-primary" type="button">작성 완료</button>
	</div>
</div>
<script>
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
				height: 500,                 // 에디터 높이
				minHeight: 300,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				lang: "ko-KR",					// 한글 설정
				placeholder: '문의사항 내용 작성란',	//placeholder 설정
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
//				    ['insert', ['picture','link']],
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
		if($("input[name=queCategory]").val() != null && $("input[name=queCategory]").val() != ''){
			
		}else{
			alert("카테고리를 선택해주세요.");
			return;
		}
		
		$(document.queFrm).submit();
	});
	$(".dropdown-item").click((e)=>{
		$("input[name=queCategory]").val($(e.target).text());
		
	});
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
