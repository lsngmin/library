<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
      max-width: 1080px;
      margin: 30px auto;
      text-align: center; /* 검색바를 중앙 정렬하도록 수정 */
    }

    .search-title {
      font-size: 40px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .search-box {
      display: flex;
      align-items: center;
      border: 2px solid #666; /* 기존: 1px solid #333 -> 수정: 두께 및 색상 변경 */
      border-radius: 8px; /* 기존: 4px -> 수정: 더 둥글게 변경 */
      overflow: hidden;
      height: 50px; /* 기존: 60px -> 수정: 높이 조정 */
      background-color: #f9f9f9; /* 수정: 배경색 추가 */
    }


    .dropdown-container {
      display: flex;
      align-items: center;
      padding: 10px;
      width: 180px; /* 기존: 200px -> 수정: 드롭다운 너비 조정 */
    }

    .search-dropdown {
      border: none;
      background: none;
      font-size: 16px; /* 기존: 24px -> 수정: 텍스트 크기 축소 */
      font-weight: bold;
      appearance: none;
      cursor: pointer;
      width: 100%;
      text-align: center; /* 수정: 텍스트 중앙 정렬 */
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
      font-size: 16px; /* 기존: 18px -> 수정: 크기 축소 */
      padding: 10px 15px; /* 기존: 10px -> 수정: 패딩 추가 */
      background-color: #fff; /* 수정: 입력 필드 배경색 추가 */
    }

    .search-button {
      background: #007bff; /* 기존: #000 -> 수정: 파란색 배경 */
      color: #fff; /* 기존: 유지 */
      border: none;
      padding: 10px 20px; /* 기존: 15px 25px -> 수정: 크기 조정 */
      cursor: pointer;
      font-size: 16px; /* 기존: 18px -> 수정: 크기 축소 */
      height: 100%; /* 기존: 유지 */
    }

    .search-button:hover {
      background-color: #0056b3; /* 수정: 버튼 호버 시 색상 추가 */
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

    .options-container > div {
      display: flex;
      align-items: center;
      gap: 10px; /* 드롭다운과 버튼 간 간격 */
    }

    .select-all {
      display: flex;
      align-items: center;
      font-size: 16px;
    }

    .select-all input[type="checkbox"] {
      margin-right: 10px;
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
      align-items: center;
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      margin-bottom: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .checkbox-container {
      margin-right: 20px; /* 체크박스와 책 이미지 간 간격 */
    }

    input[type="checkbox"] {
      width: 20px; /* 체크박스 크기 설정 */
      height: 20px;
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
        <!-- 검색어 입력 폼 -->
        <form action="/searchkeyword" method="post" style="display: flex; width: 100%;">
        <div class="dropdown-container">
            <select class="search-dropdown" name="searchType">
              <option value="title">제목</option>
              <option value="author">저자</option>
              <option value="publisher">출판사</option>
            </select>
            <span class="dropdown-icon">▼</span>
          </div>
          <input type="text" class="search-input" name="keyword" placeholder="검색어를 입력하세요" value="${param.keyword}">
          <button type="submit" class="search-button">검색</button>
        </form>
      </div>
      <div class="search-results">
        <!-- 수정: 검색 결과 처리 로직 개선 -->
        <c:choose>
          <c:when test="${not empty books}">
            "<em>${param.keyword}</em>"에 대하여 전체 ${fn:length(books)}개의 결과가 검색되었습니다.
            <div class="search-result-container">
              <c:forEach var="book" items="${books}">
                <div class="book-item">
                  <h3>${book.bookName}</h3>
                </div>
              </c:forEach>
            </div>
          </c:when>
          <c:otherwise>
            <p>"${param.keyword}"에 대한 검색 결과가 없습니다.</p>
          </c:otherwise>
        </c:choose>
      </div>
      <hr>
      <div class="options-container">
        <div class="select-all">
          <input type="checkbox" id="select-all-checkbox" onclick="toggleSelectAll(this)">
          <label for="select-all-checkbox">전체선택</label>
        </div>
        <div style="display: flex; align-items: center; gap: 10px;"> <!-- 드롭다운과 버튼 정렬 -->
          <select class="sort-dropdown" name="searchType"> <!-- 드롭다운 -->
            <option value="recent">최신순</option>
            <option value="title">제목순</option>
            <option value="author">저자순</option>
          </select>
          <button class="bookmark-button" onclick="addToInterestedBooks()">관심도서 담기</button> <!-- 버튼 -->
        </div>
      </div>
    </div>
    <div class="search-result-container">
      <c:forEach var="book" items="${books}">
        <div class="book-item">
          <div class="checkbox-container">
            <input type="checkbox" class="book-checkbox">
          </div>
          <img class="book-image" src="${book.bookImageSrc}" alt="${book.bookName}">
          <div class="book-info">
            <div class="book-title-container">
              <div class="book-title">
                <h3>${book.bookName}</h3>
              </div>
              <div class="${book.bookQuantity > 0 ? 'book-available' : 'book-unavailable'}">
                  ${book.bookQuantity > 0 ? '✔ 대출가능' : '✘ 대출중'}
              </div>
            </div>
            <div class="book-details">
              <strong>저자:</strong> ${book.bookAuthor}<br>
              <strong>출판사:</strong> ${book.bookPublisher}<br>
              <strong>발행년:</strong> ${book.bookPublishDate}<br>
              <strong>위치:</strong> ${book.bookLocation}<br>
            </div>
            <hr style="margin-bottom: 20px">
            <div class="book-actions">
              <span class="subject-label">${book.bookCategory}</span>
              <button class="wishlist-button">관심도서 담기</button>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>
<script>
  // 전체 선택/해제 기능
  function toggleSelectAll(selectAllCheckbox) {
    // 모든 체크박스를 선택하거나 해제
    const checkboxes = document.querySelectorAll('.book-checkbox');
    checkboxes.forEach(checkbox => {
      checkbox.checked = selectAllCheckbox.checked;
    });
  }
</script>
</body>
</html>