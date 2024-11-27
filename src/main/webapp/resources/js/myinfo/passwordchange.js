document.addEventListener("DOMContentLoaded", () => {
    const password = document.getElementById("new-password");
    const passwordConfirm = document.getElementById("passwordConfirm");
    const errorMessage = document.getElementById("error-message");
    const submitButton = document.getElementById("submit-button");

    // 실시간으로 비밀번호와 확인 비밀번호를 비교
    const comparePasswords = () => {
        if (password.value === "" || passwordConfirm.value === "") {
            errorMessage.style.display = "none"; // 비어 있을 때는 메시지를 숨김
            submitButton.disabled = true; // 버튼 비활성화
        } else if (password.value !== passwordConfirm.value) {
            errorMessage.style.display = "block";
            errorMessage.textContent = "비밀번호가 일치하지 않습니다.";
            submitButton.disabled = true; // 비밀번호가 일치하지 않으면 버튼 비활성화
        } else {
            errorMessage.style.display = "none";
            submitButton.disabled = false; // 비밀번호가 일치하면 버튼 활성화
        }
    };

    // 각 입력 필드에서 입력이 변경될 때마다 비교
    password.addEventListener("input", comparePasswords);
    passwordConfirm.addEventListener("input", comparePasswords);
});