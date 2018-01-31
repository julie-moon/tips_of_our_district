<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>우리동네꿀팁 main</title>
    <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
    <style>
        html {
            overflow-x: hidden;
            overflow-y: scroll;
        }
        #content .aux{
            background-color: #fff;
        }

        /* h2요소 */
        .aux h2 {
            font-size: 25px;

        }
        .aux h2 a {
            text-decoration: none;
            color: #424242;
            transition: .2s ease-in;
        }
        .aux h2 a:hover {
            color: #FEBF37;
        }

         /* 배너영역 */
        .main_pic {
            width: 960px;
            margin-bottom: 30px;
            position: relative;
        }
        #slideWrap {
            width: 960px;
            height: 400px;
        }
        .list_slide {
            width: 6720px;
            height: 400px;
            position: relative;
            /*left: -1920px;*/
        }
        .slide_item:nth-child(1),.slide_item:nth-child(3) {
            opacity: 0.7;
            filter: blur(2px);
        }
        .slide_item {
            width: 960px;
            height: 400px;
            text-decoration: none;
            float: left;
            position: relative;
            background-image: url("img/banner.jpg");
            background-size: cover;
            background-position: center;
        }
        .slide_item a {
            text-decoration: none;
            color: #fff;
        }
        .info {
            width: 960px;
            height: 100px;
            position: absolute;
            bottom: 20px;
            left: 0;
            background-color: rgba(0%,0%,0%,0.7);
            font-size: 13px;
            font-weight: normal;
        }
        .info h3 {
            width: 700px;
            /*background-color: #2196F3;*/
            font-size: 30px;
            font-weight: bold;
            position: absolute;
            top: 35px;
            left: 140px;
            /* 제목 길어졌을 때 생략 */
            text-overflow:ellipsis;
            overflow:hidden;
            white-space:nowrap;
        }
        .info h3 span {
            font-size: 20px;
            font-weight: normal;
        }
        .info.writer {
            width: 400px;
            height: 80px;
            position: absolute;
            top: 7px;
            left: 50px;
            background-color: transparent;
        }
        .info.writer .user_level {
            width: 70px;
        }
        .info.writer .user_image {
            width: 55px;
            border-radius: 55px;
            position: absolute;
            top: 13px;
            left: 7px;
        }
        .info.writer .writer_location {
            font-weight: normal;
            position: absolute;
            left: 90px;
            top: 5px;
        }
        .info.writer strong {
            color: #FEBF37;
            font-size: 18px;
        }
        .info.info p,time {
            font-weight: lighter;
            position: absolute;
            bottom: 13px;
            left: 140px;
        }
        .info.mark {
            width: 200px;
            position: absolute;
            bottom: 5px;
            left: 750px;
            height: 30px;
            background-color: transparent;
            font-size: 20px;
        }
        .badge.main {
            font-weight: normal;
            color: #424242;
            font-size: 15px;
            height: 23px;
            line-height: 23px;
            padding: 0 2px;
            position: absolute;
            left: 232px;
            text-align: center;
            bottom: 7px;
        }

         /* 배너영역 버튼 */
        .wrap_btn {
            display: block;
        }
        .btn_scroll {
            width: 80px;
            height: 80px;
            border-radius: 80px;
            background-color: rgba(100%,100%,100%,0.9);
            position: absolute;
            font-size: 60px;
            font-weight: lighter;
            color: #757575;
            text-align: center;
            line-height: 75px;
            cursor: pointer;
        }
        .btn_prev {
            top: 146px;
            left: -42px;
        }
        .btn_next {
            top: 143px;
            right: -42px;
        }
        /* 배너 페이징처리 */
        .wrap_paging {
            width: 960px;
            text-align: center;
            margin: 20px 0;
        }
        .link_page {
            text-decoration: none;
            margin: 5px;
            color: #eeeeee;
            transition: .2s ease-in-out;
        }
        .link_page:hover {
            color: #FEBF37;
        }
        .link_page.current {
            color: #FEBF37;
        }


        /* 꿀플,꿀팁 공통* /
        /* list ul요소 */
        .main_list {
            width: 870px;
            height: 380px;
            margin: 10px 0;
        }
        /* list li요소 */
        .best_list {
            width: 280px;
            height: 380px;
            float: left;
            margin-right: 15px;
            position: relative;
        }
        .best_list:nth-child(3) {
            margin-right: 0px;
        }
        /* a요소 */
        .link_item {
            text-decoration: none;
        }
        /* 페이징 */
        .best_paing {
            width: 870px;
            margin: 15px auto;
            text-align: center;
            /*font-size: 13px;*/
        }
        /* 꿀플 페이징 */
        .place_link_page {
            text-decoration: none;
            margin: 10px;
            color: #757575;
            transition: .2s ease-in-out;
        }
        .place_link_page:hover {
            color: #FEBF37;
        }
        /* 지역 뱃지 */
        .badge {
            width: 55px;
            height: 27px;
            line-height: 27px;
            /*text-align: center;*/
            background-color: #FEBF37;
            font-size: 16px;
        }
        .place_badge {
            position: absolute;
            top: 15px;
            left: -10px;
        }
        .place_badge:after {
            content: "";
            display: inline-block;
            border-right: 10px solid #A47A29;
            border-bottom: 10px solid transparent;
            position: absolute;
            bottom: -10px;
            left: 0;
        }

        /* 꿀플 영역 */
        #gPlaceBox {
            width: 870px;
            margin: 70px auto;
        }
        .best_list {
            margin-bottom: 30px;
        }
        .place_pic {
            width: 280px;
            height: 300px;
            background-image: url("img/ohu.jpg");
            background-position: center;
            background-size: cover;
        }
        .place_info {
            width: 280px;
            height: 85px;
            background-color: #fff;
            color: #424242;
            line-height: 60px;
            text-indent: 5px;
            border-bottom: 1px solid #E0E0E0;
        }
        .place_info h3 {
            display: inline-block;
            max-width: 163px;
            height: 40px;
            /*background-color: red;*/
            font-size: 20px;
            font-weight: bold;
            /* 제목 길어졌을 때 생략 */
            text-overflow:ellipsis;
            overflow:hidden;
            white-space:nowrap;
        }
        .place_info .honeypot {
            width: 20px;
            margin-left: 2px;
        }
        .place_address {
            max-width: 210px;
            font-size: 15px;
            position: absolute;
            left: 5px;
            bottom: -10px;
            /* 제목 길어졌을 때 생략 */
            text-overflow:ellipsis;
            overflow:hidden;
            white-space:nowrap;
        }
        .place_reg {
            display: block;
            width: 70px;
            height: 60px;
            text-align: center;
            position: absolute;
            bottom: 0;
            right: 0;
            margin-bottom: 7px;
        }
        .place_reg .user_level {
            width: 30px;
        }
        .place_reg .user_image {
            width: 22px;
            border-radius: 22px;
            position: absolute;
            top: 9px;
            left: 26px;
        }
        .place_reg span {
            display: inline-block;
            position: absolute;
            bottom: 0px;
            right: 0px;
            width: 70px;
            height: 15px;
            font-size: 12px;
            line-height: 15px;
        }


        /* 꿀팁 영역 */
        #gTipBox {
            width: 870px;
            margin: 70px auto;
        }
        .tip_best {
            background-image: url("img/winter.jpg");
            background-size: cover;
            background-position: center;
            margin-bottom: 30px;
        }
        .tip_info {
            background-color: rgba(0%,0%,0%,0.3);
            text-align: center;
        }
        .link_item.tip {
            color: #fff;
        }
        .link_item.tip h3 {
            font-size: 20px;
            padding: 0 10px;
            position: absolute;
            top: 150px;
        }
        .tip_rating {
            position: absolute;
            left: 20px;
            bottom: 20px;
        }
        .tip_writer {
            display: block;
            width: 70px;
            height: 60px;
            text-align: center;
            position: absolute;
            bottom: 0;
            right: 0;
            margin-bottom: 7px;
        }
        .tip_writer .user_level {
            width: 30px;
        }
        .tip_writer .user_image {
            width: 22px;
            border-radius: 22px;
            position: absolute;
            top: 6px;
            left: 24px;
        }
        .tip_writer span {
            display: inline-block;
            position: absolute;
            bottom: 0px;
            right: 0px;
            width: 70px;
            height: 15px;
            font-size: 12px;
            line-height: 15px;
        }


        /* 주간꿀벌 영역 */
        #bbBox {
            width: 870px;
            margin: 70px auto;
        }
        .bb_list {
            height: 240px;
        }
        .best_user {
            width: 140px;
            height: 220px;
            margin-top: 10px;
            margin-right: 42px;
            float: left;
            text-align: center;
            position: relative;
        }
        .best_user:nth-child(5) {
            margin-right: 0;
        }
        .best_user a {
            display: inline-block;
            width: 100px;
            text-decoration: none;
            padding: 15px 20px 7px 20px;
            color: #424242;
            font-size: 18px;
            font-weight: bold;
        }
        .best_user a:hover {
            color: #FEBF37;
        }
        .bbadge {
            display: block;
            margin: 0 auto;
            /*display: none;*/
        }

        .best_user .bee_image{
            width:110px;
            border-radius:110px;
            position:absolute;
            top: 0;
            left: 0;
        }
        .best_user .minus_bee{
            background-color:rgba(0, 0, 0, .5);
            position:absolute;
            top:-110px;
            left:0;
            width:110px;
            height:110px;
            border-radius:110px;
            text-align:center;
            font-size:25px;
            color:#FFF;
            line-height:108px;
        }
        .bee_profile{
            width:140px;
            height:160px;
            background:url(img/level6.png);
            background-repeat:no-repeat;
            background-position:center 0;
            background-size:140px 160px;
        }
        .bee_profile a{
            width:110px;
            height:110px;
            position:absolute;
            left: 15px;
            top: 25px;
            z-index:1000;
            overflow: hidden;
        }
        .minus{
            display:none;
        }
        .bee_profile a:hover .minus_bee {
            top:0;
        }


        /* 지역선택팝업 */
        #popup {
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,.8);
            position: fixed;
            top: 0;
            left: 0;
            display: none;
        }
        #popMap {
            width: 700px;
            height: 750px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -375px 0 0 -350px;
            background-color: #fff;
            text-align: center;
        }
        #popMap h2 {
            padding: 50px 0 0 10px;
            font-weight: bold;
        }
        #popMap svg {
            display: block;
            margin: auto;
        }
        #popMap svg path:hover {
            fill: #FEBF37;
            cursor:pointer;
            text-shadow:1px 1px #858585;
        }
        #popMap .gu {
            width: 160px;
            height: 40px;
            border-bottom: 2px solid #E1E1E1;
            line-height: 40px;
            font-size: 20px;
            font-weight: bold;
            position: absolute;
            top: 150px;
            left: 100px;
        }
        #popMap span {
            display: inline-block;
            float: left;
            width: 70px;
        }
        #popMap strong {
            display: inline-block;
            width: 90px;
            text-align: left;
            font-size: 21px;
            color: #FEBF37;
            text-indent: 5px;
        }
        #popMap .present {
            color: #424242;
        }
        #popMap button {
            width: 300px;
            height: 40px;
            border: none;
            margin: 20px;
            color: #858585;
            background-color: #eeeeee;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 22px;
        }
        #popMap button:hover {
            color: #424242;
            background-color: #FEBF37;
        }
        #popMap .msg {
            display: none;
            color: #F44336;
        }

    </style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"></c:import>

            <!-- 배너 영역 -->
            <h2 class="screen_out">메인배너</h2>
            <div class="main_pic">
                <div id="slideWrap" >
                    <ul class="list_slide">
                        <li class="slide_item">
                            <div class="info gPlace">
                                <a href="#">
                                    <div class="info writer">
                                        <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                        <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                                        <span class="writer_location"><strong>날아라</strong> 님이 발견한 꿀플</span>
                                    </div>
                                    <h3>
                                        플플플플플플플플플플플플플플플플플플플
                                        <img src="/img/honeypot.png" width="20" />
                                        <span>77%</span>
                                    </h3>
                                    <p>서울특별시 관악구 봉천동 1598-6</p>
                                </a>
                            </div>
                        </li> <!-- // .slide_item -->
                        <li class="slide_item real">
                            <div class="info gPlace">
                                <a href="#">
                                    <div class="info writer">
                                        <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                        <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                                        <span class="writer_location"><strong>날아라</strong> 님이 발견한 꿀플</span>
                                    </div>
                                    <h3>
                                        1 쟝블랑제리
                                        <img src="/img/honeypot.png" width="20" />
                                        <span>77%</span>
                                    </h3>
                                    <p>서울특별시 관악구 봉천동 1598-6</p>
                                </a>
                            </div>
                        </li> <!-- // .slide_item -->
                        <li class="slide_item real">
                            <div class="info gTip">
                                <a href="#">
                                    <div class="info writer">
                                        <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                        <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                                        <span class="writer_location"><strong>날아라</strong> 님이 작성한 꿀팁</span>
                                    </div>
                                    <h3>2 일 못하는 사람의 6가지 특징 </h3>
                                    <time>17.11.28 17:25</time>
                                    <span class="badge main">관악구</span>
                                    <div class="info mark">
                                        <img src="/img/honeypot.png" width="20" />
                                        <span>1,000</span>&nbsp;&nbsp;
                                        <img src="/img/venom.png" width="20" />
                                        <span>101</span>
                                    </div>
                                </a>
                            </div>
                        </li> <!-- // .slide_item -->
                        <li class="slide_item real">
                            <div class="info gPlace">
                                <a href="#">
                                    <div class="info writer">
                                        <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                        <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                                        <span class="writer_location"><strong>날아라</strong> 님이 발견한 꿀플</span>
                                    </div>
                                    <h3>
                                        3
                                        <img src="/img/honeypot.png" width="20" />
                                        <span>77%</span>
                                    </h3>
                                    <p>서울특별시 관악구 봉천동 1598-6</p>
                                </a>
                            </div>
                        </li> <!-- // .slide_item -->
                        <li class="slide_item real">
                            <div class="info gTip">
                                <a href="#">
                                    <div class="info writer">
                                        <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                        <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                                        <span class="writer_location"><strong>날아라</strong> 님이 작성한 꿀팁</span>
                                    </div>
                                    <h3>4 우리가 회사에서 미친년이 되어야 하는 이유 </h3>
                                    <time>17.11.28 17:25</time>
                                    <span class="badge main">관악구</span>
                                    <div class="info mark">
                                        <img src="/img/honeypot.png" width="20" />
                                        <span>1,000</span>&nbsp;&nbsp;
                                        <img src="/img/venom.png" width="20" />
                                        <span>101</span>
                                    </div>
                                </a>
                            </div>
                        </li> <!-- // .slide_item -->
                        <li class="slide_item real">
                            <div class="info gPlace">
                                <a href="#">
                                    <div class="info writer">
                                        <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                        <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                                        <span class="writer_location"><strong>날아라</strong> 님이 발견한 꿀플</span>
                                    </div>
                                    <h3>
                                        5
                                        <img src="/img/honeypot.png" width="20" />
                                        <span>77%</span>
                                    </h3>
                                    <p>서울특별시 관악구 봉천동 1598-6</p>
                                </a>
                            </div>
                        </li> <!-- // .slide_item -->
                        <li class="slide_item">
                            <div class="info gPlace">
                                <a href="#">
                                    <div class="info writer">
                                        <img class="user_level" src="img/hexagon.png" alt="유저 레벨" />
                                        <img class="user_image" src="img/profile_default.png" alt="유저 프로필사진" />
                                        <span class="writer_location"><strong>날아라</strong> 님이 발견한 꿀플</span>
                                    </div>
                                    <h3>
                                        팁플플플플플플플플플플플플플팁
                                        <img src="img/honeypot.png" width="20" />
                                        <span>77%</span>
                                    </h3>
                                    <p>서울특별시 관악구 봉천동 1598-6</p>
                                </a>
                            </div>
                        </li> <!-- // .slide_item -->
                    </ul><!-- // .list_slide -->
                </div> <!-- // #slideWrap -->
                <div class="wrap_btn">
                    <a class="btn_scroll btn_prev">
                        &lt;
                    </a>
                    <a class="btn_scroll btn_next">
                        >
                    </a>
                </div> <!-- // #wrap_btn -->
                <div class="wrap_paging">
                    <a href="#" class="link_page current" data-page="1">
                        <i class="fa fa-circle"></i>
                    </a>
                    <a href="#" class="link_page" data-page="2">
                        <i class="fa fa-circle"></i>
                    </a>
                    <a href="#" class="link_page" data-page="3">
                        <i class="fa fa-circle"></i>
                    </a>
                    <a href="#" class="link_page" data-page="4">
                        <i class="fa fa-circle"></i>
                    </a>
                    <a href="#" class="link_page" data-page="5">
                        <i class="fa fa-circle"></i>
                    </a>
                </div> <!-- // .wrap_paing -->
            </div> <!-- // .main_pic -->


            <!-- 꿀플 베스트 -->
            <div id="gPlaceBox">
                <h2><a href="#">꿀플</a></h2>
                <ul class="main_list">
                    <li class="best_list place_best">
                        <div class="place_pic"></div>
                        <a href="" class="link_item">
                            <div class="place_info">
                                <div class="badge place_badge">강남구</div>
                                <h3>오겹살왕돌구이집</h3>
                                <img class="honeypot" src="img/honeypot.png" />
                                <span>85%</span>
                                <p class="place_address">서울시 관악구 봉천동 1599-4855654895</p>
                                <p class="place_reg">
                                    <img class="user_level" src="img/level3.png" alt="유저 레벨" />
                                    <img class="user_image" src="img/profile_default.png" alt="유저 프로필사진" />
                                    <span>이사배배배</span>
                                </p>
                            </div>
                        </a>
                    </li>
                    <li class="best_list place_best">
                        <div class="place_pic"></div>
                        <a href="" class="link_item">
                            <div class="place_info">
                                <div class="badge place_badge">관악구</div>
                                <h3>오후의 과일</h3>
                                <img class="honeypot" src="img/honeypot.png" />
                                <span>85%</span>
                                <p class="place_address">서울시 관악구 봉천동 1599-4</p>
                                <p class="place_reg">
                                    <img class="user_level" src="img/level8.png" alt="유저 레벨" />
                                    <img class="user_image" src="img/profile_default.png" alt="유저 프로필사진" />
                                    <span>이사배이비</span>
                                </p>
                            </div>
                        </a>
                    </li>
                    <li class="best_list place_best">
                        <div class="place_pic"></div>
                        <a href="" class="link_item">
                            <div class="place_info">
                                <div class="badge place_badge">도봉구</div>
                                <h3>가게이름이너무길어서짜증나는집</h3>
                                <img class="honeypot" src="img/honeypot.png" />
                                <span>85%</span>
                                <p class="place_address">서울시 관악구 봉천동 1599-4</p>
                                <p class="place_reg">
                                    <img class="user_level" src="img/level4.png" alt="유저 레벨" />
                                    <img class="user_image" src="img/profile_default.png" alt="유저 프로필사진" />
                                    <span>이사배</span>
                                </p>
                            </div>
                        </a>
                    </li>
                </ul>
                <div class="best_paing">
                    <a href="#" class="place_link_page" data-page="1">
                        <span class="img_page txt_page1">1</span>
                    </a>
                    <a href="#" class="place_link_page" data-page="2">
                        <span class="img_page txt_page2">2</span>
                    </a>
                    <a href="#" class="place_link_page" data-page="3">
                        <span class="img_page txt_page3">3</span>
                    </a>
                </div> <!-- // .best_paing -->
            </div><!--// #gPlaceBox-->


            <!-- 꿀팁 베스트 -->
            <div id="gTipBox">
                <h2><a href="#">꿀팁</a></h2>
                <ul class="main_list">
                    <li class="best_list tip_best">
                        <div class="best_list tip_info">
                            <div class="badge place_badge">도봉구</div>
                            <a href="#" class="link_item tip">
                                <h3>올 겨울을 따뜻하게 보낼 수 있는 10가지 팁</h3>
                                <div class="tip_rating">
                                    <img src="img/honeypot.png" width="15px" />
                                    <span>56</span> &nbsp;&nbsp;
                                    <img src="img/venom.png" width="15px" />
                                    <span>0</span>
                                </div>
                                <div class="tip_writer">
                                    <img class="user_level" src="img/level5.png" alt="유저 레벨" />
                                    <img class="user_image" src="img/profile_default.png" alt="유저 프로필사진" />
                                    <span>이사배</span>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li class="best_list tip_best">
                        <div class="best_list tip_info">
                            <div class="badge place_badge">도봉구</div>
                            <a href="#" class="link_item tip">
                                <h3>우왕 눈온당이 야이야이야이야이야이야이야이야이야이야이야이야이야이야이야이야이야</h3>
                                <div class="tip_rating">
                                    <img src="img/honeypot.png" width="15px" />
                                    <span>10,000</span> &nbsp;&nbsp;
                                    <img src="img/venom.png" width="15px" />
                                    <span>5,159</span>
                                </div>
                                <div class="tip_writer">
                                    <img class="user_level" src="img/level6.png" alt="유저 레벨" />
                                    <img class="user_image" src="img/profile_default.png" alt="유저 프로필사진" />
                                    <span>간지뽀대킹</span>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li class="best_list tip_best">
                        <div class="best_list tip_info">
                            <div class="badge place_badge">도봉구</div>
                            <a href="#" class="link_item tip">
                                <h3>널 너무너무너무 너무너무너무 너무너무너무너무너무너무너무</h3>
                                <div class="tip_rating">
                                    <img src="img/honeypot.png" width="15px" />
                                    <span>56</span> &nbsp;&nbsp;
                                    <img src="img/venom.png" width="15px" />
                                    <span>0</span>
                                </div>
                                <div class="tip_writer">
                                    <img class="user_level" src="img/level6.png" alt="유저 레벨" />
                                    <img class="user_image" src="img/profile_default.png" alt="유저 프로필사진" />
                                    <span>이사배</span>
                                </div>
                            </a>
                        </div>
                    </li>
                </ul>
                <div class="best_paing">
                    <a href="#" class="place_link_page" data-page="1">
                        <span class="img_page txt_page1">1</span>
                    </a>
                    <a href="#" class="place_link_page" data-page="2">
                        <span class="img_page txt_page2">2</span>
                    </a>
                    <a href="#" class="place_link_page" data-page="3">
                        <span class="img_page txt_page3">3</span>
                    </a>
                    <a href="#" class="place_link_page" data-page="3">
                        <span class="img_page txt_page3">4</span>
                    </a>
                    <a href="#" class="place_link_page" data-page="3">
                        <span class="img_page txt_page3">5</span>
                    </a>
                </div> <!-- // .best_paing -->
            </div><!--// #gTipBox-->


            <!-- 주간 꿀벌벌 -->
            <div id="bbBox">
                <h2>주간 꿀벌</h2>
                <ul class="main_list bb_list">
                    <li class="best_user">
                        <div class="bee_profile">
                            <a href="">
                                <img class="bee_image" src="img/profile_default.png" />
                                <div class="minus_bee">
                                    <i class="fa fa-plus-circle plus" ></i>
                                    <i class="fa fa-minus-circle minus" ></i>
                                </div>
                            </a>
                        </div>
                        <a href="#"><span>성길이</span></a>
                        <div class="badge bbadge">도봉구</div>
                    </li>
                    <li class="best_user">
                        <div class="bee_profile">
                            <a href="">
                                <img class="bee_image" src="img/profile_default.png" />
                                <div class="minus_bee">
                                    <i class="fa fa-plus-circle plus" ></i>
                                    <i class="fa fa-minus-circle minus" ></i>
                                </div>
                            </a>
                        </div>
                        <a href="#"><span>아이언</span></a>
                        <div class="badge bbadge">도봉구</div>
                    </li>
                    <li class="best_user">
                        <div class="bee_profile">
                            <a href="">
                                <img class="bee_image" src="img/profile_default.png" />
                                <div class="minus_bee">
                                    <i class="fa fa-plus-circle plus" ></i>
                                    <i class="fa fa-minus-circle minus" ></i>
                                </div>
                            </a>
                        </div>
                        <a href="#"><span>스파이디</span></a>
                        <div class="badge bbadge">도봉구</div>
                    </li>
                    <li class="best_user">
                        <div class="bee_profile">
                            <a href="">
                                <img class="bee_image" src="img/profile_default.png" />
                                <div class="minus_bee">
                                    <i class="fa fa-plus-circle plus" ></i>
                                    <i class="fa fa-minus-circle minus" ></i>
                                </div>
                            </a>
                        </div>
                        <a href="#"><span>캡틴아리랑</span></a>
                        <div class="badge bbadge">도봉구</div>
                    </li>
                    <li class="best_user">
                        <div class="bee_profile">
                            <a href="">
                                <img class="bee_image" src="img/profile_default.png" />
                                <div class="minus_bee">
                                    <i class="fa fa-plus-circle plus" ></i>
                                    <i class="fa fa-minus-circle minus" ></i>
                                </div>
                            </a>
                        </div>
                        <a href="#"><span>또르</span></a>
                        <div class="badge bbadge">도봉구</div>
                    </li>
                </ul>
                <div class="best_paing">
                    <a href="#" class="place_link_page" data-page="1">
                        <span class="img_page txt_page1">말벌</span>
                    </a>
                    <a href="#" class="place_link_page" data-page="2">
                        <span class="img_page txt_page2">일벌</span>
                    </a>
                    <a href="#" class="place_link_page" data-page="3">
                        <span class="img_page txt_page3">시벌</span>
                    </a>
                    <a href="#" class="place_link_page" data-page="3">
                        <span class="img_page txt_page3">글벌</span>
                    </a>
                    <a href="#" class="place_link_page" data-page="3">
                        <span class="img_page txt_page3">왕벌</span>
                    </a>
                    <a href="#" class="place_link_page" data-page="3">
                        <span class="img_page txt_page3">땅벌</span>
                    </a>
                </div> <!-- // .best_paing -->
            </div><!--// #bbBox-->


            <!-- 지역선택팝업 -->
            <div id="popup">
                <div id="popMap">
                    <h2>지역선택</h2>
                    <div class="gu">
                        <span>현재구: </span> <strong class="present"></strong>
                        <span>선택구: </span> <strong class="select"></strong>
                    </div>

                    <svg width="500px" height="500px" viewBox="0 0 1400 1400" enable-background="new 0 0 1400 1400">
                        <path data-name="도봉구"  id="Dobong-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M964.064,164.667
	c-1.447,9.018-0.285,18.105-2.002,27.506c-2.068,11.332-9.018,22.101-11.502,33.507c-0.867,3.979-0.977,9.201-1.5,14.003
	c-0.508,4.656-1.969,10.129-1.5,14.003c0.779,6.456,5.756,14.04,8.502,21.005c2.287,5.805,7.385,15.948,8.002,21.505
	c0.539,4.856-0.953,11.628-1.502,17.504c-0.547,5.879-1.484,11.904-2,17.504c-1.135,12.346-0.799,25.368-3,36.008
	c-1.582,7.641-5.57,14.402-7.002,21.505c-1.725,8.558-1.271,18.438-3,27.506c-6.813,0.022-13.387,0.283-19.506,1
	c-14.793-19.111-31.705-39.509-48.51-58.013c-4.902-5.398-11.217-16.078-17.504-18.504c-7.016-2.707-17.623,0.042-22.006-7.001
	c-4.459-4.876-9.127-9.544-14.002-14.003c-0.148-1.02-1.354-0.98-1.502-2c-3.959-4.376-8.127-8.544-12.502-12.503
	c-2.484-9.723,2.434-16.186,3.5-24.005c1.156-1.678,0.176-5.493,0.5-8.001c0-4.168,0-8.335,0-12.503
	c-1.914-13.504,2.932-25.383,2.502-37.009c-0.459-12.384-5.236-23.798-6.002-36.508c11.756-1.325,7.563-21.182,9.002-35.508
	c0.838-8.333,5.449-13.907,6.502-19.504c9.998-4.506,22.598-6.408,38.008-5.501c2.178-0.323,5.654,0.652,7.002-0.5
	c3.451,0.612,7.951-0.803,10.502,0c9.178,2.887,3.551,20.857,10.002,25.005c4.402,2.831,14.043,1.217,20.506,1.5
	c7.441,0.328,14.299,0.634,21.004,1C944.035,158.024,948.826,166.568,964.064,164.667z"/>
                        <path data-name="동대문구" id="Dongdaemun-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M943.059,562.258
	c17.314-12.86,45.85-14.498,69.016-21.505c4.727,50.787,10.273,100.752,15.504,151.034c-6.555,14.951-12.34,30.67-19.004,45.511
	c-22.848-9.494-47.135-17.548-71.518-25.506c-1.996-7.838-4.219-15.451-7-22.505c-1.004-1.498-4.105-0.896-6.502-1
	c-0.693-1.14-3.48-0.187-5.002-0.5c-4.93,0.306-9.943-0.296-15.002-0.5c-5.111-0.206-11.324-1.679-15.004-0.5
	c-4.971,1.592-4.482,8.52-9.002,11.003c-1.5,0-3.002,0-4.502,0c-0.693-1.141-3.48-0.187-5-0.5
	c-6.898-0.604-9.074-5.929-13.504-9.002c0-2,0-4.001,0-6.001c1.15-1.184,0.18-4.488,0.5-6.501c0-3.334,0-6.668,0-10.002
	c-1.777-8.816,6.691-12.109,9.502-18.004c3.188-6.685,2.475-12.889,5.502-20.004c13.135-9.705,25.787-19.891,43.01-25.506
	c5.984-9.353,9.824-20.849,17.004-29.006C935.932,569.802,939.6,566.134,943.059,562.258z"/>
                        <path data-name="동작구" id="Dongjak-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M549.469,914.338
	c12.88,1.814,26.066,2.353,40.509,1.5c5.67-0.331,12.667,0.665,17.504-0.5c1.864,0.031,3.163-0.504,4.501-1
	c6.505,6.898,12.973,14.271,19.505,22.006c6.095,7.215,12.891,16.18,21.505,20.504c7.69,3.861,17.505,3.021,28.006,5.502
	c1.606,6.563,2.639,13.698,5.001,19.504c6.734,1.602,15.933,0.738,23.005,2c4.186,7.818,7.715,16.29,11.502,24.506
	c-4.217,11.309-7.695,25.375-9.502,41.01c-2.027,17.546-1.936,31.865,2,45.01c-7.719,3.617-13.839,8.832-27.005,7.002
	c-3,0-6.001,0-9.002,0c-4.278-3.027-8.12-6.408-12.502-10.002c-3.631-2.978-9.757-6.318-12.003-10.503
	c-3.533-6.582-4.023-16.151-6.001-24.005c-2.02-8.021-4.385-15.643-6.501-23.506c-12.507-4.498-23.557-10.451-37.009-14.004
	c-7.835,0-15.67,0-23.505,0c-4.837,0.332-10.999-0.662-15.003,0.501c-6.668,0-13.336,0-20.004,0
	c-5.503,0.331-12.333-0.664-17.004,0.5c-4.723,4.112-5.059,12.612-8.502,18.004c-8.232,6.149-19.541,2.86-29.507,6.001
	c-9.423,2.971-16.667,13.793-26.506,13.504c1.216-7.453,2.1-15.238,3.5-22.506c4.8-3.152,7.619-8.869,13.503-11.502
	c8.821-3.948,20.193-3.832,30.507-7.002c2.514-8.961,8.113-16.396,10.002-25.506c1.771-8.537-0.226-17.053,1.5-26.506
	c0.636-3.48,3.329-7.236,5.001-11.002C533.56,938.992,541.504,925.207,549.469,914.338z"/>
                        <path data-name="은평구" id="Eunpyeong-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M575.476,330.705
	c7.587,0.952,9.29-2.505,13.003-6.501c7.224-7.775,13.519-17.169,18.004-25.505c14.693,12.132,30.782,26.277,46.01,39.509
	c3.894,3.383,13.752,9.375,15.003,13.503c0.862,2.844-0.673,6.792,0,9.002c0,4.834,0,9.669,0,14.503
	c0.324,2.343-0.654,5.989,0.5,7.501c1.953,14.456-6.109,18.896-9.502,28.007c0.628,0.205,1.022,0.645,1,1.5
	c-5.143,9.597-10.142,17.47-17.004,25.006c-3.037,3.335-7.588,6.393-9.002,10.002c-2.79,7.125-1.877,15.108-4.501,24.006
	c-1.152,1.348-0.178,4.823-0.5,7.001c0,3.667,0,7.335,0,11.002c0,3.334,0,6.668,0,10.002c-1.152,1.348-0.178,4.824-0.5,7.001
	c0,3.667,0,7.335,0,11.002c0,4.167,0,8.335,0,12.503c-9.909-2.624-14.437,0.35-20.505,4.001c-2.967,1.785-6.638,3.607-8.502,5.501
	c-6.809,6.919-9.348,18.968-12.003,28.006c-9.573,3.93-19.012,7.994-29.506,11.003c-2.983,8.353-6.446,16.227-11.502,22.505
	c-1.074,0.927-3.664,0.338-5.501,0.5c-3.173,0.328-7.661-0.659-10.002,0.5c-4.668,0-9.335,0-14.003,0
	c-5.337,0.332-12-0.664-16.504,0.5c-3.186-0.352-4.295,1.374-5.501,3c-2.043,1.625-3.877,3.458-5.501,5.501
	c-1.876,1.458-3.543,3.125-5.001,5.001c0,0.167,0,0.333,0,0.5c-2.043,1.624-3.876,3.458-5.501,5.501
	c-1.874,6.295-2.348,13.989-3.501,21.005c-7.333-4.537-13.729-10.497-21.005-16.004c-7.046-5.333-15.879-9.708-21.505-16.003
	c-3.167-3.544-4.184-8.449-8.001-11.502c-9.872,0.035-11.732-7.939-16.003-13.503c10.749,5.088,25.466,6.208,41.509,6.001
	c5.736-6.742,14.377-14.342,20.005-22.505c5.505-7.985,9.425-16.801,8.002-31.007c0-3.167,0-6.334,0-9.502
	c0-7.168,0-14.336,0-21.505c-0.331-5.17,0.664-11.666-0.5-16.003c0-10.335,0-20.671,0-31.007c2.321-3.633,8.118-5.423,9.502-9.502
	c1.134-3.341,0.625-8.999,1-13.503c2.579-30.969,5.016-65.498,8.002-94.521c11.516,0.432,24.255,0.549,34.508,1
	c3.694,0.163,8,1.385,11.503,0c7.246-2.866,6.368-17.586,19.004-13.503c0.693,1.141,3.481,0.187,5.001,0.5
	C569.141,330.705,572.308,330.705,575.476,330.705z"/>
                        <path data-name="강북구" id="Gangbuk-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M809.029,188.173
	c0.912,12.448,6.383,24.226,6.5,36.508c0.084,8.802-3.998,17.245-3,27.006c-1.156,1.678-0.176,5.492-0.5,8.001
	c0,4.167,0,8.335,0,12.503c1.809,14.38-6.305,20.132-3.5,34.008c1.307,1.693,2.83,3.171,4,5.001
	c4.125,4.543,8.461,8.877,13.002,13.003c4.461,4.876,9.127,9.544,14.004,14.003c4.174,4.995,14.822,3.516,22.006,5.501
	c29.617,32.396,58.822,65.205,81.518,104.524c-9.205,15.968-17.861,32.483-26.506,49.011c-4.91,2.591-8.998,6.004-14.004,8.502
	c-3.006,0.327-7.326-0.659-9.502,0.5c-3,0-6,0-9.002,0c-3.5,0-7.002,0-10.502,0c-2.178,0.323-5.652-0.652-7.002,0.5
	c-3,0-6,0-9.002,0c-3.5,0-7.002,0-10.502,0c-2.5,0-5.002,0-7.502,0c-3.18-1.987-7.064-3.271-9.502-6.001
	c-4.273-15.565-7.566-32.108-12.002-47.511c-12.75-10.672-26.533-20.346-39.51-30.507c-4.32-3.382-8.381-8.007-13.004-10.502
	c-6.852-3.699-15.078-4.146-22.504-8.002c-3.998-4.838-7.506-10.165-11.502-15.003c1.264-2.903,3.693-4.642,4.5-8.002
	c1.158-2.01,0.174-6.161,0.5-9.002c-0.324-2.509,0.656-6.324-0.5-8.002c0-5.168,0-10.336,0-15.504c0-5.001,0-10.002,0-15.003
	c-0.324-2.344,0.654-5.989-0.5-7.502c0-5.168,0-10.336,0-15.503c0-5.001,0-10.002,0-15.003c0-2.334,0-4.668,0-7.002
	c6.334-11.432,14.252-23.222,21.004-34.508c2.314-3.867,5.734-8.378,7.002-12.002c4.479-12.813,3.801-26.4,8.502-40.509
	C784.264,197.082,796.582,192.563,809.029,188.173z"/>
                        <path data-name="강동구" id="Gangdong-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M1169.111,741.299
	c5.732-6.754,13.379-10.111,22.004-15.504c8.936-5.586,14.174-12.908,26.506-13.003c10.67-0.333,22.672,0.667,32.508-0.5
	c18.525-4.354,29.406-16.417,44.01-25.006c8.764-5.154,19.996-8.898,28.506-14.003c0,1.667,0,3.334,0,5.001
	c0.326,2.509-0.654,6.323,0.502,8.002c-0.258,11.092,11.025,10.646,17.004,15.504c1.512,1.154,5.158,0.176,7.5,0.5
	c1.086,7.083,1.484,14.853,4.502,20.005c-1.932,10.422-10.932,19.746-9.502,32.007c0.439,3.773,5.059,8.253,6,13.503
	c1.15,6.411-0.707,13.824,0.502,19.504c0.762,3.582,4.42,6.434,5,9.503c-2.693,4.808-5.02,9.982-8.002,14.503
	c-14.064,3.812-27.102,8.573-43.51,14.004c-6.725,2.226-13.926,4.617-21.504,7.001c-6.23,1.96-18.705,4.1-21.506,7.502
	c-2.205,2.679-1.711,10.053-2,16.003c-0.27,5.521-0.115,11.744-0.5,16.004c-0.494,5.479-4.258,10.002-7.002,14.504
	c-7.244,11.887-13.189,21.056-20.504,33.008c-5.291-1.752-9.098-0.548-13.504-2.501c-4.646-2.06-6.66-7.547-11.002-9.003
	c-5.998-2.009-12.977-0.372-21.006-2c-4.625-8.117-5.539-17.827-10.502-25.006c-4.063-5.875-11.83-7.93-15.504-14.003
	c5.16-14.568,16.49-35.228,7.002-51.011c-3.82-0.68-7.887-1.115-12.502-1.001c-3.299-2.87-5.486-6.851-8.502-10.003
	c4.039-21.131,4.615-45.729,18.504-57.012C1164.984,745.842,1167.152,743.675,1169.111,741.299z"/>
                        <path data-name="강서구" id="Gangseo-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M134.875,530.751
	c14.186,7.902,28.88,17.473,41.509,27.006c4.251,3.209,9.459,6.075,13.003,9.502c4.232,4.093,7.689,10.18,11.502,15.004
	c3.918,4.956,7.421,10.604,11.503,15.003c6.56,7.07,15.108,12.175,21.505,19.005c8.05,8.595,12.902,20.3,21.505,29.006
	c6.374,6.451,17.3,10.128,26.006,15.003c3.432,1.921,6.93,4.513,10.502,6.501c3.87,2.155,8.53,3.593,11.502,6.001
	c3.497,2.833,6.386,8.233,10.002,12.503c3.64,4.297,8.201,8.06,10.502,12.002c3.5,5.994,4.969,13.018,8.502,18.504
	c5.596,8.689,15.438,15.27,23.005,22.005c8.075,7.188,16.7,13.607,24.506,21.005c2.256,5.079,2.541,12.129,3.001,19.004
	c0,0.334,0,0.667,0,1c-6.002,0-12.003,0-18.004,0c-5.92-1.747-10.951-4.385-18.504-4.5c-3.843,4.658-6.47,10.533-10.002,15.503
	c-0.172,10.497-1.497,19.842-1.5,30.507c-5.514,8.156-10.331,17.01-15.003,26.006c-8.665,1.709-16.358,9.035-25.006,9.502
	c-3.351,0.182-9.662-1.734-13.503-2.5c-10.699-2.131-20.229-4.968-25.006-12.003c-1.979-2.915-3.274-7.977-5.001-12.003
	c-3.733-8.706-7.112-16.434-10.502-24.506c-1.854-4.414-2.894-9.518-5.001-12.502c-1.992-2.822-7.871-7.548-10.502-8.002
	c-6.062-1.047-14.354,2.875-20.005,2c-3.302,5.2-6.064,10.939-9.002,16.504c-8.57-0.594-16.527-0.893-25.005-1.5
	c-6.744-0.483-19.111-2.885-25.506-1.5c-5.025,1.087-10.524,10.202-14.003,14.003c-4.763,5.202-9.093,9.708-14.003,14.003
	c-2.676-5.246-5.24-10.084-7.502-16.004c-1.854-4.855-3.532-13.175-7.001-16.504c-2.526-2.423-9.272-3.868-13.503-5.501
	c-14.528-5.605-28.749-11.121-42.009-16.503c-0.499-13.672-5.639-22.701-10.002-32.508c4.057-5.3,11.855-4.416,15.504-10.002
	c1.666-2.551,1.634-7.865,2.5-12.004c2.518-12.024,6.03-25.201,9.002-35.508c5.497-2.554,11.032-4.787,17.504-7.501
	c4.729-1.983,13.795-4.065,16.503-8.502c3.111-5.097,2.565-13.703,3.5-21.004c0.943-7.357,1.846-14.689,2.501-22.005
	c3.839-3.569,7.796-7.497,13.003-12.002c6.48-5.608,15.725-9.435,13.003-23.005c1.155-1.678,0.175-5.493,0.5-8.002
	c1.876-13.255-8.925-25.063-6.001-37.508C126.606,538.5,132.789,536.269,134.875,530.751z"/>
                        <path data-name="금천구" id="Geumcheon-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M409.438,1062.872
	c10.055-0.948,14.109-7.896,22.005-11.003c8.709,3.959,17.785,18.691,29.007,11.503c1.936,4.731,4.911,8.425,7.001,13.003
	c4.371,1.964,8.918,3.752,13.003,6.002c-0.113,3.721-0.805,6.863-0.5,11.002c-0.828,0.7-0.828,4.801,0,5.502
	c1.265,19.843,4.213,42.334,6.502,61.514c0.842,7.057,0.685,15.172,2.5,20.504c1.959,5.756,8.856,10.419,10.502,16.004
	c4.774,1.228,8.83,3.173,13.503,4.501c1.205,6.297,3.346,11.657,5.001,17.505c-0.607,2.56-3.158,3.176-4.501,5
	c-16.374,3.465-20.527,19.148-25.006,34.508c-8.089,0.664-14.721,8.753-23.005,10.003c-9.996,1.508-19.743-2.559-31.507-1.501
	c-6.953-26.869-16.129-59.129-24.006-88.02c-2.003-7.346-3.826-24.808-9.002-28.506c-3.041-2.174-9.421-1.811-13.503-2.001
	c-2.895-34.114-17.084-56.934-26.506-84.52c2.5,0,5.001,0,7.501,0c3.009,0.833,9.495,0.833,12.503,0c2.834,0,5.668,0,8.502,0
	c1.849-0.319,4.982,0.647,6.002-0.5c2.667,0,5.334,0,8.001,0C405.284,1063.053,408.418,1064.02,409.438,1062.872z"/>
                        <path data-name="구로구" id="Guro-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M428.942,1040.367c0.317,1.684-0.644,4.645,0.5,5.501
	c0,1,0,2.001,0,3.001c-7.014,3.32-11.124,9.547-20.504,10.502c-1.849,0.319-4.982-0.647-6.001,0.5c-2.667,0-5.334,0-8.002,0
	c-1.848,0.319-4.982-0.647-6.001,0.5c-2.834,0-5.668,0-8.502,0c-3.834,0-7.668,0-11.502,0c-3.07-0.264-7.24,0.572-9.502-0.5
	c-2.025-8.383,1.501-17.846-2-24.506c-1.383-2.629-7.673-5.575-10.002-7.001c-3.662-2.241-8.242-5.894-11.502-6.001
	c-2.817-0.094-7.527,2.728-10.002,4c-2.836,1.459-7.151,3.227-9.502,5.002c-2.417,1.824-7.969,9.016-9.002,12.002
	c-2.259,6.529,0.466,16.63-5.001,19.005c-2.709,2.292-5.21,4.792-7.502,7.501c-3.542,3.126-6.877,6.46-10.002,10.003
	c-1.09,1.744-2.248,3.421-4.001,4.501c-2.709,2.291-5.21,4.792-7.502,7.502c-3.542,3.125-6.877,6.459-10.002,10.002
	c-2.603,2.77-4.024,6.548-7.502,7.502c-6.091,1.67-16.19,0.877-22.005,0c-5.793-0.873-10.356-4.833-15.504-5.002
	c-10.37-0.339-19.73,5.449-29.006,6.002c-5.163,0.307-9.707-1.09-15.503-1.5c5.927-12.122,11.899-26.067,18.004-39.01
	c2.118-4.488,5.993-9.389,6.001-13.502c0.012-5.465-5.336-12.942-8.502-20.006c-2.061-4.598-8.586-15.993-8.502-20.004
	c0.044-2.09,2.84-6.572,4.501-10.002c8.828-18.236,18.595-35.627,21.505-57.014c-0.289-3.212-3.403-3.599-4.501-6.001
	c7.568,0.767,14.526,2.144,21.505,3.501c2.272,5.395,3.418,11.918,7.001,16.004c0.54,0.827,4.462,0.827,5.001,0
	c3.5,0,7.001,0,10.502,0c4.004-0.33,9.33,0.662,12.503-0.5c5.631-2.188,10.712-8.438,16.504-13.504
	c2.238-1.957,5.196-3.902,8.001-6.501c4.358-4.038,6.289-8.403,13.503-7.002c0.855,1.145,3.817,0.184,5.501,0.501
	c4.167,0,8.335,0,12.503,0c2.144,7.523,5.065,14.271,7.001,22.004c4.975,1.3,9.393,5.851,15.503,6.502
	c7.731,0.824,16.25-1.998,25.506-1c1.52-0.314,4.308,0.641,5.001-0.5c3.791-2.215,6.551-9.283,9.002-14.504
	c2.473-5.266,3.817-10.847,7.002-14.503c4.698,2.081,8.631,5.198,13.503,8.001c3.752,2.16,11.111,4.273,13.503,8.002
	c1.4,2.185,2.071,7.009,3.001,10.503c2.963,11.132,5.162,22.878,6.501,35.509c3.465,4.703,9.131,7.205,7.501,17.003
	c0.317,1.685-0.644,4.646,0.5,5.501c0,2.834,0,5.668,0,8.502c0.317,1.684-0.644,4.646,0.5,5.502
	C428.942,1035.032,428.942,1037.699,428.942,1040.367z"/>
                        <path data-name="관악구" id="Gwanak-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M694.002,1210.906
	c-4.465,4.478-9.49,9.332-15.003,14.503c-4.905,4.601-9.783,10.629-15.504,14.503c-5.579,3.778-12.692,6.807-20.004,11.003
	c-6.592,3.783-13.672,10.269-20.004,11.503c-4.604,0.896-10.121,0.33-15.004,0.5c-4.958,0.172-10.222,0.289-15.503,0.5
	c-8.362,0.334-23.305,2.309-31.007,1c-6.05-1.028-10.412-7.248-16.503-9.502c-4.21-6.324-3.53-20.211-8.502-25.006
	c-4.548-4.387-12.656-2.06-19.505-5.002c8.225-5.589-0.902-17.209-2-25.506c-3.932-2.236-8.583-3.752-13.503-5
	c-1.827-5.164-8.366-9.896-10.002-15.504c-1.574-5.393-1.633-13.365-2.5-20.505c-0.814-6.708-1.677-13.724-2.5-20.505
	c-2.561-21.088-3.9-39.887-4.001-58.013c-4.064-2.271-8.587-4.082-13.003-6.001c-2.081-4.088-4.802-7.535-6.501-12.004
	c11.121-1.375,18.907-12.017,27.506-14.502c11.104-3.211,22.65,0.189,31.007-7.002c2.241-5.428,4.121-11.217,6.502-16.504
	c6.001,0,12.002,0,18.004,0c4.67-0.331,10.665,0.663,14.503-0.5c6.668,0,13.337,0,20.005,0c8.168,0,16.337,0,24.506,0
	c10.86,4.143,21.86,8.146,32.007,13.002c4.08,15.592,8.194,31.148,12.003,47.012c8.873,7.131,17.411,14.596,26.506,21.504
	c2.674,1.161,7.497,0.172,11.003,0.501c1.848-0.319,4.981,0.647,6.001-0.501c9.897,1.395,14.094-5.574,20.004-6.501
	c-1.588,13.631,1.807,20.663,6.002,29.007c7.521,14.96,15.389,32.314,24.006,43.51c-3.738,0.93-8.176,1.16-11.502,2.5
	C718.799,1185.691,706.297,1198.194,694.002,1210.906z"/>
                        <path data-name="광진구" id="Gwangjin-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M968.564,871.328
	c2.316-14.521,7.197-26.477,7.502-43.01c8.822-11.86,18.256-21.808,24.006-37.008c5.83-15.418,6.246-33.637,11.002-51.012
	c2.184-7.975,6.811-15.682,10.002-23.506c3.381-8.283,5.756-16.752,10.002-23.505c13.057-2.375,26.496,0.72,38.01-2.501
	c10.371-2.901,19.273-13.59,34.508-10.502c3.646-0.813,1.371,4.297,2,6.501c-1.842,8.604-12.258,15.216-13.002,24.006
	c-0.449,5.296,4.145,11.839,5.5,17.504c2.047,8.548-0.248,18.539,5.502,24.005c2.166,0,4.334,0,6.502,0
	c1.678,1.156,5.492,0.176,8.002,0.5c2.834,0,5.668,0,8.502,0c-2.664,6.541-4.318,12.607-5.502,20.005
	c-1.111,6.94-1.309,15.409-3.5,22.505c-2.055,6.65-7.506,15.23-11.504,23.006c-3.957,7.696-9.898,14.141-14.502,20.004
	c-4.736,6.031-10.125,12.135-15.504,19.005c-4.619,5.896-10.355,16.442-15.504,19.005c-6.918,3.441-16.094,3.563-25.006,4
	c-2.334,0-4.668,0-7.002,0c-3.334,0-6.668,0-10.002,0c-1.52,0.314-4.309-0.641-5.002,0.5
	C995.094,881.143,980.262,877.802,968.564,871.328z"/>
                        <path data-name="강남구" id="Gangnam-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M809.529,885.332
	c3.344-3.51,7.164-6.168,11.002-9.502c3.58-3.111,6.844-7.933,11.002-9.503c3.145-1.187,8.471-1.302,12.504-2.001
	c10.121-1.754,17.617-2.169,29.006-1.5c15.992,0.939,26.063,3.173,37.008,8.002c26.447,11.669,47.611,32.773,78.518,36.008
	c1.088,2.58,0.227,7.111,0.502,10.503c0,3.334,0,6.668,0,10.003c0.32,2.012-0.65,5.317,0.5,6.501c0,2.834,0,5.668,0,8.502
	c0,3.334,0,6.668,0,10.002c0.318,1.849-0.648,4.981,0.5,6.001c-1.123,9.712,2.514,13.063,5.5,19.005
	c1.992,3.962,3.227,8.579,5.002,11.003c2.117,2.891,7.289,6.038,11.002,9.002c3.914,3.123,7.424,6.66,11.504,9.002
	c4.016,2.305,9.201,4.087,14.002,6.501c4.635,2.33,9.215,5.753,13.504,7.002c12.207,3.557,27.744,3.449,39.508,7.001
	c2.563,3.273,5.932,5.738,8.502,9.002c1.391,4.277,2.246,9.092,4.002,13.004c9.594,7.076,20.686,12.655,30.006,20.004
	c0.875,6.341,2.055,12.245,3.002,18.004c0.984,6.002,1.041,12.711,3,18.004c1.092,2.949,4.381,6.836,6.502,10.003
	c9.504,14.194,19.082,27.798,25.006,44.511c-5.541,1.964-14.252-0.62-20.006,2c-4.949,2.254-6.008,10.943-10.002,16.004
	c-2.055,2.604-7.475,6.924-11.002,8.002c-5.742,1.754-12.551,0.227-18.004,1.5c-4.266,0.995-7.09,4.738-11.002,5.501
	c-4.352,0.849-9.047-0.96-15.004-0.5c-4.955-4.302-7.02-10.321-12.504-15.003c-4.303-3.674-10.471-5.346-14.502-9.002
	c-2.607-2.365-9.137-11.533-10.504-15.504c0-2.668,0-5.335,0-8.002c-0.313-1.52,0.641-4.308-0.5-5.002
	c0.389-4.389-0.732-7.268-0.5-11.502c-4.393-2.852-7.592-7.5-13.002-9.502c-14.945-5.529-33.725,0.521-46.012,6.001
	c-4.537,7.298-8.525,15.146-14.002,21.505c-16.326,0.345-28.281,5.061-40.51,9.502c-12.758-17.582-15.137-45.543-21.004-70.016
	c-4.961-5.376-10.129-10.544-15.504-15.504c-6.775-3.227-14.982-5.021-20.006-10.002c-2.291-2.709-4.791-5.21-7.5-7.502
	c-0.178-0.656-0.881-0.786-1.002-1.5c-2.125-2.543-4.457-4.877-7-7.002c-7.23-7.581-6.807-23.209-8.002-38.508
	c-0.609-7.787,0.043-16.854-2.002-23.006c-2.199-6.624-12.922-11.019-15.502-18.004c-2.012-5.447-1.949-13.102-3.002-19.504
	c-1.125-6.854-1.74-14.938-3.5-20.506c-2.148-6.789-6.955-12.942-10.002-19.004C815.576,898.467,812.641,891.889,809.529,885.332z"
                        />
                        <path data-name="종로구" id="Jongno-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M720.008,682.285
	c-13.643,8.694-29.509,15.167-47.511,19.505c-6.417-5.753-13.255-11.084-19.004-17.504c-1.625-2.043-3.458-3.876-5.501-5.501
	c-4.496-4.668-9.113-12.79-9.002-20.004c0.059-3.846,2.49-9.455,4.001-14.504c3.006-10.049,6.144-18.898,9.002-28.506
	c1.488-5.001,3.81-10.584,4.001-15.003c0.284-6.57-2.044-13.576-3.501-19.504c-1.444-5.877-3.262-11.502-5.001-18.004
	c-5.435-2.734-11.846-4.491-16.504-8.002c0-0.667,0-1.333,0-2c1.153-1.348,0.177-4.823,0.5-7.001c0-3.667,0-7.335,0-11.002
	c0-3.334,0-6.668,0-10.002c1.152-1.348,0.177-4.824,0.5-7.001c0-3.668,0-7.335,0-11.003c0-3.334,0-6.668,0-10.002
	c1.152-1.348,0.177-4.824,0.5-7.002c0-3.667,0-7.335,0-11.002c0.908-12.657,0.718-22.671,4.501-31.007
	c3.217-7.087,11.845-11.738,16.504-18.504c3.345-4.858,4.499-9.644,8.002-14.503c12.175-1.161,22.316-4.356,34.508-5.501
	c4.252,4.75,9.984,8.02,15.503,11.502c6.941,16.762,8.516,34.323,13.504,52.012c5.047,17.906,16.736,33.542,17.004,55.512
	c-2.867,5.802-5.285,12.053-8.002,18.004c-5.268,1.902-10.518,3.819-15.504,6.001c-0.797,6.729-2.854,14.783-2,21.505
	c9.846,8.849,27.449,6.847,42.51,11.002c7.674,2.118,13.383,6.375,20.004,8.002c11.162,22.178,19.406,47.276,35.008,65.015
	c13.176,0.995,26.723,1.617,39.51,3c0,1.167,0,2.334,0,3.501c-1.16,2.341-0.172,6.829-0.5,10.002c0,4.334,0,8.668,0,13.003
	c-4.334,0-8.67,0-13.004,0c-1.848,0.319-4.982-0.648-6.002,0.5c-3.166,0-6.334,0-9.502,0c-1.848,0.319-4.98-0.647-6,0.5
	c-3.002,0-6.002,0-9.002,0c-2.014,0.321-5.318-0.65-6.502,0.5c-12.729,0.941-23.139,4.201-35.508,5.501c-8.336,0-16.672,0-25.006,0
	c-4.959-3.876-8.289-9.382-14.004-12.503C726.826,681.454,721.691,681.454,720.008,682.285z"/>
                        <path data-name="중구" id="Jung-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M852.039,722.795
	c-3.846,7.49-7.141,15.533-13.504,20.504c-2.877,2.459-5.543,5.126-8.002,8.002c-0.404,0.096-0.498,0.502-1,0.5
	c-2.299,2.201-5.035,3.969-6.502,7.002c-4.045,11.457-9.639,21.369-14.502,32.008c-7.918-3.086-13.068-8.938-21.506-11.503
	c-1.02-1.147-4.152-0.181-6.002-0.501c-3,0-6,0-9.002,0c-1.02-1.146-4.152-0.18-6-0.5c-17.834,2.664-19.93-10.41-29.508-16.003
	c-2.342-1.159-6.83-0.173-10.002-0.501c-2.344,0.324-5.988-0.653-7.502,0.501c-3.334,0-6.668,0-10.002,0
	c-2.676,0.325-6.659-0.657-8.502,0.5c-13.527,1.144-27.306,2.034-40.51,3.501c-3.02-13.316-7.289-25.385-12.002-37.009
	c9.184-7.319,19.5-13.507,25.005-24.505c12.842-3.283,24.639-6.314,35.509-12.003c6.629-3.47,9.121-8.251,19.504-7.001
	c3.959,4.376,8.127,8.544,12.504,12.503c24.184,3.167,42.299-4.035,63.514-5.501c1.848-0.319,4.982,0.648,6.002-0.5c3,0,6,0,9.002,0
	c2.012-0.321,5.318,0.65,6.5-0.5c3.002,0,6.002,0,9.004,0c2.012-0.32,5.316,0.65,6.5-0.5c3.002,0,6.002,0,9.002,0
	c0.834,0,1.668,0,2.502,0c0,2.834,0,5.668,0,8.502c0,3.001,0,6.002,0,9.002c-1.148,1.02-0.182,4.154-0.5,6.002
	C852.039,717.46,852.039,720.127,852.039,722.795z"/>
                        <path data-name="중랑구" id="Jungnang-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M1120.1,474.238
	c4.662,7.841,18.324,6.681,27.006,10.502c-2.287,12.067,11.305,15.833,13.004,24.506c1.773,9.058-4.662,14.91-5.502,24.005
	c-4.322,4.18-9.531,7.472-13.004,12.502c0,0.334,0,0.667,0,1c-0.832,3.84-0.832,11.164,0,15.003c0.725,3.943,3.436,5.9,4.502,9.502
	c0,3.334,0,6.668,0,10.002c-10.604,7.43-3.115,20.208-6.502,32.507c-1.73,6.284-15.746,14.712-19.004,20.505
	c-1.561,2.773-1.363,6.369-2.5,8.502c-3.455,6.476-15.533,10.445-16.504,17.504c-0.502,3.64,2.662,6.176,4,9.002
	c0,2.334,0,4.668,0,7.002c-0.727,0.273-2.584-0.585-2.5,0.5c-16.391-2.901-23.908,8.259-36.008,11.002
	c-11.813,2.678-22.666-0.268-36.51,2.5c-4.686-62.996-16.182-119.183-15.502-187.543c11.811-5.232,23.043-11.489,35.008-17.504
	c6.033-3.034,10.494-5.943,19.504-5.501c1.684-0.317,4.645,0.645,5.502-0.5c2.666,0,5.334,0,8.002,0
	c1.684-0.317,4.645,0.644,5.5-0.5c2.668,0,5.334,0,8.002,0c1.684-0.317,4.645,0.644,5.502-0.5
	C1110.217,479.025,1114.6,476.073,1120.1,474.238z"/>
                        <path data-name="마포구" id="Mapo-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M402.936,583.763
	c6.628,6.041,6.576,18.764,20.004,18.004c5.968,13.406,17.593,19.237,29.007,28.007c7.357,5.653,15.368,10.769,22.005,16.504
	c12.672,10.951,22.254,25.911,33.508,36.008c5.59,5.017,12.528,8.948,18.004,14.503c2.292,2.709,4.792,5.21,7.502,7.501
	c0.501-0.001,0.595,0.405,1,0.501c2.458,2.875,5.126,5.543,8.002,8.001c2.292,2.71,4.792,5.21,7.501,7.502
	c0.501-0.001,0.595,0.405,1,0.5c2.292,2.71,4.792,5.21,7.501,7.502c2.202,2.3,3.968,5.034,7.001,6.501
	c13.151,1.679,33.148,3.431,48.011,5.002c5.674,0.6,11.949,2.383,16.003,1.5c6.439-1.402,9.308-9.631,16.004-10.502
	c1.58,5.924,4.993,11.412,7.001,17.504c1.616,4.899,5.107,15.426,5.001,20.004c-0.106,4.607-4.983,19.26-6.502,23.006
	c-5.032,12.414-13.34,21.697-21.005,31.007c-10.313,12.528-22.811,24.427-34.008,34.007c-2.909-2.459-5.033-5.625-8.001-8.001
	c-3.006-2.405-6-4.657-9.002-7.002c-5.841-4.562-11.654-9.769-18.004-13.503c-19.939-11.727-41.419-19.489-63.014-27.506
	c-10.111-3.754-20.545-9.33-31.007-14.504c-10.133-5.011-21.63-9.223-30.507-15.003c-6.704-4.366-13.309-11.702-20.004-17.505
	c-17.035-14.76-33.581-28.587-50.011-43.51c-3.288-2.985-7.931-6.23-10.002-9.001c-3.899-5.214-4.916-12.548-8.002-18.004
	c-2.809-4.965-7.841-10.148-12.002-15.003c-6.841-7.979-12.272-16.188-21.505-20.505c0-0.167,0-0.333,0-0.5
	c8.283-2.733,16.484-15.161,25.005-17.004c9.141-1.977,18.662,0.807,29.507-1c3.474-3.274,7.478-7.106,11.502-11.503
	c3.063-3.346,9.383-8.809,10.502-12.503c0.708-2.338-0.158-4.918,0.5-7.001C393.398,591.544,399.557,589.176,402.936,583.763z"/>
                        <path data-name="노원구" id="Nowon-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M1083.592,305.699
	c-0.51,4.537-3.662,5.613-4.502,10.002c-0.775,4.05,0.262,18.509,1.5,23.005c0.885,3.208,6.793,14.643,9.002,16.004
	c5.967,3.672,16.053,1.403,23.506,3c8.109,1.738,14.93,5.567,22.006,7.501c2.74,11.227,0.236,20.766,3,30.507
	c2.139,7.545,9.795,12.583,7.002,24.006c-3.18,4.49-5.305,10.033-9.002,14.003c-4.596,1.663-8.748,0.512-12.504,2.501
	c-3.117,1.651-7.98,9.404-8.502,14.003c-0.748,6.625,2.275,12.594,6.002,16.504c-0.713,1.287-1.615,2.386-1.5,4.501
	c-5.883,1.452-10.193,4.478-18.504,3.501c-1.684,0.316-4.646-0.645-5.502,0.5c-2.668,0-5.334,0-8.002,0
	c-1.684,0.316-4.645-0.645-5.502,0.5c-2.666,0-5.334,0-8.002,0c-1.684,0.316-4.645-0.645-5.5,0.5
	c-12.211,0.197-21.813,7.38-31.008,12.003c-8.523,4.285-16.541,7.522-24.006,12.003c-11.572-2.931-23.703-5.303-35.008-8.502
	c-17.121-22.554-34.861-47.157-48.51-71.517c6.645-0.522,14.094-0.241,20.004-1.5c3.156-9.429,1.619-20.374,3.5-29.507
	c1.412-6.854,5.945-13.942,7.502-21.505c2.24-10.87,1.836-24.517,3.002-37.009c0.533-5.733,1.441-11.911,2-18.004
	c0.537-5.876,1.732-12.743,1-17.504c-1.043-6.773-5.283-14.015-8.002-21.005c-2.588-6.651-7.232-14.544-8.002-21.005
	c-0.441-3.712,0.98-8.423,1.5-13.003c0.482-4.25,0.182-9.028,1-13.003c2.141-10.392,9.006-21.348,11.504-33.008
	c2.17-10.125,0.41-21.711,3-30.507c5.758-9.167,15.742-8.554,26.506-14.503c3.541-1.957,8.979-6.144,12.004-9.002
	c3.121-2.951,5.645-8.404,8.502-9.502c3.232-1.244,10.299-1.729,14.002-1c3.074,0.605,6.523,4.829,10.002,7.502
	c7.916,6.081,13.107,9.773,20.506,15.503c3.42,2.65,6.877,6.662,10.002,8.002c8.432,3.616,15.584,1.682,25.506,5.501
	c4.303,15.436-2.008,19.555-8.002,28.506c-3.225,4.817-8.416,10.662-8.502,15.503c-0.078,4.409,5.43,13.495,7.502,16.504
	c3.346,4.858,12.357,11.303,14.004,17.004c2.277,7.894-0.465,15.084,1.5,26.006c-3.293,4.746-15.668,6.805-18.004,12.003
	c-1.809,4.022,0.287,9.412-0.5,16.003C1083.416,300.207,1082.436,304.021,1083.592,305.699z"/>
                        <path data-name="서초구" id="Seocho-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M806.527,888.332
	c4.836,12.346,15.342,23.65,19.506,37.509c1.785,5.944,2.385,13.452,3.5,20.005c1.16,6.825,0.615,14.923,3,20.504
	c2.943,6.886,13.414,11.089,15.504,17.504c2.102,6.455,0.887,15.961,1.5,24.006c1.275,16.718,2.035,32.602,11.004,41.01
	c2.125,2.543,4.457,4.877,7,7.001c2.293,2.71,4.793,5.21,7.502,7.502c5.152,4.351,13.154,5.851,19.004,9.502
	c4.793,5.21,9.795,10.211,15.004,15.003c6.199,24.977,8.586,53.764,22.506,71.018c12.578-3.768,27.584-9.42,44.51-10.503
	c2.496-3.239,4.85-6.384,7.502-10.503c2.125-3.299,3.473-8.528,7.002-11.002c7.916-5.549,30.465-10.368,42.51-5.502
	c3.742,1.513,5.676,5.699,9.002,7.002c1.172,0.827,1.082,2.918,1,5.002c0.313,1.52-0.641,4.307,0.5,5c0,2.168,0,4.335,0,6.502
	c0.324,2.51-0.656,6.323,0.5,8.002c0,0.666,0,1.334,0,2c3.568,5.435,8.084,9.92,11.502,15.504
	c10.914,5.424,19.607,13.066,26.006,23.006c-5.477,3.372-17.676,2.81-21.004,8.001c-2.535,3.952,0.248,8.76-0.5,14.003
	c-0.789,5.527-5.758,10.554-5.502,15.504c-6.285,1.717-15.844,0.159-19.504,4.501c-2.889,8.221-3.168,16.153-10.502,20.005
	c-4.592,2.41-14.232,3.557-20.506,5.001c-5.934,1.366-17.129,2.228-20.004,5.501c-3.428,3.902-2.934,13.344-4,19.004
	c-1.336,7.069-2.83,12.834-4.502,18.505c-6.668,0-13.336,0-20.004,0c-8.256-0.581-14.83-2.841-23.006-3.501
	c-9.994-6.312-21.668-14.544-32.508-21.505c-3.898-2.504-12.398-4.849-11.002-10.503c0.832-1.848,0.832-7.153,0-9.002
	c-2.578-16.594-7.609-30.731-11.502-46.01c0-1.834,0-3.668,0-5.502c0-1.666,0-3.334,0-5c0-5.836,0-11.67,0-17.504
	c1.156-1.845,0.174-5.828,0.5-8.502c-0.33-3.672,0.66-8.664-0.5-11.504c0.693-8.93-8.209-7.638-15.004-9.002
	c-6.039-1.211-10.387-3.737-15.504-3c-4.658,0.671-11.443,6.838-16.504,10.002c-5.42,3.389-12.389,6.385-16.504,10.002
	c-7.127,6.268-11.402,16.109-17.004,20.506c-4.719,0.825-12.785,0.825-17.504,0c-5.65-5.113-1.145-14.549-2.5-22.006
	c-0.734-4.045-7.217-10.967-10.002-12.002c-2.207-0.821-8.766-1.677-13.004,0c-4.18,1.652-4.135,6.661-8.002,9.502
	c-12.281-15.393-19.408-35.938-29.006-54.013c-0.332-6.669,0.664-14.668-0.5-20.505c-4.701-15.217-4.1-29.432-1.5-47.511
	c1.387-9.655,2.531-19.489,4.5-27.006c1.068-4.075,4.164-8.104,4.002-12.003c-0.203-4.844-4.217-9.573-6.002-13.503
	c-2.219-4.882-3.709-9.038-6.002-13.503c-7.08-1.088-14.927-1.41-23.005-1.5c-1.562-5.441-2.924-11.08-4.001-17.004
	c19.89-0.508,35.938,1.268,50.012-4.502c6.559-2.688,13.355-10.818,19.004-16.004C772.443,924.47,790.729,906.379,806.527,888.332z"
                        />
                        <path data-name="서대문구" id="Seodaemun-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M651.993,687.787
	c5.392,5.944,12.344,10.328,17.504,16.503c-9.036,16.137-28.058,22.287-41.509,34.008c-13.573-1.495-30.166-3.397-45.511-5.001
	c-8.969-0.938-16.812-0.158-20.504-6.002c-2.458-2.875-5.125-5.543-8.002-8.001c-2.292-2.71-4.792-5.21-7.501-7.502
	c-0.405-0.095-0.499-0.501-1-0.5c-2.459-2.876-5.126-5.544-8.002-8.002c-2.292-2.709-4.792-5.21-7.502-7.502
	c-13.18-8.723-25.485-21.902-36.508-34.008c-4.069-4.468-14.517-11.841-15.503-17.003c-0.5-2.617,1.692-16.675,3-20.004
	c0.917-2.335,2.949-3.667,4.501-5.001c1.876-1.458,3.543-3.125,5.001-5.001c0-0.167,0-0.333,0-0.5
	c2.043-1.624,3.876-3.458,5.501-5.501c1.278-1.556,2.11-3.558,5.501-3.001c5.502,0,11.003,0,16.504,0
	c3.173-0.328,7.661,0.66,10.002-0.5c6.487,0.152,12.591-0.079,18.504-0.5c6.326-6.176,10.388-14.618,13.503-24.005
	c10.889-2.615,19.731-7.274,29.507-11.002c2.503-10.667,6.462-19.877,11.502-28.007c8.276-3.82,13.486-11.91,27.006-9.002
	c0,0.5,0,1,0,1.5c-1.161,2.673-0.171,7.497-0.5,11.002c0,3.834,0,7.669,0,11.503c4.386,4.449,11.701,5.969,17.504,9.002
	c2.945,11.225,5.782,22.557,8.002,34.508c-4.303,13.218-8.536,28.992-13.003,44.01c-1.528,5.135-4.425,10.297-4.501,14.504
	c-0.115,6.354,4.344,11.713,5.501,18.004c1.625,2.043,3.458,3.876,5.501,5.501C648.116,684.328,649.95,686.162,651.993,687.787z"/>
                        <path data-name="성북구" id="Seongbuk-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M729.51,392.219
	c4.775,3.428,6.586,11.528,11.504,15.003c6.434,4.547,15.797,4.11,23.004,8.002c4.41,2.381,8.689,6.688,13.004,10.002
	c13.127,10.086,26.316,20.602,38.508,30.507c3.721,15.952,7.818,31.525,11.504,47.511c6.191,3.309,10.23,8.773,21.004,7.501
	c3.502,0,7.002,0,10.502,0c2.014-0.321,5.318,0.65,6.502-0.5c3.168,0,6.336,0,9.502,0c3.502,0,7.002,0,10.502,0
	c2.014-0.321,5.318,0.65,6.502-0.5c14.43,1.926,18.871-6.135,27.506-10.002c8.346-16.495,17.166-32.512,26.006-48.511
	c5.18,6.521,9.941,14.057,15.504,22.005c3.65,5.213,11.018,18.608,16.504,21.505c9.67,5.107,23.432,3.499,34.508,9.002
	c0,2.334,0,4.667,0,7.001c-1.166,7.836-0.168,17.837-0.5,26.506c-24.066,7.941-54.93,9.086-72.016,24.006
	c-3.877,3.459-7.545,7.126-11.004,11.002c-5.734,8.601-10.057,18.616-15.502,27.506c-14.291,4.829-22.807,10.759-33.508,19.004
	c-3.418,2.634-8.207,4.543-10.002,7.502c-3.072,5.061-2.602,13.886-5.502,20.005c-1.129,2.381-7.93,10.95-10.002,11.502
	c-5.072,1.351-12.443-1.066-18.504-1.5c-6.207-0.444-12.348-0.835-19.006-1c-15.918-17.589-23.059-43.956-35.508-65.015
	c-7.059-1.465-12.77-6.458-21.004-8.502c-14.41-3.577-30.959-1.897-40.01-9.502c0.285-6.216,1.23-11.773,2-17.504
	c5.316-1.52,10.008-3.664,15.004-5.501c1.957-7.628,7.678-12.839,8.502-20.505c1.564-14.538-5.063-26.023-9.002-36.508
	c-2.35-6.257-5.504-12.853-7.502-19.505c-5.582-18.59-7.576-37.961-14.002-53.512c-4.844-3.493-10.78-5.892-14.504-10.503
	c6.551-1.802,13.174,0.948,18.004-1C724.17,405.237,724.545,395.769,729.51,392.219z"/>
                        <path data-name="성동구" id="Seongdong-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M874.543,701.29c2.168,0,4.334,0,6.502,0
	c5.318-3.184,4.223-12.782,14.504-11.002c0.693,1.141,3.48,0.187,5,0.5c9.426-0.09,18.045,0.627,27.006,1
	c2.555,7.281,4.742,14.93,7.002,22.506c24.572,8.603,50.193,16.154,73.018,26.506c-4.559,27.309-8.412,49.525-20.506,68.516
	c-4.107,6.451-11.859,11.41-14.002,18.004c-1.691,5.203-0.707,11.029-1.5,16.004c-1.453,9.091-4.732,16.918-6.502,26.006
	c-21.135-10.752-42.318-26.766-69.516-33.008c-5.611-1.287-13.537-1.091-20.506-1.5c-20.389-1.197-34.918,0.928-52.512,5.001
	c-3.926-15.579-7.852-31.157-12.002-46.511c6.348-10.322,10.541-22.799,16.504-33.508c2.709-2.291,5.209-4.792,7.502-7.502
	c2.875-2.458,5.543-5.125,8-8.002c5.986-5.184,8.691-13.647,13.004-20.504c1.156-1.679,0.176-5.493,0.5-8.002
	c0-2.834,0-5.668,0-8.502c1.15-1.184,0.18-4.489,0.5-6.501c0-2.5,0-5.001,0-7.501c4.824,2.01,6.006,7.664,13.004,7.501
	C870.236,701.93,873.023,700.976,874.543,701.29z"/>
                        <path data-name="송파구" id="Songpa-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M1142.104,808.314
	c3.291,2.545,5.451,6.219,8.002,9.502c3.914,0.421,8.018,0.652,12.504,0.5c6.393,10.426,0.719,26.423-3.502,37.508
	c-1.508,3.963-4.914,9.193-4.5,12.004c0.85,5.775,13.672,9.944,16.004,15.003c4.35,8.153,6.883,18.123,12.002,25.506
	c5.994,2.008,14.322,1.683,21.506,2.501c5.795,5.874,12.436,10.902,23.504,11.502c-2.807,6.306-6.541,11.023-10.502,17.504
	c-2.289,3.744-10.203,13.9-9.502,19.004c0.586,4.262,7.207,5.046,8.502,10.003c1.482,5.668-1.051,8.273,0,15.503
	c10.061,14.612,33.895,15.451,51.512,22.506c2.176,1.158,6.496,0.173,9.502,0.5c1.162,3.505,0.17,9.166,0.5,13.503
	c-11.891,3.552-17.787,8.655-21.004,20.505c-2.311,8.503-1.09,19.406-4.002,27.506c-2.273,6.328-7.365,9.609-10.002,14.504
	c-5.816,2.695-12.551,1.388-16.504,5.001c-2.094,1.915-5.465,12.249-7.002,17.504c-1.119,3.833,1.193,8.827,0.5,12.003
	c-0.814,3.739-5.057,5.746-7,8.002c-2.51,0.324-6.324-0.656-8.002,0.5c-7.412,0.801-13.502-1.392-18.004,1
	c-3.674,1.951-5.508,9.667-7.502,14.003c-2.639,5.731-4.676,10.651-7.002,14.503c-5.922-14.547-13.602-28.167-22.006-40.509
	c-2.869-4.215-7.066-8.269-8.502-12.503c-3.799-11.217-2.223-24.072-6.5-36.508c-9.463-7.208-20.561-12.782-30.008-20.005
	c-1.467-4.368-2.533-9.136-4-13.503c-2.793-3.209-5.793-6.21-9.002-9.002c-13.086-4.025-29.4-3.43-41.51-7.502
	c-4.102-1.379-8.607-4.791-13.004-7.002c-10.031-5.043-16.197-8.297-24.006-14.503c-3.416-2.716-8.016-5.854-10.002-8.502
	c-4.135-5.515-5.576-12.743-9.502-19.505c-0.322-2.178,0.652-5.652-0.5-7.001c0-2.834,0-5.668,0-8.502c0-3.335,0-6.669,0-10.003
	c-0.318-1.848,0.648-4.981-0.5-6.001c0-3.001,0-6.001,0-9.002c0-3.334,0-6.668,0-10.003c-0.318-1.848,0.648-4.981-0.5-6
	c0-0.834,0-1.668,0-2.502c3.814,0.688,7.262,1.74,12.002,1.501c2.334,0,4.668,0,7.002,0c3.334,0,6.668,0,10.002,0
	c1.521-0.313,4.309,0.64,5.002-0.5c4.5,0,9.002,0,13.504,0c1.684-0.317,4.645,0.645,5.5-0.5c8.596-2.126,18.393-2.595,27.006-6.001
	c7.645-3.023,11.229-8.839,16.004-15.004c8.344-10.771,16.424-21.131,24.506-31.508c5.502-7.063,12.068-13.736,16.004-21.004
	C1133.998,825.777,1137.637,816.13,1142.104,808.314z"/>
                        <path data-name="양천구" id="Yangcheon-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M199.39,804.313
	c2.805-5.029,4.873-10.797,8.502-15.003c6.626,0.688,11.923-2.626,17.004-1.501c2.33,0.518,7.231,5.06,8.502,7.002
	c1.986,3.038,3.1,8.013,5.001,12.504c4.896,11.561,11.807,26.589,15.504,37.008c6.607,6.648,15.021,9.528,27.006,12.002
	c5.238,1.082,10.646,2.888,15.003,2.502c10.121-0.897,18.733-8.26,27.006-10.503c2.177-9.443,12.685-18.485,15.003-27.007
	c2.679-9.844-0.558-21.725,2.001-30.506c1.62-5.564,5.628-8.434,8.502-13.004c6.39,0.445,10.828,2.842,16.003,4.502
	c5.52,1.48,14.479-0.477,20.004,1c6.588,12.133,10.032,26.038,16.504,38.008c1.717,3.177,5.399,5.818,6.501,9.503
	c1.723,5.761-0.143,11.556,1.5,17.504c-8.795,8.376-18.912,15.43-27.507,24.005c0,5.002,0,10.003,0,15.004
	c-1.163,4.171-0.169,10.5-0.5,15.504c0,8.335,0,16.67,0,25.006c-2.254,12.416-8.858,20.48-13.003,31.006
	c-0.757,1.244-4.308-0.307-5.001,1.001c-14.251,0.537-29.897,2.867-38.009-4.501c-2.647-7.188-4.854-14.817-7.501-22.006
	c-4.339-0.828-9.2-1.135-14.503-1c-0.856-1.145-3.817-0.184-5.501-0.5c-2.501,0-5.001,0-7.502,0
	c-10.922,8.749-19.826,19.518-32.007,27.006c-4.167,0-8.335,0-12.502,0c-2.344,0.324-5.989-0.653-7.502,0.5c-2,0-4.001,0-6.001,0
	c-1.747-5.422-3.626-10.71-6.001-15.503c-9.487-1.849-19.228-3.443-29.007-5.001c1.961-7.553,11.313-18.918,12.503-27.006
	c1.75-11.883,0-27.833,0-43.01c0-15.213,2.144-31.803,0-43.51C207.808,816.662,200.691,810.254,199.39,804.313z"/>
                        <path data-name="영등포구" id="Yeongdeungpo-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M385.432,872.828
	c3.914-3.196,8.258-7.184,13.503-11.502c3.549-2.922,11.847-7.633,13.003-12.003c1.547-5.849-1.958-11.689-1-19.505
	c-7.127-8.824-10.49-18.873-15.503-30.506c-4.992-11.584-10.961-20.336-10.503-36.009c12.586,8.73,21.889,21.758,35.008,30.507
	c6.313,4.211,14.327,6.894,21.505,10.502c21.057,10.588,42.679,22.491,66.516,29.508c4.151,20.021,4.892,40.504,12.503,56.012
	c5.411,11.027,16.118,15.754,25.506,22.506c0,0.166,0,0.333,0,0.5c-9.933,15.573-19.521,31.49-27.006,49.512
	c0.1,21.104-4.123,37.887-11.002,52.012c-9.291,2.553-22.559,2.559-30.507,6.501c-2.952,1.464-13.389,10.814-14.503,13.503
	c-3.051,7.357-0.555,17.23-4.001,26.006c-2.515,0.152-3.951,1.384-6.001,2.001c-6.938-4.23-13.496-8.843-20.004-13.503
	c0-1.168,0-2.334,0-3.501c-0.317-1.685,0.644-4.646-0.5-5.501c0-2.668,0-5.335,0-8.002c-0.316-1.684,0.645-4.646-0.5-5.502
	c0-2.834,0-5.668,0-8.502c-0.316-1.684,0.645-4.645-0.5-5.501c2.547-10.949-5.78-12.446-8.002-19.005
	c-2.365-6.984-2.019-15.568-4.001-23.505c-1.954-7.823-3.791-15.308-5.501-22.505c-9.452-5.885-19.485-11.189-29.007-17.004
	c0-8.502,0-17.004,0-25.506c0-7.335,0-14.67,0-22.005C386.091,880.49,385.104,876.002,385.432,872.828z M597.48,900.335
	c-20.856-23.653-42.328-46.692-74.017-59.514c2.068,15.437,4.544,30.464,9.502,43.01c5.697,5.112,13,14.698,21.004,17.004
	c10.17,2.929,21.25,0.715,34.008,1.001C589.714,900.138,598.159,902.816,597.48,900.335z"/>
                        <path data-name="용산구" id="Yongsan-gu" fill-rule="evenodd" clip-rule="evenodd" fill="#C8C8C8" d="M737.012,767.305
	c8.662,5.808,11.73,17.15,28.506,14.504c1.02,1.146,4.154,0.18,6.002,0.5c3.002,0,6.002,0,9.002,0c1.02,1.146,4.154,0.181,6.002,0.5
	c8.139,3.197,14.717,7.955,21.504,12.502c2.967,15.711,8.664,31.341,11.004,46.011c-17.625,10.849-33.219,28.17-48.512,45.011
	c-11.588,12.76-23.234,22.858-35.508,34.508c-7.422,7.045-10.861,11.924-22.006,13.003c-12.885,1.247-36.42,1.669-46.01-2.001
	c-5.798-2.218-10.817-9.58-15.003-14.503c-4.786-5.628-9.421-10.618-13.503-16.004c-2.026-3.475-5.16-5.843-8.001-8.502
	c-2.187-0.646-3.144-2.523-4.501-4.001c-1.958-2.376-4.125-4.543-6.501-6.501c-1.792-2.21-3.792-4.21-6.001-6.001
	c-5.487-5.35-10.367-11.305-15.503-17.004c25.86-24.984,53.596-48.095,62.514-90.021c13.819-0.684,26.499-2.507,40.509-3
	c2.834,0,5.668,0,8.502,0c2.344-0.324,5.988,0.654,7.502-0.5c3.334,0,6.668,0,10.002,0
	C730.596,766.053,735.563,764.919,737.012,767.305z"/>
                    </svg>

                    <div class="msg">
                        * 지역을 바꾸면 포인트가 차감됩니다
                    </div>
                    <button>선택완료</button>
                </div><!--// #popMap-->
            </div><!--// #popup-->


