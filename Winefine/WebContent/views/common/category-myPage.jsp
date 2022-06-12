<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

    .left_menu_ a {
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
    .left_menu:hover::after { transform: scaleX(0.4); }
    #mp1:hover::after { transform: scaleX(0.5); }
    #mp2:hover::after { transform: scaleX(0.65); }
    #mp3:hover::after { transform: scaleX(0.65); }
    #mp4:hover::after { transform: scaleX(0.5); }
    
</style>
</head>
<body>
    <div id="content">
        <div id="content_1" align="center">
            <ul id="leftNavi">
                <b style="font-size:24px;">마이페이지</b>
                <hr  color="black" style="border: 1px solid black">
                <li class="left_menu_"><a>나의쇼핑</a></li><hr color="gray">
                <li class="left_menu"><a href="/winefine/myPage.me">주문내역</a></li><br>
                <li class="left_menu"><a href="/winefine/list.ca">장바구니</a></li><hr color="gray">
                <li class="left_menu_"><a>개인정보</a></li><hr color="gray">
                <li class="left_menu" id="mp1"><a href="/winefine/checkForm.me">회원정보수정</a></li><br>
                <li class="left_menu" id="mp2"><a href="/winefine/qna.me">상품문의내역확인</a></li><br>
                <li class="left_menu" id="mp3"><a href="/winefine/1on1.me">1대1문의내역확인</a></li><br>
                <li class="left_menu" id="mp4"><a href="/winefine/review.me">리뷰내역확인</a></li><br>
            </ul>
        </div> 
        <!-- <div id="content_2"></div> -->

</div>


</body>
</html>