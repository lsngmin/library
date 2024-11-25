<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>도서관 관리 시스템</title>
  <link rel="stylesheet" href="/css/admindashboard/admindashboard.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="/js/admindashboard/searchUser.js"></script>
  <script src="/js/admindashboard/searchBook.js"></script>
  <script src="/js/admindashboard/rentalExecute.js"></script>
  <script src="/js/admindashboard/admindashboard.js"></script>
  <script src="/js/admindashboard/rentalReturn.js"></script>
  <script src="/js/admindashboard/rentalList.js"></script>
  <script src="/js/admindashboard/clearOverDue.js"></script>

</head>
<body>
<jsp:include page="adminHeader.jsp"/>
<div class="main-container">
<div class="info-box-container">
  <div class="info-box">
    <div class="icon"><img src="/img/admindashboard/currentBook_icon.png" alt="아이콘" class="info_icon"></div>
    <div class="details">
      <div class="title">현재까지 등록된 도서</div>
      <div class="number">${totalBookCount}</div>
    </div>
  </div>
  <div class="info-box">
    <div class="icon"><img src="/img/admindashboard/wishBook_icon.png" alt="아이콘" class="info_icon"></div>
    <div class="details">
      <div class="title">희망도서 신청 건 수</div>
      <div class="number">1,234</div>
    </div>
  </div>
  <div class="info-box">
    <div class="icon"><img src="/img/admindashboard/userTotal_icon.png" alt="아이콘" class="info_icon"></div>
    <div class="details">
      <div class="title">도서관 총 이용자 수</div>
      <div class="number">${totalUserCount}</div>
    </div>
  </div>
  <div class="info-box">
    <div class="icon"><img src="/img/admindashboard/rentalBook_icon.png" alt="아이콘" class="info_icon"></div>
    <div class="details">
      <div class="title">대여 진행중인 도서 수</div>
      <div class="number">89</div>
    </div>
  </div>
</div>
<div class="loan-container">
  <div class="loan-header">
    <h2>도서 대여</h2>
    <p>사용자의 학번과 도서 등록코드를 입력해 주세요</p>
  </div>

    <div class="form-group">
      <label for="userId">학번</label>
      <input type="text" id="userId" name="userId" placeholder="ex> 20131122">
    </div>
    <button id="search-button" style="display:none;">Submit</button>

    <div class="inline-group">
      <div class="form-group">
        <label for="name">이름</label>
        <input type="text" id="name" value="" disabled>
      </div>
      <div class="form-group">
        <label for="colleges">단과대학</label>
        <input type="text" id="colleges" value="" disabled>
      </div>
      <div class="form-group">
        <label for="departments">학과</label>
        <input type="text" id="departments" value="" disabled>
      </div>
    </div>
    <div class="form-group">
      <label for="rentalAvailable">대출 잔여 수량</label>
      <input type="text" id="rentalAvailable" value="" disabled>
    </div>
    <div class="form-group">
      <label for="status">대출 가능 여부</label>
      <input type="text" id="status" value="" disabled>
    </div>
    <div class="form-group">
      <label for="reason">사유</label>
      <input type="text" id="reason" value="" disabled>
    </div>
    <div class="inline-group">
      <div class="form-group">
        <label for="bookCode">도서 코드</label>
        <input type="text" id="bookCode" placeholder="도서 코드를 입력하세요...">
      </div>
      <div class="form-group">
        <label for="bookName">도서명</label>
        <input type="text" id="bookName" value="" disabled>
      </div>
    </div>
    <div class="inline-group">
      <div class="form-group">
        <label for="bookAuthor">저자</label>
        <input type="text" id="bookAuthor" value="" disabled>
      </div>
      <div class="form-group">
        <label for="bookPublisher">출판사</label>
        <input type="text" id="bookPublisher" value="" disabled>
      </div>
      <div class="form-group">
        <label for="bookPublishDate">출판일</label>
        <input type="text" id="bookPublishDate" value="" disabled>
      </div>
    </div>
    <div class="inline-group">
      <div class="form-group">
        <label for="rentalStartDate">대출 시작일</label>
        <input type="text" id="rentalStartDate" value="" disabled>
      </div>
      <div class="form-group">
        <label for="rentalEndDate">대출 종료일</label>
        <input type="text" id="rentalEndDate" value="" disabled>
      </div>
    </div>
  <div class="form-group">
    <button class="btn-submit" id="RentalExecute">대출 실행</button>
  </div>
</div>

<div class="container">
  <div class="book-return-section">
    <h2>도서 반납</h2>
    <p>사용자의 학번 입력 후 반납할 도서를 체크해 주세요</p>
    <div class="form-group">
      <label for="return-userId">학번</label>
      <input type="text" id="return-userId" placeholder="ex> 20131122">
    </div>
    <div class="inline-group">
      <div class="form-group">
        <label for="return-name">이름</label>
        <input type="text" id="return-name" value="" disabled>
      </div>
      <div class="form-group">
        <label for="return-colleges">단과대학</label>
        <input type="text" id="return-colleges" value="" disabled>
      </div>
      <div class="form-group">
        <label for="return-departments">학과</label>
        <input type="text" id="return-departments" value="" disabled>
      </div>
    </div>
    <table class="book-table" id="rentalTable">
      <thead>
      <tr>
        <th></th>
        <th>도서명</th>
        <th>저자</th>
        <th>출판사</th>
        <th>기한</th>
        <th>연체</th>
      </tr>
      </thead>
      <tbody>
      </tbody>
    </table>
    <div class="warning-message">
      <p>반납 실행 전 책을 다시 확인해 주시고 반납해 주시기 바랍니다.</p>
    </div>
    <button class="btn-submit" id="returnBooksButton">반납 실행</button>
  </div>

  <div class="overdue-clear-section">
    <h2>연체 해제</h2>
    <div class="form-group">
      <label for="overdue-student-id">학번</label>
      <input type="text" id="overdue-student-id" placeholder="ex> 20131122">
    </div>
    <div class="form-group">
      <label for="reason">사유</label>
      <select id="reasons">
        <option value="천재지변">천재지변</option>
        <option value="개인사유">개인사유</option>
        <option value="기타">기타</option>
      </select>
    </div>
    <div class="form-group">
      <label for="notes">비고</label>
      <textarea id="notes" rows="3" placeholder="..."></textarea>
    </div>
    <button class="btn-submit" id="clear-over-due-button">제출하기</button>

    <div class="status-message success" display>연체가 해제 되었습니다.</div>
    <div class="status-message warning">학번을 확인해 주세요.</div>
    <div class="status-message error">연체중이 아닙니다.</div>
  </div>
</div>
</div>
</body>
</html>