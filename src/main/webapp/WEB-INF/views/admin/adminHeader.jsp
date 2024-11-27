<%--
  Created by IntelliJ IDEA.
  User: smin
  Date: 11/25/24
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="main-nav">
    <ul class="left">
        <li><a href="/admindashboard"><img src="/img/admindashboard/home_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp홈</a></li>
        <li><a href="/bookregister"><img src="/img/admindashboard/bookregi_icon.png" alt="도서등록 아이콘" class="logout_icon">&nbsp도서 등록</a></li>
        <li><a href="/bookinquiry"><img src="/img/admindashboard/bookinfo_icon.png" alt="도서 정보 아이콘" class="logout_icon">&nbsp도서 정보</a></li>
        <li><a href="#"><img src="/img/admindashboard/userinfo_icon.png" alt="학생 정보 아이콘" class="logout_icon">&nbsp학생 정보</a></li>
        <li><a href="#"><img src="/img/admindashboard/status_icon.png" alt="희망/기종 도서 신청 아이콘" class="logout_icon">&nbsp희망/기종 도서 신청 목록</a></li>
    </ul>
    <ul class="right">
        <li><a href="#"><img src="/img/admindashboard/gotolib_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp도서관 바로가기</a></li>
        <li><a href="/admin/logout"><img src="/img/admindashboard/logout_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp로그아웃</a></li>
    </ul>
</nav>

<div class="header-container">
    <div class="header-title">강릉대학교 통합도서관 관리 시스템</div>
    <div class="search-container">
        <input type="text" class="search-input" placeholder="학생 정보 또는 도서 정보를 입력하세요...">
        <span class="search-icon"><img src="/img/admindashboard/search_icon.png" alt="홈 아이콘" class="logout_icon"></span>  <!-- 검색 아이콘을 입력 박스 안에 위치시키기 -->
    </div>
</div>

<style>
    .main-nav {
        background-color: #000;
        overflow: hidden;
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 40px;
    }

    .main-nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
        align-items: center;
    }

    .main-nav ul.left {
        display: flex;
    }

    .main-nav ul.right {
        display: flex;
    }
    .main-nav ul li {
        padding: 8px 10px;
    }

    .main-nav ul li a {
        color: white;
        text-decoration: none;
        font-size: 10px;
        display: flex;
        align-items: center;
    }

    .main-nav ul li a:hover {
        background-color: #575757;
        border-radius: 4px;
    }

    .icon-home, .icon-book-register, .icon-book-info, .icon-student-info, .icon-wishlist, .icon-library, .icon-logout {
        margin-right: 6px;
    }

    .logout_icon {
        width: 12px;
        height: 12px;
    }

    .header-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        background-color: #ffffff;
    }

    .header-title {
        font-size: 16px;
        font-weight: bold;
        margin-left: 10px;
    }

    .search-container {
        position: relative;
        width: 300px;
        padding-right: 10px;
    }

    .search-input {
        width: 100%;
        padding: 8px 40px 8px 10px;
        font-size: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .search-icon {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        font-size: 16px;
        color: #aaa;
        cursor: pointer;
        padding-right: 10px;
    }
</style>
