
$(document).ready(function() {
    $('#RentalExecute').click(function () {
        executeRental();
    });

    function executeRental() {
        var bookCode = $('#bookCode').val();
        var userId = $('#userId').val();
        var rentalStartDate = $('#rentalStartDate').val();
        var rentalEndDate = $('#rentalEndDate').val();
        var name = $('#name').val();
        var bookName = $('#bookName').val();
        var status = $('#status').val();

        $.ajax({
            type: 'POST',
            url: '/admin/rentalexecute',
            contentType: 'application/json',
            data: JSON.stringify({
                bookCode: bookCode,
                userId: userId,
                rentalStartDate: rentalStartDate,
                rentalEndDate: rentalEndDate,
                name: name,
                bookName: bookName,
                status: status
            }),
            success: function (response) {
                if (response.error) {
                    alert(response.error);
                }
                else {
                    alert(response.success)
                }
            },
            error: function () {
                alert("대출 실행 중 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    }
});