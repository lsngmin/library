<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <script src="wishbookstatus.js"></script>
    <link rel="stylesheet"  href="/resources/css/myinfo/wishbookstatus.css?after">
</head>
<body>
<jsp:include page="myinfoNavBar.jsp"/>
<div class="main-content">
    <jsp:include page="myinfoHeader.jsp"/>
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




</div>

</body>
</html>