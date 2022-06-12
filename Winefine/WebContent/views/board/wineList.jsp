<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.winefine.board.model.vo.Board" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> WINEFINE :D </title>
<style>
    /* 전체 구조 잡기*/
    div{
        box-sizing: border-box;
    }
    .wrap{
        width: 1200px;
        /* height: 1500px; */
        margin: auto;
    }
    .w_{
        width: 100%;
    }
    .top{
        height: 10%;
    }
    .body{
        height: 70%;
    }
    .bottom{
        height: 20%;
    }
    
    /* - 구조 : body 영역_ 좌측 & 우측 분할 */
    .sortArea{
        height: 3%;
        padding-right: 100px;
    }
    td.body_l{
        width: 20%;
        height: 97%;
        vertical-align: top;
    }
    td.body_r{
        width: 80%;
        height: 97%;
        vertical-align: top;
    }
    /* 상세 항목 */
    /* 사진 */
    .list-area {
    width : 1000px;
    height : 900px;
    margin : auto;
    }

    .thumbnail {
        border : 1px solid lightgray;
        width : 220px;
        display : inline-block;
        margin : 30px;
    }

    .thumbnail:hover {
        cursor : pointer;
        opacity : 0.7;
    }

    /*페이징*/

    .page {
        text-align : center; /* div 영역 안에서의 center*/
        width : 100%;
    }

    .pagination {
        list-style : none;
        display : inline-block;
        padding : 0;
        margin-top : 20px;
    }

    .pagination li {
        display : inline;
        text-align : center;
    }

    /*숫자들에 대한 스타일 지정*/
    .pagination a {
        float : left;
        display : block;
        font-size : 15px;
        text-decoration : none;
        padding : 5px 12px;
        color : rgb(107, 50, 91);
        line-height : 1.5;
    }

    .first {
        margin-right : 15px;
    }

    .last{
        margin-left : 15px;
    }

    .first:hover, .lest:hover, .left:hover, .right:hover {
        color : rgb(107, 50, 91);
    }

    .pagination a.active {
        cursor : default;
        color : #ffffff;
    }

    .pagination a:active {
        outline: none;
    }

    .modal .num {
        margin-left : 3px;
        padding : 0;
        width : 30px;
        height : 30px;
        line-height : 30px;
        -moz-border-radius : 100%;
        -webkit-border-radius : 100%;
        border-radius : 100%
    }

    .modal .num:hover {
        background-color : rgb(107, 50, 91);
        color : #ffffff;
    }
    
    /*메인 와인 페어링 사진*/
    .test-list {
        width : 780px;
        margin-left: auto;
        margin-right: auto;
    }

    .test {
        width : 220px;
        text-align : center;
        text-decoration: none;
        float: left;
        margin-left: 10px;
        margin-right: 10px;
        color : black;
    }

    .test-name{
        margin-top: 20px;
        margin-bottom: 4px;;
        font-size: 17px;
    }

    .test-title:hover {
        color : rgb(107, 50, 91);
        font-weight : bold;
    }

    .test-name:hover {
        color : rgb(107, 50, 91);
        font-weight : bold;
    }

    .test:hover {
        color : rgb(107, 50, 91);
        font-weight : bold;
    }

    .delete {
        padding-left: 5%;
        width: 90%;
        height: 100%;
    }

    .list-area div {
        float : left;
    }
    
    /* 영상 테스트 */
    
    .videoT {
        width: 100%; 
        overflow: hidden;
        margin: 0px auto; 
        position: relative;

    }
    .videoT.img {
        /* position: absolute; */
        top: 0;
        left: 50%;
        width: 100%;
        transform: translateX(-50%);
        /* z-index: 1; */
    }
    .videoT .bg_dark {
        position: absolute; 
        top: 35%;
        /* left: 50%; */
        width: 100%;
        text-align: center;
        /* z-index: 20; */
        
    }
    .videoT .bg_dark span {
        /* text-align: center;  */
        font-size: 30px; 
        color: #ffffff;
    }

    /**************************************************/
    

        </style>
    </head>
    
    
<body>
   <div class="wrap">

       <!-- top : hearder 삽입 영역 ------------------------------->
       <div class="w_ top">
           <!-- 헤더 START-->
           <%@ include file="../common/header.jsp" %>
           <!-- 헤더 END-->
       </div>
       <!-- body : 메인 페이지의 이미지 영역 --------------------------------------->
       <div class="w_ body">
       
       <!------------------------------비디오------------------------>
            
            <div class="videoT">

                <div class="img">
                    <video width="100%" height="auto" autoplay muted loop playsinline>
                        <source src="/winefine/resources/images/promotion.mp4">
                    </video>
                </div>
                <h2 class="bg_dark">
                    <span>게 시 판</span>
                </h2>
            </div>
            <!------------------------------------------------------------->
       
       
       
        <br><br>
         <!-- body left(카테고리) & right(와인용어)-->
         	           <table class="board-body">
	                
                    <td class="body_l">
	                    <!-- category-board 영역 START-->
	                    <div>
	                        <%@ include file="../common/category-board.jsp" %>
	                    </div>
	                     <!-- category-board 영역 END-->
	                </td>

	                <td class="body_r">
	                     <!-- 와인용어 콘텐츠 START-->
	                    <div class="delete">
                            <b style="font-size:24px;">와인용어</b>
                            <hr color="black">
                            
                            <% if(list != null) { %>
					
						<% for(Board b : list) { %>
						
						<div class="thumbnail" align="center">
						<input type="hidden" value="<%= b.getBoardNo() %>"> <!-- 글번호 선택용 -->
                             <img src="<%= contextPath %>/<%= b.getTitleImg() %>" width="200px" height="150px">
                             <p>
                                 No.<%= b.getBoardNo() %> <br>
                                 <%= b.getBoardTitle() %> 
                                 	   
                             </p>
                         </div>
						
						<% } %>					
					<% } else { %>
						등록된 게시글이 없습니다.
						<% } %>
						
						    <script>
						    	$(function() {
						    		$(".thumbnail").click(function() {
						    			
						    			var bno = $(this).children().eq(0).val();
						    			
						    			location.href = "<%= contextPath %>/detail.bo?bno=" + bno;
						    		});
						    	});
						    </script>
						    
                        <div class="list-area">
                                <div class="page">
                                    <ul class="pagination modal">
                                        <li><a href="#" class="arrow left">&lt;</a> </li>
                                        <li><a href="#" class="arrow num">1</a></li>
                                        <li><a href="#" class="num">2</a></li>
                                        <li><a href="#" class="num">3</a></li>
                                        <li><a href="#" class="num">4</a></li>
                                        <li><a href="#" class="num">5</a></li>
                                        <li><a href="#" class="arrow right">&gt;</a></li>
                                    </ul>
                                </div>
                            </div>

	                    </div>
	                    <!-- 와인용어 콘텐츠 END-->
	                </td>

	            </table>
	            
	        </div>

        
      <!-- bottom : 푸터바 영역 ---------------------------------------------------->
      <div class="w_ bottom">
          <!-- 푸터바 START-->
          <%@ include file="../common/footer.jsp" %>
          <!-- 푸터바 END-->
            
       </div>
   </div> 
</body>
</html>

