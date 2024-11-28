<%--
  Created by IntelliJ IDEA.
  User: smin
  Date: 11/25/24
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
  <div class="logo-container">
    <img src="img/logoImage.png" alt="강릉대학교 로고">
    <h1 class="header-title"><a href="main">강릉대학교 통합도서관</a></h1>
  </div>
  <div class="login-container">
    <c:choose>
      <c:when test="${not empty sessionScope.user}">
        <!-- 로그인 상태 -->
        <img src="img/userImage2.png" alt="사용자 아이콘">
        <a href="myInfo">내정보</a>
        <a href="logout" style="margin-left: 10px;">로그아웃</a>
      </c:when>
      <c:otherwise>
        <!-- 비로그인 상태 -->
        <img src="img/userImage.png" alt="사용자 아이콘">
        <a href="login">로그인</a>
      </c:otherwise>
    </c:choose>
  </div>
</header>

<style>
  .login-container img {
    width: 24px;
    height: 24px;
  }
  header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 60px;
    background: #f8f8f8;
    border-bottom: 1px solid #e0e0e0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
    box-sizing: border-box;
    z-index: 1001;
  }
</style>
