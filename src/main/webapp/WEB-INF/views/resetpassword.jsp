<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/restpassword.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<header class="header">
    <div class="logo-container">
        <img src="/img/logoImage.png" alt="강릉대학교 통합도서관" class="logo">
    </div>
    <div class="header-content">
        <span class="site-name">강릉대학교 통합도서관</span>
    </div>
</header>

<!-- Success Modal -->
<div id="successModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <div class="modal-title">임시 비밀번호 재발급 성공</div>
            <span class="close">&times;</span>
        </div>
        <div class="modal-body">
            <p>귀하의 임시 비밀번호는 <span id="tempPassword">74432235</span> 입니다.</p>
            <div class="modal-buttons">
                <button type="button" class="modal-button modal-button-close" id="closeSuccessModal">닫기</button>
                <button type="button" class="modal-button modal-button-copy" id="copyPassword">복사</button>
            </div>
        </div>
    </div>
</div>

<!-- Failure Modal -->
<div id="failureModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <div class="modal-title">임시 비밀번호 재발급 실패</div>
            <span class="close">&times;</span>
        </div>
        <div class="modal-body">
            <p>아이디 또는 생년월일이 올바르지 않습니다.</p>
            <div class="modal-buttons">
                <button type="button" class="modal-button modal-button-close" id="closeFailureModal">닫기</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="login-form">
        <h2>강릉대학교 통합도서관</h2>
        <p class="login-title">비밀번호 재발급</p>
        <form id="resetPasswordForm" onsubmit="return false;">
            <div class="input-group">
                <label class="input-label">아이디</label>
                <input type="text" class="input-field" placeholder="아이디를 입력해 주세요" name="userId">
            </div>
            <div class="input-group">
                <label class="input-label">생년월일</label>
                <div class="password-wrapper">
                    <input type="text"
                           class="input-field"
                           placeholder="YYYY-MM-DD"
                           name="birthdate"
                           maxlength="10"
                           pattern="\d{4}-\d{2}-\d{2}"
                           title="YYYY-MM-DD 형식으로 입력해주세요">
                    <span class="material-icons password-toggle">visibility_off</span>
                </div>
            </div>
            <button type="submit" class="login-button">임시 비밀번호 발급</button>
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
    document.addEventListener('DOMContentLoaded', function() {
        const successModal = document.getElementById('successModal');
        const failureModal = document.getElementById('failureModal');
        const form = document.getElementById('resetPasswordForm');
        const closeButtons = document.querySelectorAll('.close');
        const closeSuccessModalBtn = document.getElementById('closeSuccessModal');
        const closeFailureModalBtn = document.getElementById('closeFailureModal');
        const copyPasswordBtn = document.getElementById('copyPassword');

        // 비밀번호 표시/숨기기 토글
        document.querySelector('.password-toggle').addEventListener('click', function() {
            const passwordInput = this.previousElementSibling;
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            this.textContent = type === 'password' ? 'visibility_off' : 'visibility';
        });

        // 생년월일 입력 필드에 placeholder와 maxlength 추가
        const birthInput = form.querySelector('input[name="birthdate"]');
        birthInput.placeholder = "YYYY-MM-DD";
        birthInput.maxLength = 10;

        // 생년월일 입력 시 자동으로 하이픈 추가
        birthInput.addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, ''); // 숫자만 남김
            if (value.length >= 4) {
                value = value.slice(0, 4) + '-' + value.slice(4);
            }
            if (value.length >= 7) {
                value = value.slice(0, 7) + '-' + value.slice(7);
            }
            if (value.length > 10) {
                value = value.slice(0, 10);
            }
            e.target.value = value;
        });

        // X 버튼 닫기 이벤트 추가
        closeButtons.forEach(button => {
            button.addEventListener('click', function() {
                successModal.style.display = "none";
                failureModal.style.display = "none";
            });
        });

        // 폼 제출 처리
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            const userId = form.querySelector('input[name="userId"]').value;
            const birthdate = form.querySelector('input[name="birthdate"]').value;

            // 생년월일 형식 검증
            const birthPattern = /^\d{4}-\d{2}-\d{2}$/;
            if (!userId || !birthdate || !birthPattern.test(birthdate)) {
                failureModal.style.display = "block";
                return;
            }

            // Ajax 요청
            fetch('/resetpassword/process', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    userId: userId,
                    birth: birthdate  // YYYY-MM-DD 형식으로 전송
                })
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        document.getElementById('tempPassword').textContent = data.tempPassword;
                        successModal.style.display = "block";
                    } else {
                        failureModal.style.display = "block";
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    failureModal.style.display = "block";
                });
        });

        // 모달 닫기 버튼 이벤트
        closeSuccessModalBtn.addEventListener('click', function() {
            successModal.style.display = "none";
        });

        closeFailureModalBtn.addEventListener('click', function() {
            failureModal.style.display = "none";
        });

        // 임시 비밀번호 복사 기능
        copyPasswordBtn.addEventListener('click', function() {
            const tempPassword = document.getElementById('tempPassword').textContent;
            navigator.clipboard.writeText(tempPassword)
                .then(() => {
                    alert('임시 비밀번호가 클립보드에 복사되었습니다.');
                })
                .catch(err => {
                    console.error('복사 실패:', err);
                });
        });

        // 모달 외부 클릭 시 닫기
        window.addEventListener('click', function(e) {
            if (e.target === successModal || e.target === failureModal) {
                successModal.style.display = "none";
                failureModal.style.display = "none";
            }
        });
    });
</script>
</body>
</html>