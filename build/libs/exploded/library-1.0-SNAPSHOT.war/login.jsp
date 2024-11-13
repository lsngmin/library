<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .header {
            padding: 20px;
            background-color: white;
            border-bottom: 1px solid #ddd;
        }

        .header img {
            height: 40px;
        }

        .container {
            display: flex;
            justify-content: space-between;
            max-width: 1200px;
            margin: 50px auto;
            padding: 0 20px;
        }

        .login-form {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            width: 400px;
        }

        .login-title {
            font-size: 24px;
            margin-bottom: 30px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .save-id {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .save-id input[type="checkbox"] {
            margin-right: 8px;
        }

        .login-button {
            width: 100%;
            padding: 12px;
            background-color: #000;
            color: white;
            border: none;
            border-radius: 5px;
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
        }

        .illustration img {
            max-width: 100%;
        }

        .footer {
            margin-top: auto;
            padding: 20px;
            background-color: #f8f8f8;
            text-align: center;
            font-size: 14px;
            color: #666;
        }

        .footer-links {
            margin-bottom: 10px;
        }

        .footer-links a {
            color: #666;
            text-decoration: none;
            margin: 0 10px;
        }
    </style>
</head>
<body>
<header class="header">
    <img src="logo.png" alt="강릉대학교 통합도서관">
</header>

<div class="container">
    <div class="login-form">
        <h1 class="login-title">로그인이 필요합니다</h1>
        <form action="login_process.jsp" method="POST">
            <div class="input-group">
                <input type="text" name="userId" placeholder="아이디를 입력해 주세요" required>
            </div>
            <div class="input-group">
                <input type="password" name="userPw" placeholder="비밀번호를 입력해 주세요" required>
            </div>
            <div class="save-id">
                <input type="checkbox" id="saveId" name="saveId">
                <label for="saveId">아이디 저장</label>
            </div>
            <button type="submit" class="login-button">로그인</button>
        </form>
        <div class="find-id">
            아이디 또는 비밀번호가 기억나지 않으세요?
        </div>
    </div>

    <div class="illustration">
        <img src="illustration.png" alt="로그인 일러스트레이션">
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
    <div class="copyright">
        Copyright © 2024 강릉대학교. All rights reserved.
    </div>
</footer>
</body>
</html>