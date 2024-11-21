<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"  href="/resources/css/wishbookapply.css">
</head>
<body>
<header>
    <div class="logo-container">
        <img src="img/logoImage.png" alt="강릉대학교 로고">
        <h1 class="header-title"><a href="main">강릉대학교 통합도서관</a></h1>
    </div>
    <div class="login-container">
        <img src="img/userImage.png" alt="사용자 아이콘">
        <a href="login">로그인</a>
    </div>
</header>

<div class="main-container">
    <aside class="sidebar">
        <div class="sidebar-title">자료검색</div>
        <ul>
            <li><a href="#">통합검색</a></li>
            <li class="active"><a href="#">희망도서</a></li>
            <li><a href="#">인기도서</a></li>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">이용사항</a></li>
        </ul>
    </aside>

    <div class="content">
        <h2 >희망도서 신청</h2>
        <section class="request-container">

            <p style="color: red; font-weight: bold; font-size: 16px; margin-top: 0;">*표시는 필수 입력 사항입니다.</p>
            <form method="post" action="requestBook.jsp">

                <div class="form-group">
                    <label for="book-title">신청자료명(<span class="required">*</span>)</label>
                    <input type="text" id="book-title" name="book-title" >
                </div>
                <div class="form-group">
                    <label for="author">저자(<span class="required">*</span>)</label>
                    <input type="text" id="author" name="author" >
                </div>
                <div class="form-group">
                    <label for="publisher">출판사(<span class="required">*</span>)</label>
                    <input type="text" id="publisher" name="publisher" >
                </div>
                <div class="form-group">
                    <label for="publishday">발행년도</label>
                    <input type="text" id="publishday" name="publishday" >
                </div>
                <div class="form-group">
                    <label for="price">가격</label>
                    <input type="text" id="price" name="price" >
                </div>
                <div class="form-group">
                    <label for="name">신청자 이름</label>
                    <input type="text" id="name" name="name" >
                </div>
                <div class="form-group">
                    <label for="number">휴대폰 번호</label>
                    <input type="text" id="number" name="number" >
                </div>

                <!-- New buttons for 신청 and 취소 -->
                <div class="phone-buttons">
                    <button type="submit">신청</button>
                    <button type="reset">취소</button>
                </div>

            </form>
        </section>

        <!-- 신청안내 (Application Guide) Box -->
        <h3 >신청안내</h3>
        <section class="guide-container">

            <h4>희망도서 신청 개요</h4>
            <p><strong>신청대상:</strong> 도서관 회원증을 발급받은 회원만 신청이 가능합니다.</p>
            <p><strong>신청조건:</strong> 1인당 월 3권, 1년에 15권으로 제한</p>
            <h4>희망도서 구입 제외 대상</h4>
            <ul>
                <li>5만원 이상 고가도서 (미술, 음악, 전문도서 등과 같은 고가도서)</li>
                <li>도서 정보가 불분명한 도서 (제목, 저자명, 출판사명 등)</li>
                <li>문제집, 수험서, 참고서, 원서 및 해외배송 도서</li>
                <li>판타지, 로맨스, 무협지, 인터넷 소설, 만화(학습만화 제외) 등 도서관 소장 도서로서의 질이 보장되지 않은 도서</li>
                <li>건전한 생활태도, 미풍양속, 정서에 문제를 유발할 수 있는 유해도서 (선정적인 자료, 음란서적, 폭력물, 사행성 조장 자료 등)</li>
                <li>품절 및 절판도서, 희귀도서</li>
            </ul>

            <h4>희망도서 신청 시 유의사항</h4>
            <ul>
                <li>도서 신청 전 도서관에서 소장하고 있는지 확인해 주시기 바랍니다.</li>
                <li>정확한 업무 처리를 위해 도서 제목, 저자, 출판사 등을 정확히 기재해 주시기 바랍니다.</li>
            </ul>

            <h4>희망도서 진행 절차</h4>
            <p>신청한 도서가 선정 절차를 거쳐 구입되어 이용되기까지는 2~3주 간의 기간이 소요됩니다.</p>
            <img src="img/delivery.png" alt="희망도서 진행 절차 이미지" class="process-image">
        </section>
    </div>
</div>
</body>
</html>
