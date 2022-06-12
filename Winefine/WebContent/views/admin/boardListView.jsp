<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.winefine.board.model.vo.Board, com.winefine.common.model.vo.PageInfo" %>
<%
ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");
	// 파일번호, 원본명, 수정명, 저장경로
	
	// 페이징바 관련 변수
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> WINEFINE :D </title>
<style>

    .outer {
        width: 1200px;
        height: 900px;
        margin: auto;
        margin-top: -80px;
    }

    .wrap{
            width: 1200px; 
            height: 1100px; 
            margin: auto;
        }
        .w_{
            width: 100%;
        }
        .top {
            height: 240px; /* height: 240px */
        }

    /* 게시판 목록 */
    #board_area {
        width : 900px;
        position: relative;
    }
    .list-table {
        margin-top: 10px;
    }
    .list-table thead th{
        height:40px;
        border-top:2px solid #09C;
        border-bottom:1px solid #CCC;
        font-weight: bold;
        font-size: 17px;
    }
    .list-table tbody td{
        text-align:center; /*글씨 정렬*/
        padding:10px 0;
        border-bottom:1px solid #CCC; height:20px;
        font-size: 14px 
    }
    #write_btn {
        position: absolute;
        margin-top:40px;
        right: 0;
    }

    .list-table>tbody>tr:hover {
        color : #1E90FF;
        cursor : pointer;
    }

    .write_btn {
        color: white;
        text-decoration: none;
        
    }
</style>
</head>
<body>

    <div class="wrap">
        <!-- top : hearder 삽입 영역 ------------------------------->
        <div class="w_ top">
            <div class="w_" style="height: 150px;">
                <!-- 헤더 START-->
                <%@ include file="../common/adminHeader.jsp" %>
                <!-- 헤더 END-->
            </div>
        <div class="outer" align="center">
            <table style="margin:100px;">
                <tr>
                    <td colspan="2">
                        <div id="board_area"> 
                            <h1>게시판</h1>
                            
                            <form id="enroll-form" action="" method="post" enctype="moltipart/form-data">
                                <br>
                            
                                
                                <table class="list-table">
                                    <thead>
                                        <tr align="center">
                                            <th width="100">No</th>
                                            <th width="150">카테고리</th>
                                            <th width="500">제목</th>
                                            <th width="100">작성자</th>
                                            <th width="150">작성일</th>
                                            </tr>
                                        </thead>
                                    <tbody>
                                        <% if(list.isEmpty()) { %>
                                        <tr>
                                        <td colspan="5">조회된 리스트가 없습니다.<td>
                                        </tr>
                                        <% } else { %>
                                        <% for(Board b : list) { %>
                                            <tr>
                                            <td><%= b.getBoardNo() %></td>
                                            <td><%= b.getBoardType() %></td>
                                            <td><%= b.getBoardTitle() %></td>
                                            <td><%= b.getBoardWriter() %></td>
                                            <td><%= b.getCreateDate() %></td>
                                            </tr>
                                    <% } %>
                                        <% } %>
                                    </tbody>  
                                </table>

                                <script>
                                    $(function() {
                        
                                        $(".list-table>tbody>tr").click(function() {
                        
                                            location.href = "<%= contextPath %>/formdetail.bo?bno=" + $(this).children().eq(0).text();
                                        });
                                    });
                                </script>
                            <br><br>
                            <div align="center" class="paging-area">
                                
                                <% if(currentPage != 1) { %>
                                    <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage - 1 %>';">&lt;</button>
                                <% } %>
                                
                                <% for(int p = startPage; p <= endPage; p++) { %>
                                    <% if(p != currentPage) { %>
                                        <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= p %>';"><%= p %></button>
                                    <% } else { %>
                                        <!-- 현재 내가 보고있는 페이지일 경우는 클릭 안되게끔 -->
                                        <button disabled><%= p %></button>
                                    <% } %>
                                <% } %>
                                
                                <% if(currentPage != maxPage) { %>
                                    <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage + 1 %>';">&gt;</button>
                                <% } %>
                            </div> 
                            
                            <script>
                                $(function() {
                    
                                    $(".list-area>tbody>tr").click(function() {
                    
                                        location.href = "<%= contextPath %>/formdetail.bo?bno=" + $(this).children().eq(0).text();
                                    });
                                });
                            </script>
                            
                            
                                <!--  글쓰기 버튼 -->
                                <div id="write_btn">        
                                <a class="btn btn-secondary btn-sm" href="<%= contextPath %>/enrollForm.th">작성하기</a>
                                </div>
                        </div>
                    </td>
                </tr>
            </table> 
        </div>
     </form>  
    </div>
</body>
</html>