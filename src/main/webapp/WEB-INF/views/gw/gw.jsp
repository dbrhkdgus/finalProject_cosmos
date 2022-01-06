<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<style>
.groupware-main-calendar-schedule-box{
	margin:0;
	color:#444;
	font:300 18px/18px Roboto, sans-serif;
	transition:background .4s ease-in-out 0s;
}
*,:after,:before{box-sizing:border-box}
.pull-left{float:left}
.pull-right{float:right}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}

.calendar{width:300px;font-size:100%;margin-top:20px; margin-right: 10px; pective:1000px;cursor:default;position:relative}
.calendar .header{height:100px;position:relative;color:#fff}
.calendar .header .text{position:absolute;top:0;left:0;right:0;bottom:0;background-color:#308ff0;padding:15px;transform:rotateX(90deg);transform-origin:bottom;backface-visibility:hidden;transition:.4s ease-in-out 0s;box-shadow:0 6px 20px 0 rgba(0,0,0,.19), 0 8px 17px 0 rgba(0,0,0,.2);opacity:0}
.calendar .header .text>span{text-align:center;padding:26px;display:block}
.calendar .header.active .text{transform:rotateX(0deg);opacity:1}
.months{width:100%;height:280px;position:relative}
.months .hr{height:1px;margin:15px 0;background:#ccc}
.month{padding:15px;width:inherit;height:inherit;background:#fff;position:absolute;backface-visibility:hidden;transition:all .4s ease-in-out 0s;box-shadow:0 6px 20px 0 rgba(0,0,0,.19),0 8px 17px 0 rgba(0,0,0,.2)}
.months[data-flow="left"] .month{transform:rotateY(-180deg)}
.months[data-flow="right"] .month{transform:rotateY(180deg)}
.table{width:100%;font-size:10px;font-weight:400;display:table}
.table .row{display:table-row}
.table .row.head{color:#308ff0;text-transform:uppercase}
.table .row .cell{width:14.28%;padding:5px;text-align:center;display:table-cell}
.table .row .cell.disable{color:#ccc}
.table .row .cell span{display:block;width:28px;height:28px;line-height:28px;transition:color,background .4s ease-in-out 0s}
.table .row .cell.active span{color:#fff;background-color:#308ff0}
.months .month[data-active="true"]{transform:rotateY(0)}
.header [data-action]{color:inherit;position:absolute;top:50%;margin-top:-20px;width:40px;height:40px;z-index:1;opacity:0;transition:all .4s ease-in-out 0s}
.header [data-action]>i{width:20px;height:20px;display:block;position:absolute;left:50%;top:50%;margin-top:-10px;margin-left:-10px}
.header [data-action]>i:before,.header [data-action]>i:after{top:50%;margin-top:-1px;content:'';position:absolute;height:2px;width:20px;border-top:2px solid;border-radius:2px}
.header [data-action*="prev"]{left:15px}
.header [data-action*="next"]{right:15px}
.header [data-action*="prev"]>i:before,.header [data-action*="prev"]>i:after{left:0}
.header [data-action*="prev"]>i:before{top:3px;transform:rotate(-45deg)}
.header [data-action*="prev"]>i:after{top:auto;bottom:3px;transform:rotate(45deg)}
.header [data-action*="next"]>i:before,.header [data-action*="next"]>i:after{right:0}
.header [data-action*="next"]>i:before{top:auto;bottom:3px;transform:rotate(-45deg)}
.header [data-action*="next"]>i:after{top:3px;transform:rotate(45deg)}
.header.active [data-action]{opacity:1}

[data-theme="jan"] .row.head{color:#1E88E5}
[data-theme="jan"] .header .text,
[data-theme="jan"] .table .row .cell.active span{background-color:#1E88E5}

[data-theme="feb"] .row.head{color:#039BE5}
[data-theme="feb"] .header .text,
[data-theme="feb"] .table .row .cell.active span{background-color:#039BE5}

[data-theme="mar"] .row.head{color:#00897B}
[data-theme="mar"] .header .text,
[data-theme="mar"] .table .row .cell.active span{background-color:#00897B}

[data-theme="apr"] .row.head{color:#7CB342}
[data-theme="apr"] .header .text,
[data-theme="apr"] .table .row .cell.active span{background-color:#7CB342}

[data-theme="may"] .row.head{color:#FFB300}
[data-theme="may"] .header .text,
[data-theme="may"] .table .row .cell.active span{background-color:#FFB300}

[data-theme="jun"] .row.head{color:#F4511E}
[data-theme="jun"] .header .text,
[data-theme="jun"] .table .row .cell.active span{background-color:#F4511E}

[data-theme="jul"] .row.head{color:#8E24AA}
[data-theme="jul"] .header .text,
[data-theme="jul"] .table .row .cell.active span{background-color:#8E24AA}

[data-theme="aug"] .row.head{color:#5E35B1}
[data-theme="aug"] .header .text,
[data-theme="aug"] .table .row .cell.active span{background-color:#5E35B1}

[data-theme="sep"] .row.head{color:#E53935}
[data-theme="sep"] .header .text,
[data-theme="sep"] .table .row .cell.active span{background-color:#E53935}

[data-theme="oct"] .row.head{color:#8E24AA}
[data-theme="oct"] .header .text,
[data-theme="oct"] .table .row .cell.active span{background-color:#8E24AA}

[data-theme="nov"] .row.head{color:#6D4C41}
[data-theme="nov"] .header .text,
[data-theme="nov"] .table .row .cell.active span{background-color:#6D4C41}

[data-theme="dec"] .row.head{color:#546E7A}
[data-theme="dec"] .header .text,
[data-theme="dec"] .table .row .cell.active span{background-color:#546E7A}
</style>

<script	src='${pageContext.request.contextPath}/resources/js/moment.min.js'></script>


<div class="gw_main_workspace-box">
	<div class="main-banner-notice-new-box">
		<div class="groupware-main-title">
			<c:forEach var="attach" items="${groupBannerAttachList }">
				<c:if test="${myGroup.groupNo == attach.groupNo }">
					<%-- <img src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}" alt="" /> --%>
					<img class="groupware-main-banner" src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}" alt="" />
					<hr style="margin-bottom: 30px"/>
				</c:if>
			</c:forEach>
		</div>

		<div class="groupware-main-contents">
			<div class="groupware-main-notice" >
				<h3>공지사항</h3>
				<ul>
					<c:forEach var="notice" items="${noticePostList}">
						<li><a href="${pageContext.request.contextPath }/gw/board/boardDetail.do?postNo=${notice.postNo}">${notice.postTitle }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="groupware-main-notice" style="margin-left: 0px;" >
				<h3>새로운 게시글</h3>
				<ul>
					<c:forEach var="notice" items="${noticePostList}">
						<li><a href="${pageContext.request.contextPath }/gw/board/boardDetail.do?postNo=${notice.postNo}">${notice.postTitle }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
			<!-- 메인페이지 달력-->
	</div>
	<div class="groupware-main-calendar-schedule-box">
		<div class="calendar">
			<div class="header">
				<a data-action="prev-month" href="javascript:void(0)" title="Previous Month"><i></i></a>
				<div class="text" data-render="month-year"></div>
				<a data-action="next-month" href="javascript:void(0)" title="Next Month"><i></i></a>
			</div>
			<div class="months" data-flow="left">
				<div class="month month-a">
					<div class="render render-a"></div>
				</div>
				<div class="month month-b">
					<div class="render render-b"></div>
				</div>
			</div>
		</div>
		<div class="groupware-main-today-schedule">
			<p>오늘의 그룹 일정</p>
			<div class="groupware-main-today-schedule">
				<c:if test="${not empty todayScheduleList}">
					<c:forEach var="todaySchedule" items="${todayScheduleList }">
						<div class="groupware-main-today-schedule-content">
							<svg xmlns="http://www.w3.org/2000/svg" color="${todaySchedule.groupColor }" width="10" height="10" fill="currentColor" class="bi bi-circle-fill" viewBox="0 0 16 16">
							  <circle cx="8" cy="8" r="8"/>
							</svg> <span style="font-size: 13px; margin-left: 10px;">${todaySchedule.content }</span>
						</div>

					</c:forEach>
				</c:if>
				<c:if test="${empty todayScheduleList}">
						<div class="groupware-main-today-schedule-content">
							<svg xmlns="http://www.w3.org/2000/svg" color="#aa00ff" width="10" height="10" fill="currentColor" class="bi bi-circle-fill" viewBox="0 0 16 16">
							  <circle cx="8" cy="8" r="8"/>
							</svg> <span style="font-size: 13px; margin-left: 10px;">등록된 일정이 없습니다.</span>
						</div> 
				</c:if>

			</div>
			
		</div>
	</div>
	
</div>

<script>
var Calendar = function(t) {
    this.divId = t.RenderID ? t.RenderID : '[data-render="calendar"]', this.DaysOfWeek = t.DaysOfWeek ? t.DaysOfWeek : ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], this.Months = t.Months ? t.Months : ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    var e = new Date;
    this.CurrentMonth = e.getMonth(), this.CurrentYear = e.getFullYear();
    var r = t.Format;
    this.f = "string" == typeof r ? r.charAt(0).toUpperCase() : "M"
};
Calendar.prototype.nextMonth = function() {
    11 == this.CurrentMonth ? (this.CurrentMonth = 0, this.CurrentYear = this.CurrentYear + 1) : this.CurrentMonth = this.CurrentMonth + 1, this.divId = '[data-active="false"] .render', this.showCurrent()
}, Calendar.prototype.prevMonth = function() {
    0 == this.CurrentMonth ? (this.CurrentMonth = 11, this.CurrentYear = this.CurrentYear - 1) : this.CurrentMonth = this.CurrentMonth - 1, this.divId = '[data-active="false"] .render', this.showCurrent()
}, Calendar.prototype.previousYear = function() {
    this.CurrentYear = this.CurrentYear - 1, this.showCurrent()
}, Calendar.prototype.nextYear = function() {
    this.CurrentYear = this.CurrentYear + 1, this.showCurrent()
}, Calendar.prototype.showCurrent = function() {
    this.Calendar(this.CurrentYear, this.CurrentMonth)
}, Calendar.prototype.checkActive = function() {
    1 == document.querySelector(".months").getAttribute("class").includes("active") ? document.querySelector(".months").setAttribute("class", "months") : document.querySelector(".months").setAttribute("class", "months active"), "true" == document.querySelector(".month-a").getAttribute("data-active") ? (document.querySelector(".month-a").setAttribute("data-active", !1), document.querySelector(".month-b").setAttribute("data-active", !0)) : (document.querySelector(".month-a").setAttribute("data-active", !0), document.querySelector(".month-b").setAttribute("data-active", !1)), setTimeout(function() {
        document.querySelector(".calendar .header").setAttribute("class", "header active")
    }, 200), document.querySelector("body").setAttribute("data-theme", this.Months[document.querySelector('[data-active="true"] .render').getAttribute("data-month")].toLowerCase())
}, Calendar.prototype.Calendar = function(t, e) {
    "number" == typeof t && (this.CurrentYear = t), "number" == typeof t && (this.CurrentMonth = e);
    var r = (new Date).getDate(),
        n = (new Date).getMonth(),
        a = (new Date).getFullYear(),
        o = new Date(t, e, 1).getDay(),
        i = new Date(t, e + 1, 0).getDate(),
        u = 0 == e ? new Date(t - 1, 11, 0).getDate() : new Date(t, e, 0).getDate(),
        s = "<span>" + this.Months[e] + " &nbsp; " + t + "</span>",
        d = '<div class="table">';
    d += '<div class="row head">';
    for (var c = 0; c < 7; c++) d += '<div class="cell">' + this.DaysOfWeek[c] + "</div>";
    d += "</div>";
    for (var h, l = dm = "M" == this.f ? 1 : 0 == o ? -5 : 2, v = (c = 0, 0); v < 6; v++) {
        d += '<div class="row">';
        for (var m = 0; m < 7; m++) {
            if ((h = c + dm - o) < 1) d += '<div class="cell disable">' + (u - o + l++) + "</div>";
            else if (h > i) d += '<div class="cell disable">' + l++ + "</div>";
            else {
                d += '<div class="cell' + (r == h && this.CurrentMonth == n && this.CurrentYear == a ? " active" : "") + '"><span>' + h + "</span></div>", l = 1
            }
            c % 7 == 6 && h >= i && (v = 10), c++
        }
        d += "</div>"
    }
    d += "</div>", document.querySelector('[data-render="month-year"]').innerHTML = s, document.querySelector(this.divId).innerHTML = d, document.querySelector(this.divId).setAttribute("data-date", this.Months[e] + " - " + t), document.querySelector(this.divId).setAttribute("data-month", e)
}, window.onload = function() {
    var t = new Calendar({
        RenderID: ".render-a",
        Format: "M"
    });
    t.showCurrent(), t.checkActive();
    var e = document.querySelectorAll(".header [data-action]");
    for (i = 0; i < e.length; i++) e[i].onclick = function() {
        if (document.querySelector(".calendar .header").setAttribute("class", "header"), "true" == document.querySelector(".months").getAttribute("data-loading")) return document.querySelector(".calendar .header").setAttribute("class", "header active"), !1;
        var e;
        document.querySelector(".months").setAttribute("data-loading", "true"), this.getAttribute("data-action").includes("prev") ? (t.prevMonth(), e = "left") : (t.nextMonth(), e = "right"), t.checkActive(), document.querySelector(".months").setAttribute("data-flow", e), document.querySelector('.month[data-active="true"]').addEventListener("webkitTransitionEnd", function() {
            document.querySelector(".months").removeAttribute("data-loading")
        }), document.querySelector('.month[data-active="true"]').addEventListener("transitionend", function() {
            document.querySelector(".months").removeAttribute("data-loading")
        })
    }
};
</script>



<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>
</sec:authorize>

