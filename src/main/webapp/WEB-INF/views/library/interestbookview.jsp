<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet"  href="/resources/css/library/interestbookview.css?after">
    <style>
        /* 이미지 크기 조정 */

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #fff;
            display: flex;
        }


        .main-container {
            margin: 0 auto; /* 중앙 정렬 */
            padding: 20px;
            width: calc(100% - 300px); /* 네비게이션 바 너비 제외 */
            max-width: 1000px; /* 최대 콘텐츠 너비 */
            background: #fff;
            box-sizing: border-box;
            min-height: calc(100vh - 60px); /* 헤더 높이 제외 */
            margin-left: 450px; /* 기존보다 더 오른쪽으로 이동 */
            margin-right: 50px; /* 오른쪽 여백 */
            padding-top: 80px; /* 헤더 아래 공간 확보 */
        }
    </style>
</head>
<body>
<jsp:include page="libraryHeader.jsp"/>
<div class="main-container">
    <jsp:include page="libraryNavbar.jsp"/>
    <div class="content">
        <!-- 검색일 필터 컨테이너 -->
        <section class="date-filter-container">
            <h2>검색일</h2>
            <div class="category-buttons">
                <button>오늘</button>
                <button>일주일</button>
                <button>1개월</button>
                <button>3개월</button>
            </div>
        </section>

        <!-- 카테고리 컨테이너 -->
        <section class="category-container">
            <h3>카테고리</h3>
            <div class="category-buttons">
                <button><a href="#">전체</a></button>
                <button><a href="#">문학</a></button>
                <button><a href="#">과학</a></button>
                <button><a href="#">예술</a></button>
                <button><a href="#">기술</a></button>
                <button><a href="#">역사</a></button>
                <button><a href="#">언어학</a></button>
                <button><a href="#">사회과학</a></button>
                <button><a href="#">자연과학</a></button>
                <button><a href="#">기술과학</a></button>
            </div>
        </section>

        <!-- 책 이미지와 책 제목을 하나의 컨테이너 안에 나열 -->
        <section class="books-container">
            <div class="book-item">
                <div class="loan-count">대출: 36회</div>
                <img src="/img/Book1.png" alt="해커스 토익 기출 보카">
                <h4>해커스 토익 기출 보카</h4>
                <button class="favorite-btn">관심도서</button>
            </div>
            <div class="book-item">
                <div class="loan-count">대출: 35회</div>
                <img src="/img/Book2.png" alt="(ETS TOEIC) 토익 정기시험 기출문제집 1000 RC.4">
                <h4>(ETS TOEIC) 토익 정기시험 기출문제집 1000 RC.4</h4>
                <button class="favorite-btn">관심도서</button>
            </div>
            <div class="book-item">
                <div class="loan-count">대출: 35회</div>
                <img src="/img/Book3.5.png" alt="채식주의자: 한강 연작소설">
                <h4>채식주의자: 한강 연작소설</h4>
                <button class="favorite-btn">관심도서</button>

            </div>
            <div class="book-item">
                <div class="loan-count">대출: 35회</div>
                <img src="/img/Book4.png" alt="(ETS TOEIC) 토익 정기시험 기출문제집 : 1000 LC4">
                <h4>(ETS TOEIC) 토익 정기시험 기출문제집 : 1000 LC4</h4>
                <button class="favorite-btn">관심도서</button>
            </div>
            <div class="book-item">
                <div class="loan-count">대출: 32회</div>
                <img src="/img/Book5.png" alt="엔트로피">
                <h4>엔트로피</h4>
                <button class="favorite-btn">관심도서</button>
            </div>
            <div class="book-item">
                <div class="loan-count">대출: 30회</div>
                <img src="/img/Book6.png" alt="난장이가 쏘아올린 작은공: 조세희 소설집">
                <h4>난장이가 쏘아올린 작은공: 조세희 소설집</h4>
                <button class="favorite-btn">관심도서</button>
            </div>
            <div class="book-item">
                <div class="loan-count">대출: 30회</div>
                <img src="/img/Boook7.png" alt="모순: 양귀자 소설">
                <h4>모순: 양귀자 소설</h4>
                <button class="favorite-btn">관심도서</button>
            </div>
            <div class="book-item">
                <div class="loan-count">대출: 28회</div>
                <img src="/img/Book8.png" alt="오픽노잼 : 스크립트 없이 오픽 쌉가능">
                <h4>오픽노잼 : 스크립트 없이 오픽 쌉가능</h4>
                <button class="favorite-btn">관심도서</button>
            </div>
        </section>
    </div>
</div>
</body>
</html>