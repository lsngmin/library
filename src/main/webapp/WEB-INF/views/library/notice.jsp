<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.library.noticeBoard.model.NoticeBoardVO" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.library.noticeBoard.service.NoticeBoardService" %>
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
            background: #FFF;
            color: #333333;
            display: flex;
        }
        /* 메인 콘텐츠 영역 */
        .main-content {
            margin-left: 270px;
            padding: 20px;
            width: calc(100% - 270px);
        }

        .search-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            margin-top: 70px;
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
<%
    WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
    NoticeBoardService noticeBoardService = context.getBean("noticeBoardServiceImpl", NoticeBoardService.class);
    List<NoticeBoardVO> noticeList = noticeBoardService.getAllNoticeBoards();
    request.setAttribute("noticeList", noticeList);
%>

<jsp:include page="libraryNavbar.jsp"/>

<div class="main-content">
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