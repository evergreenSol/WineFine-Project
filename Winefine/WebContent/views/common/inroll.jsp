<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> WINEFINE :D </title>
<style>
    .inroll{
        width: 1200px;
        margin: auto;
        font-weight: 700;
    }    

</style>

</head>
<body>
    <div class="inroll">
        <form action="" method="">
            <table>
                <tr></tr>
                    <td>제 목 : &nbsp;&nbsp; </td>
                    <td><input type="text" style="width:1100px;" required></td>
                <tr></tr> 
                    <td>내 용 : &nbsp;&nbsp; </td>
                    <td><textarea row="10" style="width:1100px; height: 200px;" minlength="10" required></textarea></td>
                <tr></tr>
                    <td>파 일 : &nbsp;&nbsp; </td>
                    <td><input type="file"></td>
            </table>
            <br>
            <input type="submit" class="btn btn-secondary" value="작성하기" style="float:right">&nbsp;
        </form>
    </div>
</body>
</html>