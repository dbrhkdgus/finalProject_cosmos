<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MANAGER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<style type="text/css">
body{
 background-color:#E5EAED;
}
a { color:black; text-decoration:none !important } a:hover { color : black; text-decoration:none !important }

.gw-main-notice-title{
	background-color: #5CC4EB;
    transform: scale(1.1);
    font-size: 15px;
    color: white;
    padding: 7px;
    border-radius: 4px;
    box-shadow: 3px 3px 5px #ccc;
}
}
.gw-main-banner-change:hover{
	color:#F25E86;

}
</style>




<div class="gw_main_workspace-box">
	<div class="main-banner-notice-new-box">
						<div class="gw-banner-controller" style=" cursor: pointer; margin-left: 5%;">
							<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MASTER', 'ROLE_GW${currGroupNo}MANAGER','ROLE_ADMIN')">
								<div class="gw-banner-controller" style=" cursor: pointer; margin: 20px 0 5px 0px;">
									<span class="gw-main-banner-change">[배너 바꾸기]</span>
								  <!--   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
							  			<path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z"/>
							  			<path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
									</svg> -->
								</div>
							</sec:authorize>
						</div>
						<%-- <img src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}" alt="" /> --%>
		<div class="groupware-main-title d-flex justify-content-around">

				<div class="gw-main-banner-img" style="width: 53%; height: 110%;">
					<c:if test="${myGroup.groupNo == groupwareMainBanner.groupNo }">
						
							<img class="groupware-main-banner rounded" src="${pageContext.request.contextPath }/resources/upFile/group/${groupwareMainBanner.renamedFilename}" alt=""  style="width: 38vw;height: 90%;"/>			
					<!-- 	<hr style="margin-bottom: 30px"/> -->
					</c:if>
				</div>
				<div class="calendar-box rounded" style="width: 47%">
			
					<div id='main'>
						<div id='app'></div>
						
					</div>
				</div>

		</div>
	<hr>
		<div class="groupware-main-contents">
			<div class="groupware-main-notice" style="background-color:white;" >
				<p class="gw-main-notice-title">공지사항</p>
				<ul style="font-size:13px;">
					<c:forEach var="notice" items="${noticePostList}">
						<li><a href="${pageContext.request.contextPath }/gw/board/boardDetail.do?postNo=${notice.postNo}">${notice.postTitle }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="groupware-main-notice new" style="margin-left: 23px;background-color:white;" >
				<p class="gw-main-notice-title">새로운 게시글</p>
				<ul style="font-size:13px;">
					<c:forEach var="newPost" items="${newPostsList}">
						<c:choose>
							<c:when test="${newPost.boardType == 'B' }">
								<li><a href="${pageContext.request.contextPath }/gw/board/boardDetail.do?postNo=${newPost.postNo}">[${newPost.boardName}] ${newPost.postTitle }</a></li>
							</c:when>
							<c:when test="${newPost.boardType == 'A' }">
								<li><a href="${pageContext.request.contextPath }/gw/board/anonymous.do?postNo=${newPost.postNo}">[${newPost.boardName}] ${newPost.postTitle }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath }/gw/fileBoard/fileBoard.do?boardNo=${newPost.boardNo }&groupNo=${currGroupNo}">[${newPost.boardName}] ${newPost.postTitle }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</div>
			<div class="groupware-main-notice new" style="margin-right: 15px;background-color:white;">
					<p class="gw-main-notice-title">오늘의 그룹 일정</p>
					<div class="groupware-main-today-schedule" >
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
			<!-- 메인페이지 달력-->
	</div>
<!-- 	<div class="groupware-main-calendar-schedule-box"> -->
	
		
<!-- 	</div> -->
	
