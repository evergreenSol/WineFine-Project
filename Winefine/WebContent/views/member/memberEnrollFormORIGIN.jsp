<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> WINEFINE :D </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><!--온라인 방식-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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


    /* .enroll-outer{
        margin: auto;
        width:1200px;
        height:800px;
    } */

    #wfEnroll-form table{
        margin:auto;
    }

    #wfEnroll-form input{
        margin:10px;
    }

    #wfEnroll-form tr #pwLimit{
        font-size: small;
    }
    
    .modal-body{
        text-align: left;
        font-size: small; 
    }

    #enroll-button{
        background-color: rgb(119, 45, 96);
        color: white;
        border-radius: 5px;
        width:300px;
        height: 40px;
        font-size:medium;
    }

   #enroll-button:hover{
        opacity : 0.7;
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


   

        <br>
        <h2 align="center" style="color: rgb(119, 45, 96);">회원가입</h2>
    	<br><br>
        <form id="wfEnroll-form" action="/winefine/insert.me" method="post">
    
            <!-- 아이디, 비밀번호, (비밀번호 확인), 이름, 전화번호, 이메일, 주소 -->
            <table class="enroll-area">
    
                <!-- (tr>td*3)*8 + Enter -->
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="userId" maxlength="12" required size="26"></td>
                    <td colspan="2"><button type="button" class="btn btn-sm btn-secondary">중복확인</button></td>
                    <!-- 중복 확인은 나중에 AJAX 배운 후 진행할 예정 -->
                </tr>

                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="userPwd" minlength="8" maxlength="15" size="26" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><label id="pwLimit">영문, 숫자, 특수문자 포함 8~15자로 입력</label></td>
                    <td></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" minlength="8" maxlength="15" required size="26"></td>
                    <!-- 비밀번호 확인은 단순 비교 확인 용도라 굳이 key 값은 부여하지 않음 -->
                    <td></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="userName" required maxlength="5" size="26"></td>
                    <td></td>
                </tr>
                
                <tr>
                    <td>핸드폰번호</td>
                    <td><input type="text" name="phone" required placeholder="- 포함해서 입력" required size="26"></td>
                    <td></td>
                </tr> 
                <tr>
                    <td>이메일</td>
                    <td><input type="email" name="email" required size="26"></td>
                    <td></td>
                </tr>
                 <tr>
                   <td>주민등록번호</td>
                    <td><input type="text" required minlength="6" maxlength="6" class="ssn" size="8">-
                   	 <input type="password" required minlength="7" maxlength="7" class="ssn" size="8">
                    </td>
                   <td><input type="hidden" name="userSsn" id="userSsn" required></td>
                </tr>
            </table>
    
            <br><hr><br>

            <div align="center"><input type="checkbox" name="agreeAll" value="동의">아래 내용에 모두 동의합니다.</div>
            <br><br>
            <div align="center">
                <table>
                    <tr>
                        <td align="center"><input type="checkbox" name="accessTerms">이용약관 (필수)</td>
                        <td><button class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#accessTermsInfo">자세히 보기</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="pInfo">개인 정보 수집 및 이용 동의(필수)</td>
                        <td><button class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#pInformation">자세히 보기</button></td>
                    </tr>
                </table>
 
            </div>

            <br><br>
            <div align="center">
                <button type="submit" id="enroll-button">회원가입
            </div>
            <br><br>
        </form>
        
        <script>
        $(function(){
        	
        	$(".ssn").on("keyup", function(){
        		
        		var result = $(".ssn").map(function(){
        			return $(this).val();
        		}).get().join("-");
        			$("#userSsn").val(result);
        	});
        	
        	//$(".enroll-area>tbody>#ssn1").keyup(function(){
        		//var $ssn1 = $("#ssn1").val()+"-";
            	//var $ssn2 = $("#ssn2").text();
            	//var $ssn = $ssn1 + $ssn2;
            	
            	//console.log($ssn1);
            	//$("#userSsn").text($ssn);
            //});
        });
        
        </script>
    

        <!-- 모달 창으로 이용약관, 개인정보 동의 내용 화면 구성 -->
        <!-- The Modal -->
        <div class="modal" id="accessTermsInfo">
            <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" align="center">이용약관</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                        제 1 조 (목적)
                        이 약관은 ㈜와인파인("회사" 또는 "WINEFINE")이 제공하는 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
                        <hr>
                        제 2 조 (정의)
                        이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
                        <hr>
                        "서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 와인파인 관련 제반 서비스를 의미합니다.
                        "회원(개인회원 및 기업회원)"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
                        "아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.
                        '비회원'이라 함은 회원에 가입하지 않고 와인파인이 제공하는 서비스를 이용하는 자를 말합니다.
                        "비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
                        "유료서비스(프리미엄 회원)"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함) 및 제반 서비스를 의미합니다.
                        "등급"이라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.
                        "게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
                        <hr>
                        제 3 조 (약관의 명시와 개정)
                        "회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
                        "회사"는 "약관의규제에관한법률", "정보통신망이용촉진및정보보호등에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
                        "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리한 약관의 개정의 경우에는 공지 외에 일정기간 서비스내 전자우편, 전자쪽지, 로그인시 동의창 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다.
                        회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
                        회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다.
                        다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용계약을 해지할 수 있습니다.
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<!-- The Modal -->
<div class="modal" id="pInformation">
    <div class="modal-dialog">
    <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header">
        <h4 class="modal-title" align="center">개인 정보 수집 및 이용 동의</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body" align="center">
            (주)와인파인은 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.
            회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
            회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
            <hr>
            개인정보의 수집 및 이용 목적
            개인정보는 생존하는 개인에 관한 정보로서 실명, 주민등록번호 등의 사항으로 당사 회원 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다. 당사가 수집한 개인정보는 다음의 목적을 위해 활용합니다.
            <hr>
            ① 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
            콘텐츠 제공, 물품배송 또는 청구서 등 발송, 금융거래 본인 인증 및 금융 서비스, 구매 및 요금 결제, 요금추심
            <br><br>
            ② 회원 관리
            회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달
            <br><br>
            ③ 마케팅 및 광고에 활용
            신규 서비스(제품) 개발 및 특화, 이벤트 등 광고성 정보 전달 (회원님의 개인정보는 광고를 의뢰한 개인이나 단체에는 제공되지 않으며 상품 발송, 행사 참여 등에 따른 추가 정보에 대해서는 별도의 동의 절차 수행 후 제공합니다.)
            <br><br>
            수집하는 개인정보 항목 및 수집방법
            가. 수집하는 개인정보 항목
            <br><br>
            ① 최초 회원가입 시 회원식별 및 최적화된 서비스 제공을 위해 아래와 같은 정보를 수집합니다.
            <br><br>
            < 일반 회원가입 시 >
            필수항목: 이름, 아이디, 비밀번호, 이메일주소, 연락처, 주민등록번호, 수신동의
            <hr>
            나. 수집방법
            당사는 다음과 같은 방법으로 개인정보를 수집합니다.
            <br><br>
            ① 홈페이지를 통한 회원가입, 상담 게시판, 경품 행사응모
            <br><br>
            수집하는 개인정보의 보유 및 이용기간
            원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.
            단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간동안 보존합니다.
        
      	  </div>
   		 </div>
  	  </div>
	</div>
</div>

</body>
</html>