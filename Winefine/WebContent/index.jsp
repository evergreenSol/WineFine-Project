<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> WINEFINE :D </title>
    <style>
            /* 기본세팅 */
            div{
                color: white;
            }
            h1,p{
                margin: 0;
            }
            body{
                background-size: cover;   /* 이미지 사이즈 꽉 차게*/
                background-image: url("/winefine/resources/images/enter_cut.jpg");
                background-repeat: no-repeat; /* 이미지 반복 */
                background-color: #6B325B;
            } 
            
            /* 전체구조 */
            .wrap{
                width: 1200px; 
                height: 730px; 
                margin: auto;
            } 
            .top{
                height: 35%;
            }
            .body{
                height: 8%;
            }
            .bottom{
                height: 31%;
            }
            input{
                width: 7%;
                height: 50px;
                font-size:150%;
                text-align: center;
            }
    
            /* 세부사항 */
            a{
                text-decoration: none;
                color: white;
            }
            a:hover{
                color: white;            
            }
            .w_ {
                text-align: center;
            }
            .top{
                line-height: 500px;
                font-weight: 900;
                font-size: xx-large;
            }
            .text{
                font-size:14px;
            }
            .btn{
                width: 200px;
                height: 45px;
                font-size: 20px;
    			font-weight: 600;
                border-radius: 50px;
                border: 1px solid #6B325B;
                background-color: #6B325B;
            }
            .btn:hover{
                color: white;
                background-color: black;
                border: 1px solid black;
                cursor: pointer;
            }
    
            #description1{
                font-size: 25px;
                line-height: 70px;
            }
            #description2{
                line-height: 80px;
            }
            #description3{
                padding: 1%;
                font-weight: 600;
                color: #6B325B;
            }
        </style>
    </head>
    
    
    <body>
        <div class="wrap">
                <div class="w_ top">
                    <h1><p>ARE YOU READY TO DRINK?</p></h1>
                </div>
    
                <div id="description1" class="w_ body">
                    <h3><p>당신은 <span style="background-color:black">&nbsp;WINEFINE </span> 을 즐길 준비가 되었습니까?</p></h3>
                </div>
                
                <div id="description2" class="w_ body text">
                    <p>해당 사이트는 만 19세 이상 성인만 입장 가능합니다.</p>
                </div>
                
                <!--<form action="/winefine/entrance" method="post">-->
                    <div class="w_ body text">
                        <input type="text" id="birthYear" placeholder="생년" minlength="4" maxlength="4" required>
                        <input type="text" id="birthMonth" placeholder="월" minlength="2" maxlength="2">
                        <input type="text" id="birthDate" placeholder="일" minlength="2" maxlength="2">
                    </div>
            
            
                    <div id="description3" class="w_ body text">
                        <p>
                            온라인 와인 판매사이트인 저희 WINEFINE은 올바른 음주 문화를 선도하기 위하여 노력하고 있으며,<br>
                            19세 미만 청소년에게 절대로 주류 판매를 하지 않습니다.
                        </p>
                    </div>
        
                    <div class="w_ bottom">
                        <button class="btn" type="button" onclick="return enter();">입 장 하 기</button>
                    </div>
                <!--</form>-->
        </div>

        <script>
            function enter(){
                var birthYear = document.getElementById("birthYear").value;
                var birthMonth = document.getElementById("birthMonth").value;
                var birthDate = document.getElementById("birthDate").value;

                var sysYear = new Date();
                sysYear = sysYear.getFullYear();

                var area = document.getElementById("description2");
                
                var age = sysYear - birthYear;
                if( age > 0 && age >= 20 && age < 110 
                		&& birthMonth > 0 && birthMonth < 13 
                		&& birthDate > 0 && birthDate < 32){
                	location.href = "/winefine/welcome";
                }
                else if( age > 0 && age < 19 ){
                	area.style.color="yellow";
                    area.innerHTML = "죄송합니다. 와인파인은 19세 이상만 이용가능합니다."; 
                    
                }
                else{
                	area.style.color="yellow";
                    area.innerHTML = "올바른 형식의 날짜가 아닙니다. 다시 확인해주세요.";
                    
                    document.getElementById("birthYear").select();

                }
            }
        </script>
             
    </body>
    </html>