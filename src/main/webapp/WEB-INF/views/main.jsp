<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강릉대학교 통합도서관</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-image: url('/img/backgroundImage.png'); /* 배경 이미지 경로 */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            overflow: hidden;
            color: white;
        }

        /* 헤더 영역 */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
        }
        .logo-container {
            display: flex;
            align-items: center;
            cursor: pointer;
        }
        header img {
            height: 80px;
            margin-right: 1px;
        }
        header h1 {
            font-size: 28px;
            font-weight: bold;
            margin: 0;
        }
        .logo-container a {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: white;
        }
        .header-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .header-right img {
            height: 25px;
            margin-right: 8px;
        }
        header a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }

        .main-content {
            text-align: center;
            position: relative;
            top: 10%; /* 화면 중앙보다 살짝 위로 이동 */
        }
        .main-content h1 {
            font-size: 50px;
            margin-bottom: 40px; /* 검색창과의 간격 증가 */
        }

        .search-bar {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            position: relative;
        }
        .search-bar input[type="text"] {
            width: 60%;
            padding: 15px 20px;
            font-size: 20px;
            border: 2px solid white;
            border-radius: 50px;
            background: transparent; /* 투명 배경 */
            color: white;
        }
        .search-bar input[type="text"]::placeholder {
            color: white;
        }
        .search-bar input[type="text"]:focus {
            outline: none;
        }
        .search-bar img {
            position: absolute;
            right: 20%;
            top: 50%;
            transform: translateY(-50%);
            height: 30px;
            cursor: pointer;
        }

        /* 메뉴 스타일 */
        .menu-container {
            display: flex;
            justify-content: center;
            margin-top: 50px;
            gap: 30px;
        }
        .menu-container .menu-item {
            text-align: center;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 20px;
            width: 150px;
            cursor: pointer;
        }
        .menu-container img {
            height: 80px;
        }
        .menu-container p {
            margin-top: 10px;
            font-size: 18px;
        }
        .menu-container a {
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>
<header>
    <div class="logo-container">
        <a href="/main">
            <img src="/img/logoImage.png" alt="강릉대학교 통합도서관 로고">
            <h1>강릉대학교 통합도서관</h1>
        </a>
    </div>
    <div class="header-right">
        <c:choose>
            <c:when test="${not empty user}">
                <!-- 로그인 상태 -->
                <a href="myInfo">내 정보</a>
                <a href="logout">로그아웃</a>
            </c:when>
            <c:otherwise>
                <!-- 비로그인 상태 -->
                <img src="/img/userImage.png" alt="사용자 아이콘">
                <a href="/login">로그인</a>
            </c:otherwise>
        </c:choose>
    </div>
</header>

<div class="main-content">
    <h1>꿈을 열어주는 책, 꿈을 이루어주는 도서관</h1>
    <div class="search-bar">
        <input type="text" placeholder="원하시는 도서를 검색해주세요">
        <img src="/img/searchImage.png" alt="검색 아이콘" onclick="alert('검색 기능은 준비 중입니다!')"> <!-- 검색 아이콘 -->
    </div>
    <div class="menu-container">
        <a href="guide" class="menu-item">
            <img src="/img/guideImage.png" alt="이용안내 아이콘">
            <p>이용안내</p>
        </a>
        <a href="donation" class="menu-item">
            <img src="/img/donationImage.png" alt="도서기증 아이콘">
            <p>도서기증</p>
        </a>
        <a href="hope" class="menu-item">
            <img src="/img/hopeImage.png" alt="희망도서 아이콘">
            <p>희망도서</p>
        </a>
        <a href="notice" class="menu-item">
            <img src="/img/noticeImage.png" alt="공지사항 아이콘">
            <p>공지사항</p>
        </a>
        <a href="popular" class="menu-item">
            <img src="/img/popularImage.png" alt="인기도서 아이콘">
            <p>인기도서</p>
        </a>
    </div>
</div>
</body>
</html>
