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
        height:500px;
        display:block;
    }
    
    #welcome{
    	height:280px;
    	width: 65%;
    	margin-top: -32px;
    }

    #login_2>h1{
        color: #6B325B; 
    }

    .enroll-area button{
        cursor:pointer;
        display: inline-block;
        margin: 30px;
        padding: 10px;
        width: 130px;
        color:white;
        border-radius: 5px;
        background: #6B325B;
    }

    .enroll-area button:hover{
        opacity : 0.7;
        cursor: pointer;
    }

</style>
</head>
<body>
    <!-- top : hearder 삽입 영역 ------------------------------->
    <div class="w_ top" style="width: 1200px; margin:auto;">
        <!-- 헤더 START-->
        <%@ include file="../common/header.jsp" %>
        <!-- 헤더 END-->
    </div>
   

<br><br>
   <div class="enrollFin-outer">
        <div id="enrollFin_1"><img src="/winefine/resources/images/wineEnrollFin.jpg"></div>
        <div id="enrollFin_2">
            <h1 align="center" style="color: rgb(119, 45, 96); font-weight: bolder;">회원가입 완료</h1>
            <hr><br>

            <div class="enroll-area" align="center">
               
                    <table>
                        <tr>
                          <img src="/winefine/resources/images/welcome.png" id="welcome">
                        </tr>
                        <tr><br><h5>WINE FINE의 회원이 되신 것을 진심으로 환영합니다.</h5></tr>                      
                        <tr><br>
                            <button style="background-color: gray;" onclick="home();">홈으로</button> 
                            <button onclick="login();">로그인</button>                                  
                        </tr>   
                    </table>
                
                <script>
               	function home() {
               		
               		location.href="<%=contextPath%>/main.do";
               	};
               	
               	function login(){
               		
               		location.href="<%=contextPath%>/loginForm.me";
               	};
                
                </script>
            </div>

        </div>

    <!-- bottom : 푸터바 영역 ---------------------------------------------------->
    <div class="w_ bottom">
        <!-- 푸터바 START-->
        <%@ include file="../common/footer.jsp" %>

        <!-- 푸터바 END-->

   </div>
   
    
    
</body>
</html>