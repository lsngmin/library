<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet"  href="/resources/css/library/booketails.css"> <!-- 외부 CSS 파일 링크 -->
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