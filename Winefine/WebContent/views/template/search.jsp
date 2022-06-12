<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                height: 1500px;
                margin: auto;
            }
            .w_{
                border: 1px solid red;
                width: 100%;
            }
            .top{
               height: 10%;
            }
            .body{
                height: 45%;
            }
            .best{
                height: 25%;
            }
            .bottom{
                height: 20%;
            }
            
            /* 상세 항목 */
    
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
               <h1 class="delete">이미지 인클루드예정</h1>
           </div>
    
           <!-- best : 베스트셀러 영역 ------------------------------------------------->
           <div class="w_ best">
               <!-- 베스트셀러 START-->
               <h1 class="delete">베스트셀러 인클루드예정</h1>
               <!-- 베스트셀러 END-->
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