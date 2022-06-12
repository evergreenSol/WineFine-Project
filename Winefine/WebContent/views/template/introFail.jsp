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
                background-image: url("../../resources/images/enter_cut.jpg");
                background-repeat: no-repeat; /* 이미지 반복 */
            } 
            
            /* 전체구조 */
            .wrap{
                width: 100%; 
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
                height: 80%;
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
    
            #discript1{
                font-size: 25px;
                line-height: 70px;
            }
            #discript2{
                line-height: 80px;
            }
            #discript3{
                line-height: 20px;
                font-weight: 600;
                color: #6B325B;
            }
            /* 추가*/
            #img_cry{
                margin-top: 2%;
                width: 15%;
                height: 400%;
            }
        </style>
    </head>
    
    
    <body>
        <div class="wrap">
    
                <div class="w_ top">
                    <h1><p>아쉽지만 다음에 만나요</p></h1>
                </div>
    
                <div id="discript1" class="w_ body">
                    <h3><p>WINEFINE은 <span style="background-color:black">&nbsp;만 19세 이상 성인 </span>만 이용가능합니다.</p></h3>
                </div>
                
                <div id="discript2" class="w_ body">
                  <img id="img_cry" src="../../resources/images/cry2.png">
                </div>
                
                <div class="w_ body text">
                </div>
                
                <div id="discript3" class="w_ body text">
                </div>
    
                <div class="w_ bottom">
                </div>
                
        </div>
             
    </body>
    </html>