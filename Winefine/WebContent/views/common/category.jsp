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
    /* viewAll > .body_l 영역에 들어갈 카테고리 리스트*/
    
        /* 전체 구조 잡기*/
        div{
            box-sizing: border-box;
        }
        .category_area{
            /* 참고) viewAll에서 body_l 영역에 할당한 width:10%*/
            width: 180px; 
            height: 240px;
            font-weight: 900;
            padding-top: 70;
        }
    
        /* 세부사항 */
        .category{
            font-size: 18px;
        }
        .c_{
            text-align: center;
            line-height: 40px;
            height: 40px;
        }
        .c_title{
            font-size: 22px;
        }
        .c_title, .c_end{
            border-bottom: 1px solid #BDBDBD;
            padding-bottom: 45px;
        }
        .category a{
            color: #BDBDBD;
            text-decoration: none;
        }
        .category a:hover{
            color: #6B325B;
        }
        </style>
    </head>
    <body>
        <!-- viewAll > .body_l 영역에 들어갈 카테고리 리스트-->
        <div class="category_area">
            <div class="c_ c_title">&nbsp;와인카테고리</div>
            <div class="c_ category"><a href="">전체조회</a></div>
            <div class="c_ category"><a href="">종류별</a></div>
            <div class="c_ category"><a href="">맛별</a></div>
            <div class="c_ category"><a href="">산지별</a></div>
            <div class="c_ category c_end"><a href="">가격대별</a></div>
        </div>
    
    </body>
    </html>