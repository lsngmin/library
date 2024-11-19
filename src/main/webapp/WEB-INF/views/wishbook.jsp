<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교통합도서관 - 회원도서 신청 내역</title>
    <style>
        /* Previous styles remain the same */

        .page-title {
            font-size: 50px;  /* Increased from 24px */
            margin-bottom: 30px;
            font-weight: 400;  /* Made slightly bolder */
            color: #333;
        }

        /* Rest of the previous styles remain the same */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #fff;
        }

        .header {
            display: flex;
            justify-content: space-between;
            padding: 15px 30px;
            align-items: center;
            border-bottom: 1px solid #eee;
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            height: 40px;
        }

        .user-menu {
            display: flex;
            gap: 15px;
        }

        .user-menu a {
            text-decoration: none;
            color: #333;
            font-size: 14px;
        }

        .left-sidebar {
            width: 220px;
            background-color: #f5f5f5;
            padding: 20px;
            position: fixed;
            height: 100%;
            left: 0;
            top: 70px;
        }

        .sidebar-menu {
            list-style: none;
        }

        .sidebar-menu li {
            margin-bottom: 15px;
        }

        .sidebar-menu .active {
            border: 1px solid #333;
            padding: 10px;
        }

        .content {
            margin-left: 220px;
            padding: 30px;
        }

        .status-tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .status-tab {
            padding: 12px 30px;
            font-size: 16px;
            border: 1px solid #ddd;
            background: none;
            cursor: pointer;
            border-radius: 8px; /* 둥근 모서리 */
        }

        .status-table {
            width: 100%;           /* 기존 크기 유지 */
            max-width: 1200px;     /* 테이블의 최대 너비 증가 */
            border-collapse: separate; /* 셀 간격 분리 */
            border-spacing: 15px;  /* 셀 간격 추가 */
        }

        .status-table td {
            padding: 20px;         /* 셀 내부 여백 증가 */
            font-size: 20px;       /* 글자 크기 */
            background-color: #fff; /* 배경색 */
            border: 1px solid #ddd; /* 셀 경계선 */
            border-radius: 8px;    /* 셀 둥근 모서리 */
        }

        .status-table tr {
            background-color: #f9f9f9; /* 각 행 배경색 */
            height: 80px; /* 행 높이 증가 */
        }

        .status-row {
            background-color: #fff; /* 흰색 배경 */
            border: 1px solid #ddd; /* 테두리 */
            border-radius: 4px; /* 모서리 둥글게 */
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1); /* 약간의 그림자 */
            margin-bottom: 35px; /* 행 간 간격 */
            padding: 10px; /* 박스 내부 여백 */
            display: flex;
            align-items: center;
            justify-content: space-between;
            min-height: 80px; /* 최소 높이 증가 */
        }

        .status-cell {
            flex: 1; /* 셀 너비 균등 분배 */
            text-align: center;
            padding: 20px; /* 셀 내부 여백 증가 */
            font-size: 18px; /* 글자 크기 증가 */
        }

        .cancel-btn {
            padding: 5px 10px;
            cursor: pointer;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 4px;
            color: #333;
            font-size: 13px;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .cancel-btn:hover {
            background-color: #f8f8f8;
        }

        .info-text {
            color: #0066cc;
            background-color: #e6f3ff;
            padding: 10px 15px; /* 글자 크기에 맞는 여백 설정 */
            border-radius: 4px;
            font-size: 14px;
            margin-bottom: 20px;
            text-align: right; /* 오른쪽 정렬 */
            width: fit-content; /* 글자 길이에 맞게 박스 크기 자동 조정 */
            margin-left: auto; /* 오른쪽 정렬을 위해 왼쪽 여백 자동 */
        }

        .footer {
            margin-left: 220px;
            padding: 20px;
            text-align: center;
            border-top: 1px solid #eee;
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 10px;
        }

        .footer-links a {
            color: #666;
            text-decoration: none;
            font-size: 13px;
        }

        .copyright {
            color: #666;
            font-size: 12px;
        }

        .status-table tr {
            background-color: #fff; /* 흰색 배경 */
            border: 1px solid #ddd; /* 테두리 */
            border-radius: 4px; /* 모서리 둥글게 */
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1); /* 약간의 그림자 */
            height: 80px; /* 행 높이 증가 */
        }

        .status-table td {
            padding: 8px 5px; /* 여백 축소 */
            text-align: center; /* 내용 중앙 정렬 */
        }

        .cancel-btn {
            padding: 5px 10px; /* 버튼 여백 유지 */
            cursor: pointer;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 4px;
            color: #333;
            font-size: 13px;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .cancel-btn:hover {
            background-color: #f8f8f8;
        }
    </style>
</head>
<body>
<header class="header">
    <div class="logo">
        <img src="library-logo.png" alt="강릉대학교통합도서관">
    </div>
    <div class="user-menu">
        <a href="#"><img src="user-icon.png" alt=""> 내정보</a>
        <a href="#">로그아웃</a>
    </div>
</header>

<div class="left-sidebar">
    <h2>내정보</h2>
    <ul class="sidebar-menu">
        <li>내정보</li>
        <li>관심도서 목록</li>
        <li class="active">희망도서 신청 내역</li>
        <li>도서기증 신청</li>
        <li>비밀번호 변경</li>
    </ul>
</div>

<main class="content">
    <h2 class="page-title">희망도서 신청 내역</h2>

    <div class="status-tabs">
        <button class="status-tab">전체</button>
        <button class="status-tab active">접수중</button>
        <button class="status-tab">검토중</button>
        <button class="status-tab">처리완료</button>
    </div>

    <div class="info-text">
        접수중 상태일 때만 취소가 가능합니다.
    </div>

    <!-- 접수중 상태 -->
    <div class="status-row">
        <div class="status-cell">접수중</div>
        <div class="status-cell">인형의 집</div>
        <div class="status-cell">안미란</div>
        <div class="status-cell">민음사</div>
        <div class="status-cell">2024.10.11</div>
        <div class="status-cell"><button class="cancel-btn">취소</button></div>
    </div>

    <div class="status-row">
        <div class="status-cell">접수중</div>
        <div class="status-cell">코스모스</div>
        <div class="status-cell">재레미</div>
        <div class="status-cell">한빛미디어</div>
        <div class="status-cell">2024.10.11</div>
        <div class="status-cell"><button class="cancel-btn">취소</button></div>
    </div>

    <!-- 검토중 상태 (취소 불가) -->
    <div class="status-row">
        <div class="status-cell">검토중</div>
        <div class="status-cell">버드걸</div>
        <div class="status-cell">신혜빈</div>
        <div class="status-cell">문학동네</div>
        <div class="status-cell">2024.10.09</div>
        <div class="status-cell"><button class="cancel-btn" disabled>취소</button></div>
    </div>

    <!-- 처리완료 상태 (취소 불가) -->
    <div class="status-row">
        <div class="status-cell">처리완료</div>
        <div class="status-cell">예쁜아이</div>
        <div class="status-cell">토리헤이드</div>
        <div class="status-cell">아름드리미디어</div>
        <div class="status-cell">2024.10.01</div>
        <div class="status-cell"><button class="cancel-btn" disabled>취소</button></div>
    </div>
</main>

<footer class="footer">
    <div class="footer-links">
        <a href="#">이용약관</a>
        <a href="#">개인정보처리방침</a>
        <a href="#">규정 실정</a>
        <a href="#">운영체계</a>
        <a href="#">도서관 안내</a>
    </div>
    <p class="copyright">Copyright © 2024 강릉대학교. All rights reserved.</p>
</footer>

<script>
    document.querySelectorAll('.status-tab').forEach(tab => {
        tab.addEventListener('click', () => {
            document.querySelectorAll('.status-tab').forEach(t => {
                t.classList.remove('active');
            });
            tab.classList.add('active');
        });
    });

    document.querySelectorAll('.cancel-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            if(confirm('신청을 취소하시겠습니까?')) {
                // Add cancellation logic here
            }
        });
    });
</script>
</body>
</html>
