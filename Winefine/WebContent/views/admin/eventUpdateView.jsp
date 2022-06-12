<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.winefine.event.model.vo.Event"%>
<%
    Event e = (Event)request.getAttribute("e");  
    String start = e.getStartDate().substring(0,10);    
	String end = e.getEndDate().substring(0,10);
%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> WINEFINE :D </title>
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
                height: 240px; /* height: 240px */
            }
            .body{
                height: 600px; /* height: 600px */
            }
            .bottom{
                height: 100px;  /* height: 100px */
            }
            
            /* 상세 항목 */
            td{
                padding-right: 20px;
                padding-left: 20px;
            }
            .bottom{
                font-size: 14px;
                font-weight: 600;
            }
            .btn{
            	margin:5px 10px;
            }
            .detailTable{
                width: 80%;
                height: 90%;
                margin: 50px 120px;
            }
            .menuTitle, .menuTitle>a{
                color: lightgray;
                font-size: 22px;
                font-weight: 600;
            }
            .menuTitle>a:hover{
                color: black;
                cursor: pointer;
            }
            .tableTitle{
                width: 18%;
                font-size: 20px;
                font-weight: 500;
                text-align: center;
            }
            textarea{
                width: 100%;
                height: 80%;
            }
            /* 상단버튼 */
        #top_btn button {
            background-color : rgb(41, 128, 185);
            color : white;
            width: 80px;
            height: 30px;
            border-radius: 4px;
            cursor: pointer;
        }
        #update-form input, #update-form textarea, #update-form img { 
            width: 70%;
            height: 100%;
            box-sizing: border-box;    
        }
        #bottom_btn>button {
            background-color : rgb(41, 128, 185);
            color : white;
            width: 80px;
            height: 30px;
            border-radius: 4px;
            cursor: pointer;
        }
        #bottom_btn a, #top_btn a {
            text-decoration: none;
            color: white
        }
        #bottom_btn button:hover, #top_btn button:hover {
            opacity : 0.7;
        }
        </style>
    </head>

    <body>
       <div class="wrap">

           <!-- top : hearder 삽입 영역 ------------------------------->
           <div class="w_ top">
               <div class="w_" style="height: 150px;">
                    <!-- 헤더 START-->
                    <%@ include file="../common/adminHeader.jsp" %>
                    <!-- 헤더 END-->
                </div>
                
               <div class="w_" style="height: 90px;">
               		<br>
                    <table>
                    <tr id="top_btn">
                            <td style="width:480px; font-size: 22px; font-weight: 600">이벤트 수정하기</td>
                            <td colspan="2" style="width: 720px;" align="right">
			                   <button type="button"><a href="<%= contextPath %>/Mmain.no">공지사항</a></button>
                    			<button type="button"><a href="<%= contextPath %>/Mmain.ev">이벤트</a></button>
                    			<button type="button"><a href="<%= contextPath %>/Mmain.on">1:1문의</a></button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><hr></td>
                        </tr>
                        </table>
                </div>
           </div>
    
           <!-- body : 바디 영역 --------------------------------------->
           <div class="w_ body">

            <div outer="outer" align="center">
                <br>
                <form id="update-form" action="<%= contextPath %>/update.ev" method="post" enctype="multipart/form-data">
                    
                    <input type="hidden" name="eno" value="<%= e.getEventNo() %>">
                    <input type="hidden" name="userNo" value="<%= e.getEventWriter() %>">
                                 
                    <table>
                        <tr>
                            <th width="100" align="right">시작날짜</th>
                            <td width="600" align="center"><input type="date" id="startDate" name="startDate" required value="<%= start %>"></td>
                        </tr>
                        <tr>
                            <th width="100" align="right">종료날짜</th>
                            <td width="600" align="center"><input type="date" id="endDate" name="endDate" required value="<%= end %>"></td>
                        </tr>
                        <tr>
                            <th width="100" align="right">제목</th>
                            <td width="600" align="center"><input type=text name="title" placeholder="제목을 입력하세요." required value="<%= e.getEventTitle() %>"></td>
                        </tr>
                        <tr>
                            <th width="100" align="right">썸네일이미지</th>
                            <td height="200" align="center"><img id="thumbnail" src="<%= e.getThumbnail() %>"></td>   
                        </tr>
                        <tr>
                        	<th width="100" align="right">상세이미지</th>
                            <td height="600" align="center"><img id="contentPhoto" src="<%= e.getContentPhoto() %>"></td>
                        </tr>
                    </table>
                    <div id="file-area">
                    	
                    	<input type="file" id="file1" name="thumbnail" onchange="loadImg(this, 1);" required >
                    	<input type="file" id="file2" name="contentPhoto" onchange="loadImg(this, 2);">
                    	 
                    </div>
                    
                    <!-- 파일선택 숨기기 -->
                    <script>
                    	$(function() {
                    		
                    		$("#file-area").hide();
                    		
                    		$("#thumbnail").click(function() {
                    			$("#file1").click();
                    		});
                    		$("#contentPhoto").click(function() {
                    			$("#file2").click();
                    		});
                    		
                    	});
                    	
                    	function loadImg(inputFile, num) {
                    		
                    		// 파일이 선택됬을 경우 : 1
                            // 파일이 선택되지 않을 경우 : 0
                    		if(inputFile.files.length == 1) {
                    			
                    			var reader = new FileReader();
                    			
                    			reader.readAsDataURL(inputFile.files[0]);
                    			
                    			// 파일 읽기 완료된 순간 실행할 함수를 정의
                    			reader.onload = function(e) {
                    				
                    				switch(num) {
                    				 case 1 : $("#thumbnail").attr("src", e.target.result); break;
                                     case 2 : $("#contentPhoto").attr("src", e.target.result); break;
                    				}
                    			}
                    		}
                    		else {
                    			
                    			switch(num) {
                    			case 1 : $("#thumbnail").attr("src", null); break;
                                case 2 : $("#contentPhoto").attr("src", null); break;
                    			}
                    		}
                    	}
                        $(function() {  
                            $("#update-form").submit(function(){ 
                                var startDate = $('#startDate').val(); 
                                    var endDate = $('#endDate').val(); 
                                    //-을 구분자로 연,월,일로 잘라내어 배열로 반환
                                    var startArray = startDate.split('-'); 
                                    var endArray = endDate.split('-'); 
                                    //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성 
                                    var start_date = new Date(startArray[0], startArray[1], startArray[2]); 
                                    var end_date = new Date(endArray[0], endArray[1], endArray[2]);
                                    //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다. 
                                        if(start_date.getTime() > end_date.getTime()) { 
                                            alert("종료날짜보다 시작날짜가 작아야합니다."); 
                                            return false; 
                                        } 
                            }); 
                        });
                    </script>
                    
                    <br>
                    <div id="bottom_btn" align="center">
                        <button type="submit">수정하기</button>
                        <button type="button" onclick="history.back()">뒤로가기</button>    
                    </div>
                </form>
            </div>
           </div>

           <!-- bottom : 하단 영역 --------------------------------------->
           
       
       </div> 
       

    </body>
    </html>