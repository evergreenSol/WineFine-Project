<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.winefine.oneqna.model.vo.Oneqna" %>

<% 
	ArrayList<Oneqna> list = (ArrayList<Oneqna>)request.getAttribute("list");

%>	


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> WINEFINE :D </title>
<style>

	div{
		box-sizing: border-box;
	}
	.wrap{
		width: 1200px;
		height: 1500px;
		margin: auto;
	}
	
	.w_{
		/* border: 1px solid red; */
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
    .myPage-body{
        width: 100%;
        height: 97%;
    }
    .myPage-body td.body_l{
        width: 20%;
        vertical-align: top;
    }
    .myPage-body td.body_r{
        width: 80%;
    }
    
    /* 상세 항목 */

    .delete{
        padding-left: 5%;
        width: 90%;
        height: 100%;
    }
    
    table img {
        width: 100px;
        height: 100px;
    }

	#oneQ thead th{
		border-bottom: 1px solid black;
	}

	#oneQ tbody tr:hover {
		cursor: pointer;
		color: rgb(119, 45, 96);            
	}

	button {
		background-color: rgb(119, 45, 96); ;
		color: white;
		border: none;
	}

	button:hover {
		cursor: pointer;
	}

	#oneQ td {
		padding: 5px;
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
       
        <br>   
           <!-- body left(카테고리) & right(내용)-->
            <table class="myPage-body">
                <td class="body_l">
                <%@ include file="../common/category-myPage.jsp" %>
                </td>
                <td class="body_r">
                    <div class="delete">
                        <!-- <h2>상품 주문내역</h2> -->
						<b style="font-size:24px;">1대1 문의 내역</b>
			    		<hr style="border: 1px solid black">
			
					<table id="oneQ" style="text-align: center">
			            <thead>
			                <tr>
								<th width="100">문의번호</th>
			                    <th width="600">제목</th>
			                    <th width="100">작성일</th>
			                    <th width="100">답변상태</th>
			                </tr>
			            </thead>
			            <tbody>
							<% if(list.isEmpty()) { %>
								<tr>
									<td height="300" colspan="3">1대1 문의내역이 없습니다.</td>
								</tr>
							<% } 
							   else { %>
							   <% for(Oneqna one : list) { %>

				                <tr class="nn">
									<td><%= one.getOneqnaNo() %></td>
				                    <td><%= one.getOneqnaTitle() %></td>
				                    <td><%= one.getCreateDate() %></td>
				                    <td><% if(one.getAnswerYn().equals("Y")) { %>
				                    		답변완료
				                    	<% }
				                           else { %>
				                               	답변중
				                        <% } %>
				                   </td>
				                </tr>
				                <% } %>
			                <% } %>

			            </tbody>
			        </table>
			
			        <!-- <table border="1">
			            <thead>
			                <tr>
			                    <th width="600">제목</th>
			                    <th width="150">작성일</th>
			                    <th width="150">답변상태</th>
			                </tr>
			            </thead>
			            <tbody>
			                <tr height="300">
			                    <td colspan="3" style="text-align: center; font-size: 18px;">작성된 문의가 없습니다.</td>          
			                </tr>
			            </tbody>
			        </table> -->
			
						<br>
						<div align="center">
							
							<a href="<%= contextPath %>/list.on" class="btn btn-secondary" style="background-color: rgb(119, 45, 96); ;
								color: white; border: none;">1대1문의</a>
						</div>

		
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
	<script>

		// function toOne() {
		// 	location.href="<%= contextPath %>/list.on";
		// } 버튼이 안먹음???


		$(function () {
			$(".nn").click(function () {
				// console.log("클릭")
				var ono = $(this).children().eq(0).text();
				console.log(ono);

				location.href="<%= contextPath %>/view1On1.me?ono=" + ono;
				// 이동이 아니라 상세로 보게끔 모달창을 띄워야하나? ... 고민
			});

			//$("button[id=1on1]").click(function () {
				//console.log("클릭됨");
				//location.href="<%= contextPath %>/list.on";
				// 고객센터의 1대1 문의 화면으로 넘겨주기.
			//});
			
		});
	</script>
</body>
</html>