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

        .book-category {
            font-size: 14px;
            color: #555;
            margin-top: 5px;
        }
        .active-category { /* 선택된 카테고리 강조 스타일 추가 */
            background-color: #007bff;
            color: #fff;
            border: 1px solid #0056b3;
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
                <!-- 카테고리 필터링 버튼 -->
                <a href="/interestbookview?category=전체"><button>전체</button></a>
                <a href="/interestbookview?category=문학"><button>문학</button></a>
                <a href="/interestbookview?category=과학"><button>과학</button></a>
                <a href="/interestbookview?category=예술"><button>예술</button></a>
                <a href="/interestbookview?category=기술"><button>기술</button></a>
                <a href="/interestbookview?category=역사"><button>역사</button></a>
                <a href="/interestbookview?category=언어학"><button>언어학</button></a>
                <a href="/interestbookview?category=사회과학"><button>사회과학</button></a>
                <a href="/interestbookview?category=자연과학"><button>자연과학</button></a>
                <a href="/interestbookview?category=기술과학"><button>기술과학</button></a>
            </div>
        </section>

        <!-- 책 이미지와 책 제목을 하나의 컨테이너 안에 나열 -->
        <section class="books-container">
            <c:forEach var="book" items="${books}">
                <div class="book-item">
                    <div class="loan-count">대출: ${book.borrowCount}회</div>
                    <img src="${book.bookImageSrc}" alt="${book.bookName}">
                    <h4>${book.bookName}</h4>
                    <!-- 카테고리 출력 -->
                    <p class="book-category">카테고리: ${book.bookCategory}</p>
                    <button class="favorite-btn">관심도서</button>
                </div>
            </c:forEach>
        </section>
    </div>
</div>
</body>
</html>