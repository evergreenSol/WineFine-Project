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

    .delete {
        padding-left: 5%;
        width: 90%;
        height: 100%;
    }
    /* 상세 항목 */
    /* 사진 */
    .list-area {
    width : 1000px;
    height : 900px;
    margin : auto;
    }

    .thumbnail {
        
        width : 700px;
        display : inline-block;
        margin : 30px;
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
	                     <!-- 와인용어  START-->
	                    <div class="delete">
                            <b style="font-size:24px;"><%= b.getBoardTitle() %></b> <!-- 제목  -->
                            <hr color="black">
                        </div> 

                        <div class="thumbnail" align="center" width="500" height="300">
                        		<!--대표이지미-->
                                <img src="<%= contextPath %>/<%= list.get(0).getBrfilePath() + list.get(0).getBrchangeName() %>" width="500" height="300">
                            <p id="check" width="500" height="300">
                                   <%= b.getBoardContent() %>
                            </p>
                            <div class="" align="center">
                            <% for(int i = 1; i <list.size(); i++) { %>
                                <img src="<%= contextPath %>/<%= list.get(i).getBrfilePath() + list.get(i).getBrchangeName() %>" width="500" height="300"> 
          					<% } %>
          					</div>
          					
                        
	                    <!-- 와인용어 END-->
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
    