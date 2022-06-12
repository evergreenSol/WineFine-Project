<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)request.getAttribute("m");
%>    
    
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
            
            /* 비밀번호 찾기 완료 페이지 상세 항목 */
            .resetPwd-outer {
                width:1200px;
                height: 800px;
                margin:auto;
                margin-top: 50px;             
            }
    
            .resetPwd-outer>#resetPwd_1, .resetPwd-outer>#resetPwd_2{
                width:45%;
                height:70%;
                float: left;
            }
        
            #resetPwd-form input{
                margin: 15px;
            }

            #resetPwd_1 img{
                float: right;
                width:72%;
                height:510px;
                display:block;
            }

            #resetPwd-table{
                margin-top: -80px;
                
            }

            #resetPwd-table #submit{
                background-color: #6B325B;
                display: block; 
                color: white;
                margin:auto;
                width:85%;
                height:40px;
                border-radius: 5px;
                font-size:medium;
            }

            #resetPwd-table #submit:hover{
                opacity : 0.7;
                cursor: pointer;
            }

            textarea{
                width: 100%;
                height: 105px;
                background-color: rgb(248, 247, 248);
                text-align: left;
                border-radius:5px;
            }

            .resetPwd-area a{
                text-decoration: none;
                color: gray;
                font-size: small;
                padding: 30px;
                margin: 30px;
            }

            #resetPwd-table input::placeholder {
                color:gray;
                font-size: smaller;
                font-style: italic;
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
            <div class="resetPwd-outer">
                <div id="resetPwd_1"><img src="/winefine/resources/images/resetPwd.jpg"></div>
                <div id="resetPwd_2">
                    <div align="center" style="color:#6B325B; font-size:200%; font-weight:bolder;">비밀번호 재설정</div>
                    <br><br>
                      <div class="resetPwd-area" align="center">
                        <form id="resetPwd-form" action="/winefine/resetPwd.me" method="post" id="rfrm">
                            <table id="resetPwd-table">
                                <tr>
                                    <td colspan="2" align="center">
                                       <h5><%= m.getUserName()%>님,<br> 새로운 비밀번호를 입력해 주세요.</h5> <br>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <th>비밀번호 : </th>
                                    <td><input type=password name="resetPwd1" id="resetPwd1" required placeholder="비밀번호를 입력해 주세요." size="25"></td>
                                    <br><br>
                                </tr>
                                <tr>
                                    <th>재입력 : </th>
                                    <td><input type=password name="resetPwd2" id="resetPwd2" required placeholder="한 번 더 입력해 주세요." size="25"></td>
                                    <br><br>
                                </tr>
                                <tr>
                                	<td><input type=hidden name="userNo" value="<%=m.getUserNo() %>"></td>
                                </tr>
                                <tr>
                                    <th colspan="2">
                                        <br>
                                        <button type="submit" id="submit" onclick="return pwValidate();">비밀번호 재설정</button>
                                    </th>
                                </tr>
                            </table>
                            <br><br><hr>
                        </form>
                        <div align="center">
                            <a href="/winefine/loginForm.me">로그인 하기</a> 
                            <a href="/winefine/findIdForm.me">아이디 찾기</a>
                        </div>
                    </div>
                    <script>

                        function pwValidate(){
                          
                            //비밀번호는 영문자, 숫자, 특수기호로 총 4~16글자로 이루어져야 함
                            var regExp = /^[A-Za-z0-9]{4,16}$/;
                            var resetPwd1 = document.getElementById("resetPwd1").value;
                            var resetPwd2 = document.getElementById("resetPwd2").value;
                            
                            
                            if(!regExp.test(resetPwd1)){ //유효하지 않은 경우

                                 alert("비밀번호는 영문자, 숫자, 특수기호로 총 4~16글자로 입력해주세요.");
                                        
                                   document.getElementById("resetPwd1").value=""; //해당 칸을 공란으로 비워줌
                                   document.getElementById("resetPwd2").value=""; 
                                   document.getElementById("resetPwd1").focus(); //커서가 깜빡깜빡이도록 해줌

                                     return false;
                               }

                            if(resetPwd1!=resetPwd2){ //동일하지 않은 경우
                                alert("동일한 비밀번호를 입력해 주세요.");

                                    document.getElementById("resetPwd2").value="";
                                    document.getElementById("resetPwd2").focus();

                                return false;
                            }
                                
                                return true;
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