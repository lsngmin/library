<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.library.noticeBoard.model.NoticeBoardVO" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background: #F9F9F9;
            color: #333;
            display: flex;
        }

        /* 사이드 네비게이션 */
        .side-nav {
            width: 250px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background: #FFF;
            padding: 20px;
            border-right: 1px solid #E0E0E0;
            overflow-y: auto;
        }

        .logo {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 18px;
            color: #333;
        }

        .logo a {
            text-decoration: none; /* 밑줄 제거 */
            color: #333;
        }

        .logo img {
            width: 24px;
            height: 24px;
            margin-right: 8px;
        }

        .nav-item {
            padding: 15px;
            margin-bottom: 5px;
            cursor: pointer;
            border: 1px solid transparent;
            border-radius: 4px;
            font-size: 14px;
            color: #666666;
        }

        .nav-item.active {
            background: white;
            border: 1px solid #E0E0E0;
            color: #333333;
        }

        /* 메인 콘텐츠 영역 */
        .main-content {
            margin-left: 270px;
            padding: 20px;
            width: calc(100% - 270px);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .header .title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .header .login {
            display: flex;
            align-items: center;
            text-decoration: none; /* 밑줄 제거 */
            font-size: 16px; /* 텍스트 크기 키움 */
            font-weight: bold; /* 텍스트 강조 */
            color: #333; /* 검은색 텍스트 */
        }

        .header .login img {
            width: 24px; /* 이미지 크기 확대 */
            height: 24px;
            margin-right: 10px; /* 텍스트와 간격 */
        }

        .search-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-bar .categories {
            display: flex;
        }

        .search-bar .categories button {
            padding: 10px 20px;
            margin-right: 10px;
            border: 1px solid #E0E0E0;
            background: #FFF; /* 배경 흰색 */
            color: #333; /* 텍스트 검은색 */
            border-radius: 4px;
            cursor: pointer;
        }

        .search-bar .categories button.active {
            background: #007BFF; /* 활성화된 버튼 배경 파란색 */
            color: white; /* 활성화된 버튼 텍스트 흰색 */
        }

        .search-bar input {
            flex: 1;
            padding: 10px;
            max-width: 300px; /* 검색창 크기 제한 */
            border: 1px solid #E0E0E0;
            border-radius: 4px;
            font-size: 14px;
        }

        .search-bar button {
            padding: 10px 15px;
            margin-left: 10px;
            background: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .table-container {
            overflow-x: auto;
        }

        .notice-table {
            width: 100%;
            border-collapse: collapse;
        }

        .notice-table th, .notice-table td {
            padding: 12px;
            border: 1px solid #E0E0E0;
            text-align: center;
            font-size: 14px;
        }

        .notice-table th {
            background: #F7F7F7;
            font-weight: bold;
        }

        .pagination {
            margin-top: 20px;
            text-align: center;
        }

        .pagination button {
            padding: 8px 12px;
            border: 1px solid #E0E0E0;
            background: #FFF;
            cursor: pointer;
            margin: 0 2px;
        }

        .pagination button.active {
            background: #007BFF;
            color: white;
        }
    </style>
</head>
<body>
<div class="side-nav">
    <div class="logo">
        <img src="/img/logoImage.png" alt="로고">
        <a href="main">강릉대학교 통합도서관</a>
    </div>
    <div class="nav-item"><a href="/search" style="text-decoration: none; color: inherit;">통합검색</a></div>
    <div class="nav-item"><a href="/wishbookapply" style="text-decoration: none; color: inherit;">희망도서</a></div>
    <div class="nav-item"><a href="/popular" style="text-decoration: none; color: inherit;">인기도서</a></div>
    <div class="nav-item active"><a href="/notice" style="text-decoration: none; color: inherit;">공지사항</a></div>
    <div class="nav-item"><a href="/guide" style="text-decoration: none; color: inherit;">이용사항</a></div>

</div>

<div class="main-content">
    <div class="header">
        <div class="title">공지사항</div>
        <div class="login">
            <c:choose>
                <c:when test="${not empty user}">
                    <!-- 로그인된 상태 -->
                    <a href="/myInfo" style="display: inline-flex; align-items: center; margin-right: 15px; text-decoration: none; color: black;">
                        <span>내정보</span>
                        <img src="/img/userImage2.png" alt="사용자 아이콘" style="width: 20px; height: 20px; margin-left: 5px;">
                    </a>
                    <a href="/logout" style="text-decoration: none; color: black; margin-left: 15px;">로그아웃</a>
                </c:when>
                <c:otherwise>
                    <!-- 비로그인 상태 -->
                    <a href="/login" style="text-decoration: none; color: black;">
                        로그인
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="search-bar">
        <div class="categories">
            <button class="active">전체</button>
            <button>일반공지</button>
            <button>학술공지</button>
            <button>미분류</button>
        </div>
        <div>
            <input type="text" placeholder="검색어를 입력해주세요">
            <button>검색</button>
        </div>
    </div>

    <div class="table-container">
        <table class="notice-table">
            <thead>
            <tr>
                <th>NO.</th>
                <th>분류</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="notice" items="${noticeList}">
                <tr>
                    <td>${notice.cnt}</td>
                    <td>${notice.category}</td>
                    <td>${notice.title}</td>
                    <td>${notice.writer}</td>
                    <td>${notice.date}</td>
                    <td>조회수 없음</td> <!-- 조회수 데이터가 없다면 임시 표시 -->
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="pagination">
        <button class="active">1</button>
        <button>2</button>
        <button>3</button>
        <button>...</button>
        <button>141</button>
    </div>
</div>
</body>
</html>