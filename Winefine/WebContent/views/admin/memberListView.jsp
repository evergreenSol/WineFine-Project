<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.winefine.member.model.vo.Member, com.winefine.common.model.vo.PageInfo" %>    
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	//페이징바 관련 변수들
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
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
            
            /*전체 회원 조회 관련 스타일 적용*/
            .member-outer{
                width:1200px;
                height: 800px;
                margin:auto;
            }
            .admin-member{
                margin:auto;
                width: 1200px;
            }
            #member-list-table th{
                text-align: center;
                background-color: skyblue;
                height: 30px;
            }
            #member-list-table tbody tr{
	            text-align: center;
	            cursor: pointer;
	            height: 25px;
            }
            
            #member-list-table tbody tr:hover{
            	opacity: 0.7;
            	background-color: #838282;
                cursor: pointer;
            }
            
              /* 페이징처리 버튼 */
	        .btn-no{
	            display: inline-block;
	            border: none;
	            border-radius: 100px;
	            color: #5f5f5f;
	            font-size: 14px;            
	            background-color: #f3f0f0;
	            margin-left: 10px;
	        }
	        .btn-no:hover {
	            color: white;
	            cursor: pointer;
	            background-color: rgb(41, 128, 185);
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
                            <td style="width:480px; font-size: 22px; font-weight: 600">전체 회원 조회</td>
                    </tr>
                        <tr>
                            <td colspan="2"><hr></td>
                        </tr>
                        </table>
                </div>
           </div>
    
           <!-- body : 바디 영역 --------------------------------------->
           <div class="w_ body">

                  <div class="member-outer">
                      
                        <div class="admin-member">
                           <br>
                            <table align="center" id="member-list-table" border="1">
                                <thead>
                                <tr>
                                    <th>회원번호</th>
                                    <th>아이디</th>
                                    <th>비밀번호</th>
                                    <th>이름</th>
                                    <th>핸드폰번호</th>
                                    <th>이메일</th>
                                    <th>가입일자</th>
                                    <th>주민등록번호</th>
                                    <th>블랙리스트</th>
                                    <th>상태값</th>
                                </tr>
                                </thead>
                                <tbody>
                                
                                <%if(list.isEmpty()) {%>
                                <tr>
                                	<td colspan="10">조회된 회원이 없습니다.</td>
                                </tr>
                                <%} else { %>
                                
                                <% for(Member m : list) { %>
                                <tr>
                                    <td><%= m.getUserNo() %></td>
                                    <td><%= m.getUserId() %></td>
                                    <td><%= m.getUserPwd() %></td>
                                    <td><%= m.getUserName() %></td>
                                    <td><%= m.getPhone() %></td>
                                    <td><%= m.getEmail() %></td>
                                    <td><%= m.getEnrollDate() %></td>
                                    <td><%= m.getUserSsn() %></td>
                                    <td><%= m.getBlacklist() %></td>
                                    <td><%= m.getStatus() %></td>
                                      
                                </tr>
                                	<%} %>
                                <%} %>
                              </tbody>
                            </table>
                            <br><br>
                            
                     <script>
                        $(function(){
    	
                        //각 게시글에 해당되는 tr 태그들 선택 후 클릭 이벤트 걸기
                        $("#member-list-table>tbody>tr").click(function(){
                            
                            
                            //클릭이 되었을 때 해당 회원의 번호를 뽑아온다
                            var mno = $(this).children().eq(0).text();
                            //현재 클릭된 tr 태그의 자손들 중에서(td들 중에서) 첫번째 자손의 content 영역의 '회원번호' 문구만 필요
                            
                            location.href = "<%=contextPath %>/memdetail.admin?mno="+mno;
                        });
                            
                        
                    });     
                    </script>       

                    <!-- 페이징바 -->
                    <div align="center" class="paging-area">
                    
                        <% if(currentPage != 1) {%>
		            <button class="btn-no" onclick="location.href='/winefine/memList.me?currentPage=<%=currentPage - 1%>'">&lt;</button>
		            <%} %>
		            
		            <% for(int p=startPage; p <= endPage; p++) { %>
		            	<% if(p != currentPage) {%>
		            	<button class="btn-no" onclick="location.href='/winefine/memList.me?currentPage=<%=p%>';"><%= p %></button>
		            <% } else { %>
		            <!-- 현재 내가 보고있는 페이지일 경우는 클릭이 안되도록 막음 -->
		            	<button class="btn-no" disabled><%= p %></button>
		            	<% } %>
		            <%} %> 
		            
		            <%if(currentPage != maxPage) { %>
		            <button class="btn-no" onclick="location.href='/winefine/memList.me?currentPage=<%=currentPage + 1%>'">&gt;</button>
		       <%} %>
                    </div>
           </div>

           <!-- bottom : 하단 영역 --------------------------------------->
           <div class="w_ bottom" align="center">
           </div>
       
       </div> 
       

    </body>
    </html>