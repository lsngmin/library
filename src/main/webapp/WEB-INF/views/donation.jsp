<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관 - 도서 기증 신청</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background: #f5f5f5;
            color: #333;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background: #f8f8f8;
            border-bottom: 1px solid #e0e0e0;
        }
        .header-left {
            display: flex;
            align-items: center;
        }
        .header-left img {
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }
        .header-left .title {
            font-size: 22px;
            font-weight: bold;
            color: #333;
            text-decoration: none;
        }
        .header-left .title:hover{
            color:#007bff;
        }
        .header-right {
            display: flex;
            align-items: center;
        }
        .header-right a {
            font-size: 18px;
            text-decoration: none;
            color: #333;
            margin-right: 15px;
        }
        .header-right a:hover {
            color: #007bff;
        }
        .side-nav {
            width: 250px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 60px;
            background: #FFF;
            padding: 20px;
        }
        .nav-item {
            padding: 15px;
            cursor: pointer;
            color: #666;
        }
        .nav-item:hover{
            color:#007bff;
        }
        .main-content {
            margin-left: 270px;
            padding: 40px;
        }
        .section-title {
            font-size: 26px;
            margin-bottom: 30px;
        }
        .donation-info, .form-section {
            background: #f8f8ff;
            padding: 40px;
            border-radius: 8px;
            margin-bottom: 40px;
        }
        .donation-info h3 {
            font-size: 22px;
            margin-top: 30px;
            margin-bottom: 25px;
            line-height: 1.6; /* 줄 간격 추가 */
        }
        .donation-info ul {
            margin-left: 40px;
            list-style-type: disc;
            margin-bottom: 30px; /* 리스트 아래 간격 더 넓게 */
            line-height: 1.8; /* 리스트 항목 간 간격 */
        }
        .procedure img {
            width: 60%;
            height: auto;
            display: block;
            margin: 40px auto;
            border-radius: 8px;
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
        }
        .form-group label {
            width: 150px;
            font-weight: bold;
        }
        .form-group input {
            flex: 1;
            padding: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .button {
            background-color: #007bff;
            color: #fff;
            padding: 15px;
            text-align: center;
            border-radius: 4px;
            cursor: pointer;
            width: 180px;
            margin-top: 20px;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            table-layout: fixed;
        }
        .table th, .table td {
            border: 1px solid #ddd;
            padding: 18px;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap; /* 줄바꿈 방지 */
            overflow: hidden; /* 넘치는 내용 숨기기 */
        }
        .table th {
            background-color: #f0f0f0;
        }
        .table th:nth-child(1) { width: 15%; }  /* 접수 상태 */
        .table th:nth-child(2) { width: 25%; }  /* 도서명 */
        .table th:nth-child(3) { width: 20%; }  /* 저자 */
        .table th:nth-child(4) { width: 20%; }  /* 출판사 */
        .table th:nth-child(5) { width: 15%; }  /* 신청일자 */
        .table th:nth-child(6) { width: 10%; }  /* 취소 */
        .notice {
            color: #ff4d4d;
            margin-bottom: 20px;
        }
        .cancel-btn {
            background-color: #ff6b6b;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 6px 12px;
            cursor: pointer;
            font-size: 14px;
            white-space: nowrap; /* 버튼 내 줄바꿈 방지 */
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .cancel-btn:hover {
            background-color: #ff4d4d;
            transform: translateY(-2px);
        }

        .cancel-btn:active {
            background-color: #cc0000;
            transform: translateY(0);
        }

        .slide-out {
            transform: translateX(-100%);
            opacity: 0;
            transition: transform 0.6s ease-out, opacity 0.6s ease-out;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="header-left">
        <img src="/img/logoImage.png" alt="로고">
        <a href="main" class="title">강릉대학교 통합도서관</a>
    </div>
    <div class="header-right">
        <a href="/myInfo">내정보</a>
        <a href="/logout">로그아웃</a>
    </div>
</div>

<div class="side-nav">
    <div class="nav-item">내정보</div>
    <div class="nav-item">관심도서 목록</div>
    <div class="nav-item">희망도서 신청 내역</div>
    <div class="nav-item active">도서기증 신청</div>
    <div class="nav-item">비밀번호 변경</div>
</div>

<div class="main-content">
    <h2 class="section-title">기증 신청</h2>

    <!-- 기증 안내 -->
    <div class="donation-info">
        <h3>기증대상도서</h3>
        <ul>
            <li>고서 및 귀중도서, 인문과학분야는 5년 이내, 기술과학분야는 3년 이내 발행된 자료</li>
        </ul>
        <h3>기증제한도서</h3>
        <ul>
            <li>발행년도가 오래되고 소장가치가 낮은 참고도서(백과사전, 사전 등)</li>
            <li>잡지, 수험서, 문제집 등</li>
            <li>내용 및 삽화 등에 유해한 도서</li>
        </ul>
        <h3>도서기증절차</h3>
        <div class="procedure">
            <img src="/img/dnImage.png" alt="도서 기증 절차">
        </div>
    </div>

    <!-- 기증자 정보 -->
    <div class="form-section">
        <h3>기증자 정보</h3>
        <p class="notice">* 필수 입력 항목입니다</p>
        <form>
            <div class="form-group"><label>이름*</label><input type="text" required></div>
            <div class="form-group"><label>연락처*</label><input type="text" required></div>
            <div class="form-group"><label>전화번호</label><input type="text"></div>
            <div class="form-group"><label>이메일</label><input type="email"></div>
        </form>
    </div>

    <!-- 기증 내용 및 방법 -->
    <div class="form-section">
        <h3>기증 내용 및 방법</h3>
        <form>
            <div class="form-group"><label>주요 기증분야</label><input type="text" required></div>
            <div class="form-group"><label>도서명*</label><input type="text" required></div>
            <div class="form-group"><label>출판사*</label><input type="text" required></div>
            <div class="form-group"><label>저자*</label><input type="text" required></div>
            <div class="form-group"><label>기증사유</label><input type="text" required></div>
            <button class="button">기증신청</button>
        </form>
    </div>

    <!-- 신청 내역 -->
    <div class="form-section">
        <h3>신청 내역</h3>
        <table class="table">
            <tr><th>접수 상태</th><th>도서명</th><th>저자</th><th>출판사</th><th>신청일자</th><th>취소</th></tr>
            <tr><td>접수 완료</td><td>자바 프로그래밍</td><td>홍길동</td><td>한빛미디어</td><td>2024.10.11</td><td><button class="cancel-btn" onclick="deleteRow(this)">취소</button></td>
            </tr>
        </table>
    </div>
</div>
<script>
    function deleteRow(button) {
        const row = button.parentElement.parentElement;
        row.classList.add("slide-out"); // 슬라이드 아웃 애니메이션 추가
        setTimeout(() => {
            row.remove(); // 애니메이션 후 행 삭제
            alert("신청 내역이 취소되었습니다.");
        }, 600); // 0.6초 후 삭제
    }
</script>
</body>
</html>
