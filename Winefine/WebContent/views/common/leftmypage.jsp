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
        line-height: 50px;

    }

    .left_menu::after {
        display:block;
        content: '';
        border-bottom: solid 3px rgb(107, 50, 91);  
        transform: scaleX(0);  
        transition: transform 250ms ease-in-out;
    }
    .left_menu:hover::after { transform: scaleX(0.5); }

    #content_2 {
        padding-left: 15px;
    }

</style>
</head>
<body>

    <br><br>

    <div id="content">
        <div id="content_1">
            <ul id="leftNavi">
                <h1 align="center">마이페이지</h1>
                <hr style="border: 1px solid black">
                <li class="left_menu" id="myshopping"><a href="">나의쇼핑</a></li><hr>
                <li class="left_menu" id="shoppinglist"><a href="">주문내역</a></li>
                <li class="left_menu" id="cart"><a href="">장바구니</a></li><hr>
                <li class="left_menu" id="myinfo"><a href="">개인정보</a></li><hr>
                <li class="left_menu" id="myinfo_update"><a href="">회원 정보 수정</a></li>
                <li class="left_menu" id="myqna"><a href="">문의 내역 확인</a></li>
                <li class="left_menu" id="myreview"><a href="">리뷰 내역 확인</a></li>

            </ul> 
        </div>
        <div id="content_2">
            

        </div>
        
    </div>
    <!-- <div id="footer"></div> -->


</body>
</html>