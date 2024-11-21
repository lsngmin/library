<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>도서 등록</title>
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
    .section-title {
      margin-top: 0;
      margin-bottom: 2px;
      font-size: 16px;
      color: #333;
    }
    .section-subtitle {
      margin: 0 0 20px 0;
      font-size: 13px;
      color: #666;
    }
    .form-container {
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      margin: 20px auto;
      max-width: 800px;
    }
    .form-group {
      margin-bottom: 15px;
    }
    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: normal;
      color: #333;
    }
    .form-control {
      width: 100%;
      padding: 8px;
      border: 1px solid #ddd;
      border-radius: 4px;
      background-color: white;
    }
    .form-row {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px;
      margin-bottom: 15px;
    }
    .form-row-triple {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 15px;
      margin-bottom: 15px;
    }
    .btn {
      padding: 8px 16px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
    }
    .btn-primary {
      background: #1a73e8;
      color: white;
      width: 100%;
    }
    .btn-cancel {
      background: #fff;
      color: #666;
      border: 1px solid #ddd;
      width: 100%;
    }
    .button-group {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px;
      margin: 20px auto 0;
      max-width: 400px;
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
        <input type="text" placeholder="학생 정보 또는 도서 정보를 입력하세요...">
        <span class="search-icon">🔍</span>
      </div>
    </div>
  </div>
</div>

<div class="content-wrapper">
  <div class="form-container">
    <h3 class="section-title">도서 등록</h3>
    <p class="section-subtitle">도서 정보를 입력해주세요</p>

    <form action="/admin/bookregister" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label>도서명</label>
        <input type="text" class="form-control" name="bookName" placeholder="도서명을 입력해주세요">
      </div>

      <div class="form-row-triple">
        <div class="form-group">
          <label>저자</label>
          <input type="text" class="form-control" name="bookAuthor" placeholder="저자명을 입력해주세요">
        </div>
        <div class="form-group">
          <label>출판사</label>
          <input type="text" class="form-control" name="bookPublisher" placeholder="출판사명을 입력해주세요">
        </div>
        <div class="form-group">
          <label>출판연도</label>
          <input type="text" class="form-control" name="bookPublishDate" placeholder="출판연도를 입력해주세요">
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label>카테고리</label>
          <input type="text" class="form-control" name="bookCategory" placeholder="카테고리를 입력해주세요" list="categoryList">
          <datalist id="categoryList">
            <option value="자연과학">
            <option value="인문학">
            <option value="사회과학">
            <option value="예술">
            <option value="공학">
          </datalist>
        </div>
        <div class="form-group">
          <label>등록번호</label>
          <input type="text" class="form-control" name="bookCode" placeholder="EM000000000">
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label>가격</label>
          <input type="text" class="form-control" name="bookPrice" placeholder="가격을 입력해주세요">
        </div>
        <div class="form-group">
          <label>도서페이지</label>
          <input type="text" class="form-control" name="bookPage" placeholder="페이지 수를 입력해주세요">
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label>도서위치</label>
          <input type="text" class="form-control" name="bookLocation" placeholder="도서 위치를 입력해주세요">
        </div>
        <div class="form-group">
          <label>도서상태</label>
          <input type="text" class="form-control" name="bookStatus" placeholder="도서 상태를 입력해주세요" list="statusList">
          <datalist id="statusList">
            <option value="새책">
            <option value="중고">
            <option value="파손">
          </datalist>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label>책 소개</label>
          <textarea class="form-control" name="bookDecription" rows="6" placeholder="책 소개를 입력해주세요"></textarea>
        </div>
        <div class="form-group">
          <label>도서표지 이미지 업로드</label>
          <input type="file" class="form-control" name="bookImageSrc" accept="image/*">
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label>수량</label>
          <input type="text" class="form-control" name="bookQuantity" placeholder="수량을 입력해주세요">
        </div>
      </div>

      <div class="button-group">
        <button type="submit" class="btn btn-primary">등록</button>
        <button type="button" class="btn btn-cancel">취소</button>
      </div>
    </form>
  </div>
</div>
</body>
</html>