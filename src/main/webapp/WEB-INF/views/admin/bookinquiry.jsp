<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>도서 조회</title>
  <style>
    * { box-sizing: border-box; }
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;
    }
    .content-wrapper {
      padding: 20px;
      max-width: 1200px;
      margin: 0 auto;
    }
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
      font-size: 18px;
    }

    .form-container {
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      margin-bottom: 20px;
    }

    .section-title {
      margin-top: 0;
      margin-bottom: 20px;
      font-size: 16px;
      color: #333;
    }

    .book-grid {
      margin-top: 20px;
    }

    .book-header-row, .book-data {
      display: flex;
      gap: 10px;
      margin-bottom: 10px;
      align-items: center;
    }

    .book-header {
      flex: 1;
      font-weight: 600;
      color: #333;
      text-align: center;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 8px 12px;
      min-height: 40px;
    }

    .data-cell {
      flex: 1;
      text-align: center;
      color: #666;
      padding: 8px 12px;
      background-color: white;
      border: 1px solid #ddd;
      border-radius: 4px;
      min-height: 40px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .book-header:nth-child(1),
    .data-cell:nth-child(1) { flex: 1.2; }
    .book-header:nth-child(2),
    .data-cell:nth-child(2) { flex: 1.5; }
    .book-header:nth-child(3),
    .data-cell:nth-child(3) { flex: 1; }
    .book-header:nth-child(4),
    .data-cell:nth-child(4) { flex: 1; }
    .book-header:nth-child(5),
    .data-cell:nth-child(5) { flex: 0.8; }
    .book-header:nth-child(6),
    .data-cell:nth-child(6) {
      flex: 0.6;
      background-color: transparent;
      border: none;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .edit-btn {
      padding: 8px 24px;
      background-color: white;
      border: 1px solid #ddd;
      border-radius: 4px;
      cursor: pointer;
      color: #333;
      font-size: 14px;
      min-width: 80px;
    }

    .edit-btn:hover {
      background-color: #f8f9fa;
    }

    .sort-select select {
      padding: 8px 30px 8px 12px;
      border: 1px solid #ddd;
      border-radius: 4px;
      background-color: white;
      font-size: 14px;
      color: #333;
      cursor: pointer;
      appearance: none;
      -webkit-appearance: none;
      background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23333' d='M6 8L0 2h12z'/%3E%3C/svg%3E");
      background-repeat: no-repeat;
      background-position: right 10px center;
      background-size: 12px;
      min-width: 150px;
    }

    .sort-select select:focus {
      outline: none;
      border-color: #aaa;
    }

    .search-section {
      display: flex;
      align-items: center;
      gap: 15px;
    }

    /* Modal Styles */
    .modal {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      z-index: 1000;
    }

    .modal-content {
      position: relative;
      background-color: #fff;
      width: 90%;
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .close {
      position: absolute;
      right: 20px;
      top: 20px;
      font-size: 24px;
      cursor: pointer;
    }

    .modal-title {
      font-size: 20px;
      margin-bottom: 20px;
      color: #333;
    }

    .form-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      color: #333;
      font-size: 14px;
    }

    .form-group input, .form-group select {
      width: 100%;
      padding: 8px 12px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 14px;
    }

    /* 기존 스타일에 추가 */
    .form-group select {
      padding: 8px 30px 8px 12px;
      border: 1px solid #ddd;
      border-radius: 4px;
      background-color: white;
      font-size: 14px;
      color: #333;
      cursor: pointer;
      appearance: none;
      -webkit-appearance: none;
      background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23333' d='M6 8L0 2h12z'/%3E%3C/svg%3E");
      background-repeat: no-repeat;
      background-position: right 10px center;
      background-size: 12px;
      width: 100%;
    }

    .form-group select:focus {
      outline: none;
      border-color: #aaa;
    }

    .button-group {
      display: flex;
      justify-content: center;
      gap: 10px;
      margin-top: 20px;
    }

    .modal-btn {
      padding: 8px 24px;
      border-radius: 4px;
      font-size: 14px;
      cursor: pointer;
      border: none;
    }

    .submit-btn {
      background-color: #00C73C;
      color: white;
    }

    .reset-btn {
      background-color: #fff;
      border: 1px solid #ddd;
      color: #333;
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
      <div class="search-section">
        <div class="sort-select">
          <select>
            <option>정렬조건선택</option>
          </select>
        </div>
        <div class="search-bar">
          <input type="text" placeholder="학생 정보 또는 도서 정보를 입력하세요...">
          <span class="search-icon">🔍</span>
        </div>
      </div>
    </div>
  </div>

  <div class="content-wrapper">
    <div class="form-container">
      <h3 class="section-title">도서 조회</h3>
      <div class="book-grid">
        <div class="book-header-row">
          <div class="book-header">등록번호</div>
          <div class="book-header">책제목</div>
          <div class="book-header">저자</div>
          <div class="book-header">출판사</div>
          <div class="book-header">출판연도</div>
          <div class="book-header"></div>
        </div>
        <c:forEach var="book" items="${bookList}">
          <div class="book-data">
            <div class="data-cell">${book.bookCode}</div>
            <div class="data-cell">${book.bookName}</div>
            <div class="data-cell">${book.bookAuthor}</div>
            <div class="data-cell">${book.bookPublisher}</div>
            <div class="data-cell">${book.bookPublishDate}</div>
            <div class="data-cell">
              <button class="edit-btn">수정</button>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
</div>

<!-- Edit Modal -->
<div id="editModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2 class="modal-title">도서 수정</h2>
    <form id="editBookForm">
      <div class="form-grid">
        <div class="form-group">
          <label for="bookName">도서명</label>
          <input type="text" id="bookName" name="bookName">
        </div>
        <div class="form-group">
          <label for="regNumber">등록번호</label>
          <input type="text" id="regNumber" name="regNumber">
        </div>
        <div class="form-group">
          <label for="author">저자</label>
          <input type="text" id="author" name="author">
        </div>
        <div class="form-group">
          <label for="price">가격</label>
          <input type="text" id="price" name="price">
        </div>
        <div class="form-group">
          <label for="publisher">출판사</label>
          <input type="text" id="publisher" name="publisher">
        </div>
        <div class="form-group">
          <label for="bookPage">도서페이지</label>
          <input type="text" id="bookPage" name="bookPage">
        </div>
        <div class="form-group">
          <label for="pubYear">출판연도</label>
          <input type="text" id="pubYear" name="pubYear">
        </div>
        <div class="form-group">
          <label for="bookLocation">도서위치</label>
          <input type="text" id="bookLocation" name="bookLocation">
        </div>
        <div class="form-group">
          <label for="category">카테고리</label>
          <select id="category" name="category">
            <option value="">선택</option>
            <option value="literature">문학</option>
            <option value="science">과학</option>
            <option value="technology">기술</option>
            <option value="history">역사</option>
            <option value="philosophy">철학</option>
            <option value="arts">예술</option>
            <option value="social">사회과학</option>
            <option value="language">언어</option>
          </select>
        </div>
        <div class="form-group">
          <label for="bookStatus">도서상태</label>
          <input type="text" id="bookStatus" name="bookStatus">
        </div>
      </div>
      <div class="button-group">
        <button type="submit" class="modal-btn submit-btn">수정</button>
        <button type="reset" class="modal-btn reset-btn">초기화</button>
      </div>
    </form>
  </div>
</div>

<script>
  const modal = document.getElementById('editModal');
  const closeBtn = document.querySelector('.close');

  // 수정 버튼 클릭 시 모달 표시
  document.querySelectorAll('.edit-btn').forEach(btn => {
    btn.onclick = function(e) {
      e.preventDefault();
      const bookData = this.closest('.book-data');
      const bookInfo = {
        bookCode: bookData.children[0].textContent,
        bookName: bookData.children[1].textContent,
        author: bookData.children[2].textContent,
        publisher: bookData.children[3].textContent,
        pubYear: bookData.children[4].textContent
      };
      populateForm(bookInfo);
      modal.style.display = 'block';
    }
  });

  // 모달 닫기
  closeBtn.onclick = () => modal.style.display = 'none';
  window.onclick = (e) => {
    if (e.target === modal) modal.style.display = 'none';
  }

  // 폼 데이터 채우기
  function populateForm(data) {
    document.getElementById('bookName').value = data.bookName;
    document.getElementById('regNumber').value = data.bookCode;
    document.getElementById('author').value = data.author;
    document.getElementById('publisher').value = data.publisher;
    document.getElementById('pubYear').value = data.pubYear;
  }

  // 폼 제출 처리
  document.getElementById('editBookForm').onsubmit = function(e) {
    e.preventDefault();
    const formData = {
      bookName: document.getElementById('bookName').value,
      regNumber: document.getElementById('regNumber').value,
      author: document.getElementById('author').value,
      price: document.getElementById('price').value,
      publisher: document.getElementById('publisher').value,
      bookPage: document.getElementById('bookPage').value,
      pubYear: document.getElementById('pubYear').value,
      bookLocation: document.getElementById('bookLocation').value,
      category: document.getElementById('category').value,
      bookStatus: document.getElementById('bookStatus').value
    };

    // TODO: API로 데이터 전송
    // fetch('/api/books/update', {
    //   method: 'POST',
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    //   body: JSON.stringify(formData)
    // })
    // .then(response => response.json())
    // .then(data => {
    //   if(data.success) {
    //     modal.style.display = 'none';
    //     // 필요시 페이지 새로고침 또는 데이터 업데이트
    //     location.reload();
    //   }
    // });
  };
</script>