<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet"  href="/resources/css/library/booketails.css">
</head>
<body>
<header>
    <div class="logo-container">
        <img src="/resources/img/logoImage.png" alt="강릉대학교 로고">
        <h1 class="header-title"><a href="/main">강릉대학교 통합도서관</a></h1>
    </div>
    <div class="login-container">
        <img src="/resources/img/userImage.png" alt="사용자 아이콘">
        <a href="/login">로그인</a>
    </div>
</header>

<div class="main-container">
    <aside class="sidebar">
        <div class="sidebar-title">자료검색</div>
        <ul>
            <li class="active"><a href="#">통합검색</a></li>
            <li><a href="#">희망도서</a></li>
            <li><a href="#">인기도서</a></li>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">이용사항</a></li>
        </ul>
    </aside>
    <section class="results-container">
        <div class="result-item">
            <img src="${book.bookImageSrc != null ? book.bookImageSrc : '/resources/img/gun.png'}" alt="${book.bookName}">
            <div class="result-details">
                <p class="subject">${book.bookCategory}</p>
                <p>도서명: ${book.bookName}</p>
                <p>저자: ${book.bookAuthor}</p>
                <p>발행사항: ${book.bookPublisher}</p>
                <p>매체구분: 인쇄자료</p>
                <p>발행년: ${book.bookPublishDate}</p>
                <p>가격: ${book.bookPrice}원</p>
            </div>
        </div>
        <div class="book-introduction">
            <h4>도서 소개</h4>
            <p>${book.bookDecription}</p>
        </div>
        <div class="book-location">
            <h4>소장 정보</h4>
            <p>
                <strong>자료 위치:</strong> ${book.bookLocation}<br>
                <strong>등록 번호:</strong> ${book.bookCode}<br>
                <strong>도서 상태:</strong> ${book.bookStatus}
            </p>
        </div>
        <div class="button-container">
            <button class="interest-btn">관심도서</button>
            <button class="list-btn" onclick="history.back()">목록</button>
        </div>
    </section>
</div>
</body>
</html>