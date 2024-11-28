<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>강릉대학교 통합도서관</title>
  <link rel="stylesheet"  href="/resources/css/library/search.css">

  <style>
    body {
      font-family: Arial, sans-serif;
    }

    .search-container {
      max-width: 1080px; /* 최대 너비 1080px로 변경 */
      margin: 30px auto;
      text-align: left;
    }

    .search-title {
      font-size: 40px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .search-box {
      display: flex;
      align-items: center;
      border: 1px solid #333; /* 전체 테두리 */
      border-radius: 4px;
      overflow: hidden;
      height: 60px; /* 검색 박스의 세로 길이를 늘림 */
    }

    .dropdown-container {
      display: flex;
      align-items: center;
      position: relative;
      padding: 10px;
      padding-left: 35px;
      width: 200px; /* 드롭다운 영역의 가로 길이를 늘림 */
    }

    .search-dropdown {
      border: none;
      background: none;
      font-size: 24px; /* 폰트 크기를 키움 */
      font-weight: bold;
      appearance: none; /* 기본 드롭다운 스타일 제거 */
      cursor: pointer;
      width: 100%; /* 드롭다운이 dropdown-container의 너비를 꽉 채우도록 설정 */
    }

    .dropdown-icon {
      position: absolute;
      right: 10px; /* 드롭다운 오른쪽에 위치시킴 */
      pointer-events: none; /* 클릭되지 않도록 설정 */
      font-size: 14px;
    }

    .search-input {
      flex-grow: 1;
      border: none;
      outline: none;
      font-size: 18px; /* 폰트 크기를 키움 */
      padding: 10px;
    }

    .search-button {
      background: #000;
      color: #fff;
      border: none;
      padding: 15px 25px; /* 버튼의 패딩을 키워서 더 커 보이도록 설정 */
      cursor: pointer;
      font-size: 18px; /* 폰트 크기를 키움 */
      height: 100%; /* 버튼이 검색 박스의 세로 높이를 꽉 채우도록 설정 */
    }

    .search-results {
      margin-top: 20px;
      font-size: 16px;
    }

    .search-results em {
      font-weight: bold;
    }

    hr {
      margin-top: 20px;
      border: 0;
      border-top: 1px solid #6d6d6d; /* 구분선 스타일 */
    }
    .options-container {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-top: 15px;
    }

    .select-all {
      display: flex;
      align-items: center;
      font-size: 16px;
    }

    .select-all input[type="checkbox"] {
      width: 20px; /* 체크박스의 너비 */
      height: 20px; /* 체크박스의 높이 */
    }

    .bookmark-button {
      border: 2px solid #007bff; /* 파란색 테두리 */
      color: #007bff; /* 파란색 글씨체 */
      background: none;
      padding: 10px 20px;
      /*border-radius: 8px; !* 약간 둥글게 설정 *!*/
      cursor: pointer;
      margin-right: 10px;
      height: 38px; /* 버튼 높이 설정 */
      font-size: 14px;
    }

    .bookmark-button:hover {
      background-color: #007bff;
      color: white; /* 호버 시 글자색 변경 */
    }

    .sort-dropdown {
      border: 2px solid;
      font-size: 12px;
      padding: 10px;
      height: 38px; /* 관심도서 담기 버튼과 높이 맞춤 */
      width: 150px; /* 드롭다운 박스의 가로 길이 늘림 */
    }
    .search-result-container {
      max-width: 1080px;
      margin: 20px auto;
      padding: 10px;
    }

    .book-item {
      display: flex;
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      margin-bottom: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .book-image {
      flex: 0 0 150px;
      height: 200px;
      margin-right: 20px;
    }

    .book-info {
      flex-grow: 1;
    }

    .book-info h3 {
      font-size: 20px;
      margin: 0 10px 10px 0;
    }

    .book-title {
      display: flex;
      align-items: center;
      flex-grow: 1;
    }
    .book-title-container {
      display: flex;
      align-items: center;
      justify-content: space-between; /* 제목과 대출 상태를 양쪽 끝에 위치시킴 */

      margin-bottom: 10px;
    }

    .book-title-container input[type="checkbox"] {
      width: 20px; /* 체크박스의 너비 */
      height: 20px; /* 체크박스의 높이 */
      margin-right: 10px; /* 체크박스와 제목 간 간격 */
      margin-bottom: 10px;
    }

    .book-info .book-details {
      font-size: 14px;
      line-height: 1.6;
      margin-bottom: 15px;
    }

    /*.book-info .book-available {*/
    /*  font-weight: bold;*/
    /*  color: #007bff;*/
    /*  margin-bottom: 15px;*/
    /*}*/

    /*.book-info .book-unavailable {*/
    /*  font-weight: bold;*/
    /*  color: red;*/
    /*  margin-bottom: 15px;*/
    /*}*/

    .book-available,
    .book-unavailable {
      font-weight: bold;
      margin-left: 20px; /* 제목과 상태 사이의 간격 */
    }

    .book-available {
      color: #007bff;
    }

    .book-unavailable {
      color: red;
    }

    .book-actions {
      display: flex;
      align-items: center;
      margin-top: auto;
    }

    .subject-label {
      background: #f0ad4e; /* 주황색 배경 */
      color: #fff;
      padding: 5px 10px;
      border-radius: 4px;
      font-size: 14px;
      margin-right: 10px;
    }

    .wishlist-button {
      border: 2px solid #28a745; /* 초록색 테두리 */
      color: #28a745; /* 초록색 글씨체 */
      background: none;
      padding: 10px 20px;
      border-radius: 8px; /* 약간 둥글게 설정 */
      cursor: pointer;
      font-size: 14px;
    }

    .wishlist-button:hover {
      background-color: #28a745; /* 초록색 배경 */
      color: #fff; /* 호버 시 글자색 흰색으로 변경 */
    }

    .checkbox-container {
      margin-right: 10px;
    }

    input[type="checkbox"] {
      width: 20px; /* 체크박스의 너비 */
      height: 20px; /* 체크박스의 높이 */
    }
  </style>
</head>
<body>
<jsp:include page="libraryNavbar.jsp"/>
<div class="main-container">
  <div class="content">
    <div class="search-container">
      <div class="search-title">통합검색</div>
      <div class="search-box">
        <div class="dropdown-container">
          <select class="search-dropdown">
            <option value="title">제목</option>
            <option value="author">저자</option>
            <option value="publisher">출판사</option>
          </select>
          <span class="dropdown-icon">▼</span> <!-- 드롭다운 아이콘 -->
        </div>
        <input type="text" class="search-input" placeholder="검색어를 입력하세요" value="총균쇠">
        <button class="search-button">검색</button>
      </div>
      <div class="search-results">
        "<em>총균쇠</em>"에 대하여 전체 3개가 검색되었습니다.
      </div>
      <hr>
      <div class="options-container">
        <div class="select-all">
          <input type="checkbox" id="select-all-checkbox">
          <label for="select-all-checkbox" style="margin-left: 5px;">전체선택</label>
        </div>
        <div>
          <select class="sort-dropdown">
            <option value="recent">최신순</option>
            <option value="title">제목순</option>
            <option value="author">저자순</option>
          </select>
          <button class="bookmark-button">관심도서담기</button>
        </div>
      </div>
    </div>
    <div class="search-result-container">
      <!-- 책 항목 1 -->
      <div class="book-item">
        <img class="book-image" src="/img/book1.jpg" alt="총, 균, 쇠 책 이미지">
        <div class="book-info">
          <div class="book-title-container">
            <div class="book-title">
              <input type="checkbox">
              <h3>총, 균, 쇠</h3>
            </div>
            <div class="book-available">✔ 대출가능</div>
            <div class="book-unavailable">✘ 대출중</div>
          </div>
          <hr style="margin-bottom: 20px">

          <div class="book-details">
            <span style="font-weight: bold; margin-right: 15px">저자:</span> <c:out value="${book.author}" />
            <span style="font-weight: bold; margin-right: 15px">발행처:</span> <c:out value="${book.publisher}" />
            <span style="font-weight: bold; margin-right: 15px">발행년:</span> <c:out value="${book.publishYear}" />
            <span style="font-weight: bold; margin-right: 15px">자료위치:</span> <c:out value="${book.location}" /><br>
            <span style="font-weight: bold;">등록번호:</span> <c:out value="${book.registrationNumber}" />
          </div>
          <hr style="margin-bottom: 20px">
          <div class="book-actions">
            <span class="subject-label">사회과학</span>
            <button class="wishlist-button">관심도서 담기</button>
          </div>
        </div>
      </div>
  </div>
</div>
</body>
</html>