<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강릉대학교 통합도서관</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #fff;
            border-bottom: 1px solid #ddd;
        }

        .logo-container {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .logo-container img {
            height: 50px;
        }

        .header-title {
            margin: 0;
            font-size: 20px;
            font-weight: bold;
            color: #333;
            cursor: pointer;
        }

        .header-title a {
            text-decoration: none;
            color: inherit;
        }

        .login-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .login-container img {
            height: 30px;
        }

        .login-container a {
            text-decoration: none;
            font-size: 16px;
            color: #000;
        }

        .main-container {
            display: flex;
            gap: 20px;
            max-width: 1200px;
            margin: 20px auto;
        }

        .sidebar {
            width: 220px;
            flex-shrink: 0;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 15px;
        }

        .sidebar-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 15px;
            padding: 10px;
            background-color: #eee;
            text-align: center;
            border-radius: 4px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar ul li {
            margin: 15px 0;
            display: flex;
            align-items: center;
        }

        .sidebar ul li.active {
            font-weight: bold;
            color: #007bff;
        }

        .sidebar ul li.active:before {
            content: "◆";
            color: #007bff;
            margin-right: 8px;
        }

        .sidebar ul li:before {
            content: "◆";
            color: #ccc;
            margin-right: 8px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #333;
        }

        .content {
            flex-grow: 1;
            padding-left: 20px;
        }

        .search-header {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .search-container {
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .search-container form {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .search-container input[type="text"] {
            flex-grow: 1;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .search-container button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .search-filters {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .results-summary {
            font-size: 14px;
            margin-top: 10px;
            color: #555;
        }

        .results-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .result-item {
            margin-bottom: 20px;
            display: flex;
            gap: 15px;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .result-item:last-child {
            border-bottom: none;
        }

        .result-item img {
            width: 180px;
            height: 230px;
            object-fit: cover;
            border-radius: 4px;
        }

        .result-details {
            flex-grow: 1;
        }

        .result-details h4 {
            margin: 0;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .result-details .subject {
            font-size: 14px;
            color: #007bff;
            margin: 5px 0;
        }

        .result-actions {
            margin-top: 10px;
        }
        .book-introduction {
            margin-top: 20px;
            padding: 15px;
            background-color: #f4f4f4;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
        }

        .book-introduction h4 {
            margin: 0 0 10px 0;
            font-size: 18px;
            color: #333;
        }

        .book-introduction p {
            margin: 0;
            font-size: 14px;
            color: #555;
            line-height: 1.6;
        }
        .book-location {
            margin-top: 20px;
            padding: 15px;
            background-color: #f0f8ff;
            border-left: 4px solid #007bff;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
        }

        .book-location h4 {
            margin: 0 0 10px 0;
            font-size: 18px;
            color: #333;
        }

        .book-location p {
            margin: 0;
            font-size: 14px;
            color: #555;
            line-height: 1.6;
        }
        .results-container {
            position: relative;
            padding-bottom: 60px; /* 버튼이 아래로 내려가도 콘텐츠와 겹치지 않도록 공간 확보 */
        }

        .list-button-container {
            position: absolute;
            bottom: 5px; /* 컨테이너 아래로부터 간격 */
            left: 50%; /* 중앙 정렬 */
            transform: translateX(-50%); /* 버튼을 정확히 중앙에 위치 */
        }

        .list-button {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .list-button:hover {
            background-color: #0056b3;
        }
        .result-details p {
            margin: 5px 0;
            font-size: 20px; /* 모든 텍스트 크기 기본값 */
            color: #333;
        }

        .result-details p.book-title {
            font-size: 30px; /* 도서명 크기 */
            font-weight: bold;
            color: #000;
        }

        .result-details p.author,
        .result-details p.publication,
        .result-details p.media,
        .result-details p.price,
        .result-details p.category {
            font-size: 30px; /* 저자, 발행사항, 매체구분, 가격, 분류 크기 */
            font-weight: normal;
            color: #444;
        }


        .button-container button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .interest-btn {
            background-color: #28a745; /* 초록색 버튼 */
            color: #fff;
        }

        .list-btn {
            background-color: #007bff; /* 파란색 버튼 */
            color: #fff;
        }

        .button-container button:hover {
            opacity: 0.9; /* 호버 시 약간 어둡게 */
        }


        .list-button-container {
            text-align: center;
            margin-top: 20px;
        }

        .list-button {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .list-button:hover {
            background-color: #0056b3;
        }
        .collection-info-container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-top: 20px;
        }

        .collection-info-container p {
            margin-bottom: 10px;
            font-size: 16px;
            color: #333;
        }

        .button-container {
            display: flex; /* 버튼들을 플렉스 박스 형태로 배치 */
            justify-content: center; /* 가로 중앙 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
            gap: 15px; /* 버튼 간 간격 */
            margin-top: 20px; /* 버튼 상단 여백 */
        }

        .button-container button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .interest-btn {
            background-color: #28a745; /* 초록색 버튼 */
            color: #fff;
        }

        .list-btn {
            background-color: #007bff; /* 파란색 버튼 */
            color: #fff;
        }

        .button-container button:hover {
            opacity: 0.9; /* 호버 시 약간 어두워짐 */
        }
        .thumbnail-img {
            width: 30px;
            height: 30px;
            margin-right: 10px; /* 버튼과 이미지 사이 간격 */
        }
        .book-image {
            display: block;
            max-width: 100%; /* 이미지가 컨테이너 크기를 넘지 않도록 설정 */
            height: auto; /* 이미지 비율 유지 */
            margin: 10px auto; /* 상하 간격 및 중앙 정렬 */
            border-radius: 8px; /* 둥근 모서리 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }

    </style>

</head>
<body>
<header>
    <div class="logo-container">
        <img src="img/logoImage.png" alt="강릉대학교 로고">
        <h1 class="header-title"><a href="main">강릉대학교 통합도서관</a></h1>
    </div>
    <div class="login-container">
        <img src="img/userImage.png" alt="사용자 아이콘">
        <a href="login">로그인</a>
    </div>
</header>

<div class="main-container">
    <aside class="sidebar">
        <div class="sidebar-title">자료검색</div>
        <ul>
            <li class="active"><a href="#">통합검색</a></li>
            <li><a href="#">희망도서</a></li>
            <li><a href="#">인기도서</a></li>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">이용사항</a></li>
        </ul>
    </aside>
    <section class="results-container">
        <div class="result-item">
            <img src="img/gun.png" alt="gun">
            <div class="result-details">
                <p class="subject">사회과학</p>
                <p>도서명: 총균쇠</p>
                <p>저자: 재레드 다이아몬드</p>
                <p>발행사항: 문학사상, 2014</p>
                <p>매체구분: 인쇄자료</p>
                <p>발행년: 2014</p>
                <p>가격:17,000원</p>
            </div>
        </div>
        <!-- 책 소개문 컨테이너 -->
        <div class="book-introduction">
            <h4>도서 소개</h4>
            <p>
                인류문명의 불균형은 총, 균, 쇠 때문이다! 퓰리처상을 수상한 세계적 석학 <strong>재레드 다이아몬드</strong> 박사의
                『총, 균, 쇠』. 2005년의 개정판을 다시 개정 출간한 것으로, 기존의 32컷의 사진에서 18컷을 추가한 총 50컷의 사진이 수록되어 있다.
            </p>
            <p>
                ‘왜 어떤 민족들은 다른 민족들의 정복과 지배의 대상으로 전락하고 말았는가?’,
                ‘왜 각 대륙들마다 문명의 발달 속도에 차이가 생겨났는가?’,
                ‘인간 사회의 다양한 문명은 어디에서 비롯되었는가?’라는 의문을 명쾌하게 분석하여 그 해답을 제시한다.
            </p>
            <p>
                이 책은 모든 인류가 수렵과 채집으로 살아가던 1만 3천 년 전 석기시대로 거슬러 올라간다.
                저자는 제국, 지역, 문자, 농작물, 총의 기원뿐만 아니라 각 대륙의 인류 사회가
                각기 다른 발전의 길을 걷게 된 원인을 설득력 있게 설명함으로써,
                역사에 대한 인종주의적 이론의 허구를 벗겨낸다.
                뉴기니와 아메리카 원주민에서부터 현대 유럽인과 일본인에 이르기까지,
                세계 각지의 인간 생활에 관한 이야기를 흥미진진하게 풀어낸다.
            </p>
        </div>
        <!-- 소장정보(자료 위치) 컨테이너 -->
        <div class="book-location">
            <h4>소장 정보</h4>
            <p>
                <strong>자료 위치:</strong> 중앙도서관 3층 사회과학 자료실<br>
                <strong>등록 번호:</strong> EM0000026766<br>
                <strong>도서 상태:</strong> 대출 가능
            </p>
        </div>
        <div class="button-container">
            <button class="interest-btn">관심도서</button>
            <button class="list-btn">목록</button>
        </div>
    </section>
</div>
</body>
</html>