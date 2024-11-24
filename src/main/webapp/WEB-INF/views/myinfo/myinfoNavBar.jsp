<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String currentUri = request.getRequestURI();

  String[] pathParts = currentUri.split("/");
  String currentPage = pathParts[pathParts.length - 1];
%>
<div class="side-nav">
  <a href="/main" style="text-decoration: none; color: inherit;">
    <div class="logo">
      <img src="img/logoImage.png" alt="로고">
      강릉대학교통합도서관
    </div>
  </a>
  <div class="nav-item <%= currentPage.equals("myInfo.jsp") ? "active" : "" %>"><a href="/myInfo">내정보</a></div>
  <div class="nav-item <%= currentPage.equals("interestedBooks.jsp") ? "active" : "" %>"><a href="/interestedBooks">관심도서 목록</a></div>
  <div class="nav-item <%= currentPage.equals("wishbookstatus.jsp") ? "active" : "" %>"><a href="/wishbookstatus">희망도서 신청 내역</a></div>
  <div class="nav-item <%= currentPage.equals("donation.jsp") ? "active" : "" %>"><a href="/donation">도서기증 신청</a></div>
  <div class="nav-item <%= currentPage.equals("passwordchange.jsp") ? "active" : "" %>"><a href="/passwordchange">비밀번호 변경</a></div>
</div>

<style>
  .logo {
    display: flex;
    align-items: center;
    margin-bottom: 30px;
    font-weight: 700;
    font-size: 18px;
    color: #333;
  }

  .logo img {
    width: 50px;
    height: 50px;
    /*margin-right: 1px;*/
  }

  .side-nav {
    width: 290px;
    height: 100vh;
    position: fixed;
    left: 0;
    top: 0;
    background: #FFF;
    padding: 20px;
    border-right: 1px solid #E0E0E0;
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

  .nav-item a {
    color: black; /* 원하는 색깔로 변경 */
    text-decoration: none; /* 밑줄 제거 */
  }

  .nav-item a:hover {
    color: #007bff; /* 원하는 호버 색깔로 변경 */
    text-decoration: none; /* 호버 상태에서도 밑줄 제거 */
  }

</style>