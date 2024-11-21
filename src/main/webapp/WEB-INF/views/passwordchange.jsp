<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet"  href="/resources/css/passwordchange.css">
</head>
<body>
<div class="login-form">
    <h2>비밀번호 변경</h2>
    <form action="#" method="post">
        <input type="text" id="username" name="username" placeholder="현재 비밀번호를 입력해주세요" required>

        <input type="password" id="password" name="password" placeholder="새 비밀번호를 입력해주세요" required>

        <input type="password" id="password1" name="password" placeholder="비밀번호를 확인해주세요" required>

        <button type="submit">비밀번호 변경</button>
    </form>
</div>

<div class="side-nav">
    <div class="logo">
        <img src="img/logoImage.png" alt="로고">
        강릉대학교 통합도서관
    </div>
    <div class="nav-item">내정보</div>
    <div class="nav-item">관심도서 목록</div>
    <div class="nav-item">도서기증 신청</div>
    <div class="nav-item active">비밀번호 변경</div>
</div>

<div class="main-content">
    <div class="header">
        <div class="user-menu">
            <span>내정보</span>
            <span class="separator">|</span>
            <a href="#" style="color: #666666; text-decoration: none;">로그아웃</a>
        </div>
    </div>
</div>
<footer class="footer">
    <div class="footer-links">
        <a href="#">이용약관</a>
        <a href="#">개인정보처리방침</a>
        <a href="#">우리 도서관</a>
        <a href="#">운영정책</a>
        <a href="#">도서관 안내</a>
    </div>
    <div>Copyright © 2024 강릉대학교. All rights reserved.</div>
</footer>
</body>
</html>