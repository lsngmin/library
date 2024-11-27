<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background: #FFF;
            color: #333333;
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
            position: fixed;
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

        /* 메인 컨텐츠 */
        .main-content {
            margin-left: 270px;
            padding: 60px 20px 20px;
            width: calc(100% - 270px);
        }

        .content-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .table th, .table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            font-size: 14px;
        }

        .table th {
            background-color: #f5f5f5;
            font-weight: bold;
        }

        .address {
            font-size: 16px;
            margin-top: 30px;
            display: flex;
            align-items: center;
        }

        .address img {
            width: 20px;
            height: 20px;
            margin-right: 8px;
        }

        .map {
            margin-top: 10px;
        }

        .map img {
            width: 100%;
            height: auto;
            max-width: 400px;
        }
    </style>
</head>
<body>
<div class="side-nav">
    <a href="main" style="text-decoration: none; color: #333;">
        <div class="logo">
            <img src="/img/logoImage.png" alt="로고">
            강릉대학교 통합도서관
        </div>
    </a>
    <a href="search" class="nav-link">
        <div class="nav-item">통합검색</div>
    </a>
    <a href="wishbookapply" class="nav-link">
        <div class="nav-item">희망도서</div>
    </a>
    <a href="interestbookview" class="nav-link">
        <div class="nav-item">인기도서</div>
    </a>
    <a href="notice" class="nav-link">
        <div class="nav-item">공지사항</div>
    </a>
    <a href="guide" class="nav-link">
        <div class="nav-item active">이용사항</div>
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



<div class="main-content">
    <!-- 도서관 이용시간 섹션 -->
    <div class="content-title">도서관 이용시간</div>
    <table class="table">
        <thead>
        <tr>
            <th>층수</th>
            <th>실명</th>
            <th>이용시간</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td rowspan="3">2층</td>
            <td>로비/정보검색실</td>
            <td>05:00 ~ 24:00</td>
        </tr>
        <tr>
            <td>자료운영실 (안내데스크/대출 반납)</td>
            <td>평일: 09:00 ~ 24:00<br>토요일: 09:00 ~ 13:00<br>일, 공휴일: 휴실</td>
        </tr>
        <tr>
            <td>그룹 스터디룸</td>
            <td>09:00 ~ 24:00</td>
        </tr>
        <tr>
            <td rowspan="3">3층</td>
            <td>참고 도서실</td>
            <td>09:00 ~ 18:00<br>일, 공휴일: 휴실</td>
        </tr>
        <tr>
            <td>제1열람실</td>
            <td>05:00 ~ 24:00</td>
        </tr>
        <tr>
            <td>제2열람실</td>
            <td>05:00 ~ 24:00 (방학 중 휴실)</td>
        </tr>
        </tbody>
    </table>

    <!-- 도서관 실별 안내 섹션 -->
    <div class="content-title">도서관 실별 안내</div>
    <table class="table">
        <thead>
        <tr>
            <th>층수</th>
            <th>실명</th>
            <th>내용</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>2층</td>
            <td>정보검색실</td>
            <td>2층 로비 내 정보검색 PC 12대 운영</td>
        </tr>
        <tr>
            <td>2층</td>
            <td>자료운영실</td>
            <td>안내데스크 운영, 도서 대출/반납</td>
        </tr>
        <tr>
            <td>2층</td>
            <td>그룹 스터디룸</td>
            <td>그룹 스터디룸 3개 운영</td>
        </tr>
        <tr>
            <td>2층</td>
            <td>참고 도서실</td>
            <td>참고 도서 소장</td>
        </tr>
        <tr>
            <td>3층</td>
            <td>열람실</td>
            <td>제1·2 일반 열람실</td>
        </tr>
        </tbody>
    </table>

    <!-- 주소 및 지도 -->
    <div class="address">
        <img src="/img/placeImage.png" alt="주소 아이콘">
        주소: 강릉시 범일로 579번길 24
    </div>
    <div class="map">
        <img src="/img/mapImage.png" alt="지도 이미지">
    </div>
</div>
</body>
</html>
