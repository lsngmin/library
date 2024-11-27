<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 이 줄을 추가 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <script src="/resources/js/myinfo/wishbookstatus.js"></script>
    <link rel="stylesheet"  href="/resources/css/myinfo/wishbookstatus.css">
</head>
<body>
<jsp:include page="myinfoNavBar.jsp"/>
<div class="main-content">
    <jsp:include page="myinfoHeader.jsp"/>
    <main class="content">
        <h2 class="page-title">희망도서 신청 내역</h2>

        <div class="status-tabs">
            <button class="status-tab active" data-status="all">전체</button>
            <button class="status-tab" data-status="접수중">접수중</button>
            <button class="status-tab" data-status="검토중">검토중</button>
            <button class="status-tab" data-status="처리완료">처리완료</button>
        </div>

        <div class="info-text">
            접수중 상태일 때만 취소가 가능합니다.
        </div>

        <!-- 접수중 상태 -->
        <c:forEach items="${wishBookList}" var="wishBook">
            <div class="status-row" data-status="${wishBook.wishStatus}">
                <div class="status-cell">${wishBook.wishStatus}</div>
                <div class="status-cell">${wishBook.wishBookName}</div>
                <div class="status-cell">${wishBook.wishBookAuthor}</div>
                <div class="status-cell">${wishBook.wishBookPublisher}</div>
                <div class="status-cell">${wishBook.wishBookPublishDate}</div>
                <div class="status-cell">
                    <button class="cancel-btn"
                        ${wishBook.wishStatus != '접수중' ? 'disabled' : ''}
                            onclick="cancelWishBook('${wishBook.wishCode}')">
                        취소
                    </button>
                </div>
            </div>
        </c:forEach>
    </main>
</div>
</body>
</html>