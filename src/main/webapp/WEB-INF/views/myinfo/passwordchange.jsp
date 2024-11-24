<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet"  href="/resources/css/myinfo/passwordchange.css">
    <script src="/js/myinfo/passwordchange.js"></script>

</head>
<body>
<div class="main-content">
    <jsp:include page="myinfoHeader.jsp"/>
    <div class="login-form">
        <h2>비밀번호 변경</h2>
        <form action="/passwordchange/process" method="post">
            <input type="text" id="current-password" name="current-password" placeholder="현재 비밀번호를 입력해주세요" required>

            <input type="password" id="new-password" name="new-password" placeholder="새 비밀번호를 입력해주세요" required>

            <input type="password" id="passwordConfirm" name="passwordConfirm" placeholder="비밀번호를 확인해주세요" required>
            <div id="error-message" style="color: red; display: none;">비밀번호가 일치하지 않습니다.</div>

            <button type="submit" id="submit-button" disabled>비밀번호 변경</button>
        </form>
        <c:if test="${not empty errorMessage}">
            <div style="color: red;">${errorMessage}</div>
        </c:if>

        <c:if test="${not empty message}">
            <div style="color: green;">${message}</div>
        </c:if>
    </div>
</div>
<jsp:include page="myinfoNavBar.jsp"/>
</body>
</html>