<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            background-color: white;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .header {
            display: flex;
            padding: 20px 40px;
            background-color: white;
            border-bottom: none;
            align-items: center;
        }

        .logo-container {
            flex: 0 0 auto; /* 고정 크기 유지 */
        }

        .header-content {
            flex: 1;
            text-align: center;
            display: flex;
            font-size: 18px;
            /*align-items: center;*/
            gap: 15px;
        }

        .site-name {
            font-size: 20px;
            color: #333;
            font-weight: bold;
        }

        .logo {
            height: 80px;
            width: auto;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            max-width: 1200px;
            margin: 50px auto;
            margin-left: 650px; /* 왼쪽 마진을 키움 */
            padding: 0 20px;
            flex: 1;

        }

        .login-form {
            margin-left: -350px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            width: 400px;
        }

        .login-form h2 {
            font-size: 20px;
            margin-bottom: 25px;
            font-weight: normal;
        }

        .login-title {
            font-size: 26px;
            margin-bottom: 35px;
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
            background-color: #000;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .find-id {
            text-align: center;
            margin-top: 15px;
            color: #666;
        }

        .illustration {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            max-width: 500px;
            margin: 0 20px;
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
            color: #666;
            border-top: 1px solid #eee;
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
    </style>
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

<script>
    document.querySelector('.password-toggle').addEventListener('click', function() {
        const passwordInput = this.previousElementSibling;
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);

        this.textContent = type === 'password' ? 'visibility_off' : 'visibility';
    });
</script>
</body>
</html>