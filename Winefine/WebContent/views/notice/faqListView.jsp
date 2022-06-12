<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    .store_body{
        width: 100%;
        height: 70%;
    }
    .store_body td.body_l{
        width: 20%;
        vertical-align: top;
    }
    .store_body td.body_r{
        width: 80%;
    }
    
    /* 상세 항목 */
    .sort{
        float: right;
        height: 100%;
    }

    .delete{
        padding-left: 5%;
        width: 90%;
        height: 100%;
    }
    /* body_r 영역 */
    #faq>div {
        width : 750px;
        height : 50px;
        line-height : 50px;
        border-radius : 5px;
        border : 1px solid rgb(107, 50, 91);
        cursor : pointer;
        text-align : center; 
    }
    #faq>p {
        border : 1px solid lightgray;
        background-color : rgb(107, 50, 91);
        color : white;
        width : 750px;
        height : 100px;
        margin-top : 5px;
        border-radius : 10px;
        padding : 10px;
        box-sizing : border-box;
        display : none;
        text-align : center;
    }
    .btn1 {
        background-color : rgb(107, 50, 91);
        color : white;
        cursor : pointer;
        width: 750px;
        height: 50px;
        font-size:medium;
        border-radius : 5px;
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
        <br><br>
        <div class="videoT">

            <div class="img">
                <video width="100%" height="auto" autoplay muted loop playsinline>
                    <source src="/winefine/resources/images/wine.mp4">
                </video>
            </div>
            <h2 class="bg_dark">
                <span>고 객 센 터</span>
            </h2>
        </div>
        <br>
        <!-- body left(카테고리) & right(상품리스트)-->
        <table class="store_body">
            <td class="body_l">
                <%@ include file="../common/category-notice.jsp" %>
            </td>
            <td class="body_r">
                <div class="delete" >
                    <b style="font-size:24px;">FAQ</b>
                    <hr style="border: 1px solid black">
                    <br><br>
                    <ul id="faq">
                        <div ><img src=""><b>[픽업,배송] 지정한 수령일보다, 몇 주 늦게 가도 될까요? 와인 보관이 가능한가요?</b></div>
                        <p><img src="">수령점으로 전화 주시면, 최대한 고객님 편의에 맞춰 도와드리겠습니다.</p>
                        <div><img src=""><b>[픽업,배송] 주문자가 직접 가지 못하여, 대리인이 가서 수령하려고 합니다.</b></div>
                        <p><img src="">기본적으로 주문하신 고객님 본인께서 매장에 방문해주셔야 합니다. 예외적인 경우에는 수령점으로 전화 주시기 바랍니다.</p>
                        <div><img src=""><b>[주문,결제] 와인 어떻게 사나요? 주문 어떻게 하나요?</b></div>
                        <p><img src="">와인 상세페이지에서 [구매하기] 클릭 후 진행하실 수 있습니다.</p>
                        <div><img src=""><b>[주문,결제] 무통장 입금 하였는데, 왜 계속 [입금대기] 상태로 보이나요?</b></div>
                        <p><img src="">전일 14시 01분~당일 14시까지의 입금 내역이 14시에 [결제완료] 상태로 일괄 변경이 됩니다. 고객님께서 입금하셨더라도, 14시 전까지는 [입금대기] 상태로 보일 수 있습니다.</p>
                        <div><img src=""><b>[주문,결제] 현장 결제 선택 하였는데, 수령시에 매장에서 카드결제로 변경 가능한가요?</b></div>
                        <p><img src="">수령시에 결제수단 변경 가능합니다.</p>
                        <div><img src=""><b>[픽업,배송] 수령점 변경은 어떻게 하나요?</b></div>
                        <p><img src="">주류통신판매 행정고시사항으로 선택하신 수령점 외에는 수령 하실 수 없습니다.</p>
                        <div><img src=""><b>[픽업,배송] 수령일자 변경은 어떻게 하나요?</b></div>
                        <p><img src="">지정하신 수령점으로 전화 하셔서 변경이 가능합니다.</p>
                        <div><img src=""><b>[픽업,배송] 지방은 구매가 안 되는 건가요?</b></div>
                        <p><img src="">온라인으로 구매예약/결제완료한 상품을, 매장에서 직접 수령하시게 됩니다. WINEFINE 매장은 서울에 3곳이 있습니다.</p>
                        <div><img src=""><b>[픽업,배송] 택배 발송 가능한가요?</b></div>
                        <p><img src="">WINEFINE 직영점, 서울 3개점에서 수령이 가능합니다.</p> 
                    </ul>
                    <br><br>
                    <div align="center">
                    <b>
                    	자주 찾는 질문의 답변이 부족하시다면 <br>
                    	WINEFINE 상담원에게 문의해 주세요<br><br> 
                    	<% if(loginUser != null) { %>
                    	<a href="/winefine/list.on"><button class="btn1">1:1 문의하기 </button></a>
                    	<% } else {%>
                    	<a href="/winefine/loginForm.me"><button class="btn1">1:1 문의하기 </button></a>	 
                    	<% } %>
                    	
                    </b>
                    </div>
                    <script>
                        $(function() {
                            $("#faq>div").click(function() {
                                
                                var $p = $(this).next();
            
                                console.log($p.css("display"));
            
                                if($p.css("display") == "none") {
                                    
                                    $(this).siblings("p").slideUp(1000);
            
                                    $p.slideDown(1000);
                                }
                                else {
            
                                    $p.slideUp(1000);
                                }
                            });
                        });
                    </script>   
                </div>
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