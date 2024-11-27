<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet"  href="/resources/css/library/main.css">
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
                    <img src="/img/userImage.png" alt="사용자 아이콘" style="width: 20px; height: 20px; margin-right: 5px;">
                    내 정보
                </a>
                <a href="logout" style="margin-left: 15px;">로그아웃</a>
            </c:when>
            <c:otherwise>
                <!-- 비로그인 상태 -->
                <a href="/login">로그인</a>
                <!-- 수정-->
            </c:otherwise>
        </c:choose>
    </div>
</header>

<div class="main-content">
    <h1>꿈을 열어주는 책, 꿈을 이루어주는 도서관</h1>
    <div class="search-bar">
        <input
                type="text"
                id="searchInput"
                placeholder="원하시는 도서를 검색해주세요"
                onkeydown="handleSearch(event)">
        <img
                src="/img/searchImage.png"
                alt="검색 아이콘"
                onclick="alert('검색 기능은 준비 중입니다!')"> <!-- 검색 아이콘 -->
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
        <a href="interestbookview" class="menu-item">
            <img src="/img/popularImage.png" alt="인기도서 아이콘">
            <p>인기도서</p>
        </a>
    </div>
</div>
</body>
<script>
    function handleSearch(event) {
        if (event.key === "Enter") {
            alert('검색 기능은 준비 중입니다!');
            // 여기에 실제 검색 기능을 연결하려면, alert를 대체하여 검색 로직을 구현하세요.
        }
    }
</script>
</html>
