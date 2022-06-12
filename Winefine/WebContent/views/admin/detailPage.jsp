<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <td style="width:480px; font-size: 22px; font-weight: 600">상세페이지</td>
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

                <table class="detailTable">
                    <tr>
                        <td class="menuTitle" colspan="2">
                            <a href="" id="detailPage" style="color: black; text-decoration:none;">상세페이지</a> &nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="detailInfo.jsp" id="detailInfo" style="text-decoration:none;">상세정보</a> &nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="refundInfo.jsp" id="refundInfo" style="text-decoration:none;">교환 및 반품 안내</a>
                            <br>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="tableTitle">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
                        <td colspan="2">
                            <textarea rows="10" style="resize: none;"></textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="tableTitle">현재 파일</td>
                        <td style="color:grey;">http://localhost:8888/winefine/views/admin/adminStore_Detail.jsp</td>
                    </tr>
                    
                    <tr>
                        <td class="tableTitle">파일 첨부</td>
                        <td>
                            <input type="file">
                        </td>
                    </tr>
                </table>
           </div>

           <!-- bottom : 하단 영역 --------------------------------------->
           <div class="w_ bottom" align="center">
                <button type="button" class="btn btn-secondary">초기화</button>
                <button type="button" class="btn btn-secondary">수정하기</button>
           </div>
       
       </div> 
       
       <script>
        $(function(){

              $("#detailInfo").on({"mouseenter":function(){
                                      $("#detailPage").css("color","lightgrey");
                                  }, "mouseout":function(){
                                      $("#detailPage").css("color","black");
                                  }});
            
              $("#refundInfo").on({"mouseenter":function(){
            	   					  $("#detailPage").css("color","lightgrey");
                                  }, "mouseout":function(){
                                      $("#detailPage").css("color","black");
                                  }});
          });
        </script>

    </body>
    </html>