<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>우리동네꿀팁 template</title>
    <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
    <style>
        a{
            color:#424242;
            text-decoration:none;
        }
/*        #profileSection{
            background-color:skyblue;
            width:960px;
            height:400px;
            position:relative;
        }
        #profileWrap{
            background-color:#FFF;
            width:430px;
            height:200px;
            position:absolute;
            left:265px;
            top:100px;
        }
        #levelWrap{
            !*background-color:pink;*!
            width:150px;
            height:200px;
            position:absolute;
            top:0;
            left:0;
            text-align:center;
        }
        #levelWrap .lv{
            !*background-color:aquamarine;*!
            font-size:28px;
            font-weight:500;
            margin-top:15px;
            !*text-align:center;*!
        }
        #levelWrap .lv_num{
            !*background-color:blueviolet;*!
            font-size:40px;
            font-weight:700;
            !*text-align:center;*!
            color:#FEBD39;
            padding:3px 0;
            margin-bottom:10px;
        }
        #levelWrap .point_name{
            text-align:left;
        }
        #levelWrap .all_point, #levelWrap .now_point{
            margin:7px 0;
            font-size:14px;
        }
        #levelWrap span{
            !*background-color:aqua;*!
        }
        #levelWrap .more{
            background-color:#FFF;
            display:inline-block;
            padding:7px 12px;
            border:1px solid #424242;
            !*text-align:center;*!
            position:absolute;
            bottom:15px;
            right:40px;
        }
        ***********************
        #profileInMyPage{
            !*background-color:violet;*!
            width:120px;
            height:200px;
            position:absolute;
            top:0;
            left:150px;
        }
        .profile_wrap{
            !*background-color:bisque;*!
            width:100px;
            height:150px;
            position:absolute;
            text-align:center;
            top:25px;
            left:10px;
        }
        .profile_wrap .writer_level{
            width:100px;
        }
        .profile_wrap .bee_image{
            width:80px;
            border-radius:50px;
            position:absolute;
            top:0;
            left:0;!**!
        }
        .profile_wrap .minus_bee{
            background-color:rgba(0, 0, 0, .5);
            position:absolute;
            top:-80px;
            left:0;
            width:80px;
            height:80px;
            border-radius:40px;
            text-align:center;
            font-size:20px;
            color:#FFF;
            line-height:78px;
            !*display:none;*!
        }
        .bee_profile{
            width:100px;
            height:115px;
            background:url(/img/hexagon.png);
            background-repeat:no-repeat;
            background-position:center 0;
            background-size:100px 115px;
        }
        .bee_profile a{
            width:80px;
            height:80px;
            !*background:red;*!
            position:absolute;
            left: 10px;
            top: 17.5px;
            z-index:1000;
            overflow: hidden;
        }
        .minus{
            display:none;
        }
        .bee_profile a:hover .minus_bee {
            top:0;
        }
        .profile_wrap .bee_nickname{
            !*background-color:aquamarine;*!
            text-align:center;
            font-size:16px;
            padding:15px 0 10px 0;
            font-weight:500;
        }
        .bee_nickname .bee_mypage{
            color:#424242;
            text-decoration:none;
        }
        .bee_nickname .bee_mypage:hover{
            color:#FEBD39;
            font-weight:500;
        }
        #myActivities{
            !*background-color:darksalmon;*!
            width:160px;
            height:200px;
            position:absolute;
            top:0;
            right:0;
        }
        #myActivities img{
            position:absolute;
            width:120px;
            left:20px;
            top:32px;
        }*/
        #contentSection{
            /*background-color:azure;*/
            width:960px;
            overflow:hidden;
            position: relative;
        }
        #contentSection h2{
            font-size: 24px;
            font-weight: 700;
            margin: 30px 0 50px 0;
        }
        /*#myPageMenu{
            !*background-color:violet;*!
            overflow:hidden;
            height:36px;
            margin-top:10px;
        }
        #myPageMenu li{
            !*background-color:aquamarine;*!
            float:left;
            margin:10px 10px;
            padding-right:20px;
            border-right:1px solid #424242;
        }
        #myPageMenu li:first-child{
            margin-left:0;
        }
        #myPageMenu li:last-child{
            border:0;
        }*/
        #myPageDetailMenu{
            /*background-color:aquamarine;*/
            overflow:hidden;
            height:36px;
            margin:3px 0 10px 0;
        }
        #myPageDetailMenu li{
            /*background-color:deepskyblue;*/
            float:left;
            margin:10px 10px;
            padding-right:20px;
            border-right:1px solid #424242;
        }
        #myPageDetailMenu li:first-child{
            margin-left:0;
        }
        #myPageDetailMenu li:last-child{
            border:0;
        }
        .on{
            color:#FEBD39;
            font-weight:500;
        }
        #content .aux{
            background-color:#FFF;
        }
        .ggultip_list{
            margin-top:15px;
        }
        .ggultip{
            /*background-color:burlywood;*/
            width:960px;
            height:150px;
            border-bottom:1px solid #424242;
            position:relative;
            /*margin:auto 80px;*/
        }
        .ggultip:first-child{
            border-top:1px solid #424242;
        }
        .ggultip .board_name{
            position:absolute;
            top:15px;
            left:45px;/* 15px */
            font-size:15px;
        }
        .ggultip .titleName{
            /*background-color:pink;*/
            position:absolute;
            top:45px;
            left:45px;
            font-size:18px;
            font-weight:600;
            width:650px;
            /* 제목 길어졌을 때 생략 */
            text-overflow:ellipsis;
            overflow:hidden;
            white-space:nowrap;
        }
        .ggultip time{
            position:absolute;
            top:72px;
            left:45px;
            font-size:13px;
        }
        .profileWrap {
            /*background-color:violet;*/
            position:absolute;
            left:45px;
            bottom:13px;
            /*
            width:;
            height:;
            */
        }
        .profileWrap .profile_image_wrap{
            /*background-color:blue;*/
            display:inline-block;
            vertical-align:middle;
            margin-right:3px;
        }
        .profile_image_wrap .user_level{
            width:30px;
        }
        .profile_image_wrap .user_image{
            width:22px;
            border-radius:25px;
            position:absolute;
            top:6px;
            left:4px;
        }
        .profileWrap .user_nickname{
            /*background-color:#FFF;*/
            vertical-align:middle;
            font-size:15px;
            font-weight:500;
        }
        .ggultip .counts{
            /*background-color:aquamarine;*/
            position:absolute;
            bottom:17px;
            right:210px;
        }
        .counts .honeypot{
            width:25px;
            margin-right:5px;
            vertical-align:middle;
        }
        .counts .honeypot_cnt, .counts .venom_cnt, .counts .hit_cnt{
            vertical-align:middle;
            margin-right:10px;
        }
        .counts .venom{
            width:20px;
            margin-right:5px;
            vertical-align:middle;
        }
        .counts .hit{
            font-size:20px;
            vertical-align:middle;
            margin-right:5px;
        }
        .ggultip .board_rep_image{
            background-color:antiquewhite;
            width:155px;
            height:118px;
            position:absolute;
            right:45px;
            top:15px;
            cursor:pointer;
        }
        /* paginate */
        .paginate {
            /*background-color:violet;*/
            clear:both;
            font-size:14px;
            text-align:center;
            height:34px;
            line-height:34px;
            font-weight:500;
            margin-top:30px;
        }
        .paginate a,
        .paginate span,
        .paginate strong{
            color:#858585;
            text-decoration:none;
            padding:6px 12px;
            border:1px solid transparent;
            transition:.1s ease;
        }
        .paginate span {
            border-color:#E1E1E1;
            cursor: not-allowed;
        }
        .paginate a:hover {
            background:#FEBD39;
            border-color:#E1E1E1;
            font-weight:900;
            color:#fff;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        .paginate strong {
            background:#FEBD39;
            border-color:#FEBD39;
            color:#fff;
            cursor: not-allowed;
            font-weight:900;
        }

        /* 비활성화 */
        .paginate span.next,
        .paginate span.prev {
            border-color:#E1E1E1;
            color:#E1E1E1;
            cursor:default;
            cursor:not-allowed;
        }

        #searchBox{
            text-align: center;
            margin: 45px 0;
        }
        #searchBox input{
            padding:5px;
            margin-left: 10px;
            font-size:15px;
            vertical-align:middle;
            border:1px solid #424242;
        }
        #searchBox button{
            width:29.5px;
            height:29.5px;
            font-size:15px;
            border-radius:0;
            border:0;
            background-color:#424242;
            cursor:pointer;
            color:#FFF;
            vertical-align:middle;
        }
        #searchBox select{
            margin: 0 10px;
            font-size:15px;
            vertical-align:middle;
            border:1px solid #424242;
        }
        #searchInMyPage{
            /*background-color:aquamarine;*/
            text-align:center;
            margin:45px 0;
        }
        #searchInMyPage input{
            padding:5px;
            font-size:15px;
            vertical-align:middle;
            border:1px solid #424242;
        }
        #searchInMyPage button{
            width:29.5px;
            height:29.5px;
            font-size:15px;
            border-radius:0;
            border:0;
            background-color:#424242;
            cursor:pointer;
            color:#FFF;
            vertical-align:middle;
        }

        #searchResult{
            position: absolute;
            right: 0;
            margin-top: 10px;
            background: lightcoral;
        }
        #searchResult a{
            padding: 0 15px;
        }
        #tRegButton{
            width: 80px;
            height: 20px;
            border: 1px solid #000;
            text-decoration: none;
            text-align: center;
            position: absolute;
            right: -10px;
            top: -50px;
            /*right:202px;*/
            margin: 10px;
            padding: 8px;
        }

        #tButtonBox{
            width: 960px;
            position: relative;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
            <!--<div id="profileSection">
                <div id="profileWrap">
                    <div id="levelWrap">
                        <p class="lv">LV</p>
                        <p class="lv_num">8</p>
                        <p class="all_point">
                            <span class="point_name">누적 포인트 </span>
                            <span><span class="all_point_score">101</span>점</span>
                        </p>
                        <p class="now_point">
                            <span class="point_name">현재 포인트</span>
                            <span><span class="now_point_score">45</span>점</span>
                        </p>
                        <a class="more" href="">더보기</a>
                    </div> &lt;!&ndash; // #levelWrap &ndash;&gt;
                    <div id="profileInMyPage">
                        <div class="profile_wrap">
                            <div class="bee_profile">
                                <a href="">
                                    <img class="bee_image" src="/img/profile_default.png" />
                                    <div class="minus_bee">
                                        <i class="fa fa-plus-circle plus" ></i>
                                        <i class="fa fa-minus-circle minus" ></i>
                                    </div>
                                </a>
                            </div> &lt;!&ndash; // .writer_profile &ndash;&gt;
                            <p class="bee_nickname">
                                <a class="bee_mypage" href="">벌꿀2</a>
                            </p>
                        </div>&lt;!&ndash; // .profile_wrap &ndash;&gt;
                    </div> &lt;!&ndash; // #profileWrap &ndash;&gt;
                    <div id="myActivities"> &lt;!&ndash; 우선은 이미지로만 보여주고, 프레임워크 사용 예정 &ndash;&gt;
                        <img src="/img/hexagon.png" alt="유저활동내역 그래프" />
                    </div>
                </div> &lt;!&ndash; // #profileWrap &ndash;&gt;
            </div> &lt;!&ndash; // #profileSection &ndash;&gt;-->
            <div id="contentSection">
                <h2>꿀팁</h2>
