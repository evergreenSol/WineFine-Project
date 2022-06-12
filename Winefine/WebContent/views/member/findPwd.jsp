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
            
            /* 비밀번호 재설정 페이지 상세 항목 */
            .findPwd-outer {
                width:1200px;
                height: 800px;
                margin:auto;
                margin-top:50px;
                font-family: Arial, Helvetica, sans-serif        
            }
    
            .findPwd-outer>#findPwd_1, .findPwd-outer>#findPwd_2{
                height:70%;
                width:45%;
                float: left;
            }
        
            #findPwd-form input{
                margin: 10px;
            }

            .findPwd-area a{
                margin: 30px;
                text-decoration: none;
                color: gray;
                font-size:smaller;
                padding: 30px;
            }

            #findPwd_1 img{
                float: right;
                width:72%;
                height:540px;
                display:block;
            }

            #findPwd-table{
                margin-top: -180px; 
                width: 80%
            }
            
            #findPwd-table tr{
                text-align: center;
            }
            
             #findPwd-table th{
             	
                text-align: right;
            }
            
            #findPwd-table #submit{
                background-color: #6B325B;
                color: white;
                width:88%;
                height:40px;
                border-radius: 5px;
                font-size:medium;
                margin-top:15px;
            }

            #findPwd-table #clickButton{
                background-color:rgb(119, 118, 118);
                color:white;
                border-radius: 3px;
                font-size:8px;
            }

            #findPwd-table #submit:hover, #findPwd-table #clickButton:hover{
                opacity : 0.7;
                cursor: pointer;
            }

            #findPwd-table input::placeholder {
                color:gray;
                font-size: smaller;
                font-style: italic;
            }

            #findPwd-info{
                width: 90%;
                height: 102px;
                background-color: rgb(248, 247, 248);
                text-align: center;
                border-radius:5px;
                vertical-align: middle;
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
                <div id="findPwd_1"><img src="/winefine/resources/images/findPwd.jpg"></div>
                <div id="findPwd_2">
                    <div align="center" style="color:#6B325B; font-size:200%; font-weight:bolder;">비밀번호 찾기</div>
                    <hr>
                      <div class="findPwd-area" align="center">
                        <form id="findPwd-form" action="/winefine/findPwd.me" method="post" name="pfrm">
                            <table id="findPwd-table" text-align="center">
                                <tr>
                                    <td colspan="3">
                                        <textarea id="findPwd-info" style="resize:none;">비밀번호가 생각나지 않을 경우,&#10; 아이디와 이름, 핸드폰 번호를 입력하시면&#10; 이메일로 인증 코드를 발송해드립니다.
                                        </textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>아이디 </th>
                                    <td><input type=text name="userId" id="userId" required placeholder="아이디를 입력해 주세요." size="25"></td>
                                    <br>
                                </tr>
                                <tr>
                                    <th>이름 </th>
                                    <td><input type=text name="userName" id="userName" required placeholder="이름을 입력해 주세요." size="25"></td>
                                    <br>
                                </tr>
                                <tr>
                                    <th> 이메일</th>
                                    <td><input type=email name="email" id="email" required placeholder="이메일 주소를 입력해 주세요." size="25"></td>
                                    <br><br><br>
                                </tr>
                                <tr>
                                    <th><button type="button" id="clickButton" onclick="getCertificationNum();">메일발송</button></th>
                                    <td><input type="text" name="loginNumber" id="loginNumber" disabled placeholder="인증번호 6자리 입력" size="25"></td>
                                    <br><br><br>
                                </tr>
                                <tr>
                                    <td colspan="2"><button type="submit" id="submit" onclick="return invalidateNum();">비밀번호 재설정</button></td>
                                </tr>
                            </table><hr>
                          </form>
                        <div align="center">
                            <a href="/winefine/loginForm.me">로그인 하기</a> 
                            <a href="/winefine/findIdForm.me">아이디 찾기</a>
                        </div>
                    </div>
                </div>  
           </div>    
           
           <script>

            var otp;

		    function getCertificationNum() {
		
                alert("인증번호가 발송되었습니다.");	
                    
                var email = $("#email").val();
            
                $("#loginNumber").removeAttr("disabled");
            
                $.ajax({
                    url : "sendEmail.me",
                    data : {email : email},
                    type : "post",
                    success : function(result) {
            
                    // result : 컨트롤러에서 발생시킨 otp 코드
                    otp = result;
                    
                    }, 
                    error : function() {
            
                   		 console.log("이메일 인증용 ajax 실패");
                    }
                });
		    }
		    
            function invalidateNum() {

                var inputOtp = $("#loginNumber").val();

                     if(otp == inputOtp) {

                         alert("인증되었습니다. ");
                    
                    	 return true; 
                    } else {
                    	
                          alert("인증번호가 맞지 않습니다.");
                          $("#loginNumber").val("").attr("disabled", true);
                    
                    	return false;
                }
                return false;
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