document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.status-tab').forEach(tab => {
        tab.addEventListener('click', () => {
            // 활성 탭 표시 변경
            document.querySelectorAll('.status-tab').forEach(t => {
                t.classList.remove('active');
            });
            tab.classList.add('active');

            // 선택된 상태 가져오기
            const selectedStatus = tab.getAttribute('data-status');

            // 모든 행을 가져옴
            const rows = document.querySelectorAll('.status-row');

            // 각 행을 순회하면서 필터링
            rows.forEach(row => {
                if (selectedStatus === 'all') {
                    row.style.display = ''; // 전체 선택시 모든 행 표시
                } else {
                    // 행의 상태가 선택된 상태와 일치하는지 확인
                    if (row.getAttribute('data-status') === selectedStatus) {
                        row.style.display = ''; // 일치하면 표시
                    } else {
                        row.style.display = 'none'; // 일치하지 않으면 숨김
                    }
                }
            });
        });
    });
});

function cancelWishBook(wishCode) {
    if(confirm('정말로 취소하시겠습니까?')) {
        fetch('/cancelWishBook', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({wishCode: wishCode})
        })
            .then(response => response.json())
            .then(data => {
                if(data.success) {
                    alert('취소되었습니다.');
                    location.reload();
                } else {
                    alert('취소에 실패했습니다.');
                }
            });
    }
}

document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.status-tab').forEach(tab => {
        tab.addEventListener('click', () => {
            // 활성 탭 표시 변경
            document.querySelectorAll('.status-tab').forEach(t => {
                t.classList.remove('active');
            });
            tab.classList.add('active');

            // 선택된 상태 가져오기
            const selectedStatus = tab.getAttribute('data-status');

            // 모든 행을 가져옴
            const rows = document.querySelectorAll('.status-row');

            // 각 행을 순회하면서 필터링
            rows.forEach(row => {
                if (selectedStatus === 'all') {
                    row.style.display = ''; // 전체 선택시 모든 행 표시
                } else {
                    // 행의 상태가 선택된 상태와 일치하는지 확인
                    if (row.getAttribute('data-status') === selectedStatus) {
                        row.style.display = ''; // 일치하면 표시
                    } else {
                        row.style.display = 'none'; // 일치하지 않으면 숨김
                    }
                }
            });
        });
    });
});