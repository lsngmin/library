<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet"  href="/resources/css/login.css">
    <script src="login.js"></script>
</head>
<body>
<header class="header">
    <div class="logo-container">
        <img src="/img/logoImage.png" alt="강릉대학교 통합도서관" class="logo">
    </div>
    <div class="header-content">
        <span class="site-name">강릉대학교 통합도서관</span>
    </div>
    </div>
</header>

<div class="container">
    <div class="login-form">
        <h2>강릉대학교 통합도서관</h2>
        <p class="login-title">로그인이 필요합니다</p>
        <form action="/login" method="POST">
            <div class="input-group">
                <label class="input-label">아이디</label>
                <input type="text" class="input-field" placeholder="아이디를 입력해 주세요" name="userId", value="${savedUserId}">
            </div>
            <div class="input-group">
                <label class="input-label">비밀번호</label>
                <div class="password-wrapper">
                    <input type="password" class="input-field" placeholder="비밀번호를 입력해 주세요" name="password">
                    <span class="material-icons password-toggle">visibility_off</span>
                </div>
            </div>
            <div class="input-group">
                <input type="checkbox" id="saveId" name="saveId" ${savedUserId != null ? 'checked' : ''}>
                <label for="saveId">아이디 저장</label>
                <a href="#" style="margin-left: auto; font-size: 13px; color: #666; text-decoration: none;">비밀번호를 잊으셨나요?</a>
            </div>
            <button type="submit" class="login-button">로그인</button>
            <p id="error-message" style="color: red; font-size: 14px; display: none;"></p>
        </form>
    </div>
    <div class="illustration">
        <img src="/img/loginImage.png" alt="일러스트레이션">
    </div>
</div>

<footer class="footer">
    <div class="footer-links">
        <a href="#">이용약관</a>
        <a href="#">개인정보처리방침</a>
        <a href="#">우리 도서관</a>
        <a href="#">운영정책</a>
        <a href="#">도서관 안내</a>
    </div>
    <div>Copyright © 2024 강릉대학교. All rights reserved.</div>
</footer>

<script>
    document.querySelector('.password-toggle').addEventListener('click', function() {
        const passwordInput = this.previousElementSibling;
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);

        this.textContent = type === 'password' ? 'visibility_off' : 'visibility';
    });

    const loginForm = document.querySelector('form'); // 폼 선택
    loginForm.addEventListener('submit', function(event) {
        event.preventDefault(); // 기본 폼 제출 동작 방지

        // 입력 값 가져오기
        const userId = document.querySelector('[name="userId"]').value.trim();
        const password = document.querySelector('[name="password"]').value.trim();
        const errorMessage = document.getElementById('error-message'); // 오류 메시지 DOM 선택

        errorMessage.style.display = 'none'; // 기존 메시지 숨김

        // 입력값 검증
        if (!userId || !password) {
            errorMessage.style.display = 'block';
            errorMessage.textContent = '아이디와 비밀번호를 모두 입력해주세요.';
            return;
        }

        // AJAX 요청
        fetch('/loginAjax', { // 서버의 AJAX 처리 엔드포인트
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ userId, password }),
        })
            .then(response => response.json()) // JSON 응답 처리
            .then(data => {
                if (data.status === 'success') {
                    window.location.href = '/main'; // 성공 시 메인 페이지로 이동
                } else {
                    errorMessage.style.display = 'block';
                    errorMessage.textContent = data.message; // 실패 메시지 표시
                }
            })
            .catch(error => {
                console.error('Error:', error);
                errorMessage.style.display = 'block';
                errorMessage.textContent = '로그인 요청 중 오류가 발생했습니다.';
            });
    });

    document.addEventListener('keydown', function(event) {
        if (event.key === 'Enter') { // Enter 키를 눌렀을 때 폼 제출
            loginForm.dispatchEvent(new Event('submit')); // 폼 제출 이벤트 트리거
        }
    });
</script>
</body>
</html>