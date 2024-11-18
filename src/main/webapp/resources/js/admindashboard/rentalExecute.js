$(document).ready(function() {
    $('#RentalExecute').click(function () {
        executeRental();
    });

    function executeRental() {
        var bookCode = $('#bookCode').val();
        var userId = $('#userId').val();
        var rentalStartDate = $('#rentalStartDate').val();
        var rentalEndDate = $('#rentalEndDate').val();

        $.ajax({
            type: 'POST',
            url: '/admin/rentalexecute',
            contentType: 'application/json',
            data: JSON.stringify({
                bookCode: bookCode,
                userId: userId,
                rentalStartDate: rentalStartDate,
                rentalEndDate: rentalEndDate
            }),
            success: function (response) {
                alert("대출이 성공적으로 실행되었습니다!");
            },
            error: function () {
                alert("대출 실행 중 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    }
});