<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.winefine.member.model.vo.Member" %>
<%
    // 메인 화면으로 이동하는 경로 뽑기
    String contextPath = request.getContextPath();

    // 서블릿에서 보낸 메세지 뽑기
	String alertMsg = (String)session.getAttribute("alertMsg");

    Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- * 부트스트랩 영역 --------------------------------------------------------------------------->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
 <!-- menubar영역은 모든 페이지마다 넣어주기로 했으니 얘한테 한번 넣어두면 include 되는 모든페이지에서 쓸 수 있겠쥬 ! ☆  -->

<style>
    div {
        margin: 0px;
        height: 100%;
        /* 아니 이걸 헤더에다가 넣어두면 안되지1!!!!*/
    }

    .adminHeader{
        border-collapse: collapse;
        width: 100%;
        height: 100%;
    }
    
    .adminHeader td{
        padding-right: 20px;
        padding-left: 20px;
    }
    #header {
        background-color: gray;
    }
    #header a {
        text-decoration: none;
        color: white
    }
    #mainlogo {
        display:inline-block;
        width: 800px;
        margin: 20px;
    }
    #top_btn button {
        background-color : rgb(41, 128, 185);
        color : white;
        width: 80px;
        height: 30px;
        border-radius: 4px;
        cursor: pointer;
    }
    #navigator{
            
        background-color: rgb(41, 128, 185);
        position: relative;
    }
    #navigator label {
        margin : 10px 30px;
    }
    #navigator a {
        color: white;
        text-decoration : none;
        margin:0;
        text-transform:uppercase; 
        font-size : 18px;
        font-weight : bold;    
    }
    #navigator a:hover {
        opacity : 0.7;
    }   
    .header_r{
        text-align: right;
    }
 
</style>

<!-- jQuery-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- * 부트스트랩 영역 --------------------------------------------------------------------------->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

    <div>
        <table class="adminHeader">
            <tr id="header" style="height:70%;">
                <td style="width:800px;"><a href="<%= contextPath %>/main.admin"><h3 id="mainlogo">ADMINISTRATOR</h3></a></td>
                <td class="header_r">
                    <a href="<%= contextPath %>/main.do">Wine Fine&nbsp;</a>
                    <a href="<%= contextPath %>/logout.me" style="color:red">로그아웃</a>
                </td>
            </tr>
            <tr id="navigator" style="height:30%;" align="center">
                <td colspan="3">
                    <label><a href="<%= contextPath %>/memList.me?currentPage=1">회원정보관리</a></label>
                    <label><a href="<%= contextPath %>/orderListView.admin?currentPage=1">주문정보관리</a></label>    
                    <label><a href="<%= contextPath %>/productView.admin?currentPage=1">상품관리</a></label>
                    <label><a href="<%= contextPath %>/list.bo?currentPage=1">게시판관리</a></label>
                    <label><a href="<%= contextPath %>/Mmain.no">고객센터관리</a></label>
                    <label><a href="<%= contextPath %>/prepare.do">통계</a></label>
            </tr>
        </table> 
           
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