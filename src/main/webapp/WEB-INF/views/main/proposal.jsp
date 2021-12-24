<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="proposal" name="title"/>
</jsp:include>
<style>
div#board-container{width: 50%;}
</style>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
<script type="text/javascript">(function() {emailjs.init("user_ZTROVNAq4CCFE47DBAm5w");})();</script>
<h2 class="text-center">제휴 문의</h2>
	<div id="board-container" class="mx-auto">
	<form class="row g-3">
  <div class="col-12">
    <label for="name" class="form-label">업체명</label>
    <input type="text" class="form-control" id="name" name="name" placeholder="업체명을 입력해주세요">
  </div>
  <div class="col-12">
    <label for="phone" class="form-label">전화번호</label>
    <input type="text" class="form-control" id="phone" name="phone" placeholder="연락처를 입력해주세요">
  </div>
  <div class="col-12">
    <label for="address" class="form-label">주소</label>
    <input type="text" class="form-control" id="address" name="address" placeholder="업체 주소를 입력해주세요">
  </div>
 <div class="mb-3">
  <label for="message" class="form-label">내용입력</label>
  <textarea class="form-control" name="message" id="message" rows="10" cols="30" placeholder="내용을 입력해주세요"></textarea>
</div>
  <div class="col-12">
    <div class="form-check">
      <label class="form-check-label" for="gridCheck">
      </label>
    </div>
  </div>
  <div class="col-12">
    <input type="button" name="submit" id="button" class="btn btn-primary float-right" value="보내기">
  </div>
</form>
</div>
<script>
$(document).ready(function() {
	emailjs.init("user_ZTROVNAq4CCFE47DBAm5w");
	$('input[name=submit]').click(function(){
		var templateParams = {
			name: $('input[name=name]').val(),
			phone: $('input[name=phone]').val(),
			address: $('input[name=address]').val(),
			message : $('textarea[name=message]').val()
			};
	emailjs.send('mail', 'template_n0455oh', templateParams).then(function(response) {
		alert('SUCCESS!');
		},
		function(error) {
			alert('FAILED...');
			});
	});
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
