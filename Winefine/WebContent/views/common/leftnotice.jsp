<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> WINEFINE :D </title>
<style>

    
div {
            box-sizing : border-box;
            /* border : 1px solid red; */
        }

        .wrap {
            width : 1000px;
            height : 800px;
            margin : auto;
        }

        /* 크게 세가지 영역 */
        .wrap>div {
            width : 100%;
        }

        #header, #footer {
            height : 20%;
        }


        #content {
            height : 55%
        }

        /* header 의 두가지 영역 */
        #header>div, #content>div {
            height : 100%;
            float : left;
        }

        #header_1, #header_2{
            width : 20%;
        }

        #header_2 {
            width : 60%;
        }

        #header_1 {
            line-height: 200px;
        }
       

        #content_1 {
            width : 20%;
        }

        #content_2 {
            width : 80%;
        }


    /* 왼쪽 메뉴바 */

    #leftNavi {
        list-style-type : none;
        margin : 0px;
        padding : 0px;
        height : 100%;

    }
    #leftNavi li {
        width : 100%;
        height : 11%;
        text-align : center;
    }
    .left_menu a {
        color: #000;
        text-decoration : none;
        margin:0;
        text-transform:uppercase; 
        font-size : 20px;
        font-weight : bold;

    }

    .left_menu::after {
        display:block;
        content: '';
        border-bottom: solid 3px rgb(107, 50, 91);  
        transform: scaleX(0);  
        transition: transform 250ms ease-in-out;
    }
    .left_menu:hover::after { transform: scaleX(0.5); }

</style>
</head>
<body>

    <br><br>

    <div id="content">
        <div id="content_1">
            <ul id="leftNavi">
                <h1 align="center">고객센터</h1>
                <hr style="border: 1px solid black">
                <li class="left_menu"><a href="">공지사항</a></li><hr>
                <li class="left_menu"><a href="">이벤트</a></li><hr>
                <li class="left_menu"><a href="">1:1문의</a></li><hr>
                <li class="left_menu"><a href="">Contact Us</a></li><hr>
                <li class="left_menu"><a href="">FAQ</a></li>
            </ul> 
        </div>
        <div id="content_2"></div>
        
    </div>
    <div id="footer"></div>


</body>
</html>