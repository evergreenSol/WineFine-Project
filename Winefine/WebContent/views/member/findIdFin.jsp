<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Member m = (Member)request.getAttribute("loginUser"); %>    

 
 
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> WINEFINE :D </title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><!--온라인 방식-->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
            
            /* 아이디 찾기 완료 페이지 상세 항목 */
            .enrollFin-outer {
                width:1200px;
                height: 800px;
                margin:auto;
                margin-top: 50px;
               
            }

            textarea{
                width: 65%;
                height: 115px;
                background-color: rgb(248, 247, 248);
                text-align: center;
                border-radius:5px;
                font-weight: bolder;
                
            }

            #enrollFin_1 img{
                float: right;
                width:70%;
                height:500px;
                display:block;
            }

           
            .enrollFin-outer>#enrollFin_1, .enrollFin-outer>#enrollFin_2{
                width:45%;
                height:70%;
                float:left;
            }

            #enroll-info{
                width:80%;
            }

            #login_2>h1{
                color: #6B325B; 
            }

            #login-button{
                cursor:pointer;
                width: 65%;
                height:40px;
                color:white;
                border-radius: 5px;
                background: #6B325B;
                font-size:medium;
            }

            #login-button:hover{
                opacity : 0.7;
                cursor: pointer;
            }

			
            .enroll-area a{
                margin: 30px;
                text-decoration: none;
                color: gray;
                font-size:smaller;
                padding: 30px;
            }
                    
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
           <div class="w_ body content">
            <div class="enrollFin-outer">
                <div id="enrollFin_1"><img src="/winefine/resources/images/wine5.jpg"></div>
                <div id="enrollFin_2">
                    <div align="center" style="color:rgb(119, 45, 96); font-size:200%; font-weight:bolder;">아이디 찾기 완료</div>
                    <hr><br><br><br>
        
                    <div class="enroll-area" align="center">
                            <table>
                                <tr>
                                  <textarea style="resize:none; font-size: large;">  회원님이  가입  당시&#10; 작성했던  아이디는&#10; [ <%=m.getUserId() %> ] 입니다.
                                  </textarea>
                                </tr>
                                <br><br>                    
                                <tr><br><br>
                                  <button id="login-button" onclick="login();">로그인 하기</button>                             
                                  <br><br><br><hr>
                                </tr>
                            </table>
                      
                        <div>
                            <a href="<%=contextPath%>">홈으로</a>
                            <a href="<%= contextPath%>/findPwdForm.me">비밀번호 찾기</a>
                        </div>
                    </div>
                </div>
               
           </div>
           <script>
               function login(){

                location.href="/winefine/loginForm.me";
               };
           </script>
           
           

       <!-- bottom : 푸터바 영역 ---------------------------------------------------->
       <div class="w_ bottom">
        <!-- 푸터바 START-->
        <%@ include file="../common/footer.jsp" %>
        <!-- 푸터바 END-->
        </div>
     </div>
    
      

    </body>
    </html>