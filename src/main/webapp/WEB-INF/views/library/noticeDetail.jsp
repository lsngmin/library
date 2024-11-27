<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.library.noticeBoard.model.NoticeBoardVO" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.library.noticeBoard.service.NoticeBoardService" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관 - 공지사항 상세</title>
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
        /* 공지사항 상세 */
        .notice-detail {
            margin-top: 30px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            height: 500px;
        }
        .notice-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .notice-detail h2 {
            text-align: center; /* 제목 중앙 정렬 */
            font-size: 28px;
            margin-bottom: 20px; /* 제목 아래 간격 */
        }
        .notice-meta {
            display: flex;
            justify-content: flex-start; /* 항목들을 양 끝에 배치 */
            font-size: 16px;
            margin-bottom: 20px;
            gap: 30px;
        }
        .notice-meta div {
            padding-right: 30px; /* Space between the text and the vertical line */
            position: relative; /* For positioning the pseudo-elements */
        }


        .notice-detail div {
            margin-bottom: 20px; /* 각 항목 사이 간격 */
            font-size: 16px;
        }
        .notice-meta div:not(:last-child)::after {
            content: ''; /* Empty content for the pseudo-element */
            position: absolute;
            top: 0;
            right: 0;
            height: 100%;
            border-right: 2px solid #E0E0E0; /* Add a vertical line with desired color */
        }

        .notice-detail hr {
            margin: 20px 0; /* 내용과 내용 사이 구분선 간격 */
        }

        .notice-detail a {
            display: inline-block;
            margin-top: 30px;
            font-size: 25px;
            color: #007BFF;
            text-decoration: none;
        }

        .notice-detail a:hover {
            text-decoration: underline;
        }
        .back-to-list-btn {
            display: inline-block;
            padding: 12px 20px;
            margin-top: 20px;
            font-size: 16px;
            color: white;
            background-color: #007BFF;
            text-decoration: none;
            border-radius: 4px;
            text-align: center;
        }

        .back-to-list-btn:hover {
            background-color: #0056b3; /* 버튼에 마우스를 올리면 색이 변함 */
            text-decoration: underline;
        }
        .notice-content {
            font-size: 25px; /* 글자 크기를 20px로 설정 */
            border-right: 1px
        }
    </style>
</head>
<body>
<%
    String cnt = request.getParameter("cnt");  // 공지사항의 cnt 파라미터를 받는다.
    WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
    NoticeBoardService noticeBoardService = context.getBean("noticeBoardServiceImpl", NoticeBoardService.class);
    NoticeBoardVO notice = noticeBoardService.getNoticeBoardByCnt(cnt);  // cnt로 공지사항 정보를 조회
%>

<div class="side-nav">
    <div class="logo">
        <img src="/img/logoImage.png" alt="로고">
        <a href="main">강릉대학교 통합도서관</a>
    </div>
    <div class="nav-item"><a href="/search" style="text-decoration: none; color: inherit;">통합검색</a></div>
    <div class="nav-item"><a href="/wishbookapply" style="text-decoration: none; color: inherit;">희망도서</a></div>
    <div class="nav-item"><a href="/interestbookview" style="text-decoration: none; color: inherit;">인기도서</a></div>
    <div class="nav-item active"><a href="/notice" style="text-decoration: none; color: inherit;">공지사항</a></div>
    <div class="nav-item"><a href="/guide" style="text-decoration: none; color: inherit;">이용사항</a></div>

</div>

<div class="main-content">
    <div class="header">
        <div class="title">공지사항 상세</div>
        <div class="login">
            <c:choose>
                <c:when test="${not empty user}">
                    <a href="/myInfo">내정보</a>
                    <a href="/logout">로그아웃</a>
                </c:when>
                <c:otherwise>
                    <a href="/login">로그인</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="notice-detail">
        <h2>${notice.title}</h2>
            <div class="notice-meta">
                <div>작성자: ${notice.writer}</div>
                <div>작성일: ${notice.date}</div>
                <div>분류: ${notice.category}</div>
            </div>
        <hr />
        <div>내용:</div>
        <div class="notice-content">${notice.content}</div>
    </div>

    <div>
        <a href="/notice" class="back-to-list-btn">목록</a>
    </div>
</div>
</body>
</html>
