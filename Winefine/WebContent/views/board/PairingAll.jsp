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
            
            /* - 구조 : body 영역_ 좌측 & 우측 분할 */
            .sortArea{
                height: 3%;
                padding-right: 100px;
            }
            td.body_l{
                width: 20%;
                height: 97%;
                vertical-align: top;
            }
            td.body_r{
                width: 80%;
                height: 97%;
                vertical-align: top;
            }
            /* 상세 항목 */
            
    /* 영상 테스트 */
    
    .videoT {
        width: 100%; 
        overflow: hidden;
        margin: 0px auto; 
        position: relative;

    }
    .videoT.img {
        /* position: absolute; */
        top: 0;
        left: 50%;
        width: 100%;
        transform: translateX(-50%);
        /* z-index: 1; */
    }
    .videoT .bg_dark {
        position: absolute; 
        top: 35%;
        /* left: 50%; */
        width: 100%;
        text-align: center;
        /* z-index: 20; */
        
    }
    .videoT .bg_dark span {
        /* text-align: center;  */
        font-size: 30px; 
        color: #ffffff;
    }

    /**************************************************/
    

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
           <div class="w_ body">
           
                      <!------------------------------비디오------------------------>
            
            <div class="videoT">

                <div class="img">
                    <video width="100%" height="auto" autoplay muted loop playsinline>
                        <source src="/winefine/resources/images/promotion.mp4">
                    </video>
                </div>
                <h2 class="bg_dark">
                    <span>게 시 판</span>
                </h2>
            </div>
            <!------------------------------------------------------------->
           
	            <!-- sort : 정렬 드롭다운 영역 ------------------------------------------------------------>
	            <div class="w_ sortArea">
	                <!-- 삽입X 공간여백용으로 띄워둠-->
	            </div>
	            <!-- body left(카테고리) & right(와인용어)-->
	            <table style="height: 100%;" >
	                
                    <td class="body_l">
	                    <!-- category-board 영역 START-->
	                    <div>
	                        <%@ include file="../common/category-board.jsp" %>
	                    </div>
	                     <!-- category-board 영역 END-->
	                </td>

	                <td class="body_r">
	                     <!-- 와인용어 콘텐츠 START-->
	                    <div>
	                        <%@ include file="../common/terminology.jsp" %>
	                    </div>
	                    <!-- 와인용어 콘텐츠 END-->
	                </td>

	            </table>
	            
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
    
