<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WINEFINE :D</title>
</head>
<style>
    body{
        cursor: pointer;
    }
    #video { 
        position: absolute;
        top: 0px;
        left: 0px;
        min-width: 100%;
        min-height: 100%;
        width: 1200px;
        z-index: -1;
        overflow: hidden;
    }
    .videoT .bg_dark span {
        line-height: 120px;
        font-size: 150px;
        color: #ffffff;
    }
    a{
        font-weight: 900;
        font-size: 22px;
        color:#6B325B;
    }
    </style>

<body>
    <div class="videoT" onclick="welcome();">
        <video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
            <source src="/winefine/resources/images/intro.mp4">
        </video>
        <h2 class="bg_dark">
            <span>&nbsp;Time for Wine,<br>&nbsp;WINEFINE</span>
        </h2>
        
    
        <div id="footer" style="color:white; padding-left: 50px;">
            <p>
                <b><a href="https://www.instagram.com/sumsei.official/">INSTAGRAM</a> 
                    <a href="https://www.youtube.com/channel/UCbvIfAgYuIQQK3AGIa4RI0Q">YOUTUBE</a>
                    <a href="https://music.apple.com/library/playlist/p.AWXoLZ4HN43qDl4">APPLE MUSIC</a> 
                    <a href="https://open.spotify.com/playlist/60dWQe5aLrRK5jujBaE5v3?si=d96458e4e97d4846">SPOTIFY</a></b><br><br>
                    (주)와인파인 대표자: WINEFINE<br>
                    사업자등록번호: [KH-452-02-00843] 통신판매업자신고번호: 제2022-서울 영등포 - NO4호<br>
                    대표번호: KH-1640-5091 주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19F, 20F<br>
                    개인정보관리자: KH(khlove@iei.co.kr)<br>
                    대표메일 winefine@iei.co.kr 사이트명: 와인파인<br>
                    Bank Accounts : KH은행 027-142321-01-004 주식회사 와인파인<br>
                    CS Center : 1661-5091 AM 10:00 ~ PM 6:00<br>
                    (점심시간 PM 1:00~ 2:00) ( WEEKEND/HOLIDAY OFF )<br>
            </p>
    </div>
    </div>

    <script>
        function welcome(){
            location.href="/winefine/main.do";
        }
    </script>
</body>
</html>