<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> WINEFINE :D </title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- * 부트스트랩 영역 --------------------------------------------------------------------------->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- menubar영역은 모든 페이지마다 넣어주기로 했으니 얘한테 한번 넣어두면 include 되는 모든페이지에서 쓸 수 있겠쥬 ! ☆  -->

<!-- swiper.js -->
<link
rel="stylesheet"
href="https://unpkg.com/swiper@8/swiper-bundle.min.css"
/>

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<style>
    
	.wrap{
		width: 1200px;
		height: 900px;
		margin: auto;
	}
	.w_{
        width: 100%;
	}
	
	.top{ 
      	height: 10%;
          
    }
    .body{
        height: 80%;
        width: 100%;
        margin: auto;
    }
    .bottom{
        height: 20%;
    }
    
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
    form table{
        margin: auto;
        width: 80%;
    }

    #buttonDiv{
        margin-top: 30px;
    }

    .swiper {
            
        width: 900px; /* 스와이퍼의 한 페이지의 너비*/
        height: 400px;
    }

    .swiper-content{
        text-align: center;
        font-size: large;
    }
    
    /**********************************************/
    .soul-title{
        height: 20%;
        border: 5px solid rgb(107, 50, 91);
        background-color: rgba(107, 50, 91, 0.7);
        color: white;
        border-radius: 50px;
        margin-bottom: 5px;
    }
    .soul-title>h1{
        margin-top: 10px;
    }

    .soul-content{
        height: 50%;
        border: 5px solid rgb(107, 50, 91);
        background-color: rgba(107, 50, 91, 0.7);
        color: white;
        border-radius: 50px;
        margin-bottom: 5px;
        padding: 20px;
    }

    .soul-radioGroup{
        height: 20%;
        border: 5px solid rgb(107, 50, 91);
        background-color: rgba(107, 50, 91, 0.7);
        color: white;
        border-radius: 50px;
        margin-bottom: 5px;
    }
    .soul-radioGroup>*{
        margin-top: 10px;
    }

    #resultbtn{
        background-color: rgb(107, 50, 91);
        color: white;
        font-size: medium;
        border-radius: 15px;
        border: none;
        width: 130px;
        height: 50px;
        font-size: large;
        font-weight: 900;
    }

    #resultbtn:hover{
        opacity: 0.7;
    }
    input[type=radio]{
        cursor: pointer;
    }
    label{
        cursor: pointer;
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

        
		
		<!-- body : 카테고리 페이지 바디 영역 --------------------------------------------->
        <div class="w_ body">

            <!------------------------------비디오------------------------>
            <br><br><br><br>
            <div class="videoT">

                <div class="img">
                    <video width="100%" height="auto" autoplay muted loop playsinline>
                        <source src="/winefine/resources/images/soul.mp4">
                    </video>
                </div>
                <h2 class="bg_dark">
                    <span>소울와인찾기</span>
                </h2>
            </div>
            <!------------------------------------------------------------->

            <form style="margin-top:50px" action="<%= contextPath %>/result.bo" method="post">

                <!----------------------------------------------------------------------->
                <table class="store_body">
                    <td class="body_r">
                        <div class="delete" >
                            <!-- Slider main container -->
                            <div class="swiper">

                                <!-- If we need pagination -->
                                <div class="swiper-pagination"></div>
                            
                                <!-- If we need navigation buttons -->
                                <div class="swiper-button-prev" style="color: rgb(107, 50, 91); top:46%;"></div>
                                <div class="swiper-button-next" style="color: rgb(107, 50, 91); top:46%;"></div>
                            

                                <!-- Additional required wrapper -->
                                <div class="swiper-wrapper">
                                <!-- Slides -->
                                <div class="swiper-slide swiper-content"  >

                                    <div class="soul-title">
                                        <h1>당도</h1>
                                    </div>

                                    <div class="soul-content">
                                        <span>
                                            말 그대로 단맛의 정도다. <br>
                                            스위트(Sweet), 드라이(Dry) 등으로 표현한다. <br>
                                            당도가 높으면 스위트하다고 표현한다. <br>
                                            부드러운 단맛과 진하지 않은 정도의 감미를 지녔다면 세미 스위트(Semi-Sweet)라고 말한다.<br>
                                            반대로 세미 드라이(Semi-Dry)는 잘 익은 과일 향이 풍부하지만 당도가 덜 느껴질 때 쓴다. <br>
                                            당도가 느껴지지 않을 때는 드라이하다고 표현한다.
                                        </span>
                                    </div>

                                    <div class="soul-radioGroup">
                                        <p style="margin-top: 5px; margin-bottom: 0px;">당도의 정도</p>
                                        <input type="radio" name="sweetness" value="1" required id="s1">&nbsp;&nbsp;<label for="s1">1</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="sweetness" value="2" id="s2">&nbsp;&nbsp;<label for="s2">2</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="sweetness" value="3" id="s3">&nbsp;&nbsp;<label for="s3">3</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="sweetness" value="4" id="s4">&nbsp;&nbsp;<label for="s4">4</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="sweetness" value="5" id="s5">&nbsp;&nbsp;<label for="s5">5</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    </div>
                                    
                                </div>

                                <div class="swiper-slide swiper-content">
                                    
                                    <div class="soul-title">
                                        <h1>산도</h1>
                                    </div>

                                    <div class="soul-content">
                                        <span>
                                            신맛의 정도를 뜻한다. <br>
                                            산도가 높을수록 힘과 견고한 구조감을 지녔다. <br>
                                            산도가 너무 높으면 날카롭다는 느낌을 준다. <br>
                                            적당한 산도의 경우 신선하고 청량한 느낌을 준다.<br>
                                            반대로 산도가 느껴지지 않거나 지나치게 낮다면<br>
                                            보관 상태에 문제가 있거나 시음 시기가 지났다고 판단할 수 있다.
                                        </span>
                                    </div>
                                
                                    <div class="soul-radioGroup">
                                        <p style="margin-top: 5px; margin-bottom: 0px;">산도의 정도</p>
                                        <input type="radio" name="acidity" value="1" required id="a1">&nbsp;&nbsp;<label for="a1">1</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="acidity" value="2" id="a2">&nbsp;&nbsp;<label for="a2">2</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="acidity" value="3" id="a3">&nbsp;&nbsp;<label for="a3">3</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="acidity" value="4" id="a4">&nbsp;&nbsp;<label for="a4">4</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="acidity" value="5" id="a5">&nbsp;&nbsp;<label for="a5">5</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    </div>
                                    
                                </div>
                                
                                <div class="swiper-slide swiper-content">
                                    
                                    <div class="soul-title">
                                        <h1>바디</h1>
                                    </div>

                                    <div class="soul-content">
                                        <span>
                                            와인을 마셨을 때 입 안에서 느껴지는 걸쭉함의 정도다. <br>
                                            4가지 특징 중 가장 표현하기 어렵다. 경험이 필요하다.<br>
                                            라이트 바디(Light Bodied)는 생수보다 약간 무게감이 느껴지는 수준이다. <br>
                                            미디엄 바디(Medium bodied)는 산도, 당도, 탄닌, 알코올농도 등 여러 요소를 감지할만한 무게감이다. <br>
                                            풀 바디(Full bodied)는 입 안이 꽉 차는 것 같은 풍만한 느낌과 묵직한 무게감을 뜻한다.
                                        </span>
                                    </div>
                                    
                                    <div class="soul-radioGroup">
                                        <p style="margin-top: 5px; margin-bottom: 0px;">바디의 정도</p>
                                        <input type="radio" name="body" value="1" required id="b1">&nbsp;&nbsp;<label for="b1">1</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="body" value="2" id="b2">&nbsp;&nbsp;<label for="b2">2</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="body" value="3" id="b3">&nbsp;&nbsp;<label for="b3">3</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="body" value="4" id="b4">&nbsp;&nbsp;<label for="b4">4</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="body" value="5" id="b5">&nbsp;&nbsp;<label for="b5">5</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    </div>
                                    
                                </div>
                            
                                <div class="swiper-slide swiper-content">
                                    
                                    <div class="soul-title">
                                        <h1>탄닌</h1>
                                    </div>

                                    <div class="soul-content">
                                        <span>
                                            떫은맛의 정도다. <br>
                                            탄닌 정도에 따라 풍부함, 부드러움, 거침 등으로 표현한다. <br>
                                            잘 익은 포도로 만들거나 충분히 숙성된 와인의 경우 탄닌이 부드럽다.
                                        </span>
                                    </div>

                                    <div class="soul-radioGroup">
                                        <p style="margin-top: 5px; margin-bottom: 0px;">탄닌의 정도</p>
                                        <input type="radio" name="tannin" value="1" required id="t1">&nbsp;&nbsp;<label for="t1">1</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="tannin" value="2" id="t2">&nbsp;&nbsp;<label for="t2">2</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="tannin" value="3" id="t3">&nbsp;&nbsp;<label for="t3">3</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="tannin" value="4" id="t4">&nbsp;&nbsp;<label for="t4">4</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="tannin" value="5" id="t5">&nbsp;&nbsp;<label for="t5">5</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    </div>
                                    
                                </div>

                            </div>  

                        </div>
                    </div>
                </td>
            </table>
        </div>
                <!---------------------------------------------------->
                <div align="center">
                    <input id="resultbtn" type="submit" value="결과보기" >
                </div>
            </form>
        </div>

    <script>
        const swiper = new Swiper('.swiper', {
        // Optional parameters
        // direction: 'vertical',
        loop: true,
        
    
        // If we need pagination
        pagination: {
        el: '.swiper-pagination',
        },
    
        // Navigation arrows
        navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
        },
    
       
    }); 
    </script>


    <!-- bottom : 푸터바 영역 ---------------------------------------------------->
    <div class="w_ bottom">
        
        <!-- 푸터바 START-->
        <%@ include file="../common/footer.jsp" %>
        <!-- 푸터바 END-->
        
    </div>
		
</body>
</html>