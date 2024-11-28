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
<jsp:include page="libraryNavbar.jsp"/>
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
