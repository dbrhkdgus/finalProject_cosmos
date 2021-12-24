<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="개인정보처리방침" name="title"/>
</jsp:include>
<style>
div#board-container{width: 50%;}
</style>
<div id="board-container" class="mx-auto">
		<div class="btn btn-outline-primary float-right"><a href="https://www.law.go.kr/LSW/lsInfoP.do?efYd=20200805&amp;lsiSeq=213857#0000">‘개인정보보호법’ 바로가기</a></div>
		
		<div id="a1" class="section">
            <h4>1. 개인정보처리방침의 의의</h4>
            <p><strong id="a1_1" class="b">COSMOS는 본 개인정보처리방침은 개인정보보호법을 기준으로 작성하되, COSMOS 내에서의 이용자 개인정보 처리 현황을 최대한 알기 쉽고 상세하게 설명하기 위해 노력하였습니다.</strong><br>이는 쉬운 용어를 사용한 개인정보처리방침 작성 원칙인 ‘Plain Language Privacy Policy(쉬운 용어를 사용한 개인정보처리방침)’를 도입한 것입니다.</p>
            <p>개인정보처리방침은 다음과 같은 중요한 의미를 가지고 있습니다.</p>
            <ul class="bu">
                <li><i></i>COSMOS가 어떤 정보를 수집하고, 수집한 정보를 어떻게 사용하며, 필요에 따라 누구와 이를 공유(‘위탁 또는 제공’)하며, 이용목적을 달성한 정보를 언제·어떻게 파기하는지 등 ‘개인정보의 한살이’와 관련한 정보를 투명하게 제공합니다.</li>
                <li><i></i>정보주체로서 이용자는 자신의 개인정보에 대해 어떤 권리를 가지고 있으며, 이를 어떤 방법과 절차로 행사할 수 있는지를 알려드립니다. 또한, 법정대리인(부모 등)이 만14세 미만 아동의 개인정보 보호를 위해 어떤 권리를 행사할 수 있는지도 함께 안내합니다.</li>
                <li><i></i>개인정보 침해사고가 발생하는 경우, 추가적인 피해를 예방하고 이미 발생한 피해를 복구하기 위해 누구에게 연락하여 어떤 도움을 받을 수 있는지 알려드립니다.</li>
                <li><i></i>그 무엇보다도, 개인정보와 관련하여 COSMOS와 이용자간의 권리 및 의무 관계를 규정하여 이용자의 ‘개인정보자기결정권’을 보장하는 수단이 됩니다.</li>
            </ul>
        </div>
        <div id="a2" class="section">
            <h4>2. 수집하는 개인정보</h4>
            <p><strong id="a2_1" class="b">이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 COSMOS 서비스를 회원과 동일하게 이용할 수 있습니다. <br>이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, COSMOS는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.</strong></p>
            <ul class="sec">
                <li class="first">
                    <p><strong id="a2_2">회원가입 시점에 COSMOS가 이용자로부터 수집하는 개인정보는 아래와 같습니다.</strong></p>
                    <ul class="bu">
                        <li><i></i>회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. <span>그리고 선택항목으로 이메일 주소를 수집합니다.</span></li>
                        <li><i></i><span>단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.</span></li>
                    </ul>
                </li>
                <li>
                    <dl class="tgl_cont" id="tgl2-1">
                        <dt>(1) 필수항목과 선택항목의 차이</dt>
                        <dd>필수항목이란 서비스의 본질적 기능을 수행하기 위해 필요한 정보이며, 선택항목이란 서비스 이용 자체에 영향을 미치지는 않으나 이용자에게 부가적인 가치를 제공하기 위해 추가로 수집하는 정보입니다. 회원가입 시에 수집하는 아이디, 비밀번호는 로그인을 위하여 필요한 정보이며 이름, 생년월일, 성별은 회원제 서비스 운영에 따르는 이용자 구분을 위하여 사용됩니다. 가입인증 휴대폰번호는 불법 광고 게시 등 부정한 목적으로 회원가입을 시도하는 경우, 이용제한 조치 등을 적용하기 위하여 수집합니다. 선택항목은 입력을 하지 않아도 회원 가입이나 서비스 이용에 제한이 없으며, 필요할 경우 ‘cosmos 내정보 &gt; 회원정보 &gt; 연락처’에서 사후에 언제든지 직접 입력하실 수 있습니다.</dd>
                        <dt>(2) 법정대리인 정보를 수집하는 이유</dt>
                        <dd>만 14세 미만 아동의 개인정보를 수집할 경우, 회사는 개인정보보호법에 따라 법정대리인(부모 등 아동의 보호자)의 동의를 받아야 합니다. 이에 따라 COSMOS는 만 14세 미만 아동의 개인정보 수집 시점에서 법정대리인의 동의를 받고 있으며, 이 과정에서 법정대리인의 이름, DI, 휴대폰번호(모바일 인증 시에만)를 수집합니다. 수집된 법정대리인의 정보는 아동이 성년이 되는 시점에서 파기하고 있습니다.</dd>
                        <dt>(3) 단체정보의 개인정보 인정 여부</dt>
                        <dd>개인정보보호법에서 정의하는 개인정보는 ‘살아있는 자연인에 대한 정보’를 말합니다. 따라서 단체명, 영업소 주소 및 전화번호, 대표자 성명 등과 같은 법인이나 단체에 관한 정보는 원칙적으로 개인정보에 해당하지 않습니다. COSMOS 단체아이디로 회원 가입 시에 수집하는 대부분의 정보는 개인정보에 해당하지 않습니다. 하지만 개인 사업자 등의 경우 이를 단체정보로만 처리하기 모호한 측면이 있고, 관리자/담당자의 연락처 정보 등을 수집하기 때문에 본 개인정보처리방침에서는 단체정보의 수집 관련 내용을 기재하여 이용자의 이해를 돕고 있습니다.</dd>
                    </dl>
                </li>
                <li>
                    <p><strong id="a2_3">서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.</strong></p>
                    <ul class="bu">
                        <li><i></i>회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. <span>회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.</span></li>
                        <li><i></i><span>COSMOS 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.</span>
                        </li></ul>
                </li>
                <li>
                    <p><strong>서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다.<br>또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.</strong></p>
                    <p>구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며, COSMOS에서 제공하는 위치기반 서비스에 대해서는 'COSMOS 위치정보 이용약관'에서 자세하게 규정하고 있습니다.<br>이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.</p>
                </li>
                <li>
                    <dl class="tgl_cont" id="tgl2-2">
                        <dt>IP(Internet Protocol) 주소란?</dt>
                        <dd>IP 주소는 인터넷 망 사업자가 인터넷에 접속하는 이용자의 PC 등 기기에 부여하는 온라인 주소정보 입니다. IP 주소가 개인정보에 해당하는지 여부에 대해서는 각국마다 매우 다양한 견해가 있습니다.</dd>
                        <dt>서비스 이용기록이란?</dt>
                        <dd>COSMOS 접속 일시, 이용한 서비스 목록 및 서비스 이용 과정에서 발생하는 정상 또는 비정상 로그 일체, 메일 수발신 과정에서 기록되는 이메일주소, 친구 초대하기 또는 선물하기 등에서 입력하는 휴대전화번호 등을 의미합니다.</dd>
                        <dt>기기정보란?</dt>
                        <dd>본 개인정보처리방침에 기재된 기기정보는 생산 및 판매 과정에서 기기에 부여된 정보뿐 아니라, 기기의 구동을 위해 사용되는 S/W를 통해 확인 가능한 정보를 모두 일컫습니다. OS(Windows, MAC OS 등) 설치 과정에서 이용자가 PC에 부여하는 컴퓨터의 이름, PC에 장착된 주변기기의 일련번호, 스마트폰의 통신에 필요한 고유한 식별값(IMEI, IMSI), AAID 혹은 IDFA, 설정언어 및 설정 표준시, USIM의 통신사 코드 등을 의미합니다. 단, COSMOS는 IMEI와 같은 기기의 고유한 식별값을 수집할 필요가 있는 경우, 이를 수집하기 전에 COSMOS도 원래의 값을 알아볼 수 없는 방식으로 암호화 하여 식별성(Identifiability)을 제거한 후에 수집합니다.</dd>
                        <dt>쿠키(cookie)란?</dt>
                        <dd>쿠키는 이용자가 웹사이트를 접속할 때에 해당 웹사이트에서 이용자의 웹브라우저를 통해 이용자의 PC에 저장하는 매우 작은 크기의 텍스트 파일입니다. 이후 이용자가 다시 웹사이트를 방문할 경우 웹사이트 서버는 이용자 PC에 저장된 쿠키의 내용을 읽어 이용자가 설정한 서비스 이용 환경을 유지하여 편리한 인터넷 서비스 이용을 가능케 합니다. 또한 방문한 서비스 정보, 서비스 접속 시간 및 빈도, 서비스 이용 과정에서 생성된 또는 제공(입력)한 정보 등을 분석하여 이용자의 취향과 관심에 특화된 서비스(광고 포함)를 제공할 수 있습니다. 이용자는 쿠키에 대한 선택권을 가지고 있으며, 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 COSMOS 일부 서비스의 이용에 불편이 있을 수 있습니다.<br></dd>
                    </dl>
                </li>
                <li class="last">
                    <p><strong id="a2_5">COSMOS는 아래의 방법을 통해 개인정보를 수집합니다.</strong></p>
                    <ul class="bu">
                        <li><i></i>회원가입 및 서비스 이용 과정에서 이용자가 개인정보 수집에 대해 동의를 하고 직접 정보를 입력하는 경우, 해당 개인정보를 수집합니다.</li>
                        <li><i></i>고객센터를 통한 상담 과정에서 웹페이지, 메일, 팩스, 전화 등을 통해 이용자의 개인정보가 수집될 수 있습니다.</li>
                        <li><i></i>오프라인에서 진행되는 이벤트, 세미나 등에서 서면을 통해 개인정보가 수집될 수 있습니다.</li>
                        <li><i></i>COSMOS와 제휴한 외부 기업이나 단체로부터 개인정보를 제공받을 수 있으며, 이러한 경우에는 개인정보보호법에 따라 제휴사에서 이용자에게 개인정보 제공 동의 등을 받은 후에 COSMOS에 제공합니다.</li>
                        <li><i></i>기기정보와 같은 생성정보는 PC웹, 모바일 웹/앱 이용 과정에서 자동으로 생성되어 수집될 수 있습니다.</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div id="a3" class="section">
            <h4>3. 수집한 개인정보의 이용</h4>
            <ul class="sec">
                <li class="first last">
                    <p><strong id="a3_1">COSMOS 및 COSMOS 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발·제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.</strong></p>
                    <ul class="bu">
                        <li><i></i>회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.</li>
                        <li><i></i>콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.</li>
                        <li><i></i>법령 및 COSMOS 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.</li>
                        <li><i></i>유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.</li>
                        <li><i></i>이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.</li>
                        <li><i></i>서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.</li>
                        <li><i></i>보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div id="a4" class="section">
            <h4>4. 개인정보의 제공 및 위탁</h4>
            <ul class="sec">
                <li class="first">
                    <p><strong id="a4_1">COSMOS는 원칙적으로 이용자 동의 없이 개인정보를 외부에 제공하지 않습니다.</strong></p>
                    <p>COSMOS는 이용자의 사전 동의 없이 개인정보를 외부에 제공하지 않습니다. 단, 이용자가 외부 제휴사의 서비스를 이용하기 위하여 개인정보 제공에 직접 동의를 한 경우, 그리고 관련 법령에 의거해 COSMOS에 개인정보 제출 의무가 발생한 경우, 이용자의 생명이나 안전에 급박한 위험이 확인되어 이를 해소하기 위한 경우에 한하여 개인정보를 제공하고 있습니다.</p>
                    <div class="btn_area">이용자 동의 후 개인정보 제공이 발생하는 경우‘개인정보 이용내역(내 정보)’ 확인하기 / 법률에 의한 개인정보 제공 (투명성 보고서 관계 법률)</div>
                </li>
                <li>
                    <p><strong id="a4_2">COSMOS는 편리하고 더 나은 서비스를 제공하기 위해 업무 중 일부를 외부에 위탁하고 있습니다.</strong></p>
                    <p>COSMOS는 서비스 제공을 위하여 필요한 업무 중 일부를 외부 업체에 위탁하고 있으며, 위탁받은 업체가 개인정보보호법에 따라 개인정보를 안전하게 처리하도록 필요한 사항을 규정하고 관리/감독을 하고 있습니다.&nbsp;<span>COSMOS가 수탁업체에 위탁하는 업무와 관련된 서비스를 이용하지 않는 경우, 이용자의 개인정보가 수탁업체에 제공되지 않습니다.</span></p>
                </li>
                <li>
                    <p><strong id="a4_3">개인정보 처리위탁 중 국외법인에서 처리하는 위탁업무는 아래와 같습니다.</strong></p>
                    <p>COSMOS는 이용자의 개인정보를 국외의 다른 사업자에게 제공하지 않습니다. 다만, 데이터 보관 업무를 ‘COSMOS클라우드 아시아 퍼시픽’에 아래와 같이 위탁하고 있습니다. 아래 회사는 COSMOS 계열사로서 COSMOS와 동일한 정보보호 정책에 따라 이용자의 정보를 보호하며, COSMOS의 엄격한 통제 하에 업무를 수행하고 있습니다.</p>
                </li>
                <li class="last">
                    <dl class="tgl_cont" id="tgl4-1">
                        <dt>(1) 개인정보 제공과 위탁의 차이</dt>
                        <dd>개인정보의 제3자 제공은 제공받는 자의 업무 처리와 이익을 위하여 개인정보가 제공되는 것을 의미합니다. 개인정보가 제공된 이후에는 제공받는 자의 책임 하에 개인정보가 처리됩니다. 이런 이유로 개인정보의 제3자 제공을 위해서는 이용자에게 사전에 ‘개인정보를 제공받는 자, 개인정보를 제공받는 자의 개인정보 이용 목적, 제공하는 개인정보의 항목, 개인정보를 제공받는 자의 개인정보 보유 및 이용 기간’에 대해 고지하고 동의를 받습니다. 개인정보의 처리위탁은 제공하는 자의 업무 처리를 위하여 개인정보를 외부에 위탁하는 것을 의미합니다. 개인정보가 제공된 이후에도 개인정보를 제공한 자, 즉 위탁자에게 수탁 업체에 대한 관리/감독 책임이 발생합니다.</dd>
                        <dt>(2) 이용자 동의가 필요한 위탁업무와 공개/통지로 동의를 갈음할 수 있는 위탁업무</dt>
                        <dd>서비스 제공에 관한 계약을 이행하고 이용자 편의 증진 등을 위해 필요한 개인정보 처리위탁은 메일 등을 통해 이용자에게 통지하거나 개인정보처리방침에 공개하는 것으로 동의를 갈음할 수 있습니다. 그 외에 개인정보 처리위탁에 대해서는 ‘수탁 업체, 위탁업무 내용’을 이용자에게 고지하고 사전에 동의를 받아야만 합니다. COSMOS는 인프라 운영, 서비스 개발 및 테스트, 서비스 운영, 고객상담, 결제처리, 본인인증 등을 위한 개인정보 처리위탁을 개인정보처리방침에 공개하는 것으로 동의를 갈음합니다. 단, 서비스 프로모션 등을 위해 외부에 개인정보를 위탁하는 경우에는 사전에 이용자 동의를 받습니다.</dd>
                    </dl>
                </li>
            </ul>
        </div>
        <div id="a5" class="section">
            <h4>5. 개인정보의 파기</h4>
            <ul class="sec">
                <li class="first">
                    <p><strong id="a5_1">회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.</strong></p>
                    <p>단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.</p>
                </li>
                <li>
                    <p><strong id="a5_2">이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.</strong></p>
                    <dl class="bu">
                        <dt><i>qnq</i>부정 가입 및 이용 방지</dt>
                        <dd>부정 이용자의 가입인증 휴대전화번호 또는 DI(만 14세 미만의 경우 법정대리인 DI) : 탈퇴일로부터 6개월 보관</dd>
                        <dd>탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관</dd>
                        <dt><i></i>QR코드 복구 요청 대응</dt>
                        <dd>QR코드 등록 정보 : 삭제 시점으로부터 6개월 보관</dd>
                    </dl>
                    <dl class="bu">
                        <dt><i></i>스마트 플레이스 분쟁 조정 및 고객문의 대응</dt>
                        <dd>휴대전화번호 : 등록/수정/삭제 요청 시로부터 최대 1년</dd>
                        <dt><i></i>COSMOS 플러스 멤버십 서비스 혜택 중복 제공 방지</dt>
                        <dd>암호화 처리(해시처리)한 DI : 혜택 제공 종료일로부터 6개월 보관</dd>
                    </dl>
                    <dl class="bu">
                        <dt><i></i>지식iN eXpert 재가입 신청 및 부정 이용 방지</dt>
                        <dd>ID : 서비스 탈퇴 후 6개월 보관</dd>
                        <dd>eXpert 서비스 및 eXpert 센터 가입 등록정보 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관</dd>
                    </dl>
                </li>
                <li>
                    <p><strong id="a5_3">전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. COSMOS는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.</strong></p>
                    <dl class="bu">
                        <dt><i></i>전자상거래 등에서 소비자 보호에 관한 법률</dt>
                        <dd>계약 또는 청약철회 등에 관한 기록 : 5년 보관</dd>
                        <dd>대금결제 및 재화 등의 공급에 관한 기록 : 5년 보관</dd>
                        <dd>소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 보관</dd>
                        <dt><i></i>전자문서 및 전자거래 기본법</dt>
                        <dd>공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관</dd>
                        <dt><i></i>통신비밀보호법</dt>
                        <dd>로그인 기록 : 3개월</dd>
                    </dl>
                </li>
                <li class="last">
                    <p><strong id="a5_4">회원탈퇴, 서비스 종료, 이용자에게 동의받은 개인정보 보유기간의 도래와 같이 개인정보의 수집 및 이용목적이 달성된 개인정보는 재생이 불가능한 방법으로 파기하고 있습니다. <br>법령에서 보존의무를 부과한 정보에 대해서도 해당 기간 경과 후 지체없이 재생이 불가능한 방법으로 파기합니다.</strong></p>
                    <p>전자적 파일 형태의 경우 복구 및 재생이 되지 않도록 기술적인 방법을 이용하여 안전하게 삭제하며, 출력물 등은 분쇄하거나 소각하는 방식 등으로 파기합니다.</p>
                    <p><strong id="a5_5">참고로 COSMOS는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관 또는 삭제하여 관리하고 있습니다.</strong></p>
                </li>
            </ul>
        </div>
        <div id="a6" class="section">
            <h4>6. 이용자 및 법정대리인의 권리와 행사 방법</h4>
            <ul class="bu">
                <li><i></i>이용자는 언제든지 자신의 개인정보를 조회하거나 수정ㆍ삭제할 수 있으며, 자신의 개인정보에 대한 열람을 요청할 수 있습니다.</li>
                <li><i></i>이용자는 언제든지 개인정보 처리의 정지를 요청할 수 있으며, 법률에 특별한 규정이 있는 등의 경우에는 처리정지 요청을 거부할 수 있습니다.</li>
                <li><i></i>이용자는 언제든지 회원탈퇴 등을 통해 개인정보의 수집 및 이용 동의를 철회할 수 있습니다.</li>
                <li><i></i>만 14세 미만 아동의 경우, 법정대리인이 아동의 개인정보를 조회하거나 수정 및 삭제, 처리정지, 수집 및 이용 동의를 철회할 권리를 가집니다.</li>
                <li><i></i>이용자가 개인정보의 오류에 대한 정정을 요청한 경우, 정정을 완료하기 전까지 해당 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.</li>
                <li><i></i>이용자 및 법정대리인의 권리는 ‘회원정보’ 페이지 등에서 직접 처리하거나, ‘문의하기’를 통해 요청할 수 있습니다. 이용자 개인의 서비스 이용활동 및 동의 내역에 따라 제3자에게 제공한 내역은 ‘개인정보 이용현황’ 페이지에서 확인하고 동의 철회를 요청할 수 있습니다.</li>
                <li><i></i>참고로 COSMOS는 '온라인 맞춤형 광고 개인정보보호 가이드 라인'에 따른 이용자 권리보장을 위한 페이지를 제공하고 있습니다.</li>
            </ul>
        </div>
        <div id="a7" class="section">
            <h4>7. 개인정보보호를 위한 COSMOS의 노력</h4>
            <ul class="sec">
                <li class="first">
                    <p><strong id="a7_1">COSMOS는 이용자의 개인정보를 안전하게 관리하기 위하여 최선을 다하며, 개인정보보호법에서 요구하는 수준 이상으로 개인정보를 보호하고 있습니다.</strong></p>
                </li>
                <li>
                    <p><strong id="a7_2">개인정보보호 내부 관리계획을 수립ㆍ시행하고 있습니다.</strong></p>
                    <p>개인정보 보호책임자의 지정 등 개인정보 보호 조직의 구성 및 운영에 관한 사항 등을 포함하여 개인정보 내부관리계획을 수립하고, 매 년 내부관리계획을 잘 시행하고 있는지를 점검하고 있습니다.</p>
                </li>
                <li>
                    <p><strong id="a7_3">개인정보에 대한 접근 통제 및 접근 권한 제한 조치를 하고 있습니다.</strong></p>
                    <p>개인정보에 대한 불법적인 접근을 차단하기 위해 개인정보 처리시스템에 대한 접근 권한의 부여 ㆍ변경 ㆍ말소 등에 관한 기준을 수립하여 시행하고 있으며, 침입차단시스템 및 침입탐지시스템을 설치ㆍ운영하고 있습니다. 또한 개인정보를 처리하는 직원을 최소한으로 관리하며, 개인정보처리시스템에서 개인정보의 다운로드가 가능한 직원들의 업무용 PC에 대해 외부 인터넷망과 내부망을 분리하여 개인정보유출 가능성을 줄이고 있습니다.</p>
                </li>
                <li>
                    <p><strong id="a7_4">개인정보를 안전하게 저장ㆍ전송할 수 있는 암호화 조치를 하고 있습니다.</strong></p>
                    <p>법령에서 암호화를 요구하고 있는 비밀번호, 고유식별정보, 계좌번호 및 카드번호 외에 이메일 주소와 휴대폰 번호 등을 추가로 암호화 하여 보관하고 있습니다. 또한 암호화 통신 등을 통하여 네트워크 상에서 개인정보를 안전하게 송수신하고 있습니다.</p>
                </li>
                <li>
                    <p><strong id="a7_5">개인정보 접속기록의 보관 및 위조ㆍ변조 방지를 위한 조치를 하고 있습니다.</strong></p>
                    <p>개인정보취급자가 개인정보처리시스템에 접속한 기록을 보관ㆍ관리하며, 개인정보의 오ㆍ남용, 분실ㆍ위조ㆍ변조 등을 방지하기 위하여 접속기록 등을 정기적으로 점검하며, 개인정보취급자의 접속기록이 위ㆍ변조 및 도난, 분실되지 않도록 해당 접속기록을 안전하게 보관하고 있습니다.</p>
                </li>
                <li>
                    <p><strong id="a7_6">개인정보에 대한 보안프로그램을 설치 및 갱신하고 있습니다.</strong></p>
                    <p>개인정보의 훼손에 대비하여 자료를 수시로 백업하고 있고, 최신 백신프로그램을 이용하여 이용자들의 개인정보나 자료가 유출되거나 손상되지 않도록 방지하고 있습니다.</p>
                </li>
                <li>
                    <p><strong id="a7_7">개인정보의 안전한 보관을 위한 물리적 조치를 하고 있습니다.</strong></p>
                    <p>해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 외부로부터 접근이 통제된 구역에 시스템을 설치하고 있으며, 출입통제 절차를 수립ㆍ운영하고 있습니다</p>
                </li>
                <li>
                    <p><strong id="a7_8">개인정보보호 전담 조직을 운영하고 있습니다.</strong></p>
                    <p>COSMOS는 국내 기업 중 최초로 2007년에 고객정보보호팀을 만든 바 있습니다. 현재도 개인정보보호 전담 부서에서 전사 임직원이 이용자 개인정보 보호 의무를 올바르게 준수할 수 있도록 기술적/관리적 보호조치를 상시 수행하고 있습니다.</p>
                </li>
            </ul>
        </div>
   
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
