$(document).ready(function() {
    // #userId 필드에서 엔터 키를 누르면 searchUser() 함수 호출
    $('#bookCode').keypress(function (event) {
        if (event.key === 'Enter') {
            event.preventDefault(); // 기본 엔터 동작 방지
            searchBook(); // 엔터 시 searchUser 함수 호출
        }
    });
});
function searchBook() {
    var bookCode = $('#bookCode').val();
    $.ajax({
        type: 'POST',
        url: "/admindashboard/searchBook",
        contentType: 'application/json',
        data: JSON.stringify({ bookCode: bookCode }),
        success: function(response) {
            if (response.error === "error") {
                alert("책을 찾을 수 없습니다.");
            }
            if (response) {
                $('#bookName').val(response.bookName);
                $('#bookAuthor').val(response.bookAuthor);
                $('#bookPublisher').val(response.bookPublisher);
                $('#bookPublishDate').val(response.bookPublishDate);

            } else {
                console.log("예상하지 못한 오류가 발생했습니다.");
            }
        },
        error: function() {
            alert("오류가 발생했습니다. 다시 시도해주세요.");
        }
    });
}
