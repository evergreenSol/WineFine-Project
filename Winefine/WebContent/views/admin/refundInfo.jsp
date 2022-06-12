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
                            <a href="detailPage.jsp" id="detailPage" style="text-decoration:none;">상세페이지</a> &nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="detailInfo.jsp" id="detailInfo" style="text-decoration:none;">상세정보</a> &nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="" id="refundInfo" style="color: black; text-decoration:none;">교환 및 반품 안내</a>
                            <br>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="tableTitle">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
                        <td colspan="2">
                            <textarea rows="10" style="resize: none;">
· 교환 및 반품은 상품 수령 후 7일 이내 가능합니다.

· 해당 예약 상품은 타상품으로 교환이 불가능 합니다.
							
· 증정품이 있을 경우 증정품을 사용한 경우 반품(환불)이 불가합니다.
							
· 주류상품의 교환 및 반품은 WINEFINE 직영 매장에서만 가능합니다.
							
· 상품(또는 케이스) 택(tag)제거,전면부 라벨 손상(오염),개봉으로 상품 가치 훼손 시에는 상품수령후 7일 이내라도 교환 및 반품이 불가능합니다.
							
· 일부 상품은 신규 빈티지 출시, 수입 가격 변동 등 제조사 사정으로 가격이 변동될 수 있습니다.
							
· 고가 및 한정 상품의 경우, 본 상품의 박스 훼손과 분실 등으로 인한 상품 가치 훼손 시 교환 및 반품이 불가능 하오니 양해 바랍니다.
							
· 일부 특가 상품의 경우, 인수 후에는 제품 하자나 오배송의 경우를 제외한 고객님의 단순변심에 의한 교환, 반품이 불가능할 수 있사오니, 각 상품의 상품 상세정보를 꼭 참조하시기 바랍니다.

                            </textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="tableTitle">현재 파일</td>
                        <td style="color:grey;">업로드된 파일 없음</td>
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
                                      $("#refundInfo").css("color","lightgrey");
                                  }, "mouseout":function(){
                                      $("#refundInfo").css("color","black");
                                  }});
            
              $("#detailPage").on({"mouseenter":function(){
            	   					  $("#refundInfo").css("color","lightgrey");
                                  }, "mouseout":function(){
                                      $("#refundInfo").css("color","black");
                                  }});
          });
        </script>

    </body>
    </html>