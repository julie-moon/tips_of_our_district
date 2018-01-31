<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>레벨제도</title>
        <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
        <style>
        	#content .aux{
        		background-color:#FFF;
        	}
            #levelBox  {
                width:960px;
                margin:20px auto;
            }
            #levelBox h2 {
                font-size:25px;
                margin:20px 0;
                font-weight:500;
            }
            #levelList {
                width:960px;
                border-top:1px solid #424242;
                overflow: hidden;
            }
            #levelList li{
                width:239px;
                height:310px;
                float: left;
                text-align: center;
                border-right:1px solid #424242;
                border-bottom:1px solid #424242;
                padding-top:40px;
            }
            #levelList li:nth-child(4n+1) {
                width:238px;
            	border-left:1px solid #424242;
            }
            #levelList img {
                width:100px;
            }
            #levelList div{
                width: 150px;
                margin:10px auto;   /*블록레벨일때 가운데 정렬*/
                line-height: 25px; /*줄간격*/
            }
            #levelList h3{
                font-size:20px;
                padding:20px 0;
            }
        </style>
    </head>
    <body>
        <c:import url="/WEB-INF/view/template/header.jsp"></c:import>
                    <div id="levelBox">
                        <h2>레벨제도</h2>
                        <ul id="levelList">
                            <li class="level1"><img src="img/level1.png"/><h3>LEVEL 1</h3>
                                <div>다른동네 정보 볼 때<br/>  ? 포인트 차감</div>
                                <div>100초간 이용가능</div>
                            </li>
                            <li class="level2"><img src="img/level2.png"/><h3>LEVEL 2</h3>
                                <div>다른동네 정보 볼 때<br/>  ? 포인트 차감</div>
                                <div>3분간 이용가능</div>
                            </li>
                            <li class="level3"><img src="img/level3.png"/><h3>LEVEL 3</h3>
                                <div>다른동네 정보 볼 때<br/>  ? 포인트 차감</div>
                                <div>5분간 이용가능</div>
                            </li>
                            <li class="level4"><img src="img/level4.png"/>
                                <h3>LEVEL 4</h3>
                                <div>다른동네 정보 볼 때<br/>  ? 포인트 차감</div>
                                <div>7분간 이용가능</div>
                            </li>
                            <li class="level5"><img src="img/level5.png"/>
                                <h3>LEVEL 5</h3>
                                <div>다른동네 정보 볼 때<br/>  ? 포인트 차감</div>
                                <div>10분간 이용가능</div>
                            </li>
                            <li class="level6"><img src="img/level6.png"/><h3>LEVEL 6</h3>
                                <div>다른동네 정보 볼 때<br/>  ? 포인트 차감</div>
                                <div>15분간 이용가능</div></li>
                            <li class="level7"><img src="img/level7.png"/><h3>LEVEL 7</h3>
                                <div>다른동네 정보 볼 때<br/>  ? 포인트 차감</div>
                                <div>20분간 이용가능</div></li>
                            <li class="level8"><img src="img/level8.png"/><h3>LEVEL 8</h3>
                                <div>다른동네 정보 볼 때<br/>  ? 포인트 차감</div>
                                <div>30분간 이용가능</div></li>
                        </ul>
                    </div>
        <c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
        <script src="js/jquery.js"></script>
        <script>
        
        </script>
    </body>
</html>