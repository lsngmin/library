<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>강릉대학교 통합도서관 관리 시스템</title>
  <style>
    /* 기본 스타일 */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }    body {
      font-family: 'Noto Sans KR', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;
    }

    /* 네비게이션 스타일 */
    .top-section {
      margin: 0;
      padding: 0;
    }
    .top-nav {
      background-color: #1a1a1a;
      padding: 10px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .nav-buttons {
      display: flex;
      gap: 20px;
    }
    .nav-right {
      display: flex;
      gap: 15px;
    }
    .nav-button {
      color: white;
      text-decoration: none;
      font-size: 14px;
      padding: 5px 10px;
      border-radius: 4px;
    }
    .nav-button:hover {
      background-color: #444;
    }

    /*!* 헤더 스타일 *!*/
    /*.main-header {*/
    /*  background-color: white;*/
    /*  padding: 15px 20px;*/
    /*  margin: 0;*/
    /*  border-bottom: 1px solid #ddd;*/
    /*}*/
    /*.header {*/
    /*  display: flex;*/
    /*  justify-content: space-between;*/
    /*  align-items: center;*/
    /*}*/
    /*.header h1 {*/
    /*  margin: 0;*/
    /*  color: #333;*/
    /*  font-size: 20px;*/
    /*}*/
    /*.header .search-bar {*/
    /*  position: relative;*/
    /*  display: flex;*/
    /*  align-items: center;*/
    /*}*/
    /*.header .search-bar input {*/
    /*  width: 300px;*/
    /*  padding: 8px 35px 8px 15px;*/
    /*  border: 1px solid #ddd;*/
    /*  border-radius: 4px;*/
    /*  background-color: #f8f8f8;*/
    /*}*/
    .search-icon {
      position: absolute;
      right: 12px;
      color: #888;
      cursor: pointer;
    }

    /* 콘텐츠 영역 스타일 */
    .content-wrapper {
      padding: 20px;
      background-color: #f8f9fa;
    }
    .content-section {
      background: #ffffff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      max-width: 1200px;
      margin: 20px auto;
    }
    .section-title {
      font-size: 22px;
      font-weight: bold;
      margin: 0 0 8px 0;
      color: #333;
    }
    .section-subtitle {
      font-size: 14px;
      color: #666;
      margin: 0 0 25px 0;
    }

    /* 검색 박스 스타일 */
    .search-box {
      position: relative;
      margin-bottom: 30px;
    }
    .search-box input {
      width: 100%;
      padding: 12px 15px 12px 40px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 14px;
    }
    .search-box::before {
      content: "⚲";
      position: absolute;
      left: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #888;
      font-size: 18px;
    }

    /* 도서 상세 정보 스타일 */
    .book-details {
      display: none; /* 기본적으로 숨김 */
      margin-bottom: 30px;
      background-color: #ffffff; /* 배경색을 하얀색으로 변경 */
      padding: 20px;
      border-radius: 8px;
      /* border: 1px solid #e9ecef; 이 줄을 제거하거나 주석 처리 */
    }
    .book-details.active {
      display: block;
    }
    /* 화살표 크기와 스타일 통일 */
    .detail-button {
      background: none;
      border: none;
      cursor: pointer;
      font-size: 18px;
      padding: 0;
      transition: transform 0.2s ease;
      line-height: 1; /* 이거 추가 */
      width: 20px; /* 이거 추가 */
      height: 20px; /* 이거 추가 */
    }

    .detail-button::before {
      content: "∨"; /* 기본 아래 화살표 */
      display: block;
      font-size: 20px;
    }

    .detail-button.active::before {
      content: "∧"; /* 활성화 시 위 화살표 */
      display: block;
      font-size: 20px;
    }
    .book-details h4 {
      font-size: 16px;
      font-weight: bold;
      margin: 0 0 20px 0;
      color: #333;
    }
    .form-container {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }
    .form-row {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 20px;
    }
    .form-group {
      display: flex;
      flex-direction: column;
      gap: 8px;
    }
    .form-group label {
      font-size: 14px;
      color: #333;
    }
    .form-group input,
    .form-group select {
      padding: 8px 12px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 14px;
      width: 100%;
    }
    /* 코드 입력 필드 텍스트 색상 변경 */
    .form-group input[readonly] {
      text-align: left;
      background-color: #f8f9fa;
      color: #1a73e8; /* 파란색으로 변경 */
    }
    .form-group input,
    .form-group select,
    .form-group textarea {
      text-align: left;  /* 모든 입력 필드 왼쪽 정렬 */
      padding: 8px 12px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 14px;
      width: 100%;
    }

    /* 테이블 스타일 */
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    /* 기존의 th, td 스타일은 유지 */
    th, td {
      padding: 12px;
      text-align: left; /* 기본적으로 왼쪽 정렬 유지 */
      border-bottom: 1px solid #eee;
      font-size: 14px;
    }

    /* 코드열은 왼쪽 정렬 유지하고 싶다면 */
    td.book-code {
      text-align: left;
    }
    /* 신청자료명도 왼쪽 정렬 유지하고 싶다면 */
    td:nth-child(4) {
      text-align: left;
    }
    /* 신청자도 왼쪽 정렬 유지하고 싶다면 */
    td:nth-child(5) {
      text-align: left;
    }
    th {
      font-weight: normal;
      color: #333;
      background-color: #fafafa;
    }
    th:first-child,
    td:first-child {
      width: 40px;
      text-align: center;
    }
    /* 처리상태 열 가운데 정렬 (6번째 열) */
    th:nth-child(6),
    td:nth-child(6) {
      text-align: center;
    }
    /* 상세보기 열 가운데 정렬 (7번째 열) */
    th:nth-child(7),
    td:nth-child(7) {
      text-align: center;
    }
    .book-code {
      color: #1a73e8;
    }

    input[type="checkbox"] {
      width: 16px;
      height: 16px;
      margin: 0;
    }
    select {
      appearance: none;
      padding-right: 25px;
      background: url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24'%3E%3Cpath d='M7 10l5 5 5-5z'/%3E%3C/svg%3E") no-repeat right 8px center/16px 16px;
    }

    /* 기증 도서 상세 정보에서만 5개 항목을 한 줄로 배치 */
    .five-column-row {
      display: grid;
      grid-template-columns: repeat(5, 1fr);  /* 5개의 항목을 균등하게 배치 */
      gap: 20px;
    }
    /* 모든 input과 textarea에 동일한 스타일 적용 */
    input, textarea {
      width: 100%; /* 너비를 100%로 설정 */
      padding: 8px; /* 여백 추가 */
      border: 1px solid #ccc; /* 테두리 스타일 */
      border-radius: 4px; /* 테두리 둥글게 */
      font-size: 14px; /* 폰트 크기 */
      box-sizing: border-box; /* 패딩을 포함한 전체 크기 계산 */
    }

    /* textarea에 대한 추가 스타일 */
    textarea {
      resize: none; /* 크기 조절 빗금 없애기 */
      height: 40px; /* 높이를 다른 input과 비슷하게 설정 */
    }

    /* input 필드에 추가적인 높이 설정 */
    input[type="text"], input[type="email"], input[type="date"] {
      height: 40px; /* 높이를 다른 input과 비슷하게 설정 */
    }

  </style>
</head>
<body>
<jsp:include page="adminHeader.jsp"/>
<%--<div class="top-section">--%>
<%--  <div class="top-nav">--%>
<%--    <div class="nav-buttons">--%>
<%--      <a href="/admin/rl" class="nav-button">홈</a>--%>
<%--      <a href="/admin/bookregister" class="nav-button">도서 등록</a>--%>
<%--      <a href="/admin/bookinquiry" class="nav-button">도서 정보</a>--%>
<%--      <a href="#" class="nav-button">학생 정보</a>--%>
<%--      <a href="#" class="nav-button">희망/기증 도서 신청 목록</a>--%>
<%--    </div>--%>
<%--    <div class="nav-right">--%>
<%--      <a href="#" class="nav-button">도서관 바로가기</a>--%>
<%--      <a href="#" class="nav-button">로그아웃</a>--%>
<%--    </div>--%>
<%--  </div>--%>

<%--  <div class="main-header">--%>
<%--    <div class="header">--%>
<%--      <h1>강릉대학교 통합도서관 관리 시스템</h1>--%>
<%--      <div class="search-bar">--%>
<%--        <input type="text" placeholder="도서명을 입력해 주세요">--%>
<%--        <span class="search-icon">🔍</span>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>

<div class="content-wrapper">
  <!-- 희망도서 신청 목록 섹션 -->
  <div class="content-section">
    <h3 class="section-title">희망도서 신청 목록</h3>
    <p class="section-subtitle">희망도서 반려시 사유를 비고란에 입력해 주세요</p>

    <div class="search-box">
      <input type="text" placeholder="도서 코드 또는 도서명을 입력해 주세요">
    </div>

    <!-- 숨겨질 도서 상세 정보 -->
    <div class="book-details" id="hope-book-details">
      <h4>도서 상세 정보</h4>
      <div class="form-container">
        <div class="form-row">
          <div class="form-group">
            <label>코드</label>
            <input type="text" name="code" readonly>
          </div>
          <div class="form-group">
            <label>도서명</label>
            <input type="text" name="bookName">
          </div>
          <div class="form-group">
            <label>저자</label>
            <input type="text" name="author">
          </div>
          <div class="form-group">
            <label>출판사</label>
            <input type="text" name="publisher">
          </div>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label>발행년도</label>
            <input type="text" name="publishYear">
          </div>
          <div class="form-group">
            <label>가격</label>
            <input type="text" name="price">
          </div>
          <div class="form-group">
            <label>처리상태</label>
            <select name="status" onchange="updateStatus(document.querySelector('input[name=\'code\']').value, this.value)">
              <option value="접수중">접수중</option>
              <option value="검토중">검토중</option>
              <option value="처리완료">처리완료</option>
            </select>
          </div>
        </div>
      </div>
    </div>

    <table>
      <thead>
      <tr>
        <th><input type="checkbox" id="select-all-hope" onclick="toggleCheckboxes(this)"></th>
        <th>코드</th>
        <th>날짜</th>
        <th>신청자료명</th>
        <th>신청자</th>
        <th>처리상태</th>
        <th>상세보기</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${wishBookList}" var="wishBook">
        <tr>
          <td><input type="checkbox" class="select-item"></td>
          <td class="book-code">${wishBook.wishCode}</td>
          <td>${wishBook.wishBookPublishDate}</td>
          <td>${wishBook.wishBookName}</td>
          <td>${wishBook.wishUserName}</td>
          <td>${wishBook.wishStatus}</td>
          <td>
            <button type="button"
                    class="detail-button"
                    onclick="showWishBookDetails('${wishBook.wishCode}')">
            </button>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
  <!-- 도서 기증 신청 목록 섹션 -->
  <!-- 도서 기증 신청 목록 섹션 -->
  <div class="content-section">
    <h3 class="section-title">도서 기증 신청 목록</h3>
    <p class="section-subtitle">기증 도서의 상태를 확인 후 처리해 주세요</p>

    <div class="search-box">
      <input type="text" placeholder="기증 코드 또는 도서명을 입력해 주세요">
    </div>

    <!-- 기증도서 신청 목록 섹션 -->
    <div class="content-section">
      <h3 class="section-title">도서 기증 신청 목록</h3>
      <p class="section-subtitle">기증 도서의 상태를 확인 후 처리해 주세요</p>

      <!-- 검색 박스 -->
      <div class="search-box">
        <input type="text" id="donationSearch" placeholder="기증 코드 또는 도서명을 입력해 주세요">
      </div>

      <!-- 기증도서 상세 정보 -->
      <div class="book-details" id="donation-book-details">
        <h4>기증 도서 상세 정보</h4>
        <div class="form-container">
          <div class="form-row">
            <div class="form-group">
              <label>코드</label>
              <input type="text" name="donationCode" readonly>
            </div>
            <div class="form-group">
              <label>도서명</label>
              <input type="text" name="donationBookName">
            </div>
            <div class="form-group">
              <label>저자</label>
              <input type="text" name="donationBookAuthor">
            </div>
            <div class="form-group">
              <label>출판사</label>
              <input type="text" name="donationBookPublisher">
            </div>
          </div>
          <div class="form-row">
            <div class="form-group">
              <label>신청자</label>
              <input type="text" name="donationUserName">
            </div>
            <div class="form-group">
              <label>연락처</label>
              <input type="text" name="donationUserPhone">
            </div>
            <div class="form-group">
              <label>이메일</label>
              <input type="email" name="donationUserEmail">
            </div>
            <div class="form-group">
              <label>기증 사유</label>
              <textarea name="donationReason" rows="3"></textarea>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group">
              <label>처리상태</label>
              <select name="donationStatus" onchange="updateDonationStatus()">
                <option value="접수완료">접수완료</option>
                <option value="검토중">검토중</option>
                <option value="반려">반려</option>
                <option value="기증완료">기증완료</option>
              </select>
            </div>
          </div>
        </div>
      </div>

      <!-- 기증도서 목록 테이블 -->
      <table>
        <thead>
        <tr>
          <th><input type="checkbox" id="donation-select-all"></th>
          <th>코드</th>
          <th>날짜</th>
          <th>기증자료명</th>
          <th>기증자</th>
          <th>처리상태</th>
          <th>상세보기</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${donationList}" var="donation">
          <tr>
            <td><input type="checkbox" class="donation-select-item"></td>
            <td class="book-code">${donation.donationCode}</td>
            <td>${donation.donationDate}</td>
            <td>${donation.donationBookName}</td>
            <td>${donation.donationUserName}</td>
            <td>${donation.donationStatus}</td>
            <td>
              <button type="button" class="detail-button" onclick="showDonationDetails('${donation.donationCode}')"></button>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>
<script>
  // 기존 DOMContentLoaded 이벤트 핸들러는 제거하고 아래와 같이 수정
  document.addEventListener('DOMContentLoaded', function() {
    // 전체 선택 체크박스 기능
    function toggleCheckboxes(source) {
      const table = source.closest('table');
      const checkboxes = table.querySelectorAll('.select-item');
      checkboxes.forEach(checkbox => {
        checkbox.checked = source.checked;
      });
    }

    // 각 섹션의 전체 선택 체크박스에 이벤트 리스너 추가
    document.querySelectorAll('input[type="checkbox"][id^="select-all"]').forEach(checkbox => {
      checkbox.addEventListener('change', function() {
        toggleCheckboxes(this);
      });
    });
  });

    // 전체 선택 체크박스 기능
    function toggleCheckboxes(source) {
      const table = source.closest('table');
      const checkboxes = table.querySelectorAll('.select-item');
      checkboxes.forEach(checkbox => {
        checkbox.checked = source.checked;
      });
    }

    // 각 섹션의 전체 선택 체크박스에 이벤트 리스너 추가
    document.querySelectorAll('input[type="checkbox"][id^="select-all"]').forEach(checkbox => {
      checkbox.addEventListener('change', function() {
        toggleCheckboxes(this);
      });
    });


  // 상세보기 버튼 클릭 이벤트 핸들러
  function toggleDetails(button) {
    const row = button.closest('tr');
    const section = button.closest('.content-section');
    const details = section.querySelector('.book-details');

    // 버튼 상태 토글
    button.classList.toggle('active');

    // 상세 정보 표시/숨김
    if (button.classList.contains('active')) {
      details.style.display = 'block';
    } else {
      details.style.display = 'none';
    }
  }

  // 희망도서 상세정보 표시 함수
  function showWishBookDetails(wishCode) {
    console.log("WishCode received:", wishCode);

    const detailsDiv = document.getElementById('hope-book-details');
    const button = event.currentTarget;

    button.classList.toggle('active');

    if (button.classList.contains('active')) {
      detailsDiv.classList.add('active');

      // 전체 URL을 콘솔에 출력
      const fullUrl = window.location.origin + '/admin/getWishBookDetails/' + wishCode;
      console.log("Full request URL:", fullUrl);

      fetch(fullUrl)  // 전체 URL 사용
              .then(response => {
                console.log("Response received:", response);
                if (!response.ok) {
                  throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
              })
              .then(data => {
                console.log("Data received:", data);

                // 상세 정보 필드 찾기
                const codeField = document.querySelector('#hope-book-details input[name="code"]');
                const bookNameField = document.querySelector('#hope-book-details input[name="bookName"]');
                const authorField = document.querySelector('#hope-book-details input[name="author"]');
                const publisherField = document.querySelector('#hope-book-details input[name="publisher"]');
                const publishYearField = document.querySelector('#hope-book-details input[name="publishYear"]');
                const priceField = document.querySelector('#hope-book-details input[name="price"]');
                const statusField = document.querySelector('#hope-book-details select[name="status"]');

                // 값 설정
                if(codeField) codeField.value = data.wishCode || '';
                if(bookNameField) bookNameField.value = data.wishBookName || '';
                if(authorField) authorField.value = data.wishBookAuthor || '';
                if(publisherField) publisherField.value = data.wishBookPublisher || '';
                if(publishYearField) publishYearField.value = data.wishBookPublishDate || '';
                if(priceField) priceField.value = data.wishBookPrice || '';
                if(statusField) statusField.value = data.wishStatus || '';
              })
              .catch(error => {
                console.error('Error details:', error);
                console.error('Error stack:', error.stack);
                alert('데이터를 가져오는데 실패했습니다. 자세한 내용은 콘솔을 확인해주세요.');
              });
    } else {
      detailsDiv.classList.remove('active');
    }
  }



  function updateStatus(wishCode, newStatus) {
    if(confirm('처리상태를 변경하시겠습니까?')) {
      fetch('/admin/updateWishBookStatus', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          wishCode: wishCode,
          status: newStatus
        })
      })
              .then(response => response.json())
              .then(data => {
                if(data.success) {
                  alert('상태가 변경되었습니다.');
                  // 테이블의 상태 표시도 업데이트
                  const row = document.querySelector(`tr[data-wishcode="${wishCode}"]`);
                  if(row) {
                    const statusCell = row.querySelector('td:nth-child(6)');
                    if(statusCell) statusCell.textContent = newStatus;
                  }
                } else {
                  alert('상태 변경에 실패했습니다.');
                }
              })
              .catch(error => {
                console.error('Error:', error);
                alert('상태 변경 중 오류가 발생했습니다.');
              });
    }
  }

  // 기증도서 상세 정보 표시
  function showDonationDetails(donationCode) {
    const button = event.currentTarget;
    button.classList.toggle('active');

    const detailsDiv = document.getElementById('donation-book-details');
    if (button.classList.contains('active')) {
      fetch('/admin/getDonationBookDetails/' + donationCode)
              .then(response => response.json())
              .then(data => {
                document.querySelector('input[name="donationCode"]').value = data.donationCode;
                document.querySelector('input[name="donationBookName"]').value = data.donationBookName;
                document.querySelector('input[name="donationBookAuthor"]').value = data.donationBookAuthor;
                document.querySelector('input[name="donationBookPublisher"]').value = data.donationBookPublisher;
                document.querySelector('input[name="donationUserName"]').value = data.donationUserName;
                document.querySelector('input[name="donationUserPhone"]').value = data.donationUserPhone;
                document.querySelector('input[name="donationUserEmail"]').value = data.donationUserEmail;
                document.querySelector('textarea[name="donationReason"]').value = data.donationReason;
                document.querySelector('select[name="donationStatus"]').value = data.donationStatus;

                detailsDiv.style.display = 'block';
              })
              .catch(error => {
                console.error('Error:', error);
                alert('상세 정보를 불러오는데 실패했습니다.');
              });
    } else {
      detailsDiv.style.display = 'none';
    }
  }

  function updateDonationStatus() {
    const donationCode = document.querySelector('input[name="donationCode"]').value;
    const newStatus = document.querySelector('select[name="donationStatus"]').value;

    if(confirm('처리상태를 변경하시겠습니까?')) {
      fetch('/admin/updateDonationBookStatus', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          donationCode: donationCode,
          status: newStatus
        })
      })
              .then(response => response.json())
              .then(data => {
                if(data.success) {
                  alert('상태가 변경되었습니다.');
                  location.reload(); // 페이지 새로고침
                } else {
                  alert('상태 변경에 실패했습니다.');
                }
              })
              .catch(error => {
                console.error('Error:', error);
                alert('상태 변경 중 오류가 발생했습니다.');
              });
    }
  }

</script>