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
        height: 100%;
    }
    
	
	/* p {
		text-align: center;
		padding-top: 40px;
		font-size: 16px;
	} */
	
	#delete-guide { 
		margin: auto; 
	}

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
						<b style="font-size:24px;">회원탈퇴</b>
			    		<hr style="border: 1px solid black">
			    		<br>
			    		
						<h1 align="center">Wine Fine 회원 탈퇴를 원하시나요?</h1>
						<br>
				        
				        <form action="deleteMem.me" method="post">
							<table  align="center">
								<tr>
									<td style="text-align: left" colspan="2">
												서비스 탈퇴 시 고객님의 회원정보 및 활동내역이 모두 삭제되며<br><br>
												한 번 삭제된 정보는 복구하실 수 없습니다.<br><br>
												불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 <br><br>
												회원님의 불편함을 해결해드리도록 노력하겠습니다.
									</td>
								</tr>
						
								<tr height="30"></tr>
					
								<tr>
									<td width="150" style="text-align: center">비밀번호 확인</td>
									<td style="text-align: center"><input type="password" name="userPwd" required style="width: 80%"></td>
								</tr>
							</table>
				
				            <br><br>
				            
				            <div align="center">
				                <button type="button" id="cancel">취소</button>
				                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                <button type="submit">회원 탈퇴</button>
				            </div>
				        </form>
                   </div>
                </td>
           </table>
       </div>
<script>
	$(function () {
		$("button[id=cancel]").click(function () {
			// console.log("클릭됨")
			history.back();
			// 이전 화면으로 보내기
		});
	});

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