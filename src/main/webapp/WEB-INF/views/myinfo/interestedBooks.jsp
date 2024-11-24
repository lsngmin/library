<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet" href="/resources/css/myinfo/interestedBooks.css?after">
</head>
<body>
<jsp:include page="myinfoNavBar.jsp"/>
<div class="main-content">
    <jsp:include page="myinfoHeader.jsp"/>
    <main class="content">
        <h2 class="page-title">관심도서</h2>
        <div class="book-count-box">총 2권</div>

        <div class="sort-container">
            <select class="sort-select">
                <option value="latest">최신순</option>
                <option value="old">오래된순</option>
            </select>
        </div>

        <div class="book-list">
            <!-- 나중에 forEach로 바뀔 부분 -->
            <div class="book-item">
                <div class="book-image-container">
                    <img src="/resources/img/book1.jpg" alt="동굴씨">
                    <div class="book-category">자연과학</div>
                </div>
                <div class="book-info">
                    <div class="info-top">
                        <div class="book-title">총균쇠</div>
                        <div class="book-right">
                            <span><strong>등록일</strong>: 2014</span>
                            <span class="status-label">✓ 대출가능</span>
                        </div>
                    </div>
                    <hr class="divider">
                    <div class="info-middle">
                        <span><strong>저자</strong>: 제레디아이앤드 저/웅</span>
                        <span><strong>발행처</strong>: 비즈니스</span>
                        <span><strong>발행년</strong>: 2014</span>
                        <span><strong>자료위치</strong>: B2</span>
                    </div>
                    <div class="info-bottom">
                        <span><strong>등록번호</strong>: EM000026766</span>
                    </div>
                    <hr class="divider">
                    <div class="button-container">
                        <button class="action-btn" onclick="deleteBook('book1')">삭제</button>
                    </div>
                </div>
            </div>

            <!-- 두 번째 책도 동일한 구조로 변경 -->
            <div class="book-item">
                <div class="book-image-container">
                    <img src="/resources/img/book2.jpg" alt="보통의 발견기">
                    <div class="book-category">자기계발</div>
                </div>
                <div class="book-info">
                    <div class="info-top">
                        <div class="book-title">보통의 발견기</div>
                        <div class="book-right">
                            <span><strong>등록일</strong>: 2023</span>
                            <span class="status-label">✓ 대출가능</span>
                        </div>
                    </div>
                    <hr class="divider">
                    <div class="info-middle">
                        <span><strong>저자</strong>: 김주희 저/웅</span>
                        <span><strong>발행처</strong>: 비즈소</span>
                        <span><strong>발행년</strong>: 2023</span>
                        <span><strong>자료위치</strong>: A1</span>
                    </div>
                    <div class="info-bottom">
                        <span><strong>등록번호</strong>: EM000017554</span>
                    </div>
                    <hr class="divider">
                    <div class="button-container">
                        <button class="action-btn" onclick="deleteBook('book2')">삭제</button>
                    </div>
                </div>
            </div>
            <!-- 전체 삭제 버튼 -->
            <div class="delete-all-container">
                <button class="delete-all-btn">전체삭제</button>
            </div>

            <!-- 검색 섹션 -->
            <div class="search-section">
                <select class="search-select">
                    <option value="title">제목</option>
                    <option value="author">저자</option>
                </select>
                <input type="text" class="search-input" placeholder="검색어를 입력하세요">
                <button class="reset-btn">초기화</button>
                <button class="search-btn">검색</button>
            </div>
        </div>
    </main>
</div>

<!-- 나중에 삭제 기능 구현을 위한 자바스크립트 -->
<script>
    function deleteBook(bookId) {
        if(confirm('관심도서를 삭제하시겠습니까?')) {
            // 나중에 여기에 실제 삭제 로직 구현
            console.log('Delete book:', bookId);
        }
    }
</script>
</body>
</html>