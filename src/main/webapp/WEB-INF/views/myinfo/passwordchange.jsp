<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet" href="/resources/css/myinfo/passwordchange.css">
</head>
<body>

<div class="main-content">
    <jsp:include page="myinfoHeader.jsp"/>

    <div class="form-container">

        <!-- 비밀번호 변경 폼 -->
        <div class="login-form">
            <h2>비밀번호 변경</h2>
            <form id="changePasswordForm" onsubmit="return false;">
                <div class="input-group">
                    <label class="input-label"></label>
                    <input type="password" class="input-field" placeholder="현재 비밀번호를 입력해주세요" name="currentPassword" required>
                </div>
                <div class="input-group">
                    <label class="input-label"></label>
                    <input type="password" class="input-field" placeholder="새 비밀번호를 입력해주세요" name="newPassword" required>
                </div>
                <div class="input-group">
                    <label class="input-label"></label>
                    <input type="password" class="input-field" placeholder="비밀번호를 확인해주세요" name="confirmPassword" required>
                </div>
                <button type="submit" class="login-button">비밀번호 변경</button>
            </form>
        </div>

        <!-- 알림 -->
        <div class="notification-container">
            <h3>알림</h3>
            <p>비밀번호 변경 주의사항</p>
            <ul>
                <li>비밀번호 변경 시 30일 이내에 비밀번호 재변경이 불가능합니다.</li>
                <li>변경 후 자동으로 로그아웃 되며 변경된 비밀번호로 다시 로그인 하시기 바랍니다.</li>
                <li>강릉대학교통합도서관</li>
            </ul>
        </div>
    </div>

    <!-- 모달 -->
    <div id="successModal" class="modal">
        <div class="modal-content">

            <p>비밀번호가 성공적으로 변경되었습니다.</p>
            <span class="close">&times;</span>

        </div>
    </div>

    <div id="failureModal" class="modal">
        <div class="modal-content">
            <p>현재 비밀번호가 올바르지 않습니다.</p>
            <span class="close">&times;</span>

        </div>
    </div>
    <div id="loadingModal" class="modal">
        <div class="modal-content">
            <p>잠시 후에 다시 시도해 주세요.</p>
            <span class="close">&times;</span>
        </div>
    </div>

    <jsp:include page="myinfoNavBar.jsp"/>
</div>

</body>
</html>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const successModal = document.getElementById('successModal');
        const failureModal = document.getElementById('failureModal');
        const loadingModal = document.getElementById('loadingModal');
        const form = document.getElementById('changePasswordForm');
        const closeButtons = document.querySelectorAll('.close');



        form.addEventListener('submit', function(e) {
            e.preventDefault();
            const currentPassword = form.querySelector('input[name="currentPassword"]').value;
            const newPassword = form.querySelector('input[name="newPassword"]').value;
            const confirmPassword = form.querySelector('input[name="confirmPassword"]').value;

            if (!currentPassword || !newPassword || !confirmPassword) {
                failureModal.style.display = "block";
                return;
            }

            loadingModal.style.display = "block";

            fetch('/changePasswordForm/process', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    currentPassword: currentPassword,
                    newPassword: newPassword,
                    confirmPassword: confirmPassword
                })
            })
                .then(response => response.json())
                .then(data => {
                    loadingModal.style.display = "none";
                    if (data.success) {
                        successModal.style.display = "block";
                    } else {
                        failureModal.style.display = "block";
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    loadingModal.style.display = "none";
                    failureModal.style.display = "block";
                });
        });

        window.addEventListener('click', function(e) {
            if (e.target === successModal || e.target === failureModal || e.target === loadingModal) {
                successModal.style.display = "none";
                failureModal.style.display = "none";
                loadingModal.style.display = "none";
            }
        });
    });
</script>

</body>
</html>
