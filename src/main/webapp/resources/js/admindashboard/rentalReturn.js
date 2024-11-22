$(document).ready(function () {
    $('#returnBooksButton').on('click', function () {
        var selectedBooks = [];

        // 체크된 체크박스의 값을 가져옴
        $('#rentalTable tbody input[type="checkbox"]:checked').each(function () {
            var row = $(this).closest('tr');
            var book = {
                userId: $('#return-userId').val(),
                bookName: row.find('td:nth-child(2)').text()
            };
            selectedBooks.push(book);
        });

        if (selectedBooks.length === 0) {
            alert('반납할 도서를 선택해주세요.');
            return;
        }

        // Ajax 요청으로 선택된 데이터를 서버로 전송
        $.ajax({
            url: '/admin/rentalReturn', // 반납 컨트롤러 URL
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(selectedBooks),
            success: function (response) { // 성공 콜백 함수
                if (response.success) {
                    alert(response.success)
                    window.location.replace("/admindashboard");
                } else {
                    alert("반납 중 에러가 발생했습니다.")
                }
            },
            error: function (response) { // 에러 콜백 함수
                alert(response.error);
            }
        });
    });
});