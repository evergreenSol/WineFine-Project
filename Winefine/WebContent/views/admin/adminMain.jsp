<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> WINEFINE :D </title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <!-- * 부트스트랩 영역 --------------------------------------------------------------------------->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- menubar영역은 모든 페이지마다 넣어주기로 했으니 얘한테 한번 넣어두면 include 되는 모든페이지에서 쓸 수 있겠쥬 ! ☆  -->

        <style>
            /* 전체 구조 잡기*/
            div{
                box-sizing: border-box;
            }
            .wrap{
                width: 1200px; 
                height: 700px; 
                margin: auto;
            }
            .w_{
                width: 100%;
            }
            .top{
                height: 150px; 
            }
           .body{
               height: 500px;
           }
            .bottom{
                height: 50px;  
            }
            
            /* 상세 항목 */
            body{
                background-color: rgb(41, 128, 185) !important;
                color: white;
            }
            td{
                padding-right: 20px;
                padding-left: 20px;
            }
            .bottom{
                font-size: 14px;
                font-weight: 600;
            }
            .btn{
            	margin:5px 10px;
            }
            .title a{
                font-size: 20px; 
                font-weight: 900;
                color:rgb(46, 45, 45);
                text-decoration: none;
            }
            .title a:active{
                background-color: rgb(46, 45, 45);
                color: white;
            }
            .mainList td{
                width: 600px;
                height: 40px;
            }
            /* adminHeader 스타일 */
            div, table{
                margin: 0px;
                height: 100%;
            }
            .adminHeader{
                border-collapse: collapse;
                width: 100%;
            }
            .adminHeader td{
                padding-right: 20px;
                padding-left: 20px;
            }
            #header a {
                text-decoration: none;
                color: white
            }
            #header {
                background-color: rgb(41, 128, 185) !important;
            }
            #mainlogo {
                display:inline-block;
                width: 800px;
                margin: 20px;
            }
            #top_btn button {
                background-color : rgb(41, 128, 185);
                color : white;
                width: 80px;
                height: 30px;
                border-radius: 4px;
                cursor: pointer;
            }
            #navigator{   
                background-color: rgb(41, 128, 185);
                position: relative;
            }
            #navigator label {
                margin : 10px 30px;
            }
            #navigator a {
                color: white;
                text-decoration : none;
                margin:0;
                text-transform:uppercase; 
                font-size : 18px;
                font-weight : bold;    
            }
            #navigator a:hover {
                opacity : 0.7;
            }   
            .header_r{
                text-align: right;
            }
        
        </style>
    </head>
    
    
    <body>
       <div class="wrap">

           <!-- top : hearder 삽입 영역 ------------------------------->
           <div class="w_ top">
               <div class="w_" style="height: 150px;">
                    <!-- 헤더 START-->
                    <%@ include file="../common/adminHeader.jsp"%> 
                    <!-- 헤더 END-->
                </div>
                
               <div class="w_" style="height: 90px;">
                </div>
           </div>
    
           <!-- body : 바디 영역 --------------------------------------->
           <div class="w_ body">
               <table class="mainList" align="center">
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td rowspan="4"><h1 align="center">
                        <p id="today" style="color:white; text-align: left;">
                        	2022년 5월 18일<br>수요일 :D</h1>
                        </p>
                        </td>
                        <td class="title"><a href="/winefine/orderListView.admin?currentPage=1" style="text-decoration: none;"> > 주문 확인하기</a></td>
                     </tr>

                    <tr>
                       <td class="title"><a href="/winefine/Mmain.on" style="text-decoration: none;">> 문의내역 확인하기</a></td>
                    </tr>

                    <tr>
                        <td class="title"><a href="/winefine/review.admin?currentPage=1" style="text-decoration: none;"> > 상품후기 확인하기</a></td>
                    </tr>

                    <tr style="border-bottom: 10px solid white;">
                        <td></td>
                    </tr>

                    <tr>
                        <td rowspan="4"></td>
                        <td></td>
                    </tr>

                    <!-- <tr>
                        <td class="title"><a href="detailPage.jsp"> > 상품페이지수정</a></td>
                     </tr>

                    <tr>
                       <td class="title"><a href=""> > 베스트셀러 수정</a></td>
                    </tr> -->
               </table>
           </div>

           <!-- bottom : 하단 영역 --------------------------------------->
           <div class="w_ bottom" align="center">
           </div>

       
       </div> 

       <script>
           var today = new Date();
           var year = today.getFullYear();
           var month = today.getMonth() +1;
           var date = today.getDate();
           var day = today.getDay();


           $("#today").html("관리자님,<br><br>오늘은<br> "+ year +"년 " + month + "월 " + date +"일<br>입니다 :D");

       </script>

    </body>
    </html>  
