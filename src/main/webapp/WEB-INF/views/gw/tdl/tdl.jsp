<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
        <div class="list-container">
            <div class="list-group1" >
                <h4>개인</h4>
                <br>
                <input type="checkbox" name="spring" id="spring">
                <label for="spring">스프링 복습하기</label>
                <br>
                <input type="checkbox" name="spring" id="spring">
                <label for="spring">스프링 복습하기</label>
                <br>
                <input type="checkbox" name="spring" id="spring">
                <label for="spring">스프링 복습하기</label>
                <br>
                <span><b>+ 일정 추가</b></span>
           
            </div>
        
    
        <div class="list-group1" >
            <h4>그룹</h4>
            <br>
            <input type="checkbox" name="spring" id="spring">
            <label for="spring">스프링 복습하기</label>
            <br>
            <input type="checkbox" name="spring" id="spring">
            <label for="spring">스프링 복습하기</label>
            <br>
            <input type="checkbox" name="spring" id="spring">
            <label for="spring">스프링 복습하기</label>
            <br>
            <span><b>+ 일정 추가</b></span>
        </div>
    
        </div>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

