<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.winefine.board.model.vo.*" %>
<%
	Board b = (Board)request.getAttribute("b");
	ArrayList<Brattachment> list = (ArrayList<Brattachment>)request.getAttribute("list");
%>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> WINEFINE :D </title>
<style>
    .outer {
        color : black;
        width : 1000px;
        height : 800px;
        margin : auto;
        margin-top : 50px;
    }

    .detail-area td {
        border : 1px solid black;
        text-align : center;
    }

</style>
</head>
<body>

	<%@ include file="../common/adminHeader.jsp" %>

    <div class="outer">

        <br>
        <h2 align="center">사진게시판 상세보기</h2>
        <br>

        <table class="detail-area" align="center">
            <!-- (tr>td*4)*5 + Enter -->
            <tr>
                <td width="70">제목</td>
                <td colspan="3" width="600"><%= b.getBoardTitle() %></td>
            </tr>
            <tr>
                <td>작성자</td>
                <td><%= b.getBoardWriter() %></td>
                <td>작성일</td>
                <td><%= b.getCreateDate() %></td>
            </tr>
            <tr>
                <td>대표이미지</td>
                <td colspan="3">
                    <div>
                        <img src="<%= contextPath %>/<%= list.get(0).getBrfilePath() + list.get(0).getBrchangeName() %>" width="500" height="300">
                    </div>
                </td>
            </tr>
            <tr>
                <td>내용</td>
                <td colspan="3">
                    <p style="height:200px; overflow:auto;">
                        	<%= b.getBoardContent() %>
                    </p>
                </td>
            </tr>
            
        </table>
        <br><br>
        <div align="center">
            <a href="<%= contextPath %>/list.bo?currentPage=1" class="btn btn-secondary btn-sm">목록가기</a>
			<% if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())) { %>
	            <!-- 로그인한 사용자가 글 작성자와 일치할 경우만 보여지게끔 -->
	            <a href="<%= contextPath %>/updateForm.bo?bno=<%= b.getBoardNo() %>" class="btn btn-secondary btn-sm">수정하기</a>
	            <a href="<%= contextPath %>/delete.bo?bno=<%= b.getBoardNo() %>" class="btn btn-secondary btn-sm">삭제하기</a>
            <% } %>
        </div>
    </div> 

</body>
</html>