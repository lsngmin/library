document.querySelectorAll('.status-tab').forEach(tab => {
    tab.addEventListener('click', () => {
        document.querySelectorAll('.status-tab').forEach(t => {
            t.classList.remove('active');
        });
        tab.classList.add('active');
    });
});

document.querySelectorAll('.cancel-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        if(confirm('신청을 취소하시겠습니까?')) {
            // Add cancellation logic here
        }
    });
});