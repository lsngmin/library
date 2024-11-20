<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet"  href="/resources/css/search.css">
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
            <li class="active"><a href="#">통합검색</a></li>
            <li><a href="#">희망도서</a></li>
            <li><a href="#">인기도서</a></li>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">이용사항</a></li>
        </ul>
    </aside>

    <div class="content">
        <h2 class="search-header">통합검색</h2>
        <section class="search-container">
            <form method="get" action="searchResults.jsp">
                <input type="text" name="query" placeholder="검색어를 입력하세요" required>
                <button type="submit">검색</button>
            </form>
            <div class="search-filters">
                <label><input type="radio" name="filter" value="author"> 저자별</label>
                <label><input type="radio" name="filter" value="title"> 제목별</label>
            </div>
            <div class="results-summary">
                "검색어"에 대하여 3건이 검색되었습니다.
            </div>
        </section>

        <section class="results-container">
            <div class="result-item">
                <img src="img/gun.png" alt="책 이미지">
                <div class="result-details">
                    <p class="subject">사회과학</p>
                    <h4>총,균,쇠 <input type="checkbox"></h4>
                    <p>저자: 재레드 다이아몬드</p>
                    <p>발행처: 문학사상</p>
                    <p>발행년: 2014</p>
                    <div class="result-actions">
                        <button>관심도서 담기</button>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
</html>