</div>
<!-- 배너 이미지 수정 모달창 -->
<div class="modal fade" id="updateGWMainBanner" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">배너 이미지 변경하기</h4>
        <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form name="updateGropwareMainBannerFrm" id="updateGropwareMainBannerFrm" method="post" >
	      <div class="modal-body mx-3">
	        <div class="md-form mb-5">
	          <div class="curr-gwMainBanner-preview">
	          		<img id="preview" src="${pageContext.request.contextPath }/resources/upFile/group/${groupwareMainBanner.renamedFilename}" alt="" style="width: 400px; height: 200px;"/>
	          </div>
	          
	          <div class="box-file-input">
		          <label><input id="file" type="file" name="ev_display" class="file-input" accept="image/*"></label>
		          <span class="filename">파일을 선택해주세요.</span>
	          </div>
	        </div>
	      </div>
	      <input type="hidden" name="groupNo" value="${currGroupNo }" />
	      <input type="hidden" name="memberId" value="${loginMember.id }" />
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-updateGroupwareMainBanner">수정</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div>
<script>
// 배너 이미지 변경 
$(".gw-banner-controller").click((e)=>{
	$("#updateGWMainBanner").modal('show');
});

$(".close-modal").click((e)=>{
	$("#updateGWMainBanner").modal('hide');
});
// 배너 이미지 변경 모달창
  $(document).on("change", ".file-input", function(){
   
    $filename = $(this).val();

    if($filename == "")
      $filename = "파일을 선택해주세요.";
    if (document.getElementById('file').files && document.getElementById('file').files[0]) {
    	   var reader = new FileReader();
    	   reader.onload = function (e) {
    	    $("#preview").attr('src', e.target.result);
    	 	};
    	  reader.readAsDataURL(document.getElementById('file').files[0]);
    	  	};
    $(".filename").text($filename);

  })
// 그룹웨어 메인 배너 변경 ajax
$(".btn-updateGroupwareMainBanner").click((e)=>{
	var form = $('#updateGropwareMainBannerFrm')[0];
    var formData = new FormData(form);
     $.ajax({
        url : "${pageContext.request.contextPath}/gw/updateGropwareMainBanner.do",
        type : 'POST',
        data : formData,
        contentType : false,
        processData : false,
        headers: {
			"${_csrf.headerName}" : "${_csrf.token}"
	 	},
	 	success(data){
			if(data > 0){
				alert("배너 이미지가 변경되었습니다.");
				location.reload();
			}
	 	},
	 	error : console.log
    });  
});

