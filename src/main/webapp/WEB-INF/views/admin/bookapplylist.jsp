<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>강릉대학교 통합도서관 관리 시스템</title>
  <style>
    /* 기본 스타일 */
    * { box-sizing: border-box; }
    body {
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

    /* 헤더 스타일 */
    .main-header {
      background-color: white;
      padding: 15px 20px;
      margin: 0;
      border-bottom: 1px solid #ddd;
    }
    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .header h1 {
      margin: 0;
      color: #333;
      font-size: 20px;
    }
    .header .search-bar {
      position: relative;
      display: flex;
      align-items: center;
    }
    .header .search-bar input {
      width: 300px;
      padding: 8px 35px 8px 15px;
      border: 1px solid #ddd;
      border-radius: 4px;
      background-color: #f8f8f8;
    }
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
      margin-bottom: 30px;
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
    .form-group input[readonly] {
      background-color: #f8f9fa;
    }

    /* 테이블 스타일 */
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #eee;
      font-size: 14px;
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
    .book-code {
      color: #1a73e8;
    }
    .detail-button {
      background: none;
      border: none;
      color: #1a73e8;
      cursor: pointer;
      font-size: 18px;
      padding: 0;
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
<div class="top-section">
  <div class="top-nav">
    <div class="nav-buttons">
      <a href="/admin/rl" class="nav-button">홈</a>
      <a href="/admin/bookregister" class="nav-button">도서 등록</a>
      <a href="/admin/bookinquiry" class="nav-button">도서 정보</a>
      <a href="#" class="nav-button">학생 정보</a>
      <a href="#" class="nav-button">희망/기증 도서 신청 목록</a>
    </div>
    <div class="nav-right">
      <a href="#" class="nav-button">도서관 바로가기</a>
      <a href="#" class="nav-button">로그아웃</a>
    </div>
  </div>

  <div class="main-header">
    <div class="header">
      <h1>강릉대학교 통합도서관 관리 시스템</h1>
      <div class="search-bar">
        <input type="text" placeholder="도서명을 입력해 주세요">
        <span class="search-icon">🔍</span>
      </div>
    </div>
  </div>
</div>

<div class="content-wrapper">
  <div class="content-section">
    <h3 class="section-title">희망도서 신청 목록</h3>
    <p class="section-subtitle">희망도서 반려시 사유를 비고란에 입력해 주세요</p>

    <div class="search-box">
      <input type="text" placeholder="도서 코드 또는 도서명을 입력해 주세요">
    </div>

    <div class="book-details">
      <h4>도서 상세 정보</h4>
      <div class="form-container">
        <div class="form-row">
          <div class="form-group">
            <label>코드</label>
            <input type="text" value="#AHGA68" readonly>
          </div>
          <div class="form-group">
            <label>도서명</label>
            <input type="text" value="자연사">
          </div>
          <div class="form-group">
            <label>저자</label>
            <input type="text" value="이승민">
          </div>
          <div class="form-group">
            <label>출판사</label>
            <input type="text" value="한빛미디어">
          </div>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label>발행년도</label>
            <input type="text" value="2024">
          </div>
          <div class="form-group">
            <label>가격</label>
            <input type="text" value="65,000">
          </div>
          <div class="form-group">
            <label>처리상태</label>
            <select>
              <option selected>접수중</option>
              <option>검토중</option>
              <option>처리완료</option>
            </select>
          </div>
          <div class="form-group">
            <label>비고</label>
            <input type="text" placeholder="...">
          </div>
        </div>
      </div>
    </div>

    <table>
      <thead>
      <tr>
        <th><input type="checkbox" id="select-all" onclick="toggleCheckboxes(this)"></th>
        <th>코드</th>
        <th>날짜</th>
        <th>신청자료명</th>
        <th>신청자</th>
        <th>처리상태</th>
        <th>상세보기</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td><input type="checkbox" class="select-item"></td>
        <td class="book-code">#AHGA68</td>
        <td>2024-05-12</td>
        <td>자연사</td>
        <td>이승민</td>
        <td>접수중</td>
        <td><button class="detail-button">⌃</button></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="select-item"></td>
        <td class="book-code">#AHGA68</td>
        <td>2024-06-21</td>
        <td>수학의 힘</td>
        <td>맹정재</td>
        <td>검토중</td>
        <td><button class="detail-button">⌃</button></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="select-item"></td>
        <td class="book-code">#AHGA68</td>
        <td>2024-09-30</td>
        <td>지식의 최전선</td>
        <td>원종호</td>
        <td>처리완료</td>
        <td><button class="detail-button">⌄</button></td>
      </tr>
      </tbody>
    </table>
  </div>
  <div class="content-section">
    <h3 class="section-title">도서 기증 신청 목록</h3>
    <p class="section-subtitle">기증 도서의 상태를 확인 후 처리해 주세요</p>

    <!-- 검색 박스 -->
    <div class="search-box">
      <input type="text" placeholder="기증 코드 또는 도서명을 입력해 주세요">
    </div>

    <!-- 도서 상세 정보 -->
    <div class="book-details">
      <h4>기증 도서 상세 정보</h4>
      <div class="form-container">
        <div class="form-row five-column-row"> <!-- 5개 항목을 한 줄로 배치 -->
          <div class="form-group">
            <label>코드</label>
            <input type="text" value="#DNTR01" readonly>
          </div>
          <div class="form-group">
            <label>도서명</label>
            <input type="text" value="생명의 아름다움">
          </div>
          <div class="form-group">
            <label>저자</label>
            <input type="text" value="이민정">
          </div>
          <div class="form-group">
            <label>출판사</label>
            <input type="text" value="청림출판">
          </div>
          <div class="form-group">
            <label>발행년도</label>
            <input type="text" value="2023">
          </div>
        </div>
        <!-- 나머지 form-row들은 그대로 유지 -->
        <div class="form-row">
          <div class="form-group">
            <label>신청자</label>
            <input type="text" value="김민수">
          </div>
          <div class="form-group">
            <label>연락처</label>
            <input type="text" value="010-1234-5678">
          </div>
          <div class="form-group">
            <label>이메일</label>
            <input type="email" value="minsoo.kim@example.com">
          </div>
          <div class="form-group">
            <label>기증 사유</label>
            <textarea rows="3" placeholder="기증 사유를 입력하세요">개인 소장 도서 기증</textarea>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label>처리상태</label>
            <select>
              <option selected>접수중</option>
              <option>검토중</option>
              <option>반려</option>
              <option>기증완료</option>
            </select>
          </div>
          <div class="form-group">
            <label>비고</label>
            <textarea rows="3" placeholder="비고 입력란"></textarea>
          </div>
          <div class="form-group">
            <label>신청 날짜</label>
            <input type="date" value="2024-11-19">
          </div>
        </div>
      </div>
    </div>

    <!-- 도서 기증 목록 테이블 -->
    <table>
      <thead>
      <tr>
        <th><input type="checkbox" id="select-all" onclick="toggleCheckboxes(this)"></th>
        <th>코드</th>
        <th>날짜</th>
        <th>기증자료명</th>
        <th>신청자</th>
        <th>처리상태</th>
        <th>상세보기</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td><input type="checkbox" class="select-item"></td>
        <td class="book-code">#DNTR01</td>
        <td>2024-03-01</td>
        <td>생명의 아름다움</td>
        <td>김민수</td>
        <td>접수중</td>
        <td><button class="detail-button">⌃</button></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="select-item"></td>
        <td class="book-code">#DNTR02</td>
        <td>2024-05-10</td>
        <td>자연과학의 기초</td>
        <td>박수현</td>
        <td>검토중</td>
        <td><button class="detail-button">⌃</button></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="select-item"></td>
        <td class="book-code">#DNTR03</td>
        <td>2024-07-20</td>
        <td>문학과 철학</td>
        <td>이수영</td>
        <td>처리완료</td>
        <td><button class="detail-button">⌄</button></td>
      </tr>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>
<script>
  function toggleCheckboxes(source) {
    // 모든 체크박스를 선택/해제하는 함수
    const checkboxes = document.querySelectorAll('.select-item');
    checkboxes.forEach(checkbox => {
      checkbox.checked = source.checked;
    });
  }
</script>
