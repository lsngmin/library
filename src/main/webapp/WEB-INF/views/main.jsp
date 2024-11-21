<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet"  href="/resources/css/main.css">
</head>
<body>
<header>
    <div class="logo-container">
        <a href="/main">
            <img src="/img/whiteImage.png" alt="강릉대학교 통합도서관 로고">
            <h1>강릉대학교 통합도서관</h1>
        </a>
    </div>
    <div class="header-right">
        <c:choose>
            <c:when test="${not empty user}">
                <!-- 로그인 상태 -->
                <a href="myInfo" style="display: inline-flex; align-items: center;">
                    <span style="vertical-align: middle;">내 정보</span>
                    <img src="/img/userImage.png" alt="사용자 아이콘" style="width: 30px; height: 30px; margin-left: 5px; vertical-align: middle;"> <!-- 사용자 아이콘 가까이 배치 -->
                </a>
                <a href="logout" style="margin-left: 15px;">로그아웃</a>
            </c:when>
            <c:otherwise>
                <!-- 비로그인 상태 -->
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
        <a href="wishbookapply" class="menu-item">
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
