document.querySelector('.password-toggle').addEventListener('click', function() {
    const passwordInput = this.previousElementSibling;
    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordInput.setAttribute('type', type);

    this.textContent = type === 'password' ? 'visibility_off' : 'visibility';
});