<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.winefine.member.model.vo.Member" %>
    
<%  Member m = (Member)request.getAttribute("m"); %>   
 
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
        .top {
            height: 240px; /* height: 240px */
        }
        .body {
            height: 600px;
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
            font-size: 18px;
            font-weight: 700;
        }
        .btn{
        	margin:5px 10px;
        }

        thead>tr th {
            padding: 15px;
        }

        #MemberUpdate>tbody>tr td {
            /* width: 60px; */
            text-align: center;
            padding: 25px;
        }
        
        /* tbody>tr:hover {
            cursor: pointer;
            color: rgb(119, 45, 96);
        } */
        
        .body button{
            background-color: rgb(41, 128, 185);
            color:white;
            height:30px;
            border-radius: 5px;
        }

        textarea {
            height: 100%;
            width: 100%;
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
                        <td style="width:480px; font-size: 22px; font-weight: 600">회원 정보 수정</td>
                        <td colspan="2" style="width: 720px;" align="right">
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

            <br>

            <form action="<%= contextPath %>/updateMember.admin" method="post">
                <table align="center" id="MemberUpdate">
                    <tr>
                        <th>회원번호</th>
                        <td><input type="text" name="userNo" readonly value="<%= m.getUserNo() %>"></td>
                        <td></td>
                        <td></td>
                        <th>이메일</th>
                        <td><input type="text" name="email" readonly required value="<%= m.getEmail() %>"></td>
                        
                    </tr>
                    <tr>
                        <th>회원 아이디</th>
                        <td><input type="text" name="userId" readonly value="<%= m.getUserId() %>"></td>
                        <td></td>
                        <td></td>
                        <th>가입일자</th>
                        <td><input type="text" name="enrollDate" readonly value="<%= m.getEnrollDate() %>"></td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" name="userPwd" readonly value="<%= m.getUserPwd() %>"></td>
                        <td></td>
                        <td></td>
                        <th>주민등록번호</th>
                        <td><input type="text" name="userSsn" readonly required value="<%= m.getUserSsn() %>"></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" name="userName" required value="<%= m.getUserName() %>"></td>
                        <td></td>
                        <td></td>
                        <th>블랙리스트</th>
                        <td>
                            <select name="blacklist" required>
                                <% if(m.getBlacklist().equals("Y")) { %>
                                    <option value="Y" selected>블랙리스트회원</option>
                                    <option value="N">일반회원</option>
                                <% } 
                                   else { %> -->
                                    <option value="Y">블랙리스트회원</option>
                                    <option value="N" selected>일반회원</option>
                                   <% } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>핸드폰 번호</th>
                        <td><input type="text" name="phone" required value="<%= m.getPhone() %>"></td>
                        <td></td>
                        <td></td>
                        <th>상태값</th>
                        <td>
                            <select name="status" required>
                                <% if(m.getStatus().equals("Y")) { %>
                                    <option value="Y" selected>일반회원</option>
                                    <option value="N">탈퇴회원</option>
                                <% } 
                                   else { %> -->
                                    <option value="Y">일반회원</option>
                                    <option value="N" selected>탈퇴회원</option>
                                   <% } %>
                            </select>
                        </td>
                    </tr>
                </table>

                <br>

                <div align="center">
                    <button type="reset" onclick="goBack();">목록가기</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="submit">정보수정</button>
                </div>

                <br><br>
            </form>
        </div>
         
       <!-- bottom : 하단 영역 --------------------------------------->
       <!-- 
       <div class="w_ bottom" align="center">
            <button type="button" class="btn btn-secondary">초기화</button>
            <button type="button" class="btn btn-secondary">수정하기</button>
       </div>
       -->
   
    </div> 

    <script>

        function goBack(){
            location.href="<%= contextPath %>/memList.me?currentPage=1";
        }


    </script>
   

</body>
</html>