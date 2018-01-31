<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
    <style>
        #content{
            font-family: "Noto Sans KR",sans-serif;
        }
        #content .aux{
            padding-bottom: 10px;
        }

        #username,#password{
            margin: 20px auto;
            width: 420px;
        }
        .login_box input{
            border: 1px solid #424242;
            width: 420px;
            height: 45px;
            font-family: 'Noto Sans KR', sans-serif;
            display: block;
            font-size: 20px;
            font-weight: 200;
            text-indent: 15px;
            /* padding:2px 5px;*/
        }
        .failMsg{
            color: #FF5252;
            font-weight: bold;
            text-indent: 70px;
            /*display: none;*/
        }
        .region span {
            font-size: 30px;
        }
        .loginPopup{
            display: none;
            width: 100%;
            height: 100%;
            position: fixed;
            left: 0;
            top: 0;
            background: rgba(0,0,0,.5);
            z-index: 1;
        }
        .textbox{
            padding: 20px;
        }
        .login_box{
            position: fixed;
            left: 50%;
            top: 50%;
            width: 600px;
            height:300px;
            margin-left: -300px;
            margin-top: -240px;
            background: #FFFFFF;
            padding: 90px 0;
        }
        .submit_btn{
            font-family: "Noto Sans KR",sans-serif;
            border: none;
            cursor: pointer;
            background: #E0E0E0;
            color: #424242;
            width: 420px;
            height: 50px;
            font-size: 30px;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
            line-height: 50px;
            position: relative;
            margin: 25px -210px;
            top: 50%;
            left: 50%;
        }
        .submit_btn:hover {
            transition: .3s ease-out;
            /*text-shadow: 1px 1px 1px #424242;*/
            color: #424242;
            background: #FEBD39;
            /*box-shadow: 0 16px 28px 0 rgba(0, 0, 0, 0.22), 0 25px 55px 0 rgba(0, 0, 0, 0.21);*/
        }
        .login_box p{
            text-align: center;
         }
        .login_box a.forgot{
            border-right:1px solid #424242;
            text-decoration: none;
            padding-right: 15px;
            color:#424242;
        }
        .login_box  a.join{
            padding-left: 15px;
            text-decoration: none;
            color:#424242;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
           


    <div id="loginBox" class="loginPopup">
          <div class="login_box">
            <form  method="post" class="signin" action="main.gt">
                <fieldset class="textbox">
            <label class="username">
                <input id="username" name="username" value="" type="text" autocomplete="on"
                       title="아이디를 입력하세요" placeholder="아이디" />
            </label> <!-- .username -->
            <label class="password">
                <input id="password" name="password" value="" type="password"
                       title="비밀번호를 입력하세요" placeholder="비밀번호">
                <div class="failMsg">아이디 및 비밀번호를 잘못 입력했습니다.</div>
            </label> <!-- .password -->
            <button class="submit_btn" type="button">로그인</button>
              <p>
                <a class="forgot" href="find.gt">아이디/비밀번호 찾기</a>
                <a class="join" href="joinForm.gt">회원가입</a>
              </p>
                </fieldset>
            </form>
          </div> <!-- .login_box -->
    </div> <!-- #loginBox -->

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

        $('#menu .login').click(function (e) {
            e.preventDefault()
            //alert("test");
            $('#loginBox').show();
        }); // #menu .login click() end

        $(".login_box").click(function () {
           return false;
        }); // 클릭 한번 막기

        $('#loginBox').click(function () {
            //alert("test");
            $('#loginBox').hide();
        }); // #loginPopup click() end

       /* $(".join").click(function () {
            location.href="joinForm.html";
        }); // .join click() end*/


    </script>
</body>
</html>