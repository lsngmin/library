<%--
  Created by IntelliJ IDEA.
  User: smin
  Date: 11/25/24
  Time: 9:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String currentUri = request.getRequestURI();

    String[] pathParts = currentUri.split("/");
    String currentPage = pathParts[pathParts.length - 1];
%>

<div class="side-nav">
    <a href="main" style="text-decoration: none; color: #333;">
        <div class="logo">
            <img src="/img/logoImage.png" alt="로고">
            강릉대학교 통합도서관
        </div>
    </a>
    <a href="search" class="nav-link">
        <div class="nav-item <%= currentPage.equals("search.jsp") ? "active" : "" %>">통합검색</div>
    </a>
    <a href="wishbookapply" class="nav-link">
        <div class="nav-item">희망도서</div>
    </a>
    <a href="interestbookview" class="nav-link">
        <div class="nav-item">인기도서</div>
    </a>
    <a href="notice" class="nav-link">
        <div class="nav-item <%= currentPage.equals("notice.jsp") ? "active" : "" %>">공지사항</div>
    </a>
    <a href="guide" class="nav-link">
        <div class="nav-item <%= currentPage.equals("guide.jsp") ? "active" : "" %>">이용사항</div>
    </a>
</div>

<div class="header">
    <div class="login">
        <c:choose>
            <c:when test="${user != null}">
                <!-- 로그인된 상태 -->
                <a href="/myInfo" style="display: inline-flex; align-items: center; margin-right: 15px; text-decoration: none; color: black;">
                    <img src="/img/userImage2.png" alt="사용자 아이콘" style="width: 20px; height: 20px; margin-right: 5px;">
                    <span>내정보</span>
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

<style>
    .side-nav {
        width: 250px;
        height: 100vh;
        position: fixed;
        left: 0;
        top: 0;
        background: #FFF;
        padding: 20px;
        border-right: 1px solid #E0E0E0;
    }

    .logo {
        display: flex;
        align-items: center;
        margin-bottom: 30px;
        font-weight: 700;
        font-size: 16px;
        color: #333;
    }

    .logo img {
        width: 20px;
        height: 20px;
        margin-right: 8px;
    }
    .nav-link {
        text-decoration: none; /* 밑줄 제거 */
        color: #333; /* 링크 텍스트 색상 */
        display: block; /* 전체 영역 클릭 가능 */
    }

    .nav-link:hover .nav-item {
        color: #007bff; /* 호버 시 텍스트 색상 변경 */
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

    /* 로그인 버튼 */
    .header {
        position: absolute;
        top: 0;
        right: 0;
        padding: 20px;
        background: #FFF;
        z-index: 10;
    }

    .login {
        display: flex;
        align-items: center;
        text-decoration: none;
        color: #333;
        font-size: 14px;
    }

    .login img {
        width: 18px;
        height: 18px;
        margin-right: 6px;
    }

    .login:hover {
        color: #007bff;
    }
</style>
