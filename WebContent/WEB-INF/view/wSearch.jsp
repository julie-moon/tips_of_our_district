<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>우리동네꿀팁 wSearch</title>
    <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
    <style>
        #content .aux{
            background-color: #fff;
        }

        #searchPlaceTag {
            margin-top: 50px;
        }

        .searchbox {
            width: 960px;
            height: 50px;
        }
        .searchbox h2 {
            font-size: 27px;
            font-weight: bold;
            margin: 30px 0 20px 0;
            padding: 10px 0;
        }
        h3 {
            font-size: 23px;
            font-weight: bold;
            padding: 20px 0;
        }
        h3 a {
            text-decoration: none;
            color: #424242;
        }
        h3 a:hover {
            color: #FEBF37;
        }
        h4 {
            font-size: 20px;
            font-weight: bold;
            padding: 15px 0;
        }

        .search_list {
            display: inline-block;
            width: 460px;
            position: relative;
        }
        .search_list h5 {
            display: inline-block;
            font-size: 17px;
            padding: 5px 0 10px 0;
        }
        .search_list p {
            position: absolute;
            top: 10px;
        }
        .search_list.our p {
            right: 20px;
        }
        .search_list.another p {
            right: 0;
        }
        .search_list p a {
            color: #424242;
            text-decoration: none;
        }
        .search_list p a:hover {
            color: #FEBF37;
        }
        .search_list.our {
            padding-right: 20px;
            border-right: 1px solid #424242;
        }
        .search_list.another {
            margin-left: 15px;
        }
        .place_items {
            display: block;
            width: 458px;
            height: 100px;
            border: 1px solid #757575;
            margin-bottom: 10px;
        }
        .pi_pic {
            display: inline-block;
            width: 150px;
            height: 100px;
            background-image: url("/img/ohu.jpg");
            background-size: cover;
            background-position: center;
        }
        .pi_info {
            display: inline-block;
            width: 280px;
            height: 100px;
            vertical-align: top;
            padding-left: 10px;
        }
        .pi_info a {
            text-decoration: none;
            color: #424242;
        }
        .pi_info h6 {
            display: inline-block;
            max-width: 210px;
            font-size: 20px;
            font-weight: bold;
            padding: 10px 5px 0 0;
            /* 제목 길어졌을 때 생략 */
            text-overflow:ellipsis;
            overflow:hidden;
            white-space:nowrap;
        }
        .pi_info .mark {
            display: inline-block;
            font-size: 15px;
            font-weight: normal;
        }
        .pi_info .mark img {
            width: 18px;
        }
        .pi_info dl {
            margin-top: 5px;
            /* 제목 길어졌을 때 생략 */
            text-overflow:ellipsis;
            overflow:hidden;
            white-space:nowrap;
        }
        .pi_info dt,dd {
            margin: 5px 0;
            height: 16px;
        }
        .pi_info .address {
            display: inline-block;
        }
        .pi_info dd.address {
            margin-left: 5px;
            width: 240px;
        }


        /* 꿀팁 */
        a{
            color:#424242;
            text-decoration:none;
        }
        #tip {
            margin-top: 50px;
        }
        #searchTipTitle {
            position: relative;
        }
        #searchTipTag {
            margin-top: 70px;
            margin-bottom: 80px;
            position: relative;
        }
        .select_town {
            /*background-color:violet;*/
            /*overflow:hidden;*/
            height:36px;
            margin-top:10px;
        }
        .select_town li{
            /*background-color:aquamarine;*/
            float:left;
            margin:10px 10px;
            padding-right:20px;
            border-right:1px solid #424242;
        }
        .select_town li:first-child{
            margin-left:0;
        }
        .select_town li:last-child{
            border:0;
        }
        .select_town li a:hover {
            color: #FEBF37;
        }
        .more {
            position: absolute;
            top: 75px;
            right: 5px;
        }
        .more:hover {
            color: #FEBF37;
        }


        /* 퍼옴 만든이-주영씌*/
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
    </style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"></c:import>

            <div class="searchbox">
                <h2>'<strong>오후</strong>'에 대한 통합 검색 결과 입니다. (<span>177</span>건)</h2>
            </div>

            <div id="place">
                <h3><a href="#">꿀플</a></h3>
                <div id="searchPlaceName">
                    <h4>상호명 검색결과(<span>10</span>건)</h4>
                    <div class="search_list our">
                        <h5>우리동네</h5>
                        <p><a href="#">더보기</a></p>
                        <ul>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                    <h6><strong>1.</strong> 아웃백스테이크하우스 서울대점</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                    <dl>
                                        <dt class="screen_out">카테고리</dt>
                                        <dd class="category">음식점 > 카페/커피전문점</dd>
                                        <dt class="address">주소</dt>
                                        <dd class="address">서울특별시 관악구 관악로14가길 13 관악윤옥 </dd>
                                    </dl>
                                    </a>
                                </div>
                            </li>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>2.</strong> 오후의 과일</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문전</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>3.</strong> 오후의 과일</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문전</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>4.</strong> 오후의 과일</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문전</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="search_list another">
                        <h5>다른동네</h5>
                        <p><a href="#">더보기</a></p>
                        <ul>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>1.</strong> 오후의 과일</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문전</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>2.</strong> 아띠85도씨베이커리</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문전</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>3.</strong> 쿠우쿠우 서울대점</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문점</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>4.</strong> 오후의 과일</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문점</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="searchPlaceTag">
                    <h4>태그 검색결과(<span>10</span>건)</h4>
                    <div class="search_list our">
                        <h5>우리동네</h5>
                        <p><a href="#">더보기</a></p>
                        <ul>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>1.</strong> 오후의 과일</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문점</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>2.</strong> 오후의 과일</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문전</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>3.</strong> 오후의 과일</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문전</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>4.</strong> 오후의 과일</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문전</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="search_list another">
                        <h5>다른동네</h5>
                        <p><a href="#">더보기</a></p>
                        <ul>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>1.</strong> 오후의 과일</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문전</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>2.</strong> 오후의 과일</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문전</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>3.</strong> 오후의 과일</h6>
                                        <span class="mark"> <img src="/img/honeypot.png" /> 83%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문전</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                            <li class="place_items">
                                <div class="pi_pic"></div>
                                <div class="pi_info">
                                    <a href="#">
                                        <h6><strong>4.</strong> 오후의 과일</h6>
                                        <span class="mark"> <img src="/img/brokenpot.png"> 15%</span>
                                        <dl>
                                            <dt class="screen_out">카테고리</dt>
                                            <dd class="category">음식점 > 카페/커피전문전</dd>
                                            <dt class="address">주소</dt>
                                            <dd class="address">서울시 관악구 봉천동 1599-4</dd>
                                        </dl>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div id="tip">
                <h3><a href="#">꿀팁</a></h3>
                <div id="searchTipTitle">
                    <h4>제목 검색결과(<span>10111</span>건)</h4>
                    <ul class="select_town">
                        <li><a href="#"><h5>우리동네</h5></a></li>
                        <li><a href="#"><h5>다른동네</h5></a></li>
                    </ul>
                    <a class="more" href="#">더보기</a>
                    <ul class="ggultip_list">
                        <li class="ggultip">
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분? ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분? ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level2.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level3.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                </div>

                <div id="searchTipTag">
                    <h4>태그 검색결과(<span>10111</span>건)</h4>
                    <ul class="select_town">
                        <li><a href="#"><h5>우리동네</h5></a></li>
                        <li><a href="#"><h5>다른동네</h5></a></li>
                    </ul>
                    <a class="more" href="#">더보기</a>
                    <ul class="ggultip_list">
                        <li class="ggultip">
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분? ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분? ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                            <p class="board_name">관악구</p>
                            <p class="titleName"><a href="">ㅇㅇ역 근처 인터넷 제일 빠른 곳 아시는분?</a></p>
                            <time>17.11.28 17:25:42</time>
                            <div class="profileWrap">
                                <div class="profile_image_wrap">
                                    <img class="user_level" src="/img/level1.png" alt="유저 레벨" />
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
                </div>
            </div>


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