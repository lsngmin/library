<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet"  href="/resources/css/myinfo/passwordchange.css">
</head>
<body>
<div class="main-content">
    <jsp:include page="myinfoHeader.jsp"/>
    <div class="login-form">
        <h2>비밀번호 변경</h2>
        <form action="#" method="post">
            <input type="text" id="username" name="username" placeholder="현재 비밀번호를 입력해주세요" required>

            <input type="password" id="password" name="password" placeholder="새 비밀번호를 입력해주세요" required>

            <input type="password" id="password1" name="password" placeholder="비밀번호를 확인해주세요" required>

            <button type="submit">비밀번호 변경</button>
        </form>
    </div>
</div>
<jsp:include page="myinfoNavBar.jsp"/>
</body>
</html>