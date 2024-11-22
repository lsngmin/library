<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <script src="wishbookstatus.js"></script>
    <link rel="stylesheet"  href="/resources/css/wishbookstatus.css?after">
</head>
<body>
<div class="side-nav">
    <div class="logo">
        <img src="img/logoImage.png" alt="로고">
        강릉대학교 통합도서관
    </div>
    <div class="nav-item active">내정보</div>
    <div class="nav-item">관심도서 목록</div>
    <div class="nav-item">도서기증 신청</div>
    <div class="nav-item">비밀번호 변경</div>
</div>

<div class="main-content">
    <div class="header">
        <div class="user-menu">
            <span>내정보</span>
            <span class="separator">|</span>
            <a href="#" style="color: #666666; text-decoration: none;">로그아웃</a>
        </div>
    </div>
    </header>



    <main class="content">
        <h2 class="page-title">희망도서 신청 내역</h2>

        <div class="status-tabs">
            <button class="status-tab">전체</button>
            <button class="status-tab active">접수중</button>
            <button class="status-tab">검토중</button>
            <button class="status-tab">처리완료</button>
        </div>

        <div class="info-text">
            접수중 상태일 때만 취소가 가능합니다.
        </div>

        <!-- 접수중 상태 -->
        <div class="status-row">
            <div class="status-cell">접수중</div>
            <div class="status-cell">인형의 집</div>
            <div class="status-cell">안미란</div>
            <div class="status-cell">민음사</div>
            <div class="status-cell">2024.10.11</div>
            <div class="status-cell"><button class="cancel-btn">취소</button></div>
        </div>

        <div class="status-row">
            <div class="status-cell">접수중</div>
            <div class="status-cell">코스모스</div>
            <div class="status-cell">재레미</div>
            <div class="status-cell">한빛미디어</div>
            <div class="status-cell">2024.10.11</div>
            <div class="status-cell"><button class="cancel-btn">취소</button></div>
        </div>

        <!-- 검토중 상태 (취소 불가) -->
        <div class="status-row">
            <div class="status-cell">검토중</div>
            <div class="status-cell">버드걸</div>
            <div class="status-cell">신혜빈</div>
            <div class="status-cell">문학동네</div>
            <div class="status-cell">2024.10.09</div>
            <div class="status-cell"><button class="cancel-btn" disabled>취소</button></div>
        </div>

        <!-- 처리완료 상태 (취소 불가) -->
        <div class="status-row">
            <div class="status-cell">처리완료</div>
            <div class="status-cell">예쁜아이</div>
            <div class="status-cell">토리헤이드</div>
            <div class="status-cell">아름드리미디어</div>
            <div class="status-cell">2024.10.01</div>
            <div class="status-cell"><button class="cancel-btn" disabled>취소</button></div>
        </div>
    </main>

    <footer class="footer">
        <div class="footer-links">
            <a href="#">이용약관</a>
            <a href="#">개인정보처리방침</a>
            <a href="#">규정 실정</a>
            <a href="#">운영체계</a>
            <a href="#">도서관 안내</a>
        </div>
        <p class="copyright">Copyright © 2024 강릉대학교. All rights reserved.</p>
    </footer>


</div>

</body>
</html>