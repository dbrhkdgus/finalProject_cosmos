<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 


<div class="workspace-box">
  <div class="groupware-board-detail-outter">
    <h4>파일 업로드</h4>
   
		<form
		class="file-board-form"   
		enctype="multipart/form-data" 
		action="${pageContext.request.contextPath}/gw/fileBoard/fileEnroll.do?${_csrf.parameterName}=${_csrf.token}"
		method="POST" 
		>
      <div class="form-group row">
		
		
        <label for="file-category" class="col-sm-2 col-form-label">카테고리</label>
        <div class="col-sm-10">

       
          <select class="form-control" id="file-category" name="fileCategoryNo">
            <option value="5">이미지</option>
            <option value="6">문서</option>
            <option value="7">압축파일</option>
            <option value="8">코트파일</option>
            <option value="9">기타</option>
            
          </select>
        </div>
      </div>

      <div class="form-group row">
        <label for="file-board-writer" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="file-board-writer"  name="fileTitle" placeholder="제목을 입력하세요.">
        </div>
      </div>

      <div class="form-group row">
        <label for="file-board-title" class="col-sm-2 col-form-label">작성자</label>
        <div class="col-sm-10">
          <input type="text" class="form-control-plaintext" id="file-board-title" value="홍길동" readonly>
        </div>
      </div>

      <div class="form-group row">
        <label for="file-board-reg-date" class="col-sm-2 col-form-label">등록일</label>
        <div class="col-sm-10">
          <input type="text" class="form-control-plaintext" id="file-board-reg-date" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm"/>" readonly>
        </div>
      </div>
      
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">파일 선택</label>
        <div class="filebox bs3-primary preview-image col-sm-10">
          <input class="upload-name form-control" value="선택된 파일 없음" disabled="disabled" style="width: 250px;">
          
          <label for="input_file">업로드</label>
          <input type="file" id="input_file" class="upload-hidden" name ="upFile" required="required"> 
        </div>
      </div>
      
      
      <div class="upload-display">
        <div class="upload-thumb-wrap">
          <img src="#" class="upload-thumb">
        </div>
      </div>
		
      <div class="upload-except-img">
        
      </div>
		<input type="hidden" value="${boardNo}" name="boardNo">
		<input type="hidden" value="${groupNo}" name="groupNo">
      <div class="board-form-buttons">
        <button type="submit" class="btn btn-primary">작성하기</button>
        <button type="submit" class="btn btn-secondary">취소하기</button>

      </div>
  </div>
    </form>

