<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background: #FFF;
            color: #333333;
        }

        /* 섹션 스타일 수정 */
        .section-container {
            background: white;
            border-radius: 12px;
            padding: 24px;
            margin-bottom: 32px;
        }

        /* 섹션 제목 원래대로 복구 */
        .section-title {
            font-size: 16px;
            color: #666;
            margin-bottom: 12px;
        }

        /* 사이드 네비게이션 */
        .side-nav {
            width: 250px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background: #FFF;
            padding: 20px;
            border-right: 1px solid #E0E0E0;
        }

        .logo {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 18px;
            color: #333;
        }

        .logo img {
            width: 24px;
            height: 24px;
            margin-right: 8px;
        }

        .nav-item {
            padding: 15px;
            margin-bottom: 5px;
            cursor: pointer;
            border: 1px solid transparent;
            border-radius: 4px;
            font-size: 14px;
            color: #666666;
        }

        .nav-item.active {
            background: white;
            border: 1px solid #E0E0E0;
            color: #333333;
        }

        /* 메인 컨텐츠 */
        .main-content {
            margin-left: 250px;
            padding: 40px;
        }

        .header {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 30px;
        }

        .user-menu {
            color: #666666;
            font-size: 14px;
        }

        .user-menu .separator {
            margin: 0 10px;
            color: #E0E0E0;
        }

        /* 카드 스타일 */
        .card {
            background: white;
            border-radius: 8px;
            padding: 24px;
            margin-bottom: 24px;
            box-shadow: none;
            border: 2px solid #E0E0E0;
            position: relative;
            overflow: hidden;
        }

        /* 사용자 정보 */
        .user-info-grid {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .info-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .info-col {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .info-label {
            font-size: 13px;
            color: #666;
        }

        .info-input {
            width: 100%;
            height: 40px;
            padding: 0 12px;
            border: 1px solid #E0E0E0;
            border-radius: 4px;
            background: #FFF;
        }

        .birth-section {
            display: flex;
            flex-direction: column;
        }

        .birth-inputs {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 8px;
        }

        .birth {
            text-align: center;
        }

        .info-input[readonly] {
            background: white;
            cursor: not-allowed;
        }

        /* 대출 현황 */
        .loan-header {
            display: flex;
            gap: 16px;
            margin-bottom: 20px;
        }

        .loan-info-box {
            background: #F8F8F8;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 13px;
            color: #666;
        }

        .loan-grid {
            display: grid;
            grid-template-columns: repeat(3, 260px);
            gap: 16px;
        }

        .book-section {
            width: 260px;
            min-width: 260px;
            background: #FFFFFF;
            border: 1px solid #E0E0E0;
            border-radius: 8px;
            padding: 24px;
            position: relative;
            min-height: 180px;
            display: flex;
            flex-direction: column;
        }

        .book-content {
            margin-top: 8px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        /* 연체 라벨 수정 */
        .overdue-label {
            position: absolute;
            top: 24px;
            left: 24px;
            background: #FFE7E7;
            color: #FF4444;
            padding: 4px 8px;
            font-size: 12px;
            border-radius: 4px;
            z-index: 1;
        }

        .book-title {
            background: #333;
            color: white;
            padding: 12px;
            font-size: 14px;
            text-align: center;
            border-radius: 6px;
            margin-bottom: 16px;
            margin-top: 24px;
        }

        .book-date {
            background: #4A4A4A;
            color: white;
            padding: 12px;
            font-size: 13px;
            text-align: center;
            border-radius: 6px;
            margin-bottom: 16px;
        }

        .btn-more {
            display: flex;
            align-items: center;
            justify-content: center;
            width: fit-content;
            padding: 6px 12px;
            background: white;
            border: 1px solid #E0E0E0;
            border-radius: 4px;
            color: #666;
            font-size: 13px;
            cursor: pointer;
            margin-left: auto;
            margin-top: auto;
        }

        /* 알림 메시지 수정 */
        .loan-notification {
            position: absolute;
            top: 24px;
            right: 24px;
            background: #E7E7FF;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 13px;
            color: #4444FF;
            display: none;
            z-index: 10;
            align-items: center;
            gap: 12px;
        }

        .notification-close {
            cursor: pointer;
            border: none;
            background: none;
            color: #4444FF;
            font-size: 12px;
            padding: 4px;
        }

        .notification-close:hover {
            color: #3333CC;
        }

        /* 검색 영역 */
        .search-area {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .date-input {
            width: 140px;
        }

        .search-btn {
            width: 60px;
            padding: 0;
        }

        .button-group {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .grid-wrapper {
            overflow-x: auto;
        }
    </style>
</head>
<body>
<div class="side-nav">
    <div class="logo">
        <img src="logo.png" alt="로고">
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

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // 네비게이션 아이템 클릭 이벤트
        const navItems = document.querySelectorAll('.nav-item');
        navItems.forEach(item => {
            item.addEventListener('click', function () {
                navItems.forEach(i => i.classList.remove('active'));
                this.classList.add('active');
            });
        });

        // 더 읽을래요 버튼 클릭 시 알림 표시
        document.querySelectorAll('.btn-more').forEach(btn => {
            btn.addEventListener('click', function () {
                const notification = document.querySelector('.loan-notification');
                // 기존 타이머가 있다면 제거
                if (this.notificationTimer) {
                    clearTimeout(this.notificationTimer);
                }
                notification.style.display = 'flex';
                // 3초 후 자동으로 사라지도록 설정
                this.notificationTimer = setTimeout(() => {
                    notification.style.display = 'none';
                }, 3000);
            });
        });
    });

    // 알림 닫기 함수
    function closeNotification() {
        const notification = document.querySelector('.loan-notification');
        notification.style.display = 'none';
    }
</script>
</body>
</html>