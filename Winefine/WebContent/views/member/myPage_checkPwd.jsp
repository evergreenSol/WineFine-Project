<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    
	
	p {
		text-align: center;
		padding-top: 40px;
		font-size: 16px;
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
						<b style="font-size:24px;">비밀번호재확인</b>
			    		<hr style="border: 1px solid black">
			    		<br>
			    		
						<form action="/winefine/updateInfForm.me" method="post">
							<p>
								회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인해주세요.
							</p>
							<br>
							
							<table align="center">
                                <tr>
									<th>아이디</th>
									<td width="50"></td>
									<td><input type="text" name="userId" value="<%= loginUser.getUserId() %>" readonly></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td width="50"></td>
									<td><input type="password" name="userPwd" required></td>
								</tr>
	
							</table>
	
							
							<br><br><br>
							
				
							<hr color="black">
							<br><br>
							<div align="center">
								
								<!-- <button type="submit" onclick="return validatePwd();">확인</button> -->
								<button type="submit" onclick="">확인</button>
							</div>
						</form>
                   </div>
                </td>
           </table>
       </div>

	   <script>

		   var userPwd = "<%= loginUser.getUserPwd() %>";
			function validatePwd () {
				if($("input[name=userPwd]").val() == userPwd) {
					return true;
					
				}
				else {
					alert("잘못된 비밀번호입니다.");
					$("input[name=userPwd]").focus();
					return false;
				}
			}

	   </script>

   
       
        <!-- bottom : 푸터바 영역 ---------------------------------------------------->
        <div class="w_ bottom">
            
            <!-- 푸터바 START-->
            <%@ include file="../common/footer.jsp" %>
            <!-- 푸터바 END-->
         
        </div>
		
	</div>
</body>
</html>