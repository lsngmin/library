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
            max-width: 1200px;
            margin: 20px auto;
        }

        .sidebar {
            width: 220px;
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
            font-size: 18px;
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
            width: 100px;
            height: 120px;
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

    <div class="content">
        <h2 class="search-header">통합검색</h2>


        <section class="results-container">
            <div class="result-item">
                <img src="book1.jpg" alt="책 이미지">
                <div class="result-details">
                    <p class="subject">사회과학</p>
                    <p>도서명: 총균쇠</p>
                    <p>저자: 재레드 다이아몬드</p>
                    <p>발행사항: 문학사상,2014</p>
                    <p>매체구분: 인쇄자료</p>
                    <p>발행년: 2014</p>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
</html>
