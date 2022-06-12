<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie[] cookies = request.getCookies(); 

	String saveId ="";
	
	if(cookies!=null){
		
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("saveId")){
				
				saveId = cookies[i].getValue();
				break;
			}
		}
	}
%>    
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> WINEFINE :D </title>
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
                height: 45%;
            }
            .best{
                height: 25%;
            }
            .bottom{
                height: 20%;
            }
            
            /* 로그인 페이지 상세 항목 */
            .login-outer {
                width:1200px;
                height: 800px;
                margin:auto;
                margin-top: 50px;
            }

            .login-outer>#login_1, .login-outer>#login_2{
                height : 70%;
                float:left;
            }

            #login_1{
                width:45%;
                height:70%;
            }

            #login_1 img{
                float: right;
                width:75%;
                height:550px;
                display:block;
            }

            #login_2 {
                width:45%;
                height:70%;
            }

            #login_2>h1{
                color: rgb(119, 45, 96); 
            }

            #login-form input{
                margin: 10px;
            }

            #btn1{
                background-color: #6B325B;
                color: white;
                width:100%;
                height:40px;
                border-radius: 5px;
                font-size:medium;
            }

            #btn1:hover, #btn2:hover{
                opacity : 0.7;
                cursor: pointer;
            }

            #btn2{
                background-color: gray;
                color: white;
                width:100%;
                height:40px;
                border-radius: 5px;
                font-size:medium;
            }

            #login-form a{
                text-decoration: none;
                color: gray;
                font-size: small;
            }

            #forCache th {
                text-align: right;
            }

            #login-form input::placeholder {
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
            <div class="login-outer">
                <div id="login_1"><img src="<%= contextPath %>/resources/images/wineLogin.jpg"></div>
                <div id="login_2">
                    <div align="center" style="color:#6B325B; font-size:200%; font-weight:bolder;">로그인 하기</div>
                    <br><hr>
        
                    <div class="login-area" align="center">
                        <form id="login-form" action="<%= contextPath %>/login.me" method="post">
                            <table>
                                <tr>
                                    <th style="text-align : center;">아이디  </th>
                                    <td><input type=text name="userId" id="userId" required placeholder="아이디를 입력해 주세요." size="26"></td>
                                </tr>
                               
                                <tr>
                                    <th style="text-align : center;">비밀번호  </th>
                                    <td><input type=password name="userPwd" id="userPwd" required placeholder="비밀번호를 입력해 주세요." size="26"></td>
                                    <br>
                                </tr>
                                <tr colspan="2" id="forCache">
                                    <td></td>
                                    <th>
                                        <input type=checkbox name="saveId" id="saveId" value="y">
                                	    <label for="saveId">아이디 저장</label>
                                    </th>
                                </tr>
                                <tr>
                                    <th style="text-align:center;" colspan="2">
                                        <br>
                                        <button type="submit" class="btn" id="btn1" onclick="return login();">로그인</button>
                                        <br><br><br>
                               
                                        <a href="/winefine/findIdForm.me">아이디 찾기</a>
                                        <a href="/winefine//findPwdForm.me">비밀번호 찾기</a>
                                        <br><hr>
                                        <b>아직 회원이 아니라면?</b>
                                        <br><br><br>
                                        <button type="button" class="btn" id="btn2" onclick="enrollInfo();">회원가입하러 가기</button>
                                    </th>
                                </tr>
                            </table>
                        </form>
        
                    
                    </div>
                    
                    <script>
                        function enrollInfo() {
                            
                            location.href="/winefine/enrollInfo.me";
                        };  
                        
                        
                    	function login(){
                    		
                            var pattern = /\s/g; //공백 확인
                            var userId = $("#login-form input[name=userId]").val();
                            

                            if(userId.match(pattern)){
                                alert("아이디에 공백이 존재합니다. 다시 입력해 주세요.");
                                
                                return false;
                            }
                        };
                            $(function(){
                    		var saveId = "<%=saveId%>"; // "user03" / ""
                    		
                    		if(saveId != ""){
                    			
                    			// 쿠키가 있는 경우
                    			$("#login-form input[name=userId]").val(saveId);
                    			$("#saveId").attr("checked", true);
                    		}
                    	});
                    </script>
                </div>
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