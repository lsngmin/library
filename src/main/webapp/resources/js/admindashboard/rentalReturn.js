$(document).ready(function() {
    // #userId 필드에서 엔터 키를 누르면 searchUser() 함수 호출
    $('#return-userId').keypress(function (event) {
        if (event.key === 'Enter') {
            event.preventDefault(); // 기본 엔터 동작 방지
            getRentalList(); // 엔터 시 searchUser 함수 호출
        }
    });
});
function getRentalList() {
    var userID = $('#return-userId').val();
    $.ajax({
        url: '/admin/rentalList',
        type: 'POST',
        contentType: 'application/json',
        dataType: 'json',
        data: JSON.stringify({ userId: userID }),

        success: function (data) {
            console.log(data)
            var rows = '';
            data.forEach(function (response) {
                rows += `
              <tr>
                <td><input type="checkbox" value=""></td>
                <td>${response.bookName}</td>
                <td>${response.bookAuthor}</td>
                <td>${response.bookPublisher}</td>
                <td>${response.rentalEndDate}</td>
                <td>0일</td>
              </tr>
            `;
            });
            $('#rentalTable tbody').html(rows); // 테이블에 행 추가
        },
        error: function () {
            alert('데이터를 불러오는 중 문제가 발생했습니다.');
        }
    });
}
