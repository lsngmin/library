$(document).ready(function() {
    $('#clear-over-due-button').click(function () {
        clearOverDue();
    });

    function clearOverDue() {
        var userId = $('#overdue-student-id').val();

        $.ajax({
            type: 'POST',
            url: '/admin/clearoverdue',
            contentType: 'application/json',
            data: JSON.stringify({userId: userId}),
            success: function (response) {
                if (response.error) {
                    alert(response.error);
                }
                else {
                    alert(response.success)
                }
            },
            error: function () {
                alert("연체 해제 중 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    }
});