document.addEventListener("DOMContentLoaded", () => {
    const now = new Date();
    const start = `${now.getFullYear()}-${now.getMonth() + 1}-${now.getDate()}`;
    now.setDate(now.getDate() + 14);
    const end = `${now.getFullYear()}-${now.getMonth() + 1}-${now.getDate()}`;

    document.getElementById("rentalStartDate").value = start;
    document.getElementById("rentalEndDate").value = end;
});