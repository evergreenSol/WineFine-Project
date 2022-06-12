<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, com.winefine.store.model.vo.Review" %>

<% 
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");

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

	#review thead th{
		border-bottom: 1px solid black;
	}

	/* #review tbody tr:hover {
		cursor: pointer;
		color: rgb(119, 45, 96);            
	} */

	button {
		background-color: rgb(119, 45, 96); ;
		color: white;
		border: none;
	}

	button:hover {
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
       
        <br>   
           <!-- body left(카테고리) & right(내용)-->
           <table class="myPage-body">
               <td class="body_l">
                <%@ include file="../common/category-myPage.jsp" %>
               </td>
               <td class="body_r">
                    <div class="delete">
                        <!-- <h2>상품 주문내역</h2> -->
						<b style="font-size:24px;">상품 리뷰 내역</b>
			    		<hr style="border: 1px solid black">

						<table id="review" style="text-align: center">
							<thead>
								<tr>
									<th width="100">리뷰번호</th>
									<th width="300">상품명</th>
									<th width="400">제목</th>
									<th width="100">작성일</th>
								</tr>
							</thead>
							<tbody id="reviewList">
								<% if(list.isEmpty()) { %>
									<tr>
										<td height="300" colspan="3">문의내역이 없습니다.</td>
									</tr>
								<% } 
								   else { %>
								   <% for(Review r : list) { %>
	
									<tr class="nn" style="border-bottom: 1px solid lightgray;">
										<td><%= r.getReviewNo() %></td>
										<td><%= r.getProductNo() %></td>
										<td><%= r.getReviewTitle() %></td>
										<td><%= r.getCreateDate() %></td>
									</tr>
									<tr >
										<td>리뷰 답변일</td>
										<% if(r.getAnswerDate() == null) { %>
											<td colspan="3">답변이 아직 없습니다.</td>
										<% } 
										   else { %>
											<td colspan="3"><%= r.getAnswerDate() %></td>
										<% } %>
										<td></td>
										<td></td>
									</tr>
									<tr style="border-bottom: 1px solid black;">
										<td>리뷰 답변</td>
										<% if(r.getAnswer() == null) { %>
											<td colspan="3">답변이 아직 없습니다.</td>
										<% } 
										   else { %>
										    <td colspan="3"><%= r.getAnswer() %></td>
										<% } %>
									</tr >
									<% } %>
								<% } %>
	
							</tbody>
						</table>	
			
		

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

		$("#reviewList .nn").click(function () {

			var rno = $(this).children().eq(0).val();

			location.href="<%= contextPath%>/reviewDetail.me?rno=" + rno;
			// 이동이 아니라 상세로 보게끔 모달창을 띄워야하나? ... 고민

		});
	</script>
</body>
</html>