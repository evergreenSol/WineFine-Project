<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.winefine.notice.model.vo.Notice" %>
<%
	// 현재 게시글 정보 뽑기
	Notice n = (Notice)request.getAttribute("n");
	

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
            #update-form table {
                border-collapse: separate;
                border-spacing: 0 10px;
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
                            <td style="width:480px; font-size: 22px; font-weight: 600">공지사항 수정하기</td>
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
                <form id="update-form" action="<%= contextPath %>/update.no" method="post">
                
                	<input type="hidden" name="nno" value="<%= n.getNoticeNo() %>">
                    <table>
                        <tr>
                            <th width="100" align="right">제목</th>
                            <td width="600" align="center"><input type=text name="title" placeholder="제목을 입력하세요." required value=<%= n.getNoticeTitle() %>></td>
                        </tr>
                        <tr>
                            <th width="100" align="right">내용</th>
                            <td height="500" align="center"><textarea name="content" placeholder="내용을 입력하세요." style="resize:none;" required><%= n.getNoticeContent() %></textarea></td>
                        </tr>
                    </table>
                    <br>
                    <div id="bottom_btn" align="center">
                        <button type="submit">수정하기</button>
                        <button type="button" onclick="history.back();">뒤로가기</button>    
                    </div>
                </form>
            </div>
           </div>

           <!-- bottom : 하단 영역 --------------------------------------->
           
       
       </div> 
       

    </body>
    </html>