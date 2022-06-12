<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.winefine.notice.model.vo.Notice" %>    
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
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
                height: 500px; 
                margin: auto;
            }
            .w_{
                width: 100%;
            }
            .top{
                height: 240px; /* height: 240px */
            }
            .body{
                height: 600px;/* height: 600px */
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
                height: 50%;
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
        #pasing {
            height: 100px;
        }
        #bottom_btn a, #top_btn a {
            text-decoration: none;
            color: white
        }
        #bottom_btn button:hover, #top_btn button:hover {
            opacity : 0.7;
        }
        .list-area>tbody>tr:hover {
        background-color : rgb(41, 128, 185);
        cursor : pointer;
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
                            <td style="width:480px; font-size: 22px; font-weight: 600">공지사항</td>
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
                
                
                
                <table class="list-area" border="1" style="height:30px">
                   <thead>
                    <tr style="text-align:center">
                         <th width="100">번호</th>
                         <th width="500">제목</th>
                         <th width="100">작성자</th>
                         <th width="150">작성일</th>
                         <th width="100">조회수</th>
                    </tr>
                     </thead>
                     <tbody>
                     <% if(list.isEmpty()) { %>
                    	<tr>
                    		<td colspan="5" style="align : center; pointer-events : none;">공지사항이 존재하지 않습니다.</td>
                    	</tr>
                    	<% } else { %>
                    		<% for(Notice n : list)  { %>
                    			<tr>
                    				<td><%= n.getNoticeNo() %></td>
                    				<td><%= n.getNoticeTitle() %></td>
                    				<td><%= n.getNoticeWriter() %></td>
                    				<td><%= n.getCreateDate() %></td>
                    				<td><%= n.getCount() %></td>
                    			</tr>	
                    		<% } %>
                    	<% } %>
                    	
                    </tbody>
                </table>
                <br>
                
                <div id="bottom_btn" align="right" style="width:900px; height: 100px;">
                    <button><a href="<%= contextPath %>/enrollForm.no">글작성</a></button>
                </div>
                     
            </div>
              	
        </div>

           <!-- bottom : 하단 영역 --------------------------------------->
          
       
       </div> 
       <script>
   		$(function() {
   			$(".list-area>tbody>tr").click(function() {
   				
   				var anno = $(this).children().eq(0).text();
   				
   				location.href = "<%= contextPath %>/Mdetail.no?nno=" + anno;
   				
   			});
   		});
   	  </script>	

    </body>
    </html>