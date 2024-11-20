document.addEventListener('DOMContentLoaded', function () {
    // 네비게이션 아이템 클릭 이벤트
    const navItems = document.querySelectorAll('.nav-item');
    navItems.forEach(item => {
        item.addEventListener('click', function () {
            navItems.forEach(i => i.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // 더 읽을래요 버튼 클릭 시 알림 표시
    document.querySelectorAll('.btn-more').forEach(btn => {
        btn.addEventListener('click', function () {
            const notification = document.querySelector('.loan-notification');
            // 기존 타이머가 있다면 제거
            if (this.notificationTimer) {
                clearTimeout(this.notificationTimer);
            }
            notification.style.display = 'flex';
            // 3초 후 자동으로 사라지도록 설정
            this.notificationTimer = setTimeout(() => {
                notification.style.display = 'none';
            }, 3000);
        });
    });
});

// 알림 닫기 함수
function closeNotification() {
    const notification = document.querySelector('.loan-notification');
    notification.style.display = 'none';
}