<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>도서관 관리 시스템</title>
  <link rel="stylesheet" href="/css/admindashboard/admindashboard.css">
</head>
<body>
<nav class="main-nav">
  <ul class="left">
    <li><a href="/admindashboard"><img src="/img/admindashboard/home_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp홈</a></li>
    <li><a href="#"><img src="/img/admindashboard/bookregi_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp도서 등록</a></li>
    <li><a href="#"><img src="/img/admindashboard/bookinfo_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp도서 정보</a></li>
    <li><a href="#"><img src="/img/admindashboard/userinfo_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp학생 정보</a></li>
    <li><a href="#"><img src="/img/admindashboard/status_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp희망/기종 도서 신청 목록</a></li>
  </ul>
  <ul class="right">
    <li><a href="#"><img src="/img/admindashboard/gotolib_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp도서관 바로가기</a></li>
    <li><a href="/admin/logout"><img src="/img/admindashboard/logout_icon.png" alt="홈 아이콘" class="logout_icon">&nbsp로그아웃</a></li>
  </ul>
</nav>

<div class="header-container">
  <div class="header-title">강릉대학교 통합도서관 관리 시스템</div>
  <div class="search-container">
    <input type="text" class="search-input" placeholder="학생 정보 또는 도서 정보를 입력하세요...">
    <span class="search-icon"><img src="/img/admindashboard/search_icon.png" alt="홈 아이콘" class="logout_icon"></span>  <!-- 검색 아이콘을 입력 박스 안에 위치시키기 -->
  </div>
</div>

<div class="info-box-container">
  <div class="info-box">
    <div class="icon"><img src="/img/admindashboard/currentBook_icon.png" alt="아이콘" class="info_icon"></div>
    <div class="details">
      <div class="title">현재까지 등록된 도서</div>
      <div class="number">12,542</div>
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
    <h2>도서 대여</h2>
    <p>사용자의 학번과 도서 등록코드를 입력해 주세요</p><br>
    <div class="form-group">
      <label for="student-id">학번</label>
      <input type="text" id="student-id" placeholder="ex> 20131122">
    </div>
    <div class="inline-group">
      <div class="form-group">
        <label for="name">이름</label>
        <input type="text" id="name" value="홍길동" disabled>
      </div>
      <div class="form-group">
        <label for="department">단과대학</label>
        <input type="text" id="department" value="공과대학" disabled>
      </div>
      <div class="form-group">
        <label for="major">학과</label>
        <input type="text" id="major" value="소프트웨어학과" disabled>
      </div>
    </div>
    <div class="form-group">
      <label for="available-loans">대출 잔여 수량</label>
      <input type="text" id="available-loans" value="3" disabled>
    </div>
    <div class="form-group">
      <label for="loan-possible">대출 가능 여부</label>
      <input type="text" id="loan-possible" value="불가능" disabled style="border: 1px solid red;">
    </div>
    <div class="form-group">
      <label for="reason">사유</label>
      <input type="text" id="reason" value="연체" disabled>
    </div>
    <div class="inline-group">
      <div class="form-group">
        <label for="book-code">도서 코드</label>
        <input type="text" id="book-code" placeholder="도서 코드를 입력하세요...">
      </div>
      <div class="form-group">
        <label for="book-title">도서명</label>
        <input type="text" id="book-title" value="총균쇠" disabled>
      </div>
    </div>
    <div class="inline-group">
      <div class="form-group">
        <label for="author">저자</label>
        <input type="text" id="author" value="재레드 다이아몬드 지음; 김진준 옮김" disabled>
      </div>
      <div class="form-group">
        <label for="publisher">출판사</label>
        <input type="text" id="publisher" value="문학사상" disabled>
      </div>
      <div class="form-group">
        <label for="publication-year">출판일</label>
        <input type="text" id="publication-year" value="2014" disabled>
      </div>
    </div>
    <div class="inline-group">
      <div class="form-group">
        <label for="start-date">대출 시작일</label>
        <input type="text" id="start-date" value="2024 - 10 - 12" disabled>
      </div>
      <div class="form-group">
        <label for="end-date">대출 종료일</label>
        <input type="text" id="end-date" value="2024 - 10 - 26" disabled>
      </div>
    </div>
    <button class="btn-submit">대출 실행</button>
  </div>

<div class="container">
  <div class="book-return-section">
    <h2>도서 반납</h2>
    <p>사용자의 학번 입력 후 반납할 도서를 체크해 주세요</p>
    <div class="form-group">
      <label for="student-id">학번</label>
      <input type="text" id="student-ids" placeholder="ex> 20131122">
    </div>
    <div class="inline-group">
      <div class="form-group">
        <label for="name">이름</label>
        <input type="text" id="names" value="홍길동" disabled>
      </div>
      <div class="form-group">
        <label for="department">단과대학</label>
        <input type="text" id="departments" value="공과대학" disabled>
      </div>
      <div class="form-group">
        <label for="major">학과</label>
        <input type="text" id="majors" value="소프트웨어학과" disabled>
      </div>
    </div>
    <table class="book-table">
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
      <tr>
        <td><input type="checkbox"></td>
        <td>총균쇠</td>
        <td>재레드 다이아몬드 지음; 김진준 옮김</td>
        <td>문학사상</td>
        <td>2024-10-10 ~ 2024-10-24</td>
        <td>0일</td>
      </tr>
      <tr>
        <td><input type="checkbox"></td>
        <td>코스모스</td>
        <td>칼 세이건</td>
        <td>사이언스북스</td>
        <td>2023-10-24 ~ 2024-10-24</td>
        <td class="overdue">365일</td>
      </tr>
      <tr>
        <td><input type="checkbox"></td>
        <td>종의 기원</td>
        <td>찰스 다윈</td>
        <td>두레</td>
        <td>2024-10-10 ~ 2024-10-24</td>
        <td>0일</td>
      </tr>
      </tbody>
    </table>
    <div class="warning-message">
      <p>반납 실행 전 책을 다시 확인해 주시고 반납해 주시기 바랍니다.</p>
    </div>
    <button class="btn-submit">반납 실행</button>
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
    <button class="btn-submit">제출하기</button>

    <div class="status-message success">연체가 해제 되었습니다.</div>
    <div class="status-message warning">학번을 확인해 주세요.</div>
    <div class="status-message error">연체중이 아닙니다.</div>
  </div>
</div>

</body>
</html>