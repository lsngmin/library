<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background: #FFF;
            color: #333333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            position: relative;
        }

        .login-form {
            background: white;
            padding: 32px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 350px; /* Increased width of the form */
            text-align: center;
        }

        .login-form input {
            width: 100%;
            padding: 15px; /* Increased padding for larger input boxes */
            margin: 10px 0;
            border: 1px solid #E0E0E0;
            border-radius: 4px;
            font-size: 16px; /* Increased font size for better readability */
        }

        .login-form button {
            width: 100%;
            padding: 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-form button:hover {
            background-color: #45a049;
        }

        /* 섹션 스타일 수정 */
        .section-container {
            background: white;
            border-radius: 12px;
            padding: 24px;
            margin-bottom: 32px;
        }

        .section-title {
            font-size: 16px;
            color: #666;
            margin-bottom: 12px;
        }

        /* 사이드 네비게이션 */
        .side-nav {
            width: 250px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background: #FFF;
            padding: 20px;
            border-right: 1px solid #E0E0E0;
        }

        .logo {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 18px;
            color: #333;
        }

        .logo img {
            width: 24px;
            height: 24px;
            margin-right: 8px;
        }

        .nav-item {
            padding: 15px;
            margin-bottom: 5px;
            cursor: pointer;
            border: 1px solid transparent;
            border-radius: 4px;
            font-size: 14px;
            color: #666666;
        }

        .nav-item.active {
            background: white;
            border: 1px solid #E0E0E0;
            color: #333333;
        }

        .main-content {
            margin-left: 250px;
            padding: 40px;
        }

        /* 헤더 스타일 수정: 내정보, 로그아웃을 우측 상단으로 이동 */
        .header {
            position: absolute;
            top: 20px;
            right: 20px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        .user-menu {
            color: #666666;
            font-size: 14px;
        }

        .user-menu .separator {
            margin: 0 10px;
            color: #E0E0E0;
        }
    </style>
</head>
<body>
<!-- 로그인 폼 -->
<div class="login-form">
    <h2>비밀번호 변경</h2>
    <form action="#" method="post">
        <input type="text" id="username" name="username" placeholder="아이디" required>
        <input type="password" id="password" name="password" placeholder="비밀번호" required>
        <input type="password" id="password1" name="password" placeholder="비밀번호" required>
        <button type="submit">로그인</button>
    </form>
</div>

<div class="side-nav">
    <div class="logo">
        <img src="logo.png" alt="로고">
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
</body>
</html>
