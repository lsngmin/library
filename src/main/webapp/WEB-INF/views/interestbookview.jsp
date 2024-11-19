<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강릉대학교 통합도서관</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #fff;
            border-bottom: 1px solid #ddd;
        }

        .logo-container {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .logo-container img {
            height: 50px;
        }

        .header-title {
            margin: 0;
            font-size: 20px;
            font-weight: bold;
            color: #333;
            cursor: pointer;
        }

        .header-title a {
            text-decoration: none;
            color: inherit;
        }

        .login-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .login-container img {
            height: 30px;
        }

        .login-container a {
            text-decoration: none;
            font-size: 16px;
            color: #000;
        }

        .main-container {
            display: flex;
            max-width: 1200px;
            margin: 20px auto;
        }

        .sidebar {
            width: 220px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 15px;
        }

        .sidebar-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 15px;
            padding: 10px;
            background-color: #eee;
            text-align: center;
            border-radius: 4px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar ul li {
            margin: 15px 0;
            display: flex;
            align-items: center;
        }

        .sidebar ul li.active {
            font-weight: bold;
            color: #007bff;
        }

        .sidebar ul li.active:before {
            content: "◆";
            color: #007bff;
            margin-right: 8px;
        }

        .sidebar ul li:before {
            content: "◆";
            color: #ccc;
            margin-right: 8px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #333;
        }


        .content {
            flex-grow: 1;
            padding-left: 20px;
        }

        .date-filter-container {
            display: flex;
            flex-direction: column;
            padding: 10px 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            max-width: 900px;
        }

        .date-filter-container h2 {
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 15px;
            text-align: left;
            margin-top: 0;

        }

        .date-filter-container button {
            padding: 10px 20px;
            background-color: #6c757d;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            margin-bottom: 10px;
        }

        .date-filter-container button:hover {
            background-color: #5a6268;
        }

        .category-container {
            margin-top: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 900px;
        }

        .category-container h3 {
            margin-top: 0;
            font-size: 25px;
            font-weight: bold;
        }

        .category-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 20px;
        }

        .category-buttons button {
            width: 140px;
            padding: 15px 0;
            background-color: #6c757d;
            color: black;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            text-align: center;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .category-buttons button:hover {
            background-color: #5a6268;
        }

        .category-buttons button a {
            color: white;
            text-decoration: none;
        }

        /* New section for books */
        .books-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3개 열로 정렬 */
            gap: 20px; /* 항목 간 간격 */
            margin-top: 25px;
            background-color: #f9f9f9;
            max-width: 900px;

        }

        .book-item {
            position: relative; /* loan-count를 이미지 위에 겹치기 위해 position 설정 */
            text-align: center;
            border-radius: 8px;
            padding: 10px;
            background-color: #f9f9f9;/* 배경 투명 */
            display: flex; /* 플렉스 레이아웃 추가 */
            flex-direction: column; /* 세로 정렬 */
            align-items: center; /* 중앙 정렬 */
            justify-content: space-between; /* 요소 간 간격 균등 배치 */
            margin-bottom: 1px;
        }
        .loan-count {
            top: 20px; /* 상단에서 간격 */
            margin-bottom: 10px;
            background-color: rgba(0, 0, 0, 0.1); /* 반투명 검은 배경 */
            color: black;
            padding: 5px 50px;
            border-radius: 50px;
            font-size: 14px;
            font-weight: bold;
        }

        .book-item img {
            width: 100%; /* 컨테이너 너비에 맞춤 */
            height: 400px; /* 고정된 높이 설정 */
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .book-item h4 {
            margin-top: 2px;
            font-size: 20px;
            font-weight: bold;
            overflow: hidden; /* 너비 초과 시 처리 */
        }
        .favorite-btn {
            margin-top: 1px;
            display: inline-block;
            margin: 10px auto 0; /* 제목과 버튼 간격 */
            padding: 10px 20px;
            background-color: #007bff; /* 파란색 배경 */
            color: white; /* 흰색 글씨 */
            border: none;
            border-radius: 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;

        }

        .favorite-btn:hover {
            background-color: #0056b3; /* 호버 시 더 짙은 파란색 */
        }
    </style>
</head>
<body>
<header>
    <div class="logo-container">
        <img src="img/logoImage.png" alt="강릉대학교 로고">
        <h1 class="header-title"><a href="main">강릉대학교 통합도서관</a></h1>
    </div>
    <div class="login-container">
        <img src="img/userImage.png" alt="사용자 아이콘">
        <a href="login">로그인</a>
    </div>
</header>

<div class="main-container">
    <aside class="sidebar">
        <div class="sidebar-title">자료검색</div>
        <ul>
            <li><a href="#">통합검색</a></li>
            <li><a href="#">희망도서</a></li>
            <li class="active"><a href="#">인기도서</a></li>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">이용사항</a></li>
        </ul>
    </aside>

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
