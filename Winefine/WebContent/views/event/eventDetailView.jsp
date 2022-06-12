<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.winefine.event.model.vo.Event, java.util.Date, java.text.SimpleDateFormat" %>
<%
	Event e = (Event)request.getAttribute("e");
	String start = e.getStartDate().substring(0,10);
	String end = e.getEndDate().substring(0,10);
	
	String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	Date today = new Date(dateFormat.parse(todayfm).getTime());
	
	
	
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
            height: 1000px;
            margin: auto;
    }
    .w_{
        width: 100%;
    }
    .top{
       height: 20%;
    }
    .bottom{
        height: 300px;
    }
    
    /* - 구조 : body 영역_ 좌측 & 우측 분할 */
    .sortArea{
        height: 3%;
        padding-right: 100px;
    }
    .store_body{
        width: 100%;
        height: 70%;
    }
    .store_body td.body_l{
        width: 20%;
        vertical-align: top;
    }
    .store_body td.body_r{
        width: 80%;
    }
    
    /* 상세 항목 */
    .sort{
        float: right;
        width: 90%;
       
    }

    .delete{
        padding-left: 5%;
        width: 90%;
        height: 100%;
    }
    /* body_r 영역 */
    
    .list-area {
        width: 800px;
        margin: auto;
        
    }
    .thumbnail {
        border: 1px solid black;
        width: 200px;
        display: inline-block;
        margin : 20px;
    }
    .thumbnail:hover {
    cursor : pointer;
    opacity : 0.5;
    }
    .btn1 {
        background-color : rgb(107, 50, 91);
        color : white;
        cursor : pointer;
        width: 90px;
        height: 50px;
        font-size:medium;
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

    <!-- body : 카테고리 페이지 바디 영역 --------------------------------------------->
    <div class="w_ body">
        <br><br>
        <div class="videoT">

            <div class="img">
                <video width="100%" height="auto" autoplay muted loop playsinline>
                    <source src="/winefine/resources/images/wine.mp4">
                </video>
            </div>
            <h2 class="bg_dark">
                <span>고 객 센 터</span>
            </h2>
        </div>
        <br> 
        <!-- body left(카테고리) & right(상품리스트)-->
        <table class="store_body">
            <td class="body_l">
                <%@ include file="../common/category-notice.jsp" %>
            </td>
            <td class="body_r">
                <div class="delete">
                    

                        
                        <b style="font-size:24px;">이벤트</b>
                        
                        <hr style="border: 1px solid black">
                        <br><br>
                
                        <table id="detail-area" align="center">
                            <tr>
                                <td width="350"><%= e.getEventWriter() %></td>
                                <td width="300"align="right"><%= start %> ~ <%= end %></td>
                            </tr>
                            <tr>
                                <td colspan="2"><hr></td>
                            </tr> 
                            <tr>
                                <td colspan="2">
                                <% if((new Date(dateFormat.parse(e.getEndDate()).getTime())).compareTo(today) >= 0) { %> 
                                		[진행중] 
                                <% } 
                                   else { %>
                                   	    [마감]
                                <% } %> 
                                <%= e.getEventTitle() %></td>
                            </tr>
                            <tr>
                                <td colspan="2"><hr></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <img src="<%= e.getContentPhoto() %>" width="700" height="2000">
                                </td>
                            </tr>
                        </table>
                
                        <br><br>
                                 
                        <div align="center">
                             <a><button type="button" class="btn1"><a href="<%= contextPath %>/list.ev">목록으로</a></button></a>
                        </div>  
                
                    
                </div>
            </td>
        </table>
    </div>
	
	<br><br>
    
        <!-- bottom : 푸터바 영역 ---------------------------------------------------->
        <div class="w_ bottom">
            
            <!-- 푸터바 START-->
            <%@ include file="../common/footer.jsp" %>
            <!-- 푸터바 END-->
        
        </div>
    </div> 

</body>
</html>