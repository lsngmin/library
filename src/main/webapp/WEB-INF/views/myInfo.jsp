<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet"  href="/resources/css/myInfo.css">
    <script src="myInfo.js"></script>
</head>
<body>
<div class="side-nav">
    <div class="logo">
        <img src="img/logoImage.png" alt="로고">
        강릉대학교 통합도서관
    </div>
    <div class="nav-item active">내정보</div>
    <div class="nav-item">관심도서 목록</div>
    <div class="nav-item">도서기증 신청</div>
    <div class="nav-item">비밀번호 변경</div>
</div>

<div class="main-content">
    <div class="header">
        <div class="user-menu">
            <span>내정보</span>
            <span class="separator">|</span>
            <a href="#" style="color: #666666; text-decoration: none;">로그아웃</a>
        </div>
    </div>

    <!-- 사용자 정보 섹션 -->
    <div class="section-container">
        <div class="section-title">사용자 정보</div>
        <div class="card">
            <div class="user-info-grid">
                <div class="info-row">
                    <div class="info-col">
                        <label class="info-label">이름</label>
                        <input type="text" class="info-input" value="${user.name}" readonly>
                    </div>
                    <div class="info-col">
                        <label class="info-label">학번</label>
                        <input type="text" class="info-input" value="${user.userId}" readonly>
                    </div>
                </div>
                <div class="info-row">
                    <div class="info-col birth-section">
                        <label class="info-label">생년월일</label>
                        <div class="birth-inputs">
                            <input type="text" class="info-input birth" value="${user.birth}" readonly>
                            <input type="text" class="info-input birth" value="99" readonly>
                            <input type="text" class="info-input birth" value="9999" readonly>
                        </div>
                    </div>
                    <div class="info-col">
                        <label class="info-label">소속대학</label>
                        <input type="text" class="info-input" value="{user.}" readonly>
                    </div>
                </div>
                <div class="info-row">
                    <div class="info-col">
                        <label class="info-label">전화번호</label>
                        <input type="text" class="info-input" value="${user.phone}" style="color: #FF4444;">
                    </div>
                    <div class="info-col">
                        <label class="info-label">소속학과</label>
                        <input type="text" class="info-input" value="소프트웨어학과" readonly>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 대출 현황 섹션 -->
    <div class="section-container">
        <div class="section-title">대출 현황</div>
        <div class="card">
            <div class="loan-header">
                <div class="loan-info-box">대출 잔여 수량: 0권</div>
                <div class="loan-info-box">연체 경과일: 17일</div>
            </div>
            <div class="loan-notification">
                <span>해당 도서의 연장 신청이 반영되었습니다.</span>
                <button class="notification-close" onclick="closeNotification()">✕</button>
            </div>
            <div class="grid-wrapper">
                <div class="loan-grid">
                    <div class="book-section">
                        <div class="book-content">
                            <div class="book-title">물리학I</div>
                            <div class="book-date">2024-10-11 ~ 2024-10-25</div>
                        </div>
                        <button class="btn-more">더 읽을래요 →</button>
                    </div>
                    <div class="book-section">
                        <div class="book-content">
                            <div class="book-title">코스모스</div>
                            <div class="book-date">2024-10-01 ~ 2024-10-15</div>
                        </div>
                        <button class="btn-more">더 읽을래요 →</button>
                    </div>
                    <div class="book-section overdue">
                        <div class="overdue-label">연체</div>
                        <div class="book-content">
                            <div class="book-title">미적분 정리집</div>
                            <div class="book-date">2024-09-10 ~ 2024-09-24</div>
                        </div>
                        <button class="btn-more">더 읽을래요 →</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 대출/반납 이력 섹션 -->
    <div class="section-container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px;">
            <div class="section-title" style="margin-bottom: 0;">대출/반납 이력</div>
            <div class="search-area" style="margin: 0;">
                <input type="date" class="info-input date-input" value="2024-10-11">
                <span style="color: #666;">~</span>
                <input type="date" class="info-input date-input" value="2024-10-25">
                <button class="info-input" style="width: 60px; background: white; cursor: pointer;">조회</button>
            </div>
        </div>

        <div class="card">
            <div class="loan-header">
                <div class="loan-info-box">검색결과: 2권</div>
            </div>
            <div class="grid-wrapper">
                <div class="loan-grid">
                    <div class="book-section">
                        <div class="book-content">
                            <div class="book-title">물리학I</div>
                            <div class="book-date">2024-10-11 ~ 2024-10-25</div>
                        </div>
                        <div style="display: flex; gap: 8px; margin-top: auto;">
                            <button class="btn-more" style="margin-left: 0; flex: 1; background: #4CAF50; color: white; border: none;">관심도서담기</button>
                            <button class="btn-more" style="flex: 1; background: #9E9E9E; color: white; border: none;">도서 상세보기</button>
                        </div>
                    </div>
                    <div class="book-section">
                        <div class="book-content">
                            <div class="book-title">코스모스</div>
                            <div class="book-date">2024-10-11 ~ 2024-10-25</div>
                        </div>
                        <div style="display: flex; gap: 8px; margin-top: auto;">
                            <button class="btn-more" style="margin-left: 0; flex: 1; background: #4CAF50; color: white; border: none;">관심도서담기</button>
                            <button class="btn-more" style="flex: 1; background: #9E9E9E; color: white; border: none;">도서 상세보기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>