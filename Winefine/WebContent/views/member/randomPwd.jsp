<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ranPwd = (String)session.getAttribute("ranPwd");
%>    
    
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> WINEFINE Find password </title>
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
            
            /* 비밀번호 찾기 완료 페이지 상세 항목 */
            .findPwd-outer {
                width:1200px;
                height: 800px;
                margin:auto;
                margin-top: 50px;             
            }
    
            .findPwd-outer>#findPwd_1, .findPwd-outer>#findPwd_2{
                width:45%;
                height:70%;
                float: left;
            }
        
            #findPwd-form input{
                margin: 15px;
            }

            #findPwd_1 img{
                float: right;
                width:75%;
                height:500px;
                display:block;
            }

            #findPwd-table{
                margin-top: -80px;
                
            }

            #findPwd-table #submit{
                background-color: #6B325B;
                display: block; 
                color: white;
                margin:auto;
                width:350px;
                height:40px;
                border-radius: 5px;
                font-size:medium;
            }

            #findPwd-table #submit:hover{
                opacity : 0.7;
                cursor: pointer;
            }
           
            textarea{
                width: 65%;
                height: 130px;
                background-color: rgb(248, 247, 248);
                text-align: center;
                border-radius:5px;
                font-weight: bolder;
            }

            .findPwd-area {
                margin-top:50px;
            }


            .findPwd-area a{
                text-decoration: none;
                color: gray;
                font-size: small;
                padding: 30px;
                margin: 30px;
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
            <div class="findPwd-outer">
                <div id="findPwd_1"><img src="/winefine/resources/images/wine6.jpg"></div>
                <div id="findPwd_2">
                    <div align="center" style="color:#6B325B; font-size:200%; font-weight:bolder;">비밀번호 재설정</div>
                    <br><br>
                      <div class="findPwd-area" align="center">
                        <form id="findPwd-form" action="/winefine/resetPwd.me" method="post" id="rfrm">
                            <table id="findPwd-table">
                                <tr>
                                    <td colspan="2" align="center">
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <textarea style="resize:none; font-size: medium;">  회원님의 임시 비밀번호입니다.&#10; [<%=ranPwd %> ]&#10;로그인 후 마이페이지에서&#10; 비밀번호를 변경해 주세요.
                                    </textarea><br><br><br>
                                  </tr>
                                  <br><br><br>
                                <tr>
                                    <th colspan="2">
                                        <br>
                                        <button type="button" id="submit" onclick="login();">로그인 하기</button>
                                    </th>
                                </tr>
                            </table>
                            <br><br><hr>
                        </form>
                        <div align="center">
                            <a href="/winefine/main.do">홈으로</a> 
                            <a href="/winefine/findIdForm.me">아이디 찾기</a>
                        </div>
                    </div>
                    <script>
                        function login(){
                          
                            location.href="/winefine/loginForm.me";
                    }
                    </script>
                </div>  
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