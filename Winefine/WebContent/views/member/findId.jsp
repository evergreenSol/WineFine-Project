<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            
            /* 아이디 찾기 페이지 상세 항목 */
            .findId-outer {
                width:1200px;
                height: 800px;
                margin:auto;
                margin-top: 50px;      
            }

            .findId-outer>#findId_1, .findId-outer>#findId_2{
                height : 70%;
                width:45%;
                float:left;
            }

            #findId-form input{
                margin: 10px;
            }

            .findId-area a{
                text-decoration: none;
                color: gray;
                font-size: small;
                padding: 30px;
                margin: 30px;
            }

            #findId_1 img{
                float: right;
                width:75%;
                height:500px;
                display:block;
            }

           #findId-table{
            margin-top: -30px;
           }

            #submit{
                background-color: #6B325B;
                color: white;
                width:100%;
                height:40px;
                border-radius: 5px;
                font-size:medium;
            }

            #btn1:hover{
                opacity : 0.7;
                cursor: pointer;
            }

            #findId-info{
                width: 100%;
                height: 102px;
                background-color: rgb(248, 247, 248);
                text-align: center;
                border-radius:5px;
            }

            #findId-table input::placeholder {
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
            <div class="findId-outer">
                <div id="findId_1"><img src="/winefine/resources/images/wineFindId.jpg"></div>
                <div id="findId_2">
                    <div align="center" style="color:#6B325B; font-size:200%; font-weight:bolder;">아이디 찾기</div>
                    <hr>
                     <div class="findId-area" align="center">
                        <form id="findId-form" action="/winefine/findId.me" name="ifrm" method="post">
                            <table id="findId-table">
                                <tr>
                                    <td colspan="2">
                                        <textarea id="findId-info" style="resize:none;">아이디가 생각나지 않을 경우,&#10; 이름과 핸드폰 번호를 입력하시면&#10; 아이디 정보를 확인할 수 있습니다.
                                        </textarea><br>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이름 </th>
                                    <td><input type=text name="userName" id="userName" required placeholder="이름을 입력해 주세요." size="25"></td>
                                </tr><br>
                               
                                <tr>
                                    <th>핸드폰 번호  </th>
                                    <td><input type=text name="phone" id="phone" required placeholder="핸드폰번호를 입력해 주세요." size="25"></td>
                                    <br>
                                </tr>
                                
                                <tr><br>
                                    <th colspan="2">
                                        <br>
                                        <button type="submit" class="btn" id="submit">아이디 찾기</button>
                                    </th>
                                </tr>
                            </table>
                            <br><hr>
                        </form>
                        <div align="center">
                            <a href="<%=contextPath%>/loginForm.me">로그인 하기</a> 
                            <a href="<%= contextPath%>/findPwdForm.me">비밀번호 찾기</a>
                        </div>
                    </div>
                    </div>
              </div>
           <script>
	       window.onload = function() {
                document.getElementById('submit').onclick = function() {
                    
                    if ( document.ifrm.userName.value.trim() == '' ) {
                        alert( '이름을 입력해주세요' );
                        return false;
                    }
                    if ( document.ifrm.phone.value.trim() == '' ) {
                        alert( '이메일 주소를 입력해주세요' );
                        return false;
                    }
                    document.ifrm.submit();
                }
            }   
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