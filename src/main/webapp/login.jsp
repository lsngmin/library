<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: white;
        }

        .header {
            padding: 20px 40px;
            background-color: white; /* 배경색을 white로 설정 */
        }

        .header-content {
            display: flex;
            align-items: center;
            gap: 0; /* 로고와 사이트 이름 사이의 간격을 0으로 설정 */
        }

        .site-name {
            font-size: 24px;
            color: #333;
            font-weight: bold;
        }

        .logo {
            height: 70px;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex: 1; /* 부모 요소에서 남는 공간을 모두 차지 */
            padding: 40px;
            gap: 50px;
            flex-wrap: wrap;
        }

        .login-box {
            width: 100%;
            max-width: 400px; /* 최대 너비를 지정하여 너무 커지지 않도록 */
            background: white;
            padding: 40px;
            border: 1px solid #eee;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .login-box h2 {
            font-size: 20px;
            margin-bottom: 20px;
            font-weight: normal;
        }

        .login-title {
            font-size: 24px;
            margin-bottom: 30px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .input-field {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .input-field::placeholder {
            color: #999;
        }

        .password-wrapper {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #666;
            font-size: 20px;
            user-select: none;
        }

        .save-id {
            display: flex;
            align-items: center;
            gap: 8px;
            margin: 20px 0;
        }

        .save-id input[type="checkbox"] {
            width: 16px;
            height: 16px;
        }

        .save-id label {
            font-size: 14px;
            color: #333;
        }

        .login-button {
            width: 100%;
            padding: 12px;
            background: #000;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .illustration {
            flex-shrink: 0;
            width: 100%;
            max-width: 500px;
            margin-left: 20px;
        }

        .illustration img {
            width: 100%;
            height: auto;
            opacity: 0.9;
        }

        .footer {
            margin-top: auto;
            padding: 20px;
            text-align: center;
            font-size: 13px;
            color: #666; /* 텍스트 색상은 여전히 #666으로 유지 */
            background-color: white; /* 배경색을 white로 설정 */
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 10px;
        }

        .footer-links a {
            color: #666;
            text-decoration: none;
            font-size: 13px;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
            }

            .illustration {
                margin-left: 0;
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>
<header class="header">
    <div class="header-content">
        <img src="/library/images/logo.png" alt="강릉대학교 통합도서관" class="logo">
        <span class="site-name">강릉대학교 통합도서관</span>
    </div>
</header>

<div class="container">
    <div class="login-box">
        <h2>강릉대학교 통합도서관</h2>
        <p class="login-title">로그인이 필요합니다</p>
        <form action="login" method="POST">
            <div class="input-group">
                <label class="input-label">아이디</label>
                <input type="text" class="input-field" placeholder="아이디를 입력해 주세요" name="userId">
            </div>
            <div class="input-group">
                <label class="input-label">비밀번호</label>
                <div class="password-wrapper">
                    <input type="password" class="input-field" placeholder="비밀번호를 입력해 주세요" name="userPw">
                    <span class="material-icons password-toggle">visibility_off</span>
                </div>
            </div>
            <div class="save-id">
                <input type="checkbox" id="saveId" name="saveId">
                <label for="saveId">아이디 저장</label>
                <a href="#" style="margin-left: auto; font-size: 13px; color: #666; text-decoration: none;">비밀번호를 잊으셨나요?</a>
            </div>
            <button type="submit" class="login-button">로그인</button>
        </form>
    </div>
    <div class="illustration">
        <img src="/library/images/illustration.png" alt="일러스트레이션">
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

<script>
    document.querySelector('.password-toggle').addEventListener('click', function() {
        const passwordInput = this.previousElementSibling;
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);

        // 아이콘 변경
        this.textContent = type === 'password' ? 'visibility_off' : 'visibility';
    });
</script>
</body>
</html>