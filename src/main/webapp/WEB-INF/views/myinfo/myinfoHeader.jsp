<%--
  Created by IntelliJ IDEA.
  User: lsngm
  Date: 24. 11. 24.
  Time: 오후 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="header">
  <div class="user-menu">
    <a href="/myInfo" style="color: #666666; text-decoration: none;">내정보</a>
    <span class="separator">|</span>
    <a href="/logout" style="color: #666666; text-decoration: none;">로그아웃</a>
  </div>
</div>

<style>
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
</style>
