<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>강릉대학교 통합도서관 관리 시스템</title>
    <style>
        /* 기존 스타일 유지 */
        * { box-sizing: border-box; }
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        /* 네비게이션 및 헤더 스타일 유지 */
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
        }

        /* 학생 정보 그리드 스타일 */
        .content-wrapper {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            border-radius: 8px;
        }

        .page-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 8px;
        }

        .page-subtitle {
            color: #666;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .student-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            padding: 20px 0;
        }

        .student-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            text-align: center;
        }

        .profile-image {
            width: 80px;
            height: 80px;
            border-radius: 10px; /* 사각형 모서리를 약간만 둥글게 */
            background-color: #eee;
            margin-bottom: 8px;
            object-fit: cover;
        }

        .student-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            background: white;
            text-align: center;
            transition: all 0.2s ease;
        }

        .student-card.highlighted {
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(108, 39, 192, 0.15);
            /* border: 1px solid #6c27c0; 이 줄을 제거하면 보라색 테두리가 사라집니다 */
        }

        .profile-image {
            width: 80px;
            height: 80px;
            margin-bottom: 8px;
            background: none;
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .student-name {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 4px;
        }

        .student-college {
            font-size: 12px;
            color: #666;
        }

        .student-department {
            color: #6c27c0;
            font-size: 12px;
            margin-bottom: 8px;
        }

        /* 페이지네이션 컨테이너 수정 */
        .pagination-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            padding: 0 10px;
        }

        .page-info {
            color: #666;
            font-size: 14px;
        }

        .pagination {
            display: flex;
            gap: 4px;
        }

        .page-item {
            min-width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #ddd;
            border-radius: 4px;
            color: #333;
            cursor: pointer;
            text-decoration: none;
        }

        .page-item.active {
            background-color: #6c27c0;
            color: white;
            border-color: #6c27c0;
        }

        /* 학생 상세 정보 섹션 스타일 */
        .student-detail-section {
            background: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
        }

        .detail-header {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .detail-subtitle {
            color: #666;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .detail-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 20px;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .detail-label {
            font-size: 14px;
            color: #333;
        }

        .detail-input {
            padding: 8px 12px;
            background-color: #f0f0f0;
            border: none;
            border-radius: 4px;
            font-size: 14px;
        }

        .loan-history-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .loan-history-table th {
            background-color: #f0f0f0;
            padding: 12px;
            text-align: left;
            font-weight: normal;
        }

        .loan-history-table td {
            padding: 12px;
            border-bottom: 1px solid #eee;
        }

        .detail-grid.two-columns { grid-template-columns: repeat(2, 1fr); }
        .detail-grid.three-columns { grid-template-columns: repeat(3, 1fr); }

        .detail-input {
            background-color: #f0f0f0;
            padding: 8px 12px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            width: 100%;
        }

        .status-tag {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            text-align: center;
        }

        .status-overdue {
            background-color: #ffe5e5;
            color: #ff4646;
        }

        .status-completed {
            background-color: #e5ffe7;
            color: #28a745;
        }

        .status-extended {
            background-color: #e5f6ff;
            color: #0088cc;
        }

        .student-id,
        .student-phone {
            width: 100%;
            text-align: left;
            padding-left: 10px;
            font-size: 12px;
            color: #666;
            margin: 2px 0;
        }

        .student-id::before {
            content: "ID";
            color: #6c27c0;
            margin-right: 4px;
        }

        .student-phone::before {
            content: "☎";
            margin-right: 4px;
        }


        .content-section {
            background: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .detail-section {
            margin-bottom: 20px;
        }

        .list-section {
            background: white;
        }

        /* 섹션 스타일 추가 */
        .section {
            background: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }

        .book-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .book-table th, .book-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .book-table th {
            background-color: #f5f5f5;
            font-weight: 600;
        }

        .book-table tbody tr:hover {
            background-color: #f9f9f9;
        }

    </style>
</head>
<body>
<%--<div class="top-section">--%>
<%--    <div class="top-nav">--%>
<%--        <div class="nav-buttons">--%>
<%--            <a href="/admin/rl" class="nav-button">홈</a>--%>
<%--            <a href="/admin/bookregister" class="nav-button">도서 등록</a>--%>
<%--            <a href="/admin/bookinquiry" class="nav-button">도서 정보</a>--%>
<%--            <a href="/admin/userinfo" class="nav-button">학생 정보</a>--%>
<%--            <a href="#" class="nav-button">희망/기증 도서 신청 목록</a>--%>
<%--        </div>--%>
<%--        <div class="nav-right">--%>
<%--            <a href="#" class="nav-button">도서관 바로가기</a>--%>
<%--            <a href="#" class="nav-button">로그아웃</a>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="main-header">--%>
<%--        <div class="header">--%>
<%--            <h1>강릉대학교 통합도서관 관리 시스템</h1>--%>
<%--            <div class="search-bar">--%>
<%--                <input type="text" placeholder="학생 이름 또는 학번 입력" value="${keyword}">--%>
<%--                <span class="search-icon">🔍</span>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<jsp:include page="adminHeader.jsp"/>
<div class="section">
    <!-- 학생 상세 정보 섹션 -->
    <div id="studentDetailSection" style="display: none;">
        <h2 class="detail-header">학생 상세 정보</h2>
        <p class="detail-subtitle">비밀번호는 표시되지 않습니다.</p>

        <div class="detail-grid two-columns">
            <div class="detail-item">
                <div class="detail-label">학번</div>
                <input type="text" class="detail-input" value="" readonly>
            </div>
            <div class="detail-item">
                <div class="detail-label">전화번호</div>
                <input type="text" class="detail-input" value="" readonly>
            </div>
        </div>

        <div class="detail-grid three-columns">
            <div class="detail-item">
                <div class="detail-label">이름</div>
                <input type="text" class="detail-input" value="" readonly>
            </div>
            <div class="detail-item">
                <div class="detail-label">단과대학</div>
                <input type="text" class="detail-input" value="" readonly>
            </div>
            <div class="detail-item">
                <div class="detail-label">학과</div>
                <input type="text" class="detail-input" value="" readonly>
            </div>
        </div>

        <div class="detail-grid two-columns">
            <div class="detail-item">
                <div class="detail-label">대출 진행 수량</div>
                <input type="text" class="detail-input" value="" readonly>
            </div>
            <div class="detail-item">
                <div class="detail-label">대출 가능 여부</div>
                <input type="text" class="detail-input" value="" readonly>
            </div>
        </div>

        <div class="detail-grid three-columns">
            <div class="detail-item">
                <div class="detail-label">상태</div>
                <input type="text" class="detail-input" value="" readonly>
            </div>
            <div class="detail-item">
                <div class="detail-label">경과일</div>
                <input type="text" class="detail-input" value="" readonly>
            </div>
            <div class="detail-item">
                <div class="detail-label">대출 코드</div>
                <input type="text" class="detail-input" value="" readonly>
            </div>
        </div>

        <div class="book-return-section">
            <table class="book-table" id="rentalTable">
                <thead>
                <tr>
                    <th>대출코드</th>
                    <th>도서명</th>
                    <th>기간</th>
                    <th>상태</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="section">
    <div>
        <h2 class="page-title">학생 정보</h2>
        <p class="page-subtitle">특정 학생을 검색하기 위해서 우측 상단의 검색을 이용해 주세요</p>

        <div class="student-grid">
            <c:forEach items="${users}" var="user">
                <div class="student-card" data-userid="${user.userId}">
                    <div class="profile-image">
                        <img src="/resources/img/admindashboard/userdefaultimg.png" alt="프로필">
                    </div>
                    <div class="student-name">${user.name}</div>
                    <div class="student-college">${user.colleges}</div>
                    <div class="student-department">${user.departments}</div>
                    <div class="student-id">${user.userId}</div>
                    <div class="student-phone">${user.phone}</div>
                </div>
            </c:forEach>
        </div>

        <div class="pagination-container">
            <div class="page-info">
                Showing ${(currentPage-1)*10 + 1}-${currentPage*10 > totalUsers ? totalUsers : currentPage*10} from ${totalUsers} data
            </div>
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="?page=${currentPage-1}" class="page-item">◀</a>
                </c:if>

                <c:forEach begin="1" end="${totalPages}" var="i">
                    <a href="?page=${i}" class="page-item ${currentPage == i ? 'active' : ''}">${i}</a>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <a href="?page=${currentPage+1}" class="page-item">▶</a>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.student-card').forEach(card => {
            card.addEventListener('click', function() {
                document.querySelectorAll('.student-card.highlighted').forEach(selected => {
                    selected.classList.remove('highlighted');
                });
                this.classList.add('highlighted');

                const userId = this.dataset.userid;

                Promise.all([
                    fetch('/admin/userinfo/detail?userId=' + userId).then(r => r.json()),
                    fetch('/admin/userRentalList', {
                        method: 'POST',
                        headers: {'Content-Type': 'application/json'},
                        body: JSON.stringify({userId: userId})
                    }).then(r => r.json())
                ]).then(([userData, rentalData]) => {
                    const detailSection = document.getElementById('studentDetailSection');
                    const inputs = detailSection.querySelectorAll('.detail-input');

                    inputs[0].value = userData.userId;
                    inputs[1].value = userData.phone || '-';
                    inputs[2].value = userData.name || '-';
                    inputs[3].value = userData.colleges || '-';
                    inputs[4].value = userData.departments || '-';
                    inputs[5].value = userData.rentalAvailable || '0';
                    inputs[6].value = userData.rentalAvailable == "3" ? "가능" : "불가능";
                    inputs[7].value = userData.status == "1" ? "정상" : "연체중";
                    inputs[8].value = userData.reason || '-';
                    inputs[9].value = '-';

                    const tbody = document.querySelector('#rentalTable tbody');
                    tbody.innerHTML = '';

                    if (rentalData && rentalData.length > 0) {
                        rentalData.forEach(rental => {
                            let status = '정상';
                            let statusClass = 'status-completed';

                            if (rental.status === '0') {
                                status = '연체';
                                statusClass = 'status-overdue';
                            } else if (rental.status === '2') {
                                status = '연장';
                                statusClass = 'status-extended';
                            }

                            tbody.innerHTML +=
                                '<tr>' +
                                '<td>' + rental.rentalCode + '</td>' +
                                '<td>' + rental.bookName + '</td>' +
                                '<td>' + rental.rentalStartDate + ' ~ ' + rental.rentalEndDate + '</td>' +
                                '<td><span class="status-tag ' + statusClass + '">' + status + '</span></td>' +
                                '</tr>';
                        });
                    }

                    detailSection.style.display = 'block';
                });
            });
        });
    });

        // 검색 기능
        document.querySelector('.search-icon').addEventListener('click', function() {
            const keyword = document.querySelector('.search-bar input').value;
            if (keyword.trim()) {
                const encodedKeyword = encodeURIComponent(keyword);
                window.location.href = '${pageContext.request.contextPath}/admin/userinfo/search?keyword=' + encodedKeyword;
            }
        });

        // 검색 엔터키 이벤트
        document.querySelector('.search-bar input').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                const keyword = this.value;
                if (keyword.trim()) {
                    const encodedKeyword = encodeURIComponent(keyword);
                    window.location.href = '${pageContext.request.contextPath}/admin/userinfo/search?keyword=' + encodedKeyword;
                }
            }
        });
</script>
</body>
</html>