<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.winefine.store.model.vo.Product" %>
    
<% Product p = (Product)request.getAttribute("p"); %>   
 
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
            /* border: 1px solid red;  */
            /*가이드라인 용이니 다 쓰시고 지우면 됩니다 */
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
            font-size: 14px;
            font-weight: 600;
        }
        .btn{
        	margin:5px 10px;
        }



        thead>tr th {
            padding: 5px;
        }

        #productInsert>tbody>tr td {
            /* width: 60px; */
            text-align: center;
            padding: 5px;
        }
        
        /* tbody>tr:hover {
            cursor: pointer;
            color: rgb(119, 45, 96);
        } */
        
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
                        <td style="width:480px; font-size: 22px; font-weight: 600">상품 수정</td>
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

            <form action="<%= contextPath %>/updateProduct.admin" method="post" enctype="multipart/form-data">
                <table align="center" id="productInsert">
                    <tr>
                        <th>상품번호</th>
                        <td><input type="text" name="productNo" readonly value="<%= p.getProductNo() %>"></td>
                        <td></td>
                        <td></td>
                        <th>당도</th>
                        <td><input type="number" name="sweetness" min="1" max="5" required value="<%= p.getSweetness()%>"></td>
                    </tr>
                    <tr>
                        <th>상품명</th>
                        <td><input type="text" name="productName" required value="<%= p.getProductName() %>"></td>
                        <td></td>
                        <td></td>
                        <th>산도</th>
                        <td><input type="number" name="acidity" min="1" max="5" required value="<%= p.getAcidity() %>"></td>
                    </tr>
                    <tr>
                        <th>상품종류</th>
                        <td><input type="text" name="productType" required value="<%= p.getProductType() %>"></td>
                        <td></td>
                        <td></td>
                        <th>바디</th>
                        <td><input type="number" name="body" min="1" max="5" required value="<%= p.getBody() %>"></td>
                    </tr>
                    <tr>
                        <th>원산지</th>
                        <td><input type="text" name="origin" required value="<%= p.getOrigin() %>"></td>
                        <td></td>
                        <td></td>
                        <th>탄닌</th>
                        <td><input type="number" name="tannin" min="1" max="5" required value="<%= p.getTannin() %>"></td>
                    </tr>
                    <tr>
                        <th>판매가격</th>
                        <td><input type="number" name="price" min="0" required value="<%= p.getPrice() %>"></td>
                        <td></td>
                        <td></td>
                        <th>판매상태</th>
                        <td>
                            <select name="status" required>
                                <% if(p.getStatus().equals("Y")) { %>
                                    <option value="Y" selected>판매중</option>
                                    <option value="N">판매중지</option>
                                <% } 
                                   else { %> -->
                                    <option value="Y">판매중</option>
                                    <option value="N" selected>판매중지</option>
                                   <% } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>상품재고</th>
                        <td><input type="number" name="stock" min="0" required value="<%= p.getStock() %>"></td>
                        <td></td>
                        <td></td>
                        <th>Thumbnail</th>
                        <td>
                        <input type="file" name="thumbnail" onchange="loadImg(this, 1);">
                        </td>
                    </tr>
                    <tr>
                        <th>브랜드</th>
                        <td><input type="text" name="brand" required value="<%= p.getBrand() %>"></td>
                        <td></td>
                        <td></td>
                        <th>Content 사진1</th>
                        <td><input type="file" name="contentPhoto1" onchange="loadImg(this, 2);"></td>

                    </tr>
                    <tr>
                        <th>도수</th>
                        <td><input type="number" name="alcohol" min="0" required value="<%= p.getAlcohol() %>"></td>
                        <td></td>
                        <td></td>
                        <th>Content 사진2</th>
                        <td><input type="file" name="contentPhoto2" onchange="loadImg(this, 3);"></td>
                    </tr>
                    <tr>
                        <th>Thumbnail</th>
                        <td><img src="<%= p.getThumbnail() %>" id="thumbnail" class="productImg" width="200px" onclick="bigImg(this.src)" onerror="this.style.display='none'"></td>
                        <th>Content 사진1</th>
                        <td><img src="<%= p.getContentPhoto1() %>" id="contentPhoto1" class="productImg" width="200px" onclick="bigImg(this.src)" onerror="this.src='<%= contextPath %>/resources/images/noimg.jpg'"></td>
                        <th>Content 사진2</th>
                        <td><img src="<%= p.getContentPhoto2() %>" id="contentPhoto2" class="productImg" width="200px" onclick="bigImg(this.src)" onerror="this.src='<%= contextPath %>/resources/images/noimg.jpg'"></td>

                    </tr>
                 
                    <tr>
                        <th>내용</th>
                        <td colspan="6"><textarea name="content" rows="20"><%= p.getContent() %></textarea></td>
                    </tr>
                    
                </table>

                <br>

                <div align="center">
                    <button type="button" onclick="toList();">목록으로</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="reset">초기화</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="submit">상품수정</button>
                </div>

                <br><br>
            </form>
        </div>

        <br><br>
         

       <!-- bottom : 하단 영역 --------------------------------------->
       <!-- 
       <div class="w_ bottom" align="center">
            <button type="button" class="btn btn-secondary">초기화</button>
            <button type="button" class="btn btn-secondary">수정하기</button>
       </div>
       -->
   
    </div> 

    <script>

        function bigImg(src) {

            window.open(src, 'pop01', 'top=10, left=10, width=800, height=1000, status=no, menubar=no, toolbar=no, resizable=no');
        }

        function toList() {
            location.href="<%= contextPath %>/productView.admin?currentPage=1";
        }

        

        function loadImg(inputFile, num) {
            if(inputFile.files.length == 1) {
                var reader = new FileReader();

                console.log(inputFile.files.length)
                reader.readAsDataURL(inputFile.files[0]);

                reader.onload = function(e) {

                    switch(num) {
                        case 1 : $("#thumbnail").attr("src", e.target.result); break;
                        case 2 : $("#contentPhoto1").attr("src", e.target.result); break;
                        case 3 : $("#contentPhoto2").attr("src", e.target.result); break;
                    }

                }
            }
            else {

                switch(num) {
                    case 1 : $("#thumbnail").attr("src", null); break;
                    case 2 : $("#contentPhoto1").attr("src", null); break;
                    case 3 : $("#contentPhoto2").attr("src", null); break;
                }
            }
        }

    </script>
   

</body>
</html>