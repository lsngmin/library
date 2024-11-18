<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>관리자 로그인 - 강릉대학교 통합도서관</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Arial', sans-serif;
      background-color: #f4f4f4;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .container {
      display: flex;
      width: 80%;
      max-width: 900px;
      background: white;
      border-radius: 10px;
      padding: 50px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .login-section {
      flex: 1;
      padding-right: 20px;
    }

    .login-section h2 {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .login-section p {
      color: #555;
      font-size: 14px;
      margin-bottom: 30px;
    }

    .input-group {
      margin-bottom: 20px;
    }

    .input-group label {
      display: block;
      margin-bottom: 8px;
      font-size: 14px;
      color: #333;
    }

    .input-group input {
      width: 100%;
      padding: 12px;
      font-size: 14px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }

    .input-group input::placeholder {
      color: #aaa;
    }

    .login-button {
      width: 100%;
      padding: 12px;
      background: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }

    .login-button:hover {
      background: #0056b3;
    }

    .illustration {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .illustration img {
      width: 100%;
      max-width: 350px;
      height: auto;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="login-section">
    <h2>관리자 로그인</h2>
    <p>강릉대학교 통합도서관 관리 시스템</p>
    <form action="/admin" method="POST">
      <div class="input-group">
        <label for="adminId">아이디</label>
        <input type="text" id="adminId" name="adminId" placeholder="아이디를 입력해 주세요" required>
      </div>
      <div class="input-group">
        <label for="adminPassword">비밀번호</label>
        <input type="password" id="adminPassword" name="adminPassword" placeholder="비밀번호를 입력해 주세요" required>
      </div>
      <button type="submit" class="login-button">로그인</button>
    </form>
  </div>
  <div class="illustration">
    <img src="/img/adminLoginImage.png" alt="관리자 로그인 일러스트레이션">
  </div>
</div>
</body>
</html>