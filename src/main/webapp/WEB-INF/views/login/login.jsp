<%--
  Created by IntelliJ IDEA.
  User: smin
  Date: 11/13/24
  Time: 6:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관 로그인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #ffffff;
        }

        .login-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 80%;
            max-width: 1200px;
        }

        .login-box {
            width: 400px;
            padding: 40px;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .login-box h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .login-box p {
            color: #888;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .login-box input[type="text"], .login-box input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .login-box .checkbox-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .login-box .checkbox-container input[type="checkbox"] {
            margin-right: 5px;
        }

        .login-box button {
            width: 100%;
            padding: 12px;
            background-color: #000;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .login-box .error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }

        .illustration {
            width: 50%;
            text-align: center;
        }

        .illustration img {
            max-width: 100%;
            height: auto;
        }

        .footer {
            text-align: center;
            font-size: 12px;
            color: #888;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-box">
        <h1>강릉대학교 통합도서관</h1>
        <p>로그인이 필요합니다</p>
        <p>아이디, 비밀번호는 생년월일을 입력하세요</p>
        <form>
            <input type="text" placeholder="아이디를 입력해 주세요">
            <input type="password" placeholder="비밀번호를 입력해 주세요">
            <div class="checkbox-container">
                <input type="checkbox"> 아이디 저장
            </div>
            <button type="submit">로그인</button>
            <p class="error-message">아이디 또는 비밀번호가 틀렸습니다.</p>
        </form>
    </div>
    <div class="illustration">
        <img src="login_illustration.png" alt="Illustration">
    </div>
</div>
<div class="footer">
    <a href="#">이용약관</a> | <a href="#">개인정보처리방침</a> | <a href="#">쿠키 설정</a> | <a href="#">운영정보</a> | <a href="#">도서관 안내</a><br>
    Copyright © 2024 강릉대학교. All rights reserved.
</div>
</body>
</html>

