<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.winefine.member.model.vo.Member" %>
<% 
	// 로그인한 사용자 정보 뽑기
	Member loginUser = (Member)session.getAttribute("loginUser"); 
	// 서블릿에서 보낸 메세지 뽑기
	String alertMsg = (String)session.getAttribute("alertMsg");
	// 메인 화면으로 이동하는 경로 뽑기
	String contextPath = request.getContextPath();
%>
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



    .logo {
        width: 400px;
        float: left;
    }

    .logo>a {
        margin-left: 50px; /* 로고의 왼쪽 여백 설정 */
    }
    
    .top_right_menu { float: right;}

    .top_right_menu li{
        list-style-type: none;
        float: left;
        margin-right: 10px;
        padding-right: 10px;
        padding-left: 5px;
    }
    #top_service>a { margin-right: 50px;} /* 우측 상단 아이콘의 오른쪽 여백 설정 */

    .menu {
        display: table-cell;
        height: 50px;
        width: 200px;
    }

    .menu a {
        text-decoration: none;
        color: black;
        font-size: 20px;
        font-weight: bold;
        display: block; 
        width: 100%;
        height: 100%;
        line-height: 50px; /* 장평조절: 위~ 아래에서 가운데 조정 */
    }

    .menu a:hover {
        color:#6B325B;
    }

    .menu:after {
            display:block;
            content: '';
            border-bottom: solid 5px #6B325B;  
            transform: scaleX(0);  
            transition: transform 250ms ease-in-out;
    }

    .menu:hover:after { transform: scaleX(0.6); }

</style>
</head>
<body>
    
    <div class="top" >
        <div class="logo">
            <a href="<%= contextPath %>/main.do"><img src="<%= contextPath %>/resources/images/winefine_logo.png" width="250px"></a>
        </div>
        <ul class="top_right_menu">
            <li id="top_search"><img src="<%= contextPath %>/resources/images/icon_search.png" class="btn" data-toggle="modal" data-target="#searchModal"
                style="padding:0px"></li>
            <% if(loginUser == null) { %>
                <li id="top_cart"><a href="<%= contextPath %>/loginForm.me"><img src="<%= contextPath %>/resources/images/icon_cart.png"></a></li>
            <% }
               else { %>
                <li id="top_cart"><a href="<%= contextPath %>/list.ca"><img src="<%= contextPath %>/resources/images/icon_cart.png"></a></li>
            <% } %>
            
            <!-- 로그인 된 상태가 아니라면 보일것-->
            <% if(loginUser == null) { %>
            	<li id="top_mypage"><a href="<%= contextPath %>/loginForm.me"><img src="<%= contextPath %>/resources/images/icon_mypage.png"></a></li>
            <% }
               else if(!loginUser.getUserId().equals("admin")) { %>
	            <!-- 로그인한 사람이 admin이 아니라면 보일것-->
	            <li id="top_mypage"><a href="<%= contextPath %>/myPage.me"><img src="<%= contextPath %>/resources/images/icon_mypage.png"></a></li>
	        <% }
               else { %>
	            <!-- 만약 로그인한 사람이 admin이라면 보일것 -->
	            <li id="top_mypage"><a href="<%= contextPath %>/views/admin/adminMain.jsp"><img src="<%= contextPath %>/resources/images/icon_mypage.png"></a></li>
	        <% } %>
            
            
            
            <li id="top_service"><a href="<%= contextPath %>/list.no"><img src="<%= contextPath %>/resources/images/icon_center.png"></a></li>
            <li><a href="<%= contextPath %>/logout.me">로그아웃</a></li>
        </ul>
    </div>

    <br clear="both">
    <br>

       
    <div class="nav-area" align="center">
        <div class="menu"><a href="<%= contextPath %>/views/store/viewAll.jsp">와인스토어</a></div>
        <div class="menu"><a href="">소울와인찾기</a></div>
        <div class="menu"><a href="<%= contextPath %>/views/board/terminologyAll.jsp">게시판</a></div>
        <div class="menu"><a href="<%= contextPath %>/list.no">고객센터</a></div>
    </div>
    
    <!-- The Modal -->
    <div class="modal fade" id="searchModal" style="background-color: white; ">
        <div class="modal-dialog modal-xl">
        <div class="modal-content" style="border-color: white;">
        
            <!-- Modal Header -->
            <div class="modal-header" style="border-color: white;">
            <h4 class="modal-title"></h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <form>
                <div class="modal-body" style="width:1200px; height: 400px; border-color: white;">
                    <b style="font-size: 100px;">search</b><br>
                    <input type="text" name="searchWord" placeholder="원하시는 검색어를 입력하세요."
                        style="font-size: 50px; color:grey; width: 1000px; height: 100px; border: white;">
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer" style="border-color: white;">
                        <input type="submit" class="btn btn-secondary" value="검색하기">
                </div>
            </form>
        </div>
        </div>
    </div>

    <script>
    	
        var message = "<%= alertMsg %>";
        
        if(message != "null") { //로그인 정보가 넘어온 경우
            
            alert(message);
        
            <% session.removeAttribute("alertMsg"); %>
        }
        
    </script>


</body>
</html>