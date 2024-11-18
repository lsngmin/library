<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>도서관 관리 시스템</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      margin: 0;
      padding: 0;
      background-color: #F5F5F5;
    }

    .main-nav {
      background-color: #000;
      overflow: hidden;
      display: flex;
      justify-content: space-between;
      align-items: center;
      height: 40px;
    }

    .main-nav ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      display: flex;
      align-items: center;
    }

    .main-nav ul.left {
      display: flex;
    }

    .main-nav ul.right {
      display: flex;
    }

    .main-nav ul li {
      padding: 8px 10px;
    }

    .main-nav ul li a {
      color: white;
      text-decoration: none;
      font-size: 10px;
      display: flex;
      align-items: center;
    }

    .main-nav ul li a:hover {
      background-color: #575757;
      border-radius: 4px;
    }

    .icon-home, .icon-book-register, .icon-book-info, .icon-student-info, .icon-wishlist, .icon-library, .icon-logout {
      margin-right: 6px;
    }

    .logout_icon {
      width: 12px;  /* 아이콘의 가로 크기 설정 */
      height: 12px; /* 아이콘의 세로 크기 설정 */
    }

    .header-container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px;
      background-color: #ffffff;
    }

    .header-title {
      font-size: 16px;
      font-weight: bold;
      margin-left: 10px;
    }

    .search-container {
      position: relative;
      width: 300px;  /* 검색 바의 전체 길이 설정 */
      padding-right: 10px;
    }

    .search-input {
      width: 100%;
      padding: 8px 40px 8px 10px;  /* 오른쪽 여백을 늘려서 아이콘이 들어갈 공간 확보 */
      font-size: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .search-icon {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      font-size: 16px;
      color: #aaa;
      cursor: pointer;
      padding-right: 10px;
    }
    .info-box-container {
      margin-top: 50px;
      display: flex;
      justify-content: center;
      gap: 20px;
      flex-wrap: wrap;
    }

    .info-box {
      display: flex;
      align-items: center;
      padding: 28px;
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

      width: 240px;
      height: 100px;
    }

    .info-box .icon {
      font-size: 40px;
      color: #FF5722;
      margin-right: 10px;
    }

    .info-box .details {
      text-align: left;
    }

    .info-box .details .title {
      font-size: 10px;
      color: #777;
      margin-bottom: 5px;
    }

    .info-box .details .number {
      font-size: 24px;
      font-weight: bold;
      color: #333;
    }
    .info_icon {
      margin-left: 3px;
      width: 50px;  /* 아이콘의 가로 크기 설정 */
      height: 50px; /* 아이콘의 세로 크기 설정 */
    }

  </style>
</head>
<body>
<nav class="main-nav">
  <ul class="left">
    <li><a href="#"><img src="/img/admindashboard/home_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp홈</a></li>
    <li><a href="#"><img src="/img/admindashboard/bookregi_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp도서 등록</a></li>
    <li><a href="#"><img src="/img/admindashboard/bookinfo_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp도서 정보</a></li>
    <li><a href="#"><img src="/img/admindashboard/userinfo_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp학생 정보</a></li>
    <li><a href="#"><img src="/img/admindashboard/status_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp희망/기종 도서 신청 목록</a></li>
  </ul>
  <ul class="right">
    <li><a href="#"><img src="/img/admindashboard/gotolib_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp도서관 바로가기</a></li>
    <li><a href="#"><img src="/img/admindashboard/logout_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp로그아웃</a></li>
  </ul>
</nav>

<div class="header-container">
  <div class="header-title">강릉대학교 통합도서관 관리 시스템</div>
  <div class="search-container">
    <input type="text" class="search-input" placeholder="학생 정보 또는 도서 정보를 입력하세요...">
    <span class="search-icon"><img src="/img/admindashboard/search_icon.png" alt="홈 아이콘" class="logout_icon"></span>  <!-- 검색 아이콘을 입력 박스 안에 위치시키기 -->
  </div>
</div>

<div class="info-box-container">
  <div class="info-box">
    <div class="icon"><img src="/img/admindashboard/currentBook_icon.png" alt="아이콘" class="info_icon"></div>
    <div class="details">
      <div class="title">현재까지 등록된 도서</div>
      <div class="number">12,542</div>
    </div>
  </div>
  <div class="info-box">
    <div class="icon"><img src="/img/admindashboard/wishBook_icon.png" alt="아이콘" class="info_icon"></div>
    <div class="details">
      <div class="title">희망도서 신청 건 수</div>
      <div class="number">1,234</div>
    </div>
  </div>
  <div class="info-box">
    <div class="icon"><img src="/img/admindashboard/userTotal_icon.png" alt="아이콘" class="info_icon"></div>
    <div class="details">
      <div class="title">도서관 총 이용자 수</div>
      <div class="number">567</div>
    </div>
  </div>
  <div class="info-box">
    <div class="icon"><img src="/img/admindashboard/rentalBook_icon.png" alt="아이콘" class="info_icon"></div>
    <div class="details">
      <div class="title">대여 진행중인 도서 수</div>
      <div class="number">89</div>
    </div>
  </div>
</div>
</body>
</html>