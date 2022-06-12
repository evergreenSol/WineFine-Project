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

        .left_menu::after {
            display:block;
            content: '';
            border-bottom: solid 3px rgb(107, 50, 91);  
            transform: scaleX(0);  
            transition: transform 250ms ease-in-out;
        }
        .left_menu:hover::after { transform: scaleX(0.5); }


        
        .search input {
        padding-left: 10px;
        width: 70%;
        height: 40px;
        font-size: 15px;
        border: none;
        border-bottom: 1px black solid;
        }

        .search button {
        font-size: 15px;
        border: none;
        background-color: rgb(107, 50, 91);
        width: 45px;
        height: 30px;
        border-radius: 15px;
        color: #fff;
        cursor: pointer;
        } 
</style>
</head>
<body>
    <div id="content">
        <div id="content_1" align="center">
            <ul id="leftNavi">
                <b style="font-size:24px;">게시판</b>
                <hr style="border: 1px solid black">
                <li class="left_menu"><a href="/winefine/list.th?boardType=wine">와인용어</a></li><hr>
                <li class="left_menu"><a href="/winefine/pairing.bo?boardType=pairing">페어링</a></li><hr>
                <li class="left_menu"><a href="/winefine/magazine.bo?boardType=magazine">매거진</a></li><br>
                
            </ul> 
        
        <div id="content_2"></div>

</div>


</body>
</html>