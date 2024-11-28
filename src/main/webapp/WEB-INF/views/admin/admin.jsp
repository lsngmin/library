<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>관리자 로그인 - 강릉대학교 통합도서관</title>
  <link rel="stylesheet"  href="/resources/css/admindashboard/admin.css">
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
    <img src="/img/loginImage.png" alt="관리자 로그인 일러스트레이션">
  </div>
</div>
</body>
</html>