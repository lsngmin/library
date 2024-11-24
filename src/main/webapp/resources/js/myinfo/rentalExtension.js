document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.btn-more').forEach(button => {
        button.addEventListener('click', function () {
            const bookName = this.getAttribute('data-bookname');
            var userId = $('#ExtensionuserId').val();

            fetch('/user/myinfo/rentalextension', {
                method: 'POST',
                contentType: 'application/json',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ userId:userId, bookName: bookName}),
            })
            .then(response => response.json())
            .then(data => {
                const messageSpan = document.getElementById('rentalExtensionMessage');
                messageSpan.innerText = data.msg || '서버로부터 응답을 받지 못했습니다.';
            })
            .catch(error => {
                const messageSpan = document.getElementById('message');
                messageSpan.innerText = '오류가 발생했습니다. 다시 시도해주세요.';
            });
        });
    });
});