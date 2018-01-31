<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
        <style>
            a{
                text-decoration:none;
                color:#424242;
            }
            #message{
                /*background-color:aquamarine;*/
                font-size:22px;
                text-align:center;
                padding:50px 0;
            }
            #content .aux{
            	text-align:center;
            	background-color:#FFF;
            }
            #goToMain{
                /*background-color:pink;*/
                text-align:right;
                padding:20px 0;
            }
            #goToMain a:hover{
                color:#FEBD39;
                font-weight:600;
            }
        </style>
    </head>
    <body>
        <c:import url="/WEB-INF/view/template/header.jsp"></c:import>
                    <h3 id="message">존재하지 않는 페이지입니다.</h3>
                    <img id="errorImage" src="/img/error5.gif" alt="404 페이지 대표 이미지" />
                    <p id="goToMain"><a href="main.gt">메인 페이지로 이동하기</a></p>
        <c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
        <script src="/js/jquery.js"></script>
        <script>
            $('#profile img').click(function(){
                // alert("test");
                $('#menu').slideToggle(300);
            }); // click() end
            $('#menu li').click(function(){
                $('#menu').slideUp();
            }); //click() end
        </script>
    </body>
</html>