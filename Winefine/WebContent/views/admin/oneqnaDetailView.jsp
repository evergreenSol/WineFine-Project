<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.winefine.oneqna.model.vo.Oneqna" %>
<%
	Oneqna o = (Oneqna)request.getAttribute("o");
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
        /* 글작성 버튼 */
        #bottom_btn>button {
            background-color : rgb(41, 128, 185);
            color : white;
            width: 80px;
            height: 30px;
            border-radius: 4px;
            cursor: pointer;
        }
        #pasing>button:hover {
            background-color: rgb(41, 128, 185);
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
                            <td style="width:480px; font-size: 22px; font-weight: 600">1:1문의 상세보기</td>
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
                <form action="<%= contextPath %>/answer.on?ono=<%= o.getOneqnaNo() %>" method="post">
                    <input type="hidden" name="ono" value="<%= o.getOneqnaNo() %>">
                <table id="detail-area" align="center">
                    <tr>
                        <td width="350"><%= o.getOneqnaWriter() %></td>
                        <td width="350"align="right"><%= o.getCreateDate() %></td>
                    </tr>
                    <tr>
                        <td colspan="2"><hr></td>
                    </tr> 
                    <tr>
                        <td colspan="2"><%= o.getOneqnaTitle() %></td>
                    </tr>
                    <tr>
                        <td colspan="2"><hr></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        <p style="height : 200px"><%= o.getOneqnaContent() %>
                            
                        </p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><hr></td>
                    </tr>
                    <tr>
                        <td colspan ="2" height="200"><textarea name="answer" placeholder="답변을 입력하세요." style="resize:none;" required><% if(o.getAnswer() == null) { %>답변이 아직 등록되지 않았습니다.
                            <% } 
                               else { %><%= o.getAnswer() %>
                            <% } %>
                            
                        </textarea></td>
                        <!-- textarea 내부 텍스트 띄어쓰기 줄바꿈 다 적용되므로 스크립틀릿 사용시에도 붙여서 쓸것 -->
                            
                        </p>
                        </td>
                    </tr>
                </table>
        
                <br><br>
                         
                <div align="center" id="bottom_btn">
                    <button type="button" class="btn1"><a href="<%= contextPath %>/Mmain.on">목록으로</a></button>
                    <button type="submit">답변하기</button>
                    <button type="button"><a href="<%= contextPath%>/delete.on?ono=<%= o.getOneqnaNo() %>">삭제하기</a></button>
                </div>  
        		</form>
            </div>
           </div>
	
           <!-- bottom : 하단 영역 --------------------------------------->
          
       
       </div> 
       

    </body>
    </html>