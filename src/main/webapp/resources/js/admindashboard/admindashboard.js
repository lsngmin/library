document.addEventListener("DOMContentLoaded", () => {
    const now = new Date();

    // 현재 날짜 가져오기
    const startYear = now.getFullYear();
    const startMonth = String(now.getMonth() + 1).padStart(2, '0');
    const startDay = String(now.getDate()).padStart(2, '0');
    const start = `${startYear}-${startMonth}-${startDay}`;

    // 14일 후의 날짜 계산
    now.setDate(now.getDate() + 14);
    const endYear = now.getFullYear();
    const endMonth = String(now.getMonth() + 1).padStart(2, '0');
    const endDay = String(now.getDate()).padStart(2, '0');
    const end = `${endYear}-${endMonth}-${endDay}`;

    // 값 설정
    document.getElementById("rentalStartDate").value = start;
    document.getElementById("rentalEndDate").value = end;
});
