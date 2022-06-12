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

	#member-info { text-align: left;}

	.txt-guide {
		padding-left: 20px;
		display: none;
	}
	.txt-guide li {
		font-size: 10px;
		list-style-position: outside;
	}

	table input {
		width: 200px;
	}

	th, td {
		vertical-align: top;
	}

	button {
		background-color: rgb(119, 45, 96); ;
		color: white;
		border: none;
	}

	button:hover {
		cursor: pointer;
	}

	#updatePwd {
		/* display: none; */
	}

	.check_font{
		margin-left:10px;
		margin: 5px;
		font-size: 11px;
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
						<b style="font-size:24px;">회원정보수정</b>
			    		<hr style="border: 1px solid black">
						<br>

						<form action="update.me" method="post">
							<input type="hidden" name="userNo" value="회원번호">
							<table id="member-info" align="center">
								<tr height="40">
									<th width="150">* 이름</th>
									<td><input type="text" name="userName" value="<%= loginUser.getUserName() %>" required readonly></td>
									<td></td>
								</tr>
								<tr height="40">
									<th>* 아이디</th>
									<td><input type="text" name="userId" value="<%= loginUser.getUserId() %>" required readonly></td>
									<td></td>
								</tr>
								<tr height="40">
									<th>현재 비밀번호</th>
									<td>
										<input type="password" name="userPwd" minlength="4" maxlength="16">
										<ul class="txt-guide">
											<li style="color : red;">현재 비밀번호와 다릅니다</li>
										</ul>
									</td>
									<td></td>
								</tr>
								<tr height="40">
									<th>새 비밀번호</th>
									<td>
										<input type="password" name="newUserPwd" minlength="4" maxlength="16">
										<ul class="txt-guide">
											<li>현재 비밀번호와 다르게 입력하세요</li>
											<li>영문자, 숫자, 특수기호로 총 4~16글자로 <br>
												이루어져야합니다.</li>
										</ul>
									</td>
									<td></td>
								</tr>
								<tr height="40">
									<th>새 비밀번호 확인</th>
									<td>
										<input type="password" name="checkPwd" minlength="4" maxlength="16">
										<ul class="txt-guide">
											<li>새 비밀번호와 동일하게 입력하세요</li>
										</ul>
									</td>
									<td></td>
								</tr>
								<tr height="40">
									<th>이메일</th>
									<td><input type="email" name="email" value="<%= loginUser.getEmail() %>"></td>
									<td><button type="button" class="btn btn-sm btn-outline-secondary" onclick="checkEmail();">중복확인</button></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2"><div class="check_font" id="emailCheck"></div></td>
								</tr>
								<tr height="40">
									<th>핸드폰번호</th>
									<td><input type="text" name="phone" id="phone" minlength="13" maxlength="13" value="<%= loginUser.getPhone() %>"></td>
									<td></td>
								</tr>
							</table>
				
							<br><br>
							<div align="center">
								<button type="button" id="delete-button">회원 탈퇴</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="updatePwd" type="submit" onclick="return validate();">정보 수정</button>
							</div>
						</form>
					</div>

					

                </td>
           </table>
       </div>

	   <script>
		$(function () {
			$("input[name=newUserPwd").focus(function () {
				// console.log("포커스됨")
				$(this).next().css("display", "block");
			});

			$("input[name=checkPwd").focus(function () {
				// console.log("포커스됨")
				$(this).next().css("display", "block");
			});
			
			$("#delete-button").click(function () {
				location.href="/winefine/deleteForm.me"; 
				// 다음 페이지로 이동하게
			});
			
		});
		
		
		function validate () {
			
			var phone = document.getElementById("phone").value;
			console.log(phone);
			
			//핸드폰 검사
			regExp = /^010-[0-9]{4}-[0-9]{4}$/;
			if(!regExp.test(phone)){ //핸드폰 번호가 유효하지 않을 경우
				
				alert("유효한 핸드폰 번호 양식이 아닙니다. - 포함해서 입력해 주세요.");
			
				document.getElementById("phone").value = phone;
				document.getElementById("phone").focus();
	
				return false;
			}

			// 생각해야할 것: 현재 비번에 뭔가를 입력했을 경우에는 반드시 새 비번과 새비번(확인)을 작성해야한다.

			// return false를 하는 경우의 수!
			// 1. 현재 비번을 잘못 썼을 경우
			// 2. 새 비번과 새 비번(확인)이 같지 않을 경우
			// 2. 현재 비번과 새 비번이 같을 경우
			
			var userPwd = "<%= loginUser.getUserPwd() %>";
				if($("input[name=userPwd]").val() == "" && $("input[name=newUserPwd]").val() == "" && $("input[name=checkPwd]").val() == "") {
					// 다 안썼을 때는 그냥 넘긴다.
				return true;
			}
			
			if($("input[name=userPwd]").val() != null && $("input[name=userPwd]").val() != userPwd) {
				// 현재 비번 칸이 비어있지 않고 그 현재 비번을 잘못썼을 경우
				$("input[name=userPwd]").next().css("display", "block");

				alert("현재 비밀번호와 일치하지 않습니다.");
				$("input[name=userPwd]").focus();

				return false;
			}

			if($("input[name=userPwd]").val() != null && $("input[name=newUserPwd]").val() == "") {
				// 현재 비번 칸이 비어있지 않고 그 현재 비번을 잘못썼을 경우
				$("input[name=userPwd]").next().css("display", "block");

				alert("새로운 비밀번호를 입력해주세요.");
				$("input[name=newUserPwd]").focus();

				return false;
			}
			
			
			if($("input[name=newUserPwd]").val() != $("input[name=checkPwd]").val()) {
				// 새 비번과 새비번(확인)이 같지 않을 경우

				
				alert("새 비밀번호가 일치하지 않습니다.");
				$("input[name=newUserPwd]").focus();

				return false;
			}
			
			if($("input[name=userPwd]").val() == $("input[name=newUserPwd]").val()) {
				// 현재 비번과 새 비번이 같을 경우
				
				alert("기존 비밀번호와 일치합니다.");
				$("input[name=newUserPwd]").focus();

				return false;
			}



			
		}

		//이메일 중복 체크 검사(AJAX)
		function checkEmail(){

			var email = "<%= loginUser.getEmail() %>";

			var checkVal = $("#member-info input[name=email]").val();
					
			var checkEmail = $("#member-info input[name=email]");

			if(email == checkVal) { // 같으면~
				$("#emailCheck").css("color", "blue");
				$("#emailCheck").html("기존 이메일과 같습니다.<br>변경하시려면 새 이메일을 입력하세요.");
			}
			else {
				$.ajax({
					url : "checkEmail.me",
					data : {emailCheck : checkEmail.val()},
					success : function(result){
						
						if(result == "NNNNN"){

							$("#emailCheck").css("color", "red");
							$("#emailCheck").html("이미 존재하는 이메일 주소입니다. 다시 확인해 주세요.");
							
							checkEmail.focus();
						
						} else{
							
							$("#emailCheck").css("color", "blue");
							$("#emailCheck").html("사용 가능한 이메일입니다.");
							
							// 회원가입 버튼을 활성화 상태로 변경
							$("#wfEnroll-form :submit").removeAttr("disabled");
							
							// 입력한 이메일 값 확정
							checkEmail.attr("readonly", true);
							
						} 
					},
					error: function(){
						
						alert("에러가 발생했습니다.");
					}
				});

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