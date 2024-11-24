<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet" href="/resources/css/myinfo/dontaion.css">

</head>
<body>
<jsp:include page="myinfoNavBar.jsp"/>
<div class="main-content">
    <jsp:include page="myinfoHeader.jsp"/>
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
        <h3>기증 신청서</h3>
        <p class="notice">* 필수 입력 항목입니다</p>
        <form action="/submitDonation" method="post"> <!-- 수정된 부분: 하나의 form으로 통합 -->
            <!-- 기증자 정보 -->
            <div class="form-group"><label>이름*</label><input type="text" name="donationUserName" required></div>
            <div class="form-group"><label>연락처*</label><input type="text" name="donationUserPhone" required></div>
            <div class="form-group"><label>전화번호</label><input type="text" name="donationUserTel"></div>
            <div class="form-group"><label>이메일</label><input type="email" name="donationUserEmail"></div>

            <!-- 기증 내용 -->
            <div class="form-group"><label>주요 기증분야</label><input type="text" name="donationCategory" required></div>
            <div class="form-group"><label>도서명*</label><input type="text" name="donationBookName" required></div>
            <div class="form-group"><label>출판사*</label><input type="text" name="donationBookPublisher" required></div>
            <div class="form-group"><label>저자*</label><input type="text" name="donationBookAuthor" required></div>
            <div class="form-group"><label>기증사유</label><input type="text" name="donationReason"></div>

            <button type="submit" class="button">기증 내용 저장</button> <!-- 버튼 하나로 통합 -->
        </form>
    </div>

    <!-- 신청 내역 -->
    <div class="form-section">
        <h3>기증 신청 내역</h3>
        <table class="table">
            <thead>
            <tr>
                <th>접수 상태</th>
                <th>도서명</th>
                <th>저자</th>
                <th>출판사</th>
                <th>신청일자</th>
                <th>취소</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="donation" items="${donationList}"> <!-- 수정된 부분 -->
                <tr>
                    <td>접수 완료</td>
                    <td>${donation.donationBookName}</td>
                    <td>${donation.donationBookAuthor}</td>
                    <td>${donation.donationBookPublisher}</td>
                    <td>${donation.donationDate}</td>
                    <td>
                        <button class="cancel-btn" onclick="deleteRow(this)">취소</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<c:if test="${not empty success}">
    <input type="hidden" id="successMessage" value="${success}" />
</c:if>

<script>
    function deleteRow(button) {
        const row = button.parentElement.parentElement;
        row.classList.add("slide-out"); // 슬라이드 아웃 애니메이션 추가
        setTimeout(() => {
            row.remove(); // 애니메이션 후 행 삭제
            alert("신청 내역이 취소되었습니다.");
        }, 600); // 0.6초 후 삭제
    }

    document.addEventListener("DOMContentLoaded", () => {
        const successMessageElement = document.getElementById("successMessage");

        if (successMessageElement) {
            const message = successMessageElement.value;
            alert(message); // 성공 메시지를 알림으로 표시

            // 알림 후 리다이렉트
            window.location.href = "/donation"; // 원하는 리다이렉트 경로로 변경하세요
        }
    });
</script>
</body>
</html>