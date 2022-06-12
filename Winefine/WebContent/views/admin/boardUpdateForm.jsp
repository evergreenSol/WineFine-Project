<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.winefine.board.model.vo.*" %>
<%
    Board b = (Board)request.getAttribute("b");

	ArrayList<Brattachment> list = (ArrayList<Brattachment>)request.getAttribute("list");
	Brattachment at = (Brattachment)request.getAttribute("at");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> WINEFINE :D </title>
<style>
    /* 게시판 글쓰기 */
     #board_write {
        width:1000px;
        position:relative;
        margin:0 auto;
     }

     #write_area {
        margin-top:20px;
        font-size:15px;
     }

     #in_title, #in_title1{
        width: 600px;
        height: 40px;
     }

     a { /* 색상변경 안됨 */
       color: black;
       text-decoration: none;
     }

     #utitle {
        outline: none;
        border: none;
      }

     #in_title textarea {
        font-weight:bold;
        font-size:26px;
        color:#333;
        width: 900px;
        resize: none;
        outline: none;
        border: none;
     }

     .wi_line {
        border:solid 1px lightgray;
        margin-top:10px;
     }

     #in_content {
        height: 400px;
     }

     #in_content textarea {
        font:14px;
        color:#333;
        width: 900px;
        height: 400px;
        resize: none;
     }

     #in_pw input {
        font:14px;
        margin-top:10px;
     }

     .bt_se {
        margin-top:20px;
        text-align:center;
     }

     .bt_se button {
        width:100px;
        height:30px;
     }

     #enroll-form input, #enroll-form textarea { 
        width : 100%; 
        box-sizing : border-box;
     }

     #in_title:focus {
        border: none;
    }

    h1>a:hover  {
        color : #1E90FF;
        cursor : pointer;
    } 

    

</style>
</head>
<body>
<!-- 헤더 START-->
<%@ include file="../common/adminHeader.jsp" %>
<!-- 헤더 END-->	


<div id="board_write">
    <br><br>
    <h1><a>게시판 수정</a></h1>

        <div id="write_area">              
            <form id="enroll-form" action="<%= contextPath %>/update.bo" method="post" enctype="multipart/form-data">
				
                <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                <input type="hidden" name="bno" value="<%= b.getBoardNo() %>">

				
                <div id="in_title">
                    <textarea name="title" id="utitle" rows="1" cols="55" placeholder="제목" maxlength="100"><%= b.getBoardTitle() %></textarea>
                </div>
            
                <select name="boardtype" id="category">
                    <option value="wine">와인용어</option>
                    <option value="pairing">페어링</option>
                    <option value="magazine">매거진</option>
                </select>
            
                <div class="wi_line"></div>
                <div id="in_content">
                    <textarea name="content" id="ucontent" placeholder="내용" required><%= b.getBoardContent() %></textarea>
                </div>

                <% if(list != null) { %>
                    <!-- 기존에 파일이 있다면 원본명을 보여주자 -->
                    
                    <!-- 백엔드 단에서 기존에 파일이 있는지 검사용도로 원본파일의 파일번호, 수정명 (삭제용도) -->
                    <input type="hidden" name="originFileNo" value="<%= list.get(0).getBrfileNo() %>">
                    <input type="hidden" name="originFileName" value="<%= list.get(0).getBrchangeName() %>">
                <% } %>
             <tr>    
                <td>
                    <input type="file" name="reUpfile">
                </td>
            </tr>

                <div align="center">
                    <button type="submit">수정하기</button>
                </div>
        </form>
    </div>
</div>



</body>
</html>