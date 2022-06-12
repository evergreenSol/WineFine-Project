<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> WINEFINE :D </title>
<style>
   .enrollFin-outer {
        width:1200px;
        height: 800px;
        margin:auto;
    }

    .welcome{
        width: 100%;
        height: 100px;
    }

    .enrollFin-outer>div{
        height : 100%;
        float:left;
    }

    #enrollFin_1, #enrollFin_2{
        width:45%;
        height:100%;
    }

    #enrollFin_1>img {
        float: right;
        width:70%;
        height:480px;
        display:block;
    }

    #login_2>h1{
        color: rgb(119, 45, 96); 
    }

    #enroll-info button{
        cursor:pointer;
        display: inline-block;
        margin: 30px;
        padding: 10px;
        width: 100px;
        color:white;
        border-radius: 5px;
        background: rgb(119, 45, 96);
    }

    #enroll-info button:hover{
        opacity : 0.7;
        cursor: pointer;
    }

</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<!-- ../ : 현재 폴더로부터 한번 빠져나감(즉, 현재 폴더로부터 한단계 상위 폴더로 이동) -->
   

<br><br>
   <div class="enrollFin-outer">
        <div id="enrollFin_1"><img src="<%= contextPath %>/resources/images/wineEnrollFin.jpg"></div>
        <div id="enrollFin_2">
            <h1 align="center" style="color: rgb(119, 45, 96);" >회원가입 완료</h1>
            <hr><br>

            <div class="enroll-area" align="center">
                <form id="enroll-info" action="" method="post">
                    <table>
                        <tr>
                          <img src="<%= contextPath %>/resources/images/welcome.png" id="welcome" style="height:250px;">
                        </tr>
                        <tr><h3><b>홍길동 님의 가입을 진심으로 환영합니다 !</b></h3></tr>                      
                        <tr>
                            <button style="background-color: gray;" onclick="home();">홈으로</button> 
                            <button onclick="login();">로그인</button>                                  
                        </tr>   
                    </table>
                </form>
                
                <script>
               	function home() {
               		
               		location.href="/winefine/main.do";
               	};
               	
               	function login(){
               		
               		location.href="<%=contextPath%>/loginForm.me";
               	};
                
                </script>
            </div>

        </div>
   </div>
   
    
    
</body>
</html>