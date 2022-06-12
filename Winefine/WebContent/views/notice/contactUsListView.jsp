<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> WINEFINE :D </title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41dacd823bb6ff3bf40da2c5a349941c"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<style>
    /* 전체 구조 잡기*/
    div{
        box-sizing: border-box;
        
    }
    .wrap{
        width: 1200px;
        height: 1000px;
        margin: auto;
    }
    .w_{
        width: 100%;
    }
    .top{
       height: 20%;
    }   
    .bottom{
        height: 300px;
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
        height: 90%;
    }
    .delete{
        padding-left: 5%;
        width: 90%;
        
    }
    /* body_r 영역 */
    .outer {
        margin: auto;
        margin: 50px;
    }
    #tab, .tabcontent { width : 100%; }
    .tablinks {
        background-color: rgb(107, 50, 91);
        color: white;
        width: 150px;
        height: 30px;
    }
    .tablinks:hover {
        cursor: pointer;
        opacity : 0.7;
    }
    /* 상세 항목 */
    .swiper {
        width: 500px;
        height: 350px;
    }

    .main_pics {
        width: 100%;
        height: 100%;
        
    }

    
    .swiper-button-next {
        
    }

    .swiper-button-prev {
        background: url(/winefine/resources/images/prev.png) no-repeat;
        background-position: center;
        background-size: 75%;
    }

    .swiper-button-next {
        background: url(/winefine/resources/images/next.png) no-repeat;
        background-position: center;
        background-size: 75%;
    }

    .swiper-button-prev::after,
    .swiper-button-next::after {
        display: none;
    }

    .swiper-pagination-bullet {
        background: white !important; }

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
                <div class="delete">
                    
                    
                    <b style="font-size:24px;">ContactUs</b>
                    <hr style="border: 1px solid black">
                    <br><br>
                    <div id="contactUs-form">
                        <table align="center">
                            <tr>
                                <td colspan="2" align="center">
                                    <b style="font-size:24px;">WINE FINE 매장안내</b><br>
                                	와인이 필요한 순간에, 가장 가까운 와인나라 매장을 찾아주세요!<br>
                                3개 직영매장 (당산점 / 종로점 / 강남점 ) 및 입점매장으로 운영됩니다.
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="tab">
                                    <a href="#dang"><button class="tablinks">당산점</button></a>
                                    <a href="#jong"><button class="tablinks">종로점</button></a>
                                    <a href="#kang"><button class="tablinks">강남점</button></a>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br><br>
                        <table id="dang" class="tabcontent" align="center">
                            <tr>
                                <td>
                                    <!-- Slider main container -->
	                    			<div class="swiper">
	                        		<!-- Additional required wrapper -->
	                        		<div class="swiper-wrapper">
			                        <!-- Slides -->
			                        <div class="swiper-slide"><img src="<%= contextPath %>/resources/images/dang1.jpg" alt="당산점1" class="dang_pics"></div>
			                        <div class="swiper-slide"><img src="<%= contextPath %>/resources/images/dang2.jpg" alt="당산점2" class="dang_pics"></div>
			                        <div class="swiper-slide"><img src="<%= contextPath %>/resources/images/dang3.jpg" alt="당산점3" class="dang_pics"></div>
			
			                        </div>
			                        <!-- If we need pagination -->
			                        <div class="swiper-pagination"></div>
			                    
			                        <!-- If we need navigation buttons -->
			                        <div class="swiper-button-prev"></div>
			                        <div class="swiper-button-next"></div>
                                </td>
                                <td width="500" align="center">
                                    <b style="font-size:24px;">WINE FINE 당산점</b><br>
                                    <img src="">매장 위치 <br>
                                   	    서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F<br>
                                    <br>
                                    <img src=""> 영업 시간 <br>
					                                    평 일 10:00 ~ 21:00<br>
					                                    토요일 11:00 ~ 21:00<br>
					                                    공휴일 13:00 ~ 21:00<br>
					                                    일요일 11:00 ~ 21:00<br>
                                    <br>
                                    <img src=""> 매장 번호<br>
                                    T : 1544-9970
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="map" style="width:800px; height:400px;"></div>
                                    <script>
                                    	var container = document.getElementById('map');
                            			var options = {
                            				center: new kakao.maps.LatLng(37.5339125830764, 126.89675902595089),
                            				level: 2
                            
                            			};

                            			var map = new kakao.maps.Map(container, options);

                            			// 지도를 클릭한 위치에 표출할 마커입니다
                            			var marker = new kakao.maps.Marker({ 
                            			    // 지도 중심좌표에 마커를 생성합니다 
                            			    position: map.getCenter()
                                            
                            			});
                            			// 지도에 마커를 표시합니다
                            			marker.setMap(map);
                                        
                            			
                            			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
                            			var mapTypeControl = new kakao.maps.MapTypeControl(); 
                            			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
                            			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
                            			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); 
                            			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
                            			var zoomControl = new kakao.maps.ZoomControl();map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
                            			
                                    </script>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"><br>
					                                    버스<br>
					                                    선유고등학교/(구)강서세무서<br>
					                                    <img src="<%= contextPath %>/resources/images/icon_busB.jpg"> 7612 <img src="<%= contextPath %>/resources/images/icon_busR.jpg"> 1000 / 1200 / 1300 / 1301 / 1302 / 1400 / 1500 / 1601 / M6628 / M6724 <br>
					                                    당산역 <br>
					                                    <img src="<%= contextPath %>/resources/images/icon_busB.jpg"> 602 / 760 / 5620 / 5714 / 6514 / 6623 / 6631 <br>
					                                    지하철 <br>
					                                    지하철 2, 9호선 당산역 12번 출구 400m <br>
                                </td>
                            </tr>
                        </table>
                        <hr style="border:1px solid black;">
                        <table id="jong" class="tabcontent" align="center">
                            <tr>
                                <td>
                                    <!-- Slider main container -->
	                    			<div class="swiper">
	                        		<!-- Additional required wrapper -->
	                        		<div class="swiper-wrapper">
			                        <!-- Slides -->
			                        <div class="swiper-slide"><img src="<%= contextPath %>/resources/images/jong1.jpg" alt="종로점1" class="jong_pics"></div>
			                        <div class="swiper-slide"><img src="<%= contextPath %>/resources/images/jong2.jpg" alt="종로점2" class="jong_pics"></div>
			                        <div class="swiper-slide"><img src="<%= contextPath %>/resources/images/jong3.jpg" alt="종로점3" class="jong_pics"></div>
			
			                        </div>
			                        <!-- If we need pagination -->
			                        <div class="swiper-pagination"></div>
			                    
			                        <!-- If we need navigation buttons -->
			                        <div class="swiper-button-prev"></div>
			                        <div class="swiper-button-next"></div>
                                </td>
                                <td width="500" align="center">
                                    <b style="font-size:24px;">WINE FINE 종로점</b><br>
                                    <img src="">매장 위치 <br>
                                    	서울특별시 중구 남대문로 120 대일빌딩 2F, 3F<br>
                                    <br>
                                    <img src=""> 영업 시간 <br>
						                                    평 일 10:00 ~ 21:00<br>
						                                    토요일 11:00 ~ 21:00<br>
						                                    공휴일 13:00 ~ 21:00<br>
						                                    일요일 11:00 ~ 21:00<br>
                                    <br>
                                    <img src=""> 매장 번호<br>
                                    T : 1544-9970
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="map1" style="width:800px; height:400px;"></div>
                                    <script>
                                    	var container = document.getElementById('map1');
                            			var options = {
                            				center: new kakao.maps.LatLng(37.56792413362443, 126.98306927175909),
                            				level: 2
                            			};

                            			var map = new kakao.maps.Map(container, options);

                            			// 지도를 클릭한 위치에 표출할 마커입니다
                            			var marker = new kakao.maps.Marker({ 
                            			    // 지도 중심좌표에 마커를 생성합니다 
                            			    position: map.getCenter() 
                            			});
                            			// 지도에 마커를 표시합니다
                            			marker.setMap(map);
                            			
                            			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
                            			var mapTypeControl = new kakao.maps.MapTypeControl(); 
                            			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
                            			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
                            			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); 
                            			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
                            			var zoomControl = new kakao.maps.ZoomControl();map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
                            			
                                    </script>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"><br>
                                    버스<br>
                                    우리은행 종로지점 정류장<br>
                                    <img src="<%= contextPath %>/resources/images/icon_busB.jpg"> 163 / 172 / 201 / 262 / 401 / 406 / 701 / 704 / N15 / N62 <br>
                                    <img src="<%= contextPath %>/resources/images/icon_busG.jpg"> 7017 / 7021 / 7022 <img src="<%= contextPath %>/resources/images/icon_busR.jpg"> 8110 <br>
                                    지하철 <br>
                                    지하철 2호선 을지로입구역 3번출구 100M / 1호선 종각역 4번, 5번 출구 200M 
                                </td>
                            </tr>
                        </table>
                        <hr style="border: 1px solid black;">
                        <table id="kang" class="tabcontent" align="center">
                            <tr>
                                <td>
                                    <!-- Slider main container -->
	                    			<div class="swiper">
	                        		<!-- Additional required wrapper -->
	                        		<div class="swiper-wrapper">
			                        <!-- Slides -->
			                        <div class="swiper-slide"><img src="<%= contextPath %>/resources/images/kang1.jpg" alt="강남점1" class="kang_pics"></div>
			                        <div class="swiper-slide"><img src="<%= contextPath %>/resources/images/kang2.jpg" alt="강남점2" class="kang_pics"></div>
			                        <div class="swiper-slide"><img src="<%= contextPath %>/resources/images/kang3.jpg" alt="강남점3" class="kang_pics"></div>
			
			                        </div>
			                        <!-- If we need pagination -->
			                        <div class="swiper-pagination"></div>
			                    
			                        <!-- If we need navigation buttons -->
			                        <div class="swiper-button-prev"></div>
			                        <div class="swiper-button-next"></div>
                                </td>
                                <td width="500" align="center">
                                    <b style="font-size:24px;">WINE FINE 강남점</b><br>
                                    <img src="">매장 위치 <br>
                                    	서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F<br>
                                    <br>
                                    <img src=""> 영업 시간 <br>
						                                    평 일 10:00 ~ 21:00<br>
						                                    토요일 11:00 ~ 21:00<br>
						                                    공휴일 13:00 ~ 21:00<br>
						                                    일요일 11:00 ~ 21:00<br>
                                    <br>
                                    <img src=""> 매장 번호<br>
                                    T : 1544-9970
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="map2" style="width:800px; height:400px;"></div>
                                    <script>
                                    	var container = document.getElementById('map2');
                            			var options = {
                            				center: new kakao.maps.LatLng(37.49901672692401, 127.03285493097171),
                            				level: 2
                            			};

                            			var map = new kakao.maps.Map(container, options);

                            			// 지도를 클릭한 위치에 표출할 마커입니다
                            			var marker = new kakao.maps.Marker({ 
                            			    // 지도 중심좌표에 마커를 생성합니다 
                            			    position: map.getCenter() 
                            			});
                            			// 지도에 마커를 표시합니다
                            			marker.setMap(map);
                            			
                            			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
                            			var mapTypeControl = new kakao.maps.MapTypeControl(); 
                            			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
                            			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
                            			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); 
                            			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
                            			var zoomControl = new kakao.maps.ZoomControl();map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
                                    </script>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"><br>
					                                    버스<br>
					                                    역삼역.포스코P&S타워 정류장<br>
					                                    <img src="<%= contextPath %>/resources/images/icon_busB.jpg"> 146 / 740 / 341 / 360 <img src="<%= contextPath %>/resources/images/icon_busR.jpg"> 1100 / 1700 / 2000 / 7007 / 8001 <br>
					                                    지하철<br>
					                                    지하철 2호선 역삼역 3번출구 100m 
                                </td>
                            </tr>
                        </table>
                        <br><br>
                    </div>
                    <script>
		             const swiper = new Swiper('.swiper', {
		            // Optional parameters
		            // direction: 'vertical',
		            loop: true,
		            autoplay: {
		                delay: 3000
		            },
		        
		            // If we need pagination
		            pagination: {
		            el: '.swiper-pagination',
		            },
		        
		            // Navigation arrows
		            navigation: {
		            nextEl: '.swiper-button-next',
		            prevEl: '.swiper-button-prev',
		            },
		            // autoHeight : true // 현재 활성화된 슬라이드 높이에 맞게 버튼이 움직인다. 
		        
		            // And if we need scrollbar
		            // scrollbar: {
		            //   el: '.swiper-scrollbar',
		            // },
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





