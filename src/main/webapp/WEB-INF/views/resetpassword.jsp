<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet"  href="/resources/css/restpassword.css">
    <script src="resetpassword.js"></script>
</head>
<body>
<header class="header">
    <div class="logo-container">
        <img src="/img/logoImage.png" alt="강릉대학교 통합도서관" class="logo">
    </div>
    <div class="header-content">
        <span class="site-name">강릉대학교 통합도서관</span>
    </div>
    </div>
</header>
<div class="container">
    <div class="login-form">
        <h2>강릉대학교 통합도서관</h2>
        <p class="login-title">비밀번호 재발급</p>
        <form action="/login" method="POST">
            <div class="input-group">
                <label class="input-label">아이디</label>
                <input type="text" class="input-field" placeholder="아이디를 입력해 주세요" name="userId", value="${savedUserId}">
            </div>
            <div class="input-group">
                <label class="input-label">생년월일</label>
                <div class="password-wrapper">
                    <input type="password" class="input-field" placeholder="비밀번호를 입력해 주세요" name="password">
                    <span class="material-icons password-toggle">visibility_off</span>
                </div>
            </div>
            <button type="submit" class="login-button">임시 비밀번호 발급</button>
        </form>
    </div>
    <div class="illustration">
        <img src="/img/loginImage.png" alt="일러스트레이션">
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