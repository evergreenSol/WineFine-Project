<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> WINEFINE :D </title>
<style>

    div{
		box-sizing: border-box;
	}
	.wrap{
		width: 1200px;
		height: 1500px;
		margin: auto;
	}
	.w_{
		/* border: 1px solid red; */
		width: 100%;
	}
	
	.top{
      	height: 10%;
    }
    .body{
        height: 70%;
    }
    .bottom{
        height: 20%;
    }


  
  .enroll-outer {
        width:1200px;
        height: 800px;
        margin:auto;
        /* margin-top: 50px; */
        box-sizing : border-box;
    }

    #enroll-info{
        width: 80%;
        height: 125px;
        background-color: rgb(248, 247, 248);
        text-align: left;
        border-radius:5px;
        font-size: larger;
    }

    .enroll-outer>div{
        height : 100%;
        float: left;
    }

    #enroll_1, #enroll_2{
        width:45%;
        height:100%;
    }

    #enroll_2>h1{
        color: rgb(119, 45, 96); 
    }

   #enroll_1 img{
        float: right;
        width:70%;
        height:480px;
        display:block;
   }

    #btn1{
        background-color: rgb(119, 45, 96);
        color: white;
        width:80%;
        height: 40px;
        border-radius:5px;
        cursor: pointer;
        font-size:medium;
    }

    #btn1:hover{
        opacity : 0.7;
        cursor: pointer;
    }

    .enroll-area a{
        text-decoration: none;
        color: gray;
        font-size: small;
        padding: 30px;
    }
</style>
</head>
<body>
    <div class="w_ top" style="width: 1200px; margin:auto;">
        <!-- 헤더 START-->
        <%@ include file="../common/header.jsp" %>
        <!-- 헤더 END-->
    </div>
    <!-- ../ : 현재 폴더로부터 한번 빠져나감(즉, 현재 폴더로부터 한단계 상위 폴더로 이동) -->
    <div class="enroll-outer">
   

    <br><br>
        <div id="enroll_1"><img src="/winefine/resources/images/wineEnroll.jpg"></div>
        <div id="enroll_2">
            <h1 align="center">회원가입</h1>
            <hr><br><br>

            <div class="enroll-area" align="center">
               
                    <table>
                        <tr>
                          <textarea rows="20" style="resize:none;" id="enroll-info"> WINE-FINE은 19세 이상만 회원 가입 가능합니다. 가입을 원하시면 아래 [WINE-FINE 가입하기] 버튼을 눌러주세요.
                          </textarea>
                          <br><br><br>
                        </tr>
                        
                        <tr>
                            <div>
                                <br>
                                <button type="button" class="btn" id="btn1" onclick="enrollPage();">WINE FINE 가입하기</button>
                                <br><br><br><br><hr>
                                <span>이미 회원이신가요?</span><a href="/winefine/loginForm.me">로그인 하기</a></span>
                                
                            </div>
                        </tr>
                        
                    </table>

            </div>
        </div>
   </div>
   
   
    <script>
        function enrollPage(){

            location.href="/winefine/enrollForm.me";

        };
        
    </script>
    
    
    
</body>
</html>