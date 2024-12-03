<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강릉대학교 통합도서관 - 희망도서 신청</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #fff;
            display: flex;
        }


        .main-container {
            display: flex;
            gap: 20px;
            max-width: 1200px;
            margin: 20px auto;

        }

        .sidebar {
            width: 250px;
            background: #fff;
            border-right: 1px solid #e0e0e0;
            padding: 20px;
            height: 100vh;
        }

        .sidebar .nav-item {
            padding: 15px;
            margin-bottom: 10px;
            font-size: 16px;
            text-align: left;
            cursor: pointer;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #666;
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar .nav-item:hover {
            color: #007bff;
        }

        .sidebar .nav-item.active {
            border: 1px solid #e0e0e0;
            background: #f9f9f9;
            color: #333;
        }

        .content {
            flex: 1;
            padding: 40px;
        }

        .content h2 {
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }

        .phone-buttons {
            margin-top: 20px;
        }

        .phone-buttons button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }

        .phone-buttons button[type="submit"] {
            background-color: #007bff;
            color: #fff;
        }

        .phone-buttons button[type="reset"] {
            background-color: #ccc;
        }

        .phone-buttons button:hover {
            opacity: 0.9;
        }

        .guide-container {
            margin-top: 30px;
            line-height: 1.8; /* 텍스트 간격 조정 */
        }

        .guide-container h4 {
            margin-bottom: 10px; /* 소제목 간격 */
        }

        .guide-container p {
            margin-bottom: 15px; /* 문단 간격 */
        }

        .guide-container ul {
            margin-top: 10px;
            margin-bottom: 20px;
            padding-left: 20px; /* 리스트 안쪽 간격 */
        }

        .guide-container ul li {
            margin-bottom: 10px; /* 리스트 항목 간격 */
        }

        .guide-container img {
            margin-top: 20px;
            max-width: 100%;
            height: auto;
            display: block;
        }

        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                align-items: flex-start;
                padding: 15px;
            }

            .login-container {
                margin-top: 10px;
            }

            .main-container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                height: auto;
                padding: 10px;
                border-right: none;
                border-bottom: 1px solid #e0e0e0;
            }

            .sidebar .nav-item {
                padding: 10px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<div class="main-container">
    <jsp:include page="libraryNavbar.jsp"/>
    <div class="content">
        <h2>희망도서 신청</h2>
        <section class="request-container">
            <p style="color: red; font-weight: bold; font-size: 16px; margin-top: 0;">*표시는 필수 입력 사항입니다.</p>
            <form method="post" action="requestBook" id="requestForm">
                <div class="form-group">
                    <label for="book-title">신청자료명(<span class="required">*</span>)</label>
                    <input type="text" id="book-title" name="book-title">
                    <div class="error-message" id="title-error">신청자료명을 입력해주세요.</div>
                </div>
                <div class="form-group">
                    <label for="author">저자(<span class="required">*</span>)</label>
                    <input type="text" id="author" name="author">
                    <div class="error-message" id="author-error">저자를 입력해주세요.</div>
                </div>
                <div class="form-group">
                    <label for="publisher">출판사(<span class="required">*</span>)</label>
                    <input type="text" id="publisher" name="publisher">
                    <div class="error-message" id="publisher-error">출판사를 입력해주세요.</div>
                </div>
                <div class="form-group">
                    <label for="publishday">발행년도</label>
                    <input type="text" id="publishday" name="publishday">
                </div>
                <div class="form-group">
                    <label for="price">가격</label>
                    <input type="text" id="price" name="price">
                </div>
                <div class="form-group">
                    <label for="name">신청자 이름</label>
                    <input type="text" id="name" name="name">
                </div>
                <div class="form-group">
                    <label for="number">휴대폰 번호</label>
                    <input type="text" id="number" name="number">
                </div>

                <div class="phone-buttons">
                    <button type="submit">신청</button>
                    <button type="button" onclick="location.href='main'">취소</button>
                </div>
            </form>
        </section>

        <h3>신청안내</h3>
        <section class="guide-container">
            <h4>희망도서 신청 개요</h4>
            <p><strong>신청대상:</strong> 도서관 회원증을 발급받은 회원만 신청이 가능합니다.</p>
            <p><strong>신청조건:</strong> 1인당 월 3권, 1년에 15권으로 제한</p>
            <h4>희망도서 구입 제외 대상</h4>
            <ul>
                <li>5만원 이상 고가도서 (미술, 음악, 전문도서 등과 같은 고가도서)</li>
                <li>도서 정보가 불분명한 도서 (제목, 저자명, 출판사명 등)</li>
                <li>문제집, 수험서, 참고서, 원서 및 해외배송 도서</li>
                <li>판타지, 로맨스, 무협지, 인터넷 소설, 만화(학습만화 제외) 등 도서관 소장 도서로서의 질이 보장되지 않은 도서</li>
                <li>건전한 생활태도, 미풍양속, 정서에 문제를 유발할 수 있는 유해도서 (선정적인 자료, 음란서적, 폭력물, 사행성 조장 자료 등)</li>
                <li>품절 및 절판도서, 희귀도서</li>
            </ul>

            <h4>희망도서 신청 시 유의사항</h4>
            <ul>
                <li>도서 신청 전 도서관에서 소장하고 있는지 확인해 주시기 바랍니다.</li>
                <li>정확한 업무 처리를 위해 도서 제목, 저자, 출판사 등을 정확히 기재해 주시기 바랍니다.</li>
            </ul>

            <h4>희망도서 진행 절차</h4>
            <p>신청한 도서가 선정 절차를 거쳐 구입되어 이용되기까지는 2~3주 간의 기간이 소요됩니다.</p>
            <img src="img/delivery.png" alt="희망도서 진행 절차 이미지" class="process-image">
        </section>
    </div>
</div>
<script>
    document.getElementById('requestForm').addEventListener('submit', function (event) {
        let isValid = true;

        const titleField = document.getElementById('book-title');
        const authorField = document.getElementById('author');
        const publisherField = document.getElementById('publisher');

        // Title validation
        if (!titleField.value.trim()) {
            document.getElementById('title-error').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('title-error').style.display = 'none';
        }

        // Author validation
        if (!authorField.value.trim()) {
            document.getElementById('author-error').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('author-error').style.display = 'none';
        }

        // Publisher validation
        if (!publisherField.value.trim()) {
            document.getElementById('publisher-error').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('publisher-error').style.display = 'none';
        }

        // If validation fails, prevent form submission
        if (!isValid) {
            event.preventDefault();
        }
    });
    document.getElementById('cancelButton').addEventListener('click', function() {
        window.location.href = 'main';
    });
</script>
</body>
</html>

