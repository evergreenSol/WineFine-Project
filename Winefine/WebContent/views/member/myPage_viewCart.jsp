<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        height: 98%;
    }
    
    table img {
        width: 100px;
        height: 100px;
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
						<b style="font-size:24px;">장바구니</b>
			    		<hr style="border: 1px solid black">
			    		
			    		<!-- to 한일: 이 아래로 작성하면 됨! -->
			
						
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