</div>
<script>
  $(document).ready(function(){
    
    $(".upload-display").hide();
    $(".upload-except-img").hide();
   var fileTarget = $('.filebox .upload-hidden');

    fileTarget.on('change', function(){
        if(window.FileReader){
            // 파일명 추출
            var filename = $(this)[0].files[0].name;
        } 

        else {
            // Old IE 파일명 추출
            var filename = $(this).val().split('/').pop().split('\\').pop();
        };

        $(this).siblings('.upload-name').val(filename);
    });

    //preview image 
    var imgTarget = $('.preview-image .upload-hidden');

    imgTarget.on('change', function(){
        var parent = $(this).parent();
        parent.children('.upload-display').remove();

        if(window.FileReader){
            //image 파일만
            if ($(this)[0].files[0].type.match(/image\//)){
              var reader = new FileReader();
              reader.onload = function(e){
                var src = e.target.result;
                $(".upload-display").show();
                $(".upload-except-img").hide();
                $(".upload-thumb").attr('src', src);
              }
              reader.readAsDataURL($(this)[0].files[0]);
            //img 외 파일
            }else {
              
              var $typeName = $(this)[0].files[0].name;
              var reader = new FileReader();
              console.log($(this)[0].files[0].name);
              console.log($(this)[0].files[0].type);
              reader.onload = function(e){
                $(".upload-display").hide();
                $(".upload-except-img").text('');
                if($typeName.match(/.txt/)){
                  console.log("test");
                  $(".upload-except-img").show().append(`<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-file-font" viewBox="0 0 16 16">
                    <path d="M10.943 4H5.057L5 6h.5c.18-1.096.356-1.192 1.694-1.235l.293-.01v6.09c0 .47-.1.582-.898.655v.5H9.41v-.5c-.803-.073-.903-.184-.903-.654V4.755l.298.01c1.338.043 1.514.14 1.694 1.235h.5l-.057-2z"/>
                    <path d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/>
                    </svg>`);
                  }else if($typeName.match(/.pdf/)){
                  $(".upload-except-img").text('').show().append(`<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-file-earmark-pdf" viewBox="0 0 16 16">
          <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
          <path d="M4.603 14.087a.81.81 0 0 1-.438-.42c-.195-.388-.13-.776.08-1.102.198-.307.526-.568.897-.787a7.68 7.68 0 0 1 1.482-.645 19.697 19.697 0 0 0 1.062-2.227 7.269 7.269 0 0 1-.43-1.295c-.086-.4-.119-.796-.046-1.136.075-.354.274-.672.65-.823.192-.077.4-.12.602-.077a.7.7 0 0 1 .477.365c.088.164.12.356.127.538.007.188-.012.396-.047.614-.084.51-.27 1.134-.52 1.794a10.954 10.954 0 0 0 .98 1.686 5.753 5.753 0 0 1 1.334.05c.364.066.734.195.96.465.12.144.193.32.2.518.007.192-.047.382-.138.563a1.04 1.04 0 0 1-.354.416.856.856 0 0 1-.51.138c-.331-.014-.654-.196-.933-.417a5.712 5.712 0 0 1-.911-.95 11.651 11.651 0 0 0-1.997.406 11.307 11.307 0 0 1-1.02 1.51c-.292.35-.609.656-.927.787a.793.793 0 0 1-.58.029zm1.379-1.901c-.166.076-.32.156-.459.238-.328.194-.541.383-.647.547-.094.145-.096.25-.04.361.01.022.02.036.026.044a.266.266 0 0 0 .035-.012c.137-.056.355-.235.635-.572a8.18 8.18 0 0 0 .45-.606zm1.64-1.33a12.71 12.71 0 0 1 1.01-.193 11.744 11.744 0 0 1-.51-.858 20.801 20.801 0 0 1-.5 1.05zm2.446.45c.15.163.296.3.435.41.24.19.407.253.498.256a.107.107 0 0 0 .07-.015.307.307 0 0 0 .094-.125.436.436 0 0 0 .059-.2.095.095 0 0 0-.026-.063c-.052-.062-.2-.152-.518-.209a3.876 3.876 0 0 0-.612-.053zM8.078 7.8a6.7 6.7 0 0 0 .2-.828c.031-.188.043-.343.038-.465a.613.613 0 0 0-.032-.198.517.517 0 0 0-.145.04c-.087.035-.158.106-.196.283-.04.192-.03.469.046.822.024.111.054.227.09.346z"/>
        </svg>`);
                }else if($typeName.match(/.pptx/)){
                  $(".upload-except-img").text('').show().append(`<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-file-earmark-ppt" viewBox="0 0 16 16">
  <path d="M7 5.5a1 1 0 0 0-1 1V13a.5.5 0 0 0 1 0v-2h1.188a2.75 2.75 0 0 0 0-5.5H7zM8.188 10H7V6.5h1.188a1.75 1.75 0 1 1 0 3.5z"/>
  <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
</svg>`);
                }else if($typeName.match(/.zip/)){
                  $(".upload-except-img").text('').show().append(`<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-file-earmark-zip" viewBox="0 0 16 16">
  <path d="M5 7.5a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v.938l.4 1.599a1 1 0 0 1-.416 1.074l-.93.62a1 1 0 0 1-1.11 0l-.929-.62a1 1 0 0 1-.415-1.074L5 8.438V7.5zm2 0H6v.938a1 1 0 0 1-.03.243l-.4 1.598.93.62.929-.62-.4-1.598A1 1 0 0 1 7 8.438V7.5z"/>
  <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1h-2v1h-1v1h1v1h-1v1h1v1H6V5H5V4h1V3H5V2h1V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
</svg>`);
                }
                
              }
              reader.readAsDataURL($(this)[0].files[0]);

       
    };
};
    });
  });
</script>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