//달력 script
var _cal = (function (cal) {

 var layout, multiMemory = {pick0: [], pick1: []};

 function Calendar () {
     this.version = '0.1.8 plus';
     this.prevSpecial = new Array();
 }

 // 내부 데이터 활용
 var propLuncher = function (para){
     var _para = para;
     if(typeof _para == 'object' && _para != undefined) {
         for(var i  in _para){
             if(_cal[i] == undefined){
                 _cal[i] = _para[i];
             } else {
                 onError('"'+_cal[i]+'" is aleady exist in props value');
                 break;
             }
         }
     }
 };
 
 var _tag = function (el) {

     var name = ['year', 'month' , 'day'];
     
     function parents (division , find) {
         var t = el.parentNode;
         var value;
         
         if (t.parentNode == null) {
             return false;
         } else {
             while(true){

                 if (t == null) {
                     t = false;
                     break;
                 }
                 
                 if (division === 'class') {
                     value = classMerge(t.classList);
                 }else if (division === 'id') {
                     value = t.id;
                 } else {
                     value = t.tagName;
                 }
                 
                 if(value.indexOf(find) > -1){ 
                     break; 
                 }

                 t = t.parentNode;
             }
             return t;
         }
     }

     /* for IE ... */
     function classMerge (l) {
         var value = '';
         
         if (l != undefined) {
             for(var i = 0; i < l.length; i++){
                 value += l[i]+' '
             }
         }

         return value;
     }

     function addOnceAttribute (el, obj) {
         obj.forEach(function (value, index) {
             el.setAttribute("date-"+name[index], value);
         })
     }

     function removeOnceAttribute (el) {
         name.forEach(function (value) {
             el.removeAttribute("date-"+value);
         })
     }


     return {
         classMerge: classMerge,
         parents: parents,
         addOnceAttribute: addOnceAttribute,
         removeOnceAttribute: removeOnceAttribute
     }
 };

 var layout = function (f,o,self) {
     var b, h, t, c, l, r, d = document;
     var row = [], col = [] , span = [], heads = [];
     var weekendSimple = ['Sun', 'Mon', 'The', 'Wen', 'Thu', 'Fri', 'Set'];
     var multiple = [], clickCount = 0 ;

     /* week simple name option */
     if(o.weekendSimple != undefined) {
         if(o.weekendSimple.length < 7){
             onError('Lack a number in weekendSimple to index length.');
         }else{
             weekendSimple = o.weekendSimple;
         }
     }

     /* div create */
     b = f.el(self).appendChild(d.createElement('div'));

     /* mouse event option */
     b.ondragstart = function () {return false};
     b.onselectstart = function () {return false};
     // b.oncontextmenu = function () {return false}

    

 
     b.classList.add('calendar-body');

     l = d.createElement('div');
     l.id = 'left-btn';

     r = d.createElement('div');
     r.id = 'right-btn';

     if(o.buttonCustomizer != undefined){
         l.innerHTML = o.buttonCustomizer.left;
         r.innerHTML = o.buttonCustomizer.right;
     }else{
         l.classList.add('calendar-btn-left');
         r.classList.add('calendar-btn-right');
     }

     c = d.createElement('div');
     c.classList.add('calendar');

     t = d.createElement('div');
     t.classList.add('calendar-title');

     t.appendChild(l);
     t.appendChild(c);
     t.appendChild(r);

     b.appendChild(t);

     h = d.createElement('div');
     h.classList.add('calendar-head');
     b.appendChild(h);

     for (var w = 0; w < 7; w++){
         heads.push(d.createElement('div'));
         heads[w].classList.add('calendar-week');
         heads[w].innerText = weekendSimple[w];
         h.appendChild(heads[w]);
     }

     // dom 생성
     for (var i = 0; i < 6; i++) {
         col[i] = [];
         span[i] = [];

         row.push(d.createElement('div'));
         b.appendChild(row[i]);
         row[i].classList.add('calendar-row');
         for (var j = 0; j < 7; j++) {
             col[i].push(d.createElement('div'));
             row[i].appendChild(col[i][j]);
             col[i][j].classList.add('calendar-day');
     
             span[i].push(d.createElement('span'));
             col[i][j].appendChild(span[i][j]);
             
             f.action(span[i][j],o);   
         }
     }

     // context menu
     if (o.multipleDay != undefined) {
         var context = d.createElement('div');
         context.id = 'context';
         var menu = d.createElement('button');
         menu.innerText = '선택';
         menu.id = 'multi-button';

         menu.addEventListener('click', function (e) {
             var target = _tag(e.target).parents('class','calendar-day');
             if (clickCount == 2) {
                 multiple.forEach(function (el) {
                     el.classList.remove('multi-choice');
                 });
                 clickCount = 0;
             }

             target.classList.add('multi-choice');
             multiple[clickCount] = target;
             multiMemory['pick'+clickCount] = [target.getAttribute('date-year'),target.getAttribute('date-month'),target.getAttribute('date-day')];
             
             if (clickCount == 1) {
                 var temp,alterater = false;

                 for(var i = 0; i < multiMemory.pick0.length; i++){
                     alterater = parseInt(multiMemory.pick0[i]) > parseInt(multiMemory.pick1[i]) ? true : false;
                     if(alterater == true){
                         temp = multiMemory.pick0;
                         multiMemory.pick0 = multiMemory.pick1;
                         multiMemory.pick1 = temp;
                         break;
                     }
                 }

                 o.multipleDay(multiMemory.pick0,multiMemory.pick1);
             }
             clickCount++;
         });
         
         context.appendChild(menu);
         f.multipleDay(span , context);
     };

     return {
         body: b,
         head: h,
         heads: heads,
         row: row,
         col: col,
         span: span,
         title : [c, l, r],
     }
 };

 // Error
 var onError = function (err){
     console.error(new Error(err));
     return false;
 };

 Calendar.prototype.setDate = function (set) {
     var _set = set == undefined ? Date.now() : set;
     var d = new Date();
     var _d = new Date(_set);

     this.nowDate = {
         millie: Date.now(),
         year: d.getFullYear(),
         month: d.getMonth() + 1,
         day: d.getDate(),
         week: d.getDay(),
     };

     this.transformDate = {
         year: _d.getFullYear(),
         month: _d.getMonth() + 1,
         day: _d.getDate(),
         week: _d.getDay()
     };
 };

 Calendar.prototype.btn = function (s) {
     var self = this;
     var _selec = s;

     var next = function (func) {
         var y = self.transformDate.year;
         var m = self.transformDate.month + 1;
         if(m > 12) {
             m = 1;
             y++;
         }

         self.setDate(y +'/'+ m +'/'+ 1);
         self.fn(self).data();
         self.render(self, func);
     };

     var prev = function (func) {
         var y = self.transformDate.year;
         var m = self.transformDate.month - 1;
         if(m < 1) {
             m = 12;
             y--;
         }
         self.setDate(y +'/'+ m +'/'+ 1);
         self.fn(self).data();
         self.render(self, func);
     };

     return {
         next: next,
         prev: prev
     }
 };

 // 내부 함수 기능
 Calendar.prototype.fn = function () {
     var self = this;
     var binded = {start : undefined, end: undefined};

     function element(o) {
         var el, reg = /^[#|.]\w+$/;
         var input, tn, tag = false, fadeTime = false;
         
         if (typeof o == 'object') {
             if (!reg.test(o.el)) {
                 onError('You write wrong Selector \n Include id or class css selector in "el" option.');
                 if (!o.el ){
                     onError('You didn`t write Selector in option Object.');
                 }
             } else {
                 try {

                 el = document.querySelector(o.el);
                 tn = el.tagName.toLowerCase();
                 tag = tn === 'input' || tn === 'button' ? true : false;

                 if(tag){
                     input = document.createElement('div');
                     input.className = "calendar-input";
                     var back = document.querySelector('body');
                     back.appendChild(input);
                 
                     document.addEventListener('click', function (e) {
                         var findword = _tag(e.target).parents('class','calendar-input');
                         var findclass = ( findword != false ) || ( _tag().classMerge(e.target.classList).indexOf('calendar') > -1 );
                         
                         if ( findclass == false && fadeTime == true && e.target.tagName.toLowerCase() != 'input') {
                             input.classList.remove('fadeIn');
                             fadeTime = false;
                         }
                     });
                    
                     var event = tn === 'input' ? 'focus' : 'click';

                     el.addEventListener(event, function (e) {
                         var top = e.target.offsetTop + e.target.offsetHeight + 5 + 'px';
                         var left = e.target.offsetLeft + 'px';
                         
                         input.classList.add('fadeIn');
                         input.style.top = top;
                         input.style.left = left;

                         setTimeout(function () {
                             fadeTime = true;
                         }, 200);
                     });
                 }

                 return tag == true ? input : el;

                 } catch (err) {
                     onError('It does not exist in the selected ID or class.');
                 }
             } 
         }
     };

     function format (date , form) {
         var _date; 
         _date = date.year+"/"+date.month+"/"+date.day;
         if (form != undefined) {
             _date = form.replace(/(yyyy|yy|mm|m|dd|d)/gi , function (n) {
                 switch(n){
                     case 'yyyy' : return date.year;
                     case 'yy' : return (date.year % 1000);
                     case 'mm' : return date.month > 9 ? date.month : '0' + date.month;
                     case 'm' : return date.month;
                     case 'dd' : return date.day > 9 ? date.day : '0' + date.day;
                     case 'd' : return date.day;
                     default: return n;
                 }
             });
         }
         return _date;
     };

     function setLoopLimit (prev, next) {
         var props = self.transformDate;

         var prevProps = function () {
             var these = {py : props.year, pm : props.month - 1};
             if( these.pm < 1 ){
                 these.py = props.year - 1;
                 these.pm =  12
             }
             return 32 - new Date(these.py, these.pm - 1, 32).getDate();
         };

         var nextProps = function () {
             var these = {ny : props.year, nm : props.month + 1};
             if( these.nm > 12 ){
                 these.ny = props.year + 1;
                 these.nm =  1
             }
             return 32 - new Date(these.ny, these.nm - 1, 32).getDate();
         };

         var lastday = 32 - new Date(props.year, props.month -1, 32).getDate();
         var startday = new Date(props.year, props.month -1, 1).getDay();
         
         // var loop = Math.floor((lastday - (7 - startday)) / 7) + 1;
         // var piece = (lastday - startday) % 7
         // if (piece != 0) { loop += 1; }

         return {
             prevlastday : prevProps(),
             nextlastday : nextProps(),
             lastday: lastday,
             startday: startday
         }
     };
     
     function clickActive (binder, o) {

         var calendarInput = document.querySelector('.calendar-input');

         binder.addEventListener('click', function (e) {
         
             var attr = this.parentNode;
             var clist = e.target.parentNode.classList;

             /* If the unabledDay option is set  */
             var un = clist.value == undefined ? _tag().classMerge(clist) : clist.value;

             if (un) {
                 if(un.indexOf('unable') > -1){
                     return false
                 }
             }

             /* Get the currently clicked date properties and create a new object */
             var date_obj = {
                 year: self.transformDate.year,
                 month: self.transformDate.month,
                 day: parseInt(attr.getAttribute('date-day'))
             };
             
             /* Format the selected date according to the determined options. */
             var f = format(date_obj, o.format);

             var day = document.getElementsByClassName('active');
             if(day.length != 0){
                 day[0].classList.remove('active');
             }
             binder.parentNode.classList.add('active');

             /* If the clickActive option is set  */
             if (o.clickActive != undefined) {
                 if(typeof o.clickActive === 'function'){
                     // console.log(o.clickActive.length)
                     o.clickActive(f);
                 }else{
                     onError('The clickActives type must be a "function".');
                 }
             }
         })
     };

     function specialFilter (o) {
         var sObj = {};

         if(o.specialDay != undefined){
             for(var i in o.specialDay){
                 var day = i.split('-');
                 if(sObj[day[0]] == undefined){
                     sObj[day[0]] = [];
                 }
                 sObj[day[0]].push({day: day[1], name: o.specialDay[i]});
             }
         }
         return sObj;
     };

     function tagFilter (_e) {
         var _target = _e.target;
         var tag = _e.target.tagName;
         var newTarget = '';
     
         if(tag.toLowerCase() === 'div'){
             newTarget = _target;
         } else if (tag.toLowerCase() === 'span') {
             newTarget = _target.parentNode;
         }
         return newTarget;
     };

     function multipleDay (span, ctx) {
         span.forEach(function (stairone) {
             stairone.forEach(function (stairtwo) {
                 stairtwo.addEventListener('click', function (e) {
                     stairtwo.parentNode.appendChild(ctx);
                     ctx.classList.add('show');
                 })
             })
         })
     };

     function hasClass (param) {
         var classValue = param.classList.value == undefined ? _tag().classMerge(param.classList) : param.classList.value;
         if (classValue) {
             if (classValue.indexOf('special-day') > -1) {
                 self.prevSpecial.push(param);
             }
         }
     };

     var special = specialFilter(this);
     var el = element;
     var action = clickActive;
     var data = setLoopLimit;
     
     return {
         el: el,
         format: format,
         data: data,
         action: action,
         special : special,
         hasClass : hasClass,
         multipleDay : multipleDay
     }
 };

 // client 렌더링
 Calendar.prototype.render = function (option,func) {
     
     var t = _tag();
     var self = this;
     var o = option;
     var $_nd = this.nowDate;
     var $_td = this.transformDate;
     var yyyy = func.format($_td , 'yyyy');
     var mm = func.format($_td , 'mm');
     var sed = func.data();  // start end data

     var attr = false;
     var includeMonth = false;
     var specialDay = [];
     var startPoint = 0;
     var renderDay = 1;
     var prevRenderDay = sed.startday == 0 ?  sed.prevlastday - 7 : sed.prevlastday - sed.startday;
     var nextRenderDay = 1;
     var title = "<button class='title-y'>"+yyyy+"</button> <button class='title-m'>"+mm+"</button>";

     o.full = $_td.year+'/'+$_td.month;
     
     layout.body.setAttribute('full-day', o.full);

     layout.title[0].innerHTML = title;

     for(var _fs in func.special){
         if(_fs === mm){
             includeMonth = true;
             specialDay = func.special[_fs];
             break;
         }
     }

     /* Remove old tag from prevSpecial */
     self.prevSpecial.forEach(function (el) {
         /* IE is not include Element remove */
         el.removeChild(el.childNodes[1])
     });

     /* reset prevSpecial Object */
     self.prevSpecial = [];

     for (var i = 0; i < layout.row.length; i++) {
         for (var j = 0; j < layout.span[0].length; j++) {

             /* before day unable option */
             if (o.unabledDay == true) {
                 if ($_td.year <= $_nd.year && ($_td.month <= $_nd.month && $_nd.month <= 12)) {  
                     if(renderDay >= $_nd.day && $_td.month == $_nd.month && $_td.year >= $_nd.year){
                         layout.col[i][j].classList.remove('unable');
                     }else{
                         layout.col[i][j].classList.add('unable');
                     }
                 }else{
                     if($_td.year >= $_nd.year || ($_td.month <= $_nd.month && $_nd.month <= 12)) {
                         layout.col[i][j].classList.remove('unable');
                     }
                 }
             }

             /* chois day of week unable option */
             if (o.unabledWeek != undefined) { 
                 o.unabledWeek.forEach(function (el) {
                     if(el > 6){ 
                         onError('The unableWeek index is the limit of the 6.'); 
                         return false;
                     }
                     el == j ? layout.col[i][j].classList.add('unable') : o.unabledDay != true ? layout.col[i][j].classList.remove('unable') : null;
                 })
             }

             /* reset render */
             layout.span[i][j].innerText = '';
             layout.col[i][j].classList.remove('special-day');
             layout.col[i][j].classList.remove('multi-choice');

             if (i == 0) {
                 if (sed.startday <= j) {
                     attr = true;
                     layout.span[i][j].innerText = renderDay;
                 } else {
                     prevRenderDay++;
                     layout.col[i][j].classList.add('unable');
                     layout.span[i][j].innerText = prevRenderDay;
                 }
             } else if (i > 0) {
                 if (sed.lastday >= renderDay) {
                     layout.span[i][j].innerText = renderDay;
                 } else {
                     layout.col[i][j].classList.add('unable');
                     layout.span[i][j].innerText = nextRenderDay;
                     nextRenderDay++;
                     attr = false;
                 }
             }

             /* today position option */
             if (renderDay === $_nd.day && $_td.month == $_nd.month && $_td.year == $_nd.year && attr == true) {
                 layout.col[i][j].classList.add('active', 'today');
             } else {
                 layout.col[i][j].classList.remove('active', 'today');
             }

             /* special-day render */
             if (specialDay.length != 0 && attr == true) {
                 for (var s = 0; s < specialDay.length; s++) {
                     if (parseInt(specialDay[s].day) == renderDay) {
                         var span = document.createElement('div');
                         span.className = 'special-name';
                         span.innerText = specialDay[s].name;
                         layout.col[i][j].classList.add('special-day');
                         layout.col[i][j].appendChild(span);
                     }
                 }
             }

             /* Put tag information installed in prevSpecial */   
             func.hasClass(layout.col[i][j]);
             
             if (attr == true) {
                 t.addOnceAttribute(layout.col[i][j],[$_td.year, $_td.month, renderDay]);
                 renderDay++;
             } else {
                 if (layout.col[i][j].attributes.length > 1) {
                     t.removeOnceAttribute(layout.col[i][j]);
                 }
             }
         }
     }
     /** render end */
 };

 // setup Calandar
 Calendar.prototype.setup = function (option) {
     
     var self = this;
     this.setDate();

     propLuncher(option);
     
     var btn = this.btn();
     var func = this.fn();
     layout = layout(func,option,this);

     layout.title[1].addEventListener('click', function () {
         btn.prev(func);
     });

     layout.title[2].addEventListener('click', function () {
         btn.next(func);
     });

     this.render(option, func);  
 };

 return new Calendar();
}(this));

if(!window._cal){
 window.$c = window._cal = _cal;
}

_cal.setup({
	el: '#app',
})
</script>



</sec:authorize>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