<!--                <ul id="myPageMenu">
                    <li><a class="on" href="">꿀단지</a></li>
                    <li><a href="">북마크</a></li>
                    <li><a href="">글 목록</a></li>
                    <li><a href="">댓글 목록</a></li>
                    <li><a href="">리뷰 목록</a></li>
                    <li><a href="">꿀플 목록</a></li>
                </ul>&lt;!&ndash; // #myPageList &ndash;&gt;-->
                <div id="tButtonBox">
                    <a href="#" id="tRegButton">글쓰기</a>
                </div>

                <ul id="myPageDetailMenu">
                    <div id="searchResult">
                        <a href="#">최신순</a>
                        <span>|</span>
                        <a href="#">인기순</a>
                    </div>
                    <!--
                    <li><a href="">꿀플</a></li>
                    <li><a href="">꿀팁</a></li>
                    <li><a href="">꿀벌</a></li>
                    -->
                    <li><a href="" class="on">자유게시판</a></li>
                    <li><a href="">행사</a></li>
                    <li><a href="">교통</a></li>
                    <li><a href="">주거시설</a></li>
                    <li><a href="">육아</a></li>
                </ul>

                <ul class="ggultip_list">
                    <li class="ggultip">
                        <p class="board_name">글 번호로 출력</p>
                        <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분? ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분? ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                        <time>17.11.28 17:25:42</time>
                        <div class="profileWrap">
                            <div class="profile_image_wrap">
                                <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                            </div> <!-- // .profile_image_wrap -->
                            <span class="user_nickname">벌꿀2</span>
                        </div> <!-- // .profileWrap -->
                        <div class="counts">
                            <span><img class="honeypot" src="/img/honeypot.png" alt="총 꿀 수" /></span>
                            <span class="honeypot_cnt">99,529</span>
                            <span><img class="venom" src="/img/venom.png" alt="총 독 수" /></span>
                            <span class="venom_cnt">101</span>
                            <span class="hit"><i class="fa fa-eye"></i></span>
                            <span class="hit_cnt">1,200</span>
                        </div>
                        <div class="board_rep_image">
                            <!-- <img src="" alt="" /> -->
                        </div> <!-- // .board_rep_image -->
                    </li>
                    <li class="ggultip">
                        <p class="board_name">글 번호로 출력</p>
                        <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                        <time>17.11.28 17:25:42</time>
                        <div class="profileWrap">
                            <div class="profile_image_wrap">
                                <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                            </div> <!-- // .profile_image_wrap -->
                            <span class="user_nickname">벌꿀2</span>
                        </div> <!-- // .profileWrap -->
                        <div class="counts">
                            <span><img class="honeypot" src="/img/honeypot.png" alt="총 꿀 수" /></span>
                            <span class="honeypot_cnt">99,529</span>
                            <span><img class="venom" src="/img/venom.png" alt="총 독 수" /></span>
                            <span class="venom_cnt">101</span>
                            <span class="hit"><i class="fa fa-eye"></i></span>
                            <span class="hit_cnt">1,200</span>
                        </div>
                        <div class="board_rep_image">
                            <!-- <img src="" alt="" /> -->
                        </div> <!-- // .board_rep_image -->
                    </li>
                    <li class="ggultip">
                        <p class="board_name">글 번호로 출력</p>
                        <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                        <time>17.11.28 17:25:42</time>
                        <div class="profileWrap">
                            <div class="profile_image_wrap">
                                <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                            </div> <!-- // .profile_image_wrap -->
                            <span class="user_nickname">벌꿀2</span>
                        </div> <!-- // .profileWrap -->
                        <div class="counts">
                            <span><img class="honeypot" src="/img/honeypot.png" alt="총 꿀 수" /></span>
                            <span class="honeypot_cnt">99,529</span>
                            <span><img class="venom" src="/img/venom.png" alt="총 독 수" /></span>
                            <span class="venom_cnt">101</span>
                            <span class="hit"><i class="fa fa-eye"></i></span>
                            <span class="hit_cnt">1,200</span>
                        </div>
                        <div class="board_rep_image">
                            <!-- <img src="" alt="" /> -->
                        </div> <!-- // .board_rep_image -->
                    </li>
                    <li class="ggultip">
                        <p class="board_name">글 번호로 출력</p>
                        <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                        <time>17.11.28 17:25:42</time>
                        <div class="profileWrap">
                            <div class="profile_image_wrap">
                                <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                            </div> <!-- // .profile_image_wrap -->
                            <span class="user_nickname">벌꿀2</span>
                        </div> <!-- // .profileWrap -->
                        <div class="counts">
                            <span><img class="honeypot" src="/img/honeypot.png" alt="총 꿀 수" /></span>
                            <span class="honeypot_cnt">99,529</span>
                            <span><img class="venom" src="/img/venom.png" alt="총 독 수" /></span>
                            <span class="venom_cnt">101</span>
                            <span class="hit"><i class="fa fa-eye"></i></span>
                            <span class="hit_cnt">1,200</span>
                        </div>
                        <div class="board_rep_image">
                            <!-- <img src="" alt="" /> -->
                        </div> <!-- // .board_rep_image -->
                    </li>
                    <li class="ggultip">
                        <p class="board_name">글 번호로 출력</p>
                        <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                        <time>17.11.28 17:25:42</time>
                        <div class="profileWrap">
                            <div class="profile_image_wrap">
                                <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                            </div> <!-- // .profile_image_wrap -->
                            <span class="user_nickname">벌꿀2</span>
                        </div> <!-- // .profileWrap -->
                        <div class="counts">
                            <span><img class="honeypot" src="/img/honeypot.png" alt="총 꿀 수" /></span>
                            <span class="honeypot_cnt">99,529</span>
                            <span><img class="venom" src="/img/venom.png" alt="총 독 수" /></span>
                            <span class="venom_cnt">101</span>
                            <span class="hit"><i class="fa fa-eye"></i></span>
                            <span class="hit_cnt">1,200</span>
                        </div>
                        <div class="board_rep_image">
                            <!-- <img src="" alt="" /> -->
                        </div> <!-- // .board_rep_image -->
                    </li>
                    <li class="ggultip">
                        <p class="board_name">글 번호로 출력</p>
                        <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                        <time>17.11.28 17:25:42</time>
                        <div class="profileWrap">
                            <div class="profile_image_wrap">
                                <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                            </div> <!-- // .profile_image_wrap -->
                            <span class="user_nickname">벌꿀2</span>
                        </div> <!-- // .profileWrap -->
                        <div class="counts">
                            <span><img class="honeypot" src="/img/honeypot.png" alt="총 꿀 수" /></span>
                            <span class="honeypot_cnt">99,529</span>
                            <span><img class="venom" src="/img/venom.png" alt="총 독 수" /></span>
                            <span class="venom_cnt">101</span>
                            <span class="hit"><i class="fa fa-eye"></i></span>
                            <span class="hit_cnt">1,200</span>
                        </div>
                        <div class="board_rep_image">
                            <!-- <img src="" alt="" /> -->
                        </div> <!-- // .board_rep_image -->
                    </li>
                    <li class="ggultip">
                        <p class="board_name">글 번호로 출력</p>
                        <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                        <time>17.11.28 17:25:42</time>
                        <div class="profileWrap">
                            <div class="profile_image_wrap">
                                <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                            </div> <!-- // .profile_image_wrap -->
                            <span class="user_nickname">벌꿀2</span>
                        </div> <!-- // .profileWrap -->
                        <div class="counts">
                            <span><img class="honeypot" src="/img/honeypot.png" alt="총 꿀 수" /></span>
                            <span class="honeypot_cnt">99,529</span>
                            <span><img class="venom" src="/img/venom.png" alt="총 독 수" /></span>
                            <span class="venom_cnt">101</span>
                            <span class="hit"><i class="fa fa-eye"></i></span>
                            <span class="hit_cnt">1,200</span>
                        </div>
                        <div class="board_rep_image">
                            <!-- <img src="" alt="" /> -->
                        </div> <!-- // .board_rep_image -->
                    </li>
                    <li class="ggultip">
                        <p class="board_name">글 번호로 출력</p>
                        <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                        <time>17.11.28 17:25:42</time>
                        <div class="profileWrap">
                            <div class="profile_image_wrap">
                                <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                            </div> <!-- // .profile_image_wrap -->
                            <span class="user_nickname">벌꿀2</span>
                        </div> <!-- // .profileWrap -->
                        <div class="counts">
                            <span><img class="honeypot" src="/img/honeypot.png" alt="총 꿀 수" /></span>
                            <span class="honeypot_cnt">99,529</span>
                            <span><img class="venom" src="/img/venom.png" alt="총 독 수" /></span>
                            <span class="venom_cnt">101</span>
                            <span class="hit"><i class="fa fa-eye"></i></span>
                            <span class="hit_cnt">1,200</span>
                        </div>
                        <div class="board_rep_image">
                            <!-- <img src="" alt="" /> -->
                        </div> <!-- // .board_rep_image -->
                    </li>
                    <li class="ggultip">
                        <p class="board_name">글 번호로 출력</p>
                        <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                        <time>17.11.28 17:25:42</time>
                        <div class="profileWrap">
                            <div class="profile_image_wrap">
                                <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                            </div> <!-- // .profile_image_wrap -->
                            <span class="user_nickname">벌꿀2</span>
                        </div> <!-- // .profileWrap -->
                        <div class="counts">
                            <span><img class="honeypot" src="/img/honeypot.png" alt="총 꿀 수" /></span>
                            <span class="honeypot_cnt">99,529</span>
                            <span><img class="venom" src="/img/venom.png" alt="총 독 수" /></span>
                            <span class="venom_cnt">101</span>
                            <span class="hit"><i class="fa fa-eye"></i></span>
                            <span class="hit_cnt">1,200</span>
                        </div>
                        <div class="board_rep_image">
                            <!-- <img src="" alt="" /> -->
                        </div> <!-- // .board_rep_image -->
                    </li>
                    <li class="ggultip">
                        <p class="board_name">글 번호로 출력</p>
                        <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                        <time>17.11.28 17:25:42</time>
                        <div class="profileWrap">
                            <div class="profile_image_wrap">
                                <img class="user_level" src="/img/hexagon.png" alt="유저 레벨" />
                                <img class="user_image" src="/img/profile_default.png" alt="유저 프로필사진" />
                            </div> <!-- // .profile_image_wrap -->
                            <span class="user_nickname">벌꿀2</span>
                        </div> <!-- // .profileWrap -->
                        <div class="counts">
                            <span><img class="honeypot" src="/img/honeypot.png" alt="총 꿀 수" /></span>
                            <span class="honeypot_cnt">99,529</span>
                            <span><img class="venom" src="/img/venom.png" alt="총 독 수" /></span>
                            <span class="venom_cnt">101</span>
                            <span class="hit"><i class="fa fa-eye"></i></span>
                            <span class="hit_cnt">1,200</span>
                        </div>
                        <div class="board_rep_image">
                            <!-- <img src="" alt="" /> -->
                        </div> <!-- // .board_rep_image -->
                    </li>
                </ul>

                <!-- paginate -->
                <div class="paginate">
                            <span title="이전 페이지 없음">
                                <i class="fa fa-chevron-left"></i>
                            </span>
                    <strong title='현재 1페이지'>1</strong>
                    <a href='index.jsp?now=2' title='2'>2</a>
                    <a href='index.jsp?now=3' title='3'>3</a>
                    <a href='index.jsp?now=4' title='4'>4</a>
                    <a href='index.jsp?now=5' title='5'>5</a>
                    <a href='index.jsp?now=2' title='다음 페이지로'>
                        <i class='fa fa-chevron-right'></i>
                        <span class='screen_out'>다음 페이지</span>
                    </a>
                </div> <!-- // .paginate -->
                <div id="searchBox">
                    <span><input type="text" value="all" style="display: none;"></span>
                    <select>
                        <option value="all" selected>전체기간</option>
                        <option value="1d">1일</option>
                        <option value="1w">1주</option>
                        <option value="1m">1개월</option>
                        <option value="6m">6개월</option>
                        <option value="1y">1년</option>
                    </select>

                    <span><input type="text" value="1" style="display: none;"></span>
                    <select>
                        <option value="1" selected>제목 + 내용</option>
                        <option value="2">제목만</option>
                        <option value="3">태그</option>
                        <option value="4">글 작성자</option>
                        <option value="5">댓글 내용</option>
                        <option value="6">댓글 작성자</option>
                    </select>
                    <input type="text" placeholder="게시판 내에서 검색"><!--
                    --><button><i class="fa fa-search"></i></button>
                </div>
<!--                <p id="searchInMyPage">
                    <input type="text" placeholder="마이페이지 내 검색" />&lt;!&ndash;
                         &ndash;&gt;<button><i class="fa fa-search"></i></button>
                </p>-->
            </div> <!-- // #contentSection -->
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