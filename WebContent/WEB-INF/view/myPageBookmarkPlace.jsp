<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>마이페이지 북마크 꿀플</title>
        <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
        <style>
            /***********************공통부분***********************/
            
            a{
                color:#424242;
                text-decoration:none;
            }
            #content .aux{
                background-color:#FFF;
            }
            #profileSection{
                background-color:#FFF8E1;
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
                /*background-color:pink;*/
                width:150px;
                height:200px;
                position:absolute;
                top:0;
                left:0;
                text-align:center;
            }
            #levelWrap .lv{
                /*background-color:aquamarine;*/
                font-size:28px;
                font-weight:500;
                margin-top:15px;
                /*text-align:center;*/
            }
            #levelWrap .lv_num{
                /*background-color:blueviolet;*/
                font-size:40px;
                font-weight:700;
                /*text-align:center;*/
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
                /*background-color:aqua;*/
            }
            #levelWrap .more{
                background-color:#FFF;
                display:inline-block;
                padding:7px 12px;
                border:1px solid #424242;
                /*text-align:center;*/
                position:absolute;
                bottom:15px;
                right:40px;
            }
            #levelWrap .more:hover{
                background-color:#FEBD39;
                border:1px solid #FEBD39;
                color:#FFF;
                font-weight:500;
            }
            #profileInMyPage{
                /*background-color:violet;*/
                width:120px;
                height:200px;
                position:absolute;
                top:0;
                left:150px;
            }
            /* ??????????? */
            #profileInMyPage .profile_wrap{
                /*background-color:bisque;*/
                width:100px;   
                height:150px;
                position:absolute;
                text-align:center;
                top:25px;
                left:10px;
            }
            #profileInMyPage .profile_wrap .writer_level{
                width:100px;
            }
            #profileInMyPage .profile_wrap .bee_image{
                width:80px;
                border-radius:50px;
                position:absolute;
                top:0;
                left:0;
            }
            #profileInMyPage .profile_wrap .minus_bee{
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
                /* display:none; */
            }
            #profileInMyPage .bee_profile{
                width:100px;
                height:115px;
                background:url(/img/level${userInfo.lvl}.png);
                background-repeat:no-repeat;
                background-position:center 0;
                background-size:100px 115px; 
            }
            #profileInMyPage .bee_profile a{
                width:80px;
                height:80px;
                /* background:red; */
                position:absolute;
                left: 10px;
                top: 17.5px;
                z-index:1000;
                overflow: hidden;
            }
            #profileInMyPage .minus{
                display:none;
            }
            #profileInMyPage .bee_profile a:hover .minus_bee {
                top:0;
            }
            #profileInMyPage .profile_wrap .bee_nickname{
                /* background-color:aquamarine; */
                text-align:center;
                font-size:16px;
                padding:15px 0 10px 0;
                font-weight:500;
            }
            #profileInMyPage .bee_nickname .bee_mypage{
                color:#424242;
                text-decoration:none;
            }
            #profileInMyPage .bee_nickname .bee_mypage:hover{
                color:#FEBD39;
                font-weight:500;
            }
            /* ??????????? */
            #myActivities{
                /*background-color:darksalmon;*/
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
            }
            #contentSection{
                /*background-color:azure;*/
                width:960px;
                overflow:hidden;
            }
            #myPageMenu{
                /*background-color:violet;*/
                overflow:hidden;
                height:36px;
                margin-top:10px;
            }
            #myPageMenu li{
                /*background-color:aquamarine;*/
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
            }
            .myPageDetailMenu{
                /*background-color:aquamarine;*/
                overflow:hidden;
                height:36px;
                margin:3px 0 10px 0;
            }
            .detailMenuOff {
                display:none;
            }
            .myPageDetailMenu li{
                /*background-color:deepskyblue;*/
                float:left;
                margin:10px 10px;
                padding-right:20px;
                border-right:1px solid #424242;
            }
            .myPageDetailMenu li:first-child{
                margin-left:0;
            }
            .myPageDetailMenu li:last-child{
                border:0;
            }
            .on{
                color:#FEBD39;
                font-weight:500;
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
            
            /**********************공통부분 끝*********************/
            
            /* 꿀단지, 꿀플, 꿀플 목록 CSS */
            #myPageContent .place_list{
                /*background-color:burlywood;*/
                width:465px;
                height:380px; /* 380 */
                padding-bottom:25px;
                float:left;
            }
            #myPageContent .place_list:nth-child(2n){
                margin-left:30px;
            }
            #myPageContent .place_list .place_rep_image{
                width:465px;
                height:300px;
                margin-bottom:5px;
            }
            .place_list .place_info{
                /*background-color:beige;*/
            }
            .place_list .place_info p{
                /*background-color:cadetblue;*/
                padding:5px 0; /* 없앴을 때 문제가..*/
            }
            .place_list .place_info .place_name{
                /*background-color:aquamarine;*/ /* 체크해보기 */
                font-size:22px;
                font-weight:500;
                margin-right:10px;
                vertical-align:middle;
                display:inline-block;
                max-width:380px;
                /* 제목 길어졌을 때 생략 */
                text-overflow:ellipsis;
                overflow:hidden;
                white-space:nowrap;
            }
            .place_list .place_info .rating_avg{
                width:26px;
                vertical-align:middle;
                margin-right:5px;
            }
            .place_list .place_info .rating_avg_pct{
                vertical-align:middle;
            }
            .place_list .place_info .category, .place_list .place_info .place_address{
                font-size:14px;
            }
            
            /* 꿀팁, 글 목록 CSS */
            .ggultip{
                overflow:hidden; /**/
                background-color:burlywood; /* 주석처리 해야함 */
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
            .ggultip .profileWrap {
                /*background-color:violet;*/
                position:absolute;
                left:45px;
                bottom:13px;
            }
            .ggultip .profileWrap .profile_image_wrap{
                /*background-color:blue;*/
                display:inline-block;
                vertical-align:middle;
                margin-right:3px;
            }
            .ggultip .profile_image_wrap .user_level{
                width:30px;
            }
            .ggultip .profile_image_wrap .user_image{
                width:22px;
                border-radius:25px;
                position:absolute;
                top:6px;
                left:4px;
            }
            .ggultip .profileWrap .user_nickname{
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
            .ggultip .counts .honeypot{
                width:25px;
                margin-right:5px;
                vertical-align:middle;
            }
            .ggultip .counts .honeypot_cnt, .ggultip .counts .venom_cnt, .ggultip .counts .hit_cnt{
                vertical-align:middle;
                margin-right:10px;
            }
            .ggultip .counts .venom{
                width:20px;
                margin-right:5px;
                vertical-align:middle;
            }
            .ggultip .counts .hit{
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
            /* 꿀벌 CSS */
            .bee_list .plus{
                display:none;
            }
            .bee_list{
                /*background:red;*/
                float:left;
                margin:20px 72px 10px 0;
                position:relative;
                width:100px;
                height:150px;
            }
            .bee_list:nth-child(6n) {
                margin-right:0;
            }
            .bee_list .profile_wrap{
                background-color:bisque;
                width:100px;   
                height:150px;
                position:absolute;
                text-align:center;
            }
            .bee_list .profile_wrap .bee_image{
                width:80px;
                border-radius:50px;
                position:absolute;
                top:0;
                left:0;/**/
            }
            .bee_list .profile_wrap .minus_bee{
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
                /*display:none;*/
            }
            .bee_list .bee_profile{
                width:100px;
                height:115px;
                background:url(/img/level1.png);
                background-repeat:no-repeat;
                background-position:center 0;
                background-size:100px 115px; 
            }
            .bee_list .bee_profile a{
                width:80px;
                height:80px;
                /*background:red;*/
                position:absolute;
                left: 10px;
                top: 17.5px;
                z-index:1000;
                overflow: hidden;
            }
            .bee_list .bee_profile a:hover .minus_bee {
                top:0;
            }
            .bee_list .profile_wrap .bee_nickname{
                /*background-color:aquamarine;*/
                text-align:center;
                font-size:16px;
                padding:15px 0 10px 0;
                font-weight:500;
            }
            .bee_list .bee_nickname .bee_mypage{
                color:#424242;
                text-decoration:none;
            }
            .bee_list .bee_nickname .bee_mypage:hover{
                color:#FEBD39;
                font-weight:500;
            }
            /* 댓글 목록 CSS */
            .reply_list{
                /*background-color:violet;*/
                overflow:hidden; /* 주석 처리 해야함 */
                clear:both; /* 주석 처리 해야함 */
                padding:35px 0 20px 0;
            }
            .reply_list:first-child{
                border-top:1px solid #424242;
                padding-top:50px;
            }
            .reply_list:last-child{
                padding-bottom:0;
            }
            .reply_list .review_content{
                background-color:#FFECB3;
                width:930px;
                position:relative;  
                display:inline-block;
                padding:5px 15px 60px 15px; /*  */
                min-height:80px;
            }
            .reply_list .review_content .reply_title{
                /*background-color:aquamarine;*/
                padding:0;
                position:absolute;
                top:-30px;
                left:0;
                width:700px;
                font-size:18px;
                font-weight:600;
                /* 제목 길어졌을 때 생략 */
                text-overflow:ellipsis;
                overflow:hidden;
                white-space:nowrap;
            } 
            .reply_list .review_content p{
                /*background-color:deepskyblue;*/
                width:930px; /*  */
                line-height:25px;
                padding:10px 0; 
                position:relative;
            }
            .reply_list .review_content time{
                position:absolute;
                top:-20px;
                right:45px;
                font-size:14px;
            }
            .reply_list .review_content .delete{
                /*background-color:antiquewhite;*/
                position:absolute;
                top:-20px;
                right:0;
                font-size:13px;
            }
            .reply_list .review_content .delete a:hover{
                color:#FEBD39;
                font-weight:500;
            }
            .reply_list .review_content .review_rep_image{
                background-color:rgba(0, 0, 0, .5);
                width:64px;
                height:40px;
                text-align:center;
                line-height:40px;
                font-size:18px;
                color:#FFF;
                position:absolute;
                bottom:15px; /*  */
                right:15px;
                cursor:pointer;
            }
            .reply_list .review_content .recommend_wrap{
                /*background-color:violet;*/
                position:absolute;
                bottom:15px;
                right:85px; /*  */
            }
            .reply_list .recommend_wrap .recommend_btn{
                background-color:#FFF;
                display:inline-block;
                width:98px;
                border:1px solid #424242;
                padding:8px 0;
                cursor:pointer;
                text-align:center;
                margin-right:5px;
            }
            .reply_list .recommend_btn img{
                width:25px;
                vertical-align:middle;
                margin-right:5px;
            }
            .reply_list .recommend_wrap .recommend_btn .venom{
                width:22px;
            }
            .reply_list .recommend_btn .recommend_cnt{
                vertical-align:middle;
            }
            
            /* 리뷰 목록 CSS */ 
            .review_list{
                /*background-color:violet;*/
                padding:35px 0 20px 0;
            }
            .review_list:first-child{
                border-top:1px solid #424242;
                padding-top:50px;
            }
            .review_list:last-child{
                padding-bottom:0;
            }
            .review_list .review_content{
                background-color:#FFECB3;
                width:930px;
                position:relative;  
                display:inline-block;
                padding:5px 15px 60px 15px; /*  */
                min-height:115px;
            }
            .review_list .review_content .reply_title{
                /*background-color:aquamarine;*/
                padding:0;
                max-width:650px;
                position:absolute;
                top:-30px;
                left:0;
                font-size:18px;
                font-weight:600;
                vertical-align:middle;
            } 
            .review_list .review_content .title {
                /*background-color:violet;*/
                display:inline-block;
                max-width:500px;
                /* 제목 길어졌을 때 생략 */
                text-overflow:ellipsis;
                overflow:hidden;
                white-space:nowrap;
                vertical-align:middle;
            }
            .review_list .rating_avg{
                /*background-color:violet;*/
                width:24px;
                vertical-align:middle;
                margin:0 5px 3px 15px;
            }
            .review_list .rating_avg_pct{
                /*background-color:paleturquoise;*/
                vertical-align:middle;
                font-size:15px;
                font-weight:500;
            }
            .review_list .review_content p{
                /*background-color:deepskyblue;*/
                width:930px; /*  */
                line-height:25px;
                padding:10px 0; 
                position:relative;
            }
            .review_list .review_content time{
                position:absolute;
                top:-20px;
                right:100px;
                font-size:14px;
            }
            .review_list .review_content .revise_or_delete{
                /*background-color:antiquewhite;*/
                position:absolute;
                top:-20px;
                right:0;
                font-size:13px;
            }
            .revise{
                margin-right:10px;
            }
            .review_list .review_content .revise a:hover, .review_list .review_content .delete a:hover{
                color:#FEBD39;
                font-weight:500;
            }
            .review_list .review_content .review_rep_image{
                background-color:rgba(0, 0, 0, .5);
                width:64px;
                height:40px;
                text-align:center;
                line-height:40px;
                font-size:18px;
                color:#FFF;
                position:absolute;
                bottom:15px; /*  */
                right:15px;
                cursor:pointer;
            }
            .review_list .review_content .recommend_wrap{
                /*background-color:violet;*/
                position:absolute;
                bottom:15px;
                right:85px; /*  */
            }
            .review_list .recommend_wrap .recommend_btn{
                background-color:#FFF;
                display:inline-block;
                width:98px;
                border:1px solid #424242;
                padding:8px 0;
                cursor:pointer;
                text-align:center;
                margin-right:5px;
            }
            .review_list .recommend_btn img{
                width:25px;
                vertical-align:middle;
                margin-right:5px;
            }
            .review_list .recommend_wrap .recommend_btn .venom{
                width:22px;
            }
            .review_list .recommend_btn .recommend_cnt{
                vertical-align:middle;
            }
        </style>
    </head>
    <body>
        <c:import url="/WEB-INF/view/template/header.jsp"></c:import>
                    <div id="profileSection">
                        <div id="profileWrap">
                            <div id="levelWrap">
                                <p class="lv">LV</p>
                                <p class="lv_num">${userInfo.lvl}</p>
                                <p class="all_point">
                                    <span class="point_name">누적 포인트 </span>
                                    <span><span class="all_point_score">${userInfo.tPoint}</span>점</span>
                                </p>
                                <p class="now_point">
                                    <span class="point_name">현재 포인트</span>
                                    <span><span class="now_point_score">${userInfo.point}</span>점</span>
                                </p>
                                <a class="more" href="/level">더보기</a>
                            </div> <!-- // #levelWrap -->
                            <div id="profileInMyPage">
                                <div class="profile_wrap">
                                    <div class="bee_profile">
                                        <a href="">    
                                            <img class="bee_image" src="/img/profile/${userInfo.profile}" />
                                            <div class="minus_bee">
                                                <i class="fa fa-plus-circle plus" ></i>
                                                <i class="fa fa-minus-circle minus" ></i>
                                            </div>
                                        </a>
                                    </div> <!-- // .writer_profile -->    
                                    <p class="bee_nickname">
                                        <a class="bee_mypage" href="myPage.gt">${userInfo.nick}</a>
                                    </p>
                                </div><!-- // .profile_wrap -->
                            </div> <!-- // #profileInMyPage -->
                            <div id="myActivities"> <!-- 우선은 이미지로만 보여주고, 프레임워크 사용 예정 -->
                                <img src="/img/hexagon.png" alt="유저활동내역 그래프" />
                            </div> <!-- // #myActivities -->
                        </div> <!-- // #profileWrap -->
                    </div> <!-- // #profileSection -->
                    <div id="contentSection">
                        <ul id="myPageMenu">
                            <li><a class="" href="">꿀단지</a></li>
                            <li><a class="on" href="">북마크</a></li>
                            <li><a href="">글 목록</a></li>
                            <li><a href="">댓글 목록</a></li>
                            <li><a href="">리뷰 목록</a></li>
                            <li><a href="">꿀플 목록</a></li>
                        </ul><!-- // #myPageList -->
                        <ul class="myPageDetailMenu">
                            <li class="bookmark_place"><a class="on" href="">꿀플</a></li>
                            <li><a href="">꿀팁</a></li>
                            <li><a href="">꿀벌</a></li>
                        </ul><!-- // .myPageDetailMenu -->
                        <ul class="myPageDetailMenu detailMenuOff">
                            <li><a href="">자유게시판</a></li>
                            <li><a href="">행사</a></li>
                            <li><a href="">교통</a></li>
                            <li><a href="">주거시설</a></li>
                            <li><a href="">육아</a></li>
                        </ul>
                        <ul id="myPageContent">
                            <!-- 꿀단지, 꿀플, 꿀플 목록 양식 -->
                            <c:forEach items="${bookmarkPlaceList}" var="place">
                            <li class="place_list">
                                <a href="/place/${place.pNo}/new/page/1">
                                    <img class="place_rep_image" src="/img/place/my/${place.photo}" alt="${place.name} 대표이미지" />
                                </a>
                                <div class="place_info">
                                    <p>
                                        <a href="/place/${place.pNo}/new/page/1" class="place_name">${place.name}</a>
                                        <img class="rating_avg" src="/img/honeypot.png" alt="총 평가 꿀단지" />
                                        <span class="rating_avg_pct">${place.rating}%</span>
                                    </p>
                                    <p class="category">
                                        ${place.realCategory}
                                    </p>
                                    <p class="place_address">
                                        주소 &nbsp;&nbsp; ${place.addr}
                                    </p>
                                </div> <!-- // .place_info -->
                            </li> <!-- // .place_list -->
                            </c:forEach>
                        </ul> <!-- // #myPageContent -->
                        <!-- paginate -->
                        <div class="paginate">
                            ${gpPaginate}
                        </div> <!-- // .paginate -->
                        <p id="searchInMyPage">
                            <input type="text" placeholder="마이페이지 내 검색" /><!--
                         --><button><i class="fa fa-search"></i></button>
                        </p>
                    </div> <!-- // #contentSection -->
        <c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
       
        <script src="/js/jquery.js"></script>
        <script src="/js/underscore-min.js"></script>
        <script src="/js/moment-with-locales.js"></script>
        <script>
        </script>
    </body>
</html>