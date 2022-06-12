<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> WINEFINE :D </title>
<style>
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
            color:white;
            cursor: pointer;
            background-color: #6B325B;
        }
</style>
</head>

<body>
    <!-- 페이징바 영역 -->
    <div align="center" class="paging-area">
                            
        <!-- '<' 표시를 태그로 잘못 인식할수 있으니 &lt; &gt;으로 대체-->
        <button class="btn-no">&lt;</button>
        <button class="btn-no">1</button>
        <button class="btn-no">2</button>
        <button class="btn-no">3</button>
        <button class="btn-no">4</button>
        <button class="btn-no">5</button>
        <button class="btn-no">&gt;</button>
    </div>
    <!-- QnA 내용물 영역 END-->
</body>
</html>