<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
<script src="/js/jquery.js"></script>
<script>

    //실시간 인기검색어
    $("#search").click(function (e) {
        e.stopPropagation();
        $("#hotIssue").slideDown(300);
    });
    //실시간검색어
    var idx = 0,
        $issue_row = $(".issue_row"),
        $search = $("#search");

    $search.focus();

    $search.keyup(function(e) {
        switch (e.which) {
            case 38:
                --idx;

                console.log("위");
                break;
            case 40:
                console.log("아래");
                ++idx;

                break;
        }

        $issue_row.removeClass("on");

        console.log(idx);

        if(idx >=$issue_row.length) {
            idx = 0;

        }
        if(idx <=-1) {
            idx = 9;

        }

        $issue_row.eq(idx).addClass("on");

    });
    $(document).click(function(){
        $("#hotIssue").slideUp(300);
    });


    //지역선택팝업
    $("#chooseLocation").click(function () {
        $("#popup").show();
    });



    //배너 롤링
    var BANNER_INDEX = 1;
    var BANNER_LEN = 0;
    var BANNER_WIDTH = 960;
    var SHOW_DURATION = 200;

    $list_slide = $(".list_slide");

    bannerInit();

    $(".btn_prev").on("click", function(){
        var nIndex = BANNER_INDEX-1;
        // n번째 배너 보이기.
        showBannerAt(nIndex);

    });
    $(".btn_next").on("click", function(){
        // 이동할 이전 배너 인덱스 값 구하기.
        var nIndex = BANNER_INDEX+1;
        // n번째 배너 보이기.
        showBannerAt(nIndex);
    });


    $(".link_page").click(function () {
        var nIndex = this.dataset.page;
        $(this).siblings().removeClass("current");
        $(this).addClass("current");
        showBannerAt(nIndex);
    });

    // nIndex에 해당하는 배너 보이기.
    function showBannerAt(nIndex){
        if (nIndex != BANNER_INDEX) {

            //  n번째 배너 위치 값 구하기.
            var nPosition = -BANNER_WIDTH * nIndex;

            // 슬라이드 시작.
            $list_slide.stop();
            $list_slide.animate({
                left: nPosition
            }, SHOW_DURATION, function(){
                // 이전 내용이 없는 경우 마지막 배너 인덱스 값으로 설정하기.
                if(nIndex<1) {
                    nIndex = BANNER_LEN;
                    nPosition = -BANNER_WIDTH * nIndex;
                    $list_slide.css({"left": nPosition + "px"});
                }

                // 다음 내용이 없는 경우, 첫 번째 배너 인덱스 값으로 설정하기.
                if(nIndex>BANNER_LEN) {
                    nIndex = 1;
                    nPosition = -BANNER_WIDTH * nIndex;
                    $list_slide.css({"left": nPosition + "px"});
                }

                $(".link_page").removeClass("current").eq(nIndex-1).addClass("current");

                $list_slide.children().css({"opacity":"1", "filter": "blur(0)"});
                $list_slide.children().eq(nIndex).prev().css({"opacity":"0.7", "filter": "blur(2px)"});
                $list_slide.children().eq(nIndex).next().css({"opacity":"0.7", "filter": "blur(2px)"});

                //현재 배너 인덱스 업데이트 시키기.
                BANNER_INDEX = nIndex;
            });
        }
    }
    function bannerInit(){
        BANNER_LEN = $(".list_slide .real").length;
        $list_slide.css({"left": -BANNER_WIDTH});
    }


    $("svg path").mouseover(function() {
        var name = this.dataset.name;
        $(".present").text(name);
    });
    $("svg path").click(function() {
        var name = this.dataset.name;
        $(".select").text(name);
        $(".msg").slideDown();
    });
</script>
</body>
</html>