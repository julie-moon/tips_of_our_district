<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>꿀플</title>
    <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
    <style>
        /** {*/
        /*margin: 0;*/
        /*padding: 0;*/
        /*}*/

        a{
            text-decoration: none;
        }
        a:hover{
            text-decoration: underline;
        }

        #content{
            font: 300 15px/1.5 "Noto Sans KR", sans-serif;
            /*background: #333;*/
            margin: 15px;
            position: relative;
        }

        /*article {*/
        /*width: 600px;*/
        /*margin: 0 auto;*/
        /*background: #000;*/
        /*color: #fff;*/
        /*border-radius: 5px;*/
        /*box-shadow: 0 0 15px 2px #666;*/
        /*}*/

        /*section {*/
        /*clear: left;*/
        /*}*/

        /*h1 {*/
        /*font-size: 45px;*/
        /*font-weight: 100;*/
        /*letter-spacing: 15px;*/
        /*text-align: center;*/
        /*}*/

        /*h1, #main_content, #dog_link {*/
        /*padding: 15px;*/
        /*}*/

        /*p {*/
        /*margin: 15px 0;*/
        /*}*/

        /*a {*/
        /*color: #06c;*/
        /*}*/

        /*#menuWrapper {*/
        /*position: relative;*/
        /*}*/


        /*****************컨텐츠 바탕***********************/
        /*#content .aux {*/
            /*background: #fff;*/
        /*}*/

        #searchBox{
            text-align: center;
            width: 960px;
            border: solid 1px #000;
            /*background: red;*/
            position: relative;
        }

        #searchBox input {
            width: 560px;
            font-size: 16px;
            margin: 10px;
            margin-left: 0;
            text-align: center;
        }

        #searchBox .btn{
            border: 1px solid #000;
            padding: 2px;
        }

        .undock, .dock {
            position: absolute;
            top: 50%;
            right: 0;
            margin: -10px 0 0 0;
            width: 20px;
            height: 20px;
            float: right;
            background: #000;
            color: #fff;
        }
        .undock {
            display: none;
        }

        #searchWrap {
            /*background: red;*/
            position: relative;
            top: 40px;
            left: 50%;
            margin-left: -480px ;
            /*border: 1px solid #424242;*/
        }

        #pRegButton{
            width: 100px;
            height: 20px;
            border: 1px solid #000;
            text-decoration: none;
            text-align: center;
            position: absolute;
            right: -10px;
            top: -10px;
            /*right:202px;*/
            margin: 10px;
            padding: 5px;
        }

        #pButtonBox{
            width: 960px;
            position: relative;
        }


        /******************************************************************************************************/

        /*#menuWrapper {*/
        /*position: relative;*/
        /*}*/
        #menuWrapper {
            position: relative;
            left: 180px;
            /*margin-left: -300px;*/
            width: 600px;
            display: block;
            height: 372px;
            background: red;
            display: none;
        }

        /* We apply background color and border bottom white and width to 150px */
        #menuWrapper ul li{
            /*background-color:#ddd;*/
            border-bottom:solid 1px #eee;
            width:200px;
            /*cursor:pointer;*/
            text-align: center;
            font-size: 20px;
            font-weight: 400;
        }

        /* We apply the background hover color when user hover the mouse over of the li component */
        #menuWrapper ul li:hover{
            background-color:#ddd;
            /*position:relative;*/
        }

        /* We apply the link style */
        #menuWrapper ul li a{
            padding:5px 15px;
            color:#ffffff;
            display:inline-block;
            text-decoration:none;
        }

        /**** SECOND LEVEL MENU ****/
        /* We make the position to absolute for flyout menu and hidden the ul until the user hover the parent li item */
        #menuWrapper ul li ul{
            position:absolute;
            display:none;
        }

        /* When user has hovered the li item, we show the ul list by applying display:block, note: 150px is the individual menu width.  */
        #menuWrapper ul li:hover ul{
            left:200px;
            top:0px;
            display:block;
        }

        /* we apply different background color to 2nd level menu items*/
        #menuWrapper ul li ul li{
            background-color:#ddd;
        }

        /* We change the background color for the level 2 submenu when hovering the menu */
        #menuWrapper ul li:hover ul li:hover{
            background-color:#bbb;
        }

        /* We style the color of level 2 links */
        #menuWrapper ul li ul li a{
            color:#454444;
            display:inline-block;
            width:120px;
        }

        /**** THIRD LEVEL MENU ****/
        /* We need to hide the 3rd menu, when hovering the first level menu */
        #menuWrapper ul li:hover ul li ul{
            position:absolute;
            display:none;
        }

        /* We show the third level menu only when they hover the second level menu parent */
        #menuWrapper ul li:hover ul li:hover ul{
            display:block;
            left:200px;
            top:0;
        }

        /* We change the background color for the level 3 submenu*/
        #menuWrapper ul li:hover ul li:hover ul li{
            background:#bbb;
        }

        /* We change the background color for the level 3 submenu when hovering the menu */

        #menuWrapper ul li:hover ul li:hover ul li:hover{
            background:#999;
        }

        /* We change the level 3 link color */
        #menuWrapper ul li:hover ul li:hover ul li a{
            color:#ffffff;
        }

        /* Clear float */
        .clear{
            clear:both;
        }


        #placeCategory{
            /*background: blue;*/
            color: #FEBD39;
            font-size: 16px;
            font-weight: 400;
            position: absolute;
            left: 187px;
            top: 12px;
            z-index: 1;
        }
        #menuWrapper span{
            cursor: pointer;
        }

        #resultWrap{
            position: relative;
            top: 40px;
            background: lightblue;
            width: 960px;
            margin-bottom: 100px;
        }
        #resultWrap h2{
            font-size: 24px;
            font-weight: 600;
        }
        #resultWrap h3{
            display: inline;
            font-weight: 600;
            font-size: 18px;
        }
        #searchResult{
            position: absolute;
            right: 0;
            background: lightcoral;
        }
        #searchResult a{
            padding: 0 15px;
        }
        #searchResult h2{
            /*position: absolute;*/
            /*right: 40px;*/
            display: inline;
            float: left;
        }

        .place{
            width: 960px;
            height: 342px;
            /*background: green;*/
            border: 1px solid #424242;
            border-collapse: collapse;
            position: relative;
            overflow: auto;
            margin: 10px 0;
        }
        .list_img{
            display: block;
            width: 600px;
            height: 340px;
            float: left;
            text-align: center;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url("/img/IMG_3561.jpg");
            background-repeat: no-repeat;
            background-size: contain;
            background-position: center;
            border: 1px solid #424242;
        }
        .list_detail{
            width: 356px;
            height: 340px;
            float: right;
            border: 1px solid #424242;
            text-indent: 20px;
            /*padding: 20px 0;*/
        }
        .list_detail a{
            padding-left: 20px;
        }
        .list_detail a:last-of-type{
            padding-left: 0;
        }
        i.fa-bookmark-o, i.fa-bookmark{
            color: #FEBD39;
            font-size: 32px;
        }
        .resultOpt, .list_detail p, .list_detail strong .list_detail {
            padding: 10px 0;
        }
        #resultWrap ul li{
            display: block;
            position: relative;
        }
        .pOpt{
            /*text-align: left;*/
            width: 70px;
            display: inline-block;
            padding-right: 10px;
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
        .place_value{

        }
    </style>
</head>
<body>

<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
            <!--<div id="pButtonBox">-->
                <!--<a href="#" id="pRegButton">꿀플 등록하기</a>-->
            <!--</div> &lt;!&ndash; #pButtonBox &ndash;&gt;-->
            <div id="searchWrap">
                <div id="placeCategory">
                    <span></span>
                </div>
                <div id="searchBox">
                    <input type="text" placeholder="예) 오후의 과일" maxlength="20">
                    <a href="#" class="btn"><i class="fa fa-search"></i></a>
                    <a href="#" class="undock"><i class="fa fa-angle-up"></i></a>
                    <a href="#" class="dock"><i class="fa fa-angle-down"></i></a>
                </div><!-- #searchBox -->

                <div id="menuWrapper">
                    <ul>
                        <li>
                            <span>음식점</span>
                            <ul>
                                <li><span>베이커리 / 디저트</span></li>
                                <li><span>술집</span></li>
                                <li><span>노점상</span></li>
                            </ul>
                        </li>
                        <li>
                            <span>편의시설</span>
                            <ul>
                                <li><span>편의점</span></li>
                                <li><span>은행</span></li>
                                <li><span>병원 / 약국</span></li>
                                <li>
                                    <span>생활 / 편의</span>
                                    <ul>
                                        <li><span>주유소</span></li>
                                        <li><span>세차장</span></li>
                                        <li><span>주차장</span></li>
                                        <li><span>숙박시설</span></li>
                                        <li><span>세탁소</span></li>
                                        <li><span>헤어 / 뷰티</span></li>
                                        <li><span>애견(샵, 동물병원)</span></li>
                                        <li><span>스포츠 시설</span></li>
                                        <li><span>우체국</span></li>
                                        <li><span>구두수선</span></li>
                                        <li><span>프린트 / 제본</span></li>
                                        <li><span>사우나 / 찜질방</span></li>
                                    </ul>
                                </li>
                                <li>
                                    <span>엔터테인먼트</span>
                                    <ul>
                                        <li><span>인형뽑기</span></li>
                                        <li><span>클럽</span></li>
                                        <li><span>노래방</span></li>
                                        <li><span>당구장</span></li>
                                        <li><span>골프연습장</span></li>
                                        <li><span>볼링장</span></li>
                                        <li><span>PC방</span></li>
                                        <li><span>스크린야구</span></li>
                                        <li><span>멀티방</span></li>
                                        <li><span>영화관</span></li>
                                        <li><span>만화방</span></li>
                                        <li><span>방탈출</span></li>
                                    </ul>
                                </li>
                                <li><span>쇼핑</span></li>
                                <li><span>기타</span></li>
                            </ul>
                        </li>
                        <li><span>지역마크</span></li>
                    </ul>
                </div><!-- #menuWrapper -->

            </div><!-- #searchWrap -->


            <div id="resultWrap">
                <div>
                    <h2>________________에 대한 검색결과입니다(16건)</h2>
                    <div id="searchResult">
                        <a href="#">꿀단지순</a>
                        <span>|</span>
                        <a href="#">리뷰순</a>
                    </div>
                </div>

                <br/><br/>
                <!-------------------------->
                <h3>상호명 검색결과(10건)</h3>
                <a href="" style="float: right;">더보기</a>
                <ul>
                    <li>
                        <div class="place">
                            <a href="">
                                <div class="list_img">
                                    <!--<img src="/img/logo.png" alt="글 이미지" width="100%" height="100%">-->
                                </div>
                                <div class=" list_detail">
                                    <p><button class="bookmark on"><i class="fa fa-bookmark-o"></i></button>
                                        <button class="bookmark"><i class="fa fa-bookmark"></i></button></p>
                                    <a href="">
                                        <strong>오후의 과일</strong>
                                    </a>
                                    <br/>
                                    <a href="">음식점</a> &gt; <a href="">카페 / 커피전문점</a>
                                    <div class="place_value">
                                        <span><img src="/img/honeypot.png" alt="꿀 이미지" width="30"></span>
                                        <span>85%</span> <span>맛</span>
                                        <span><img src="/img/brokenpot.png" alt="깨진독 이미지" width="30"></span>
                                        <span>43%</span> <span>시설</span>
                                    </div>
                                    <div class="resultOpt"><span class="pOpt">주소</span><span>서울시 관악구 봉천동 1599-4</span></div>
                                    <div class="resultOpt"><span class="pOpt">가격대</span><span>만원 미만</span></div>
                                    <div class="resultOpt"><span class="pOpt">주차</span><span>무료주차 가능</span></div>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="place">
                            <a href="">
                                <div class="list_img">
                                    <!--<img src="/img/logo.png" alt="글 이미지" width="100%" height="100%">-->
                                </div>
                                <div class=" list_detail">
                                    <p><button class="bookmark on"><i class="fa fa-bookmark-o"></i></button>
                                        <button class="bookmark"><i class="fa fa-bookmark"></i></button></p>
                                    <a href="">
                                        <strong>오후의 과일</strong>
                                    </a>
                                    <br/>
                                    <a href="">음식점</a> &gt; <a href="">카페 / 커피전문점</a>
                                    <div>
                                        <span><img src="/img/honeypot.png" alt="꿀 이미지" width="30"></span>
                                        <span>85%</span> <span>맛</span>
                                        <span><img src="/img/brokenpot.png" alt="깨진독 이미지" width="30"></span>
                                        <span>43%</span> <span>시설</span>
                                    </div>
                                    <div class="resultOpt"><span class="pOpt">주소</span><span>서울시 관악구 봉천동 1599-4</span></div>
                                    <div class="resultOpt"><span class="pOpt">가격대</span><span>만원 미만</span></div>
                                    <div class="resultOpt"><span class="pOpt">주차</span><span>무료주차 가능</span></div>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="place">
                            <a href="">
                                <div class="list_img">
                                    <!--<img src="/img/logo.png" alt="글 이미지" width="100%" height="100%">-->
                                </div>
                                <div class=" list_detail">
                                    <p><button class="bookmark on"><i class="fa fa-bookmark-o"></i></button>
                                        <button class="bookmark"><i class="fa fa-bookmark"></i></button></p>
                                    <a href="">
                                        <strong>오후의 과일</strong>
                                    </a>
                                    <br/>
                                    <a href="">음식점</a> &gt; <a href="">카페 / 커피전문점</a>
                                    <div>
                                        <span><img src="/img/honeypot.png" alt="꿀 이미지" width="30"></span>
                                        <span>85%</span> <span>맛</span>
                                        <span><img src="/img/brokenpot.png" alt="깨진독 이미지" width="30"></span>
                                        <span>43%</span> <span>시설</span>
                                    </div>
                                    <div class="resultOpt"><span class="pOpt">주소</span><span>서울시 관악구 봉천동 1599-4</span></div>
                                    <div class="resultOpt"><span class="pOpt">가격대</span><span>만원 미만</span></div>
                                    <div class="resultOpt"><span class="pOpt">주차</span><span>무료주차 가능</span></div>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="place">
                            <a href="">
                                <div class="list_img">
                                    <!--<img src="/img/logo.png" alt="글 이미지" width="100%" height="100%">-->
                                </div>
                                <div class=" list_detail">
                                    <p><button class="bookmark on"><i class="fa fa-bookmark-o"></i></button>
                                        <button class="bookmark"><i class="fa fa-bookmark"></i></button></p>
                                    <a href="">
                                        <strong>오후의 과일</strong>
                                    </a>
                                    <br/>
                                    <a href="">음식점</a> &gt; <a href="">카페 / 커피전문점</a>
                                    <div>
                                        <span><img src="/img/honeypot.png" alt="꿀 이미지" width="30"></span>
                                        <span>85%</span> <span>맛</span>
                                        <span><img src="/img/brokenpot.png" alt="깨진독 이미지" width="30"></span>
                                        <span>43%</span> <span>시설</span>
                                    </div>
                                    <div class="resultOpt"><span class="pOpt">주소</span><span>서울시 관악구 봉천동 1599-4</span></div>
                                    <div class="resultOpt"><span class="pOpt">가격대</span><span>만원 미만</span></div>
                                    <div class="resultOpt"><span class="pOpt">주차</span><span>무료주차 가능</span></div>
                                </div>
                            </a>
                        </div>
                    </li>

                </ul>
<br/><br/>
                <!-------------------------->
                <h3>태그명 검색결과(10건)</h3>
                <a href="" style="float: right;">더보기</a>
                <ul>
                    <li>
                        <div class="place">
                            <a href="">
                                <div class="list_img">
                                    <!--<img src="/img/logo.png" alt="글 이미지" width="100%" height="100%">-->
                                </div>
                                <div class=" list_detail">
                                    <p><button class="bookmark on"><i class="fa fa-bookmark-o"></i></button>
                                        <button class="bookmark"><i class="fa fa-bookmark"></i></button></p>
                                    <a href="">
                                        <strong>오후의 과일</strong>
                                    </a>
                                    <br/>
                                    <a href="">음식점</a> &gt; <a href="">카페 / 커피전문점</a>
                                    <div class="place_value">
                                        <span><img src="/img/honeypot.png" alt="꿀 이미지" width="30"></span>
                                        <span>85%</span> <span>맛</span>
                                        <span><img src="/img/brokenpot.png" alt="깨진독 이미지" width="30"></span>
                                        <span>43%</span> <span>시설</span>
                                    </div>
                                    <div class="resultOpt"><span class="pOpt">주소</span><span>서울시 관악구 봉천동 1599-4</span></div>
                                    <div class="resultOpt"><span class="pOpt">가격대</span><span>만원 미만</span></div>
                                    <div class="resultOpt"><span class="pOpt">주차</span><span>무료주차 가능</span></div>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="place">
                            <a href="">
                                <div class="list_img">
                                    <!--<img src="/img/logo.png" alt="글 이미지" width="100%" height="100%">-->
                                </div>
                                <div class=" list_detail">
                                    <p><button class="bookmark on"><i class="fa fa-bookmark-o"></i></button>
                                        <button class="bookmark"><i class="fa fa-bookmark"></i></button></p>
                                    <a href="">
                                        <strong>오후의 과일</strong>
                                    </a>
                                    <br/>
                                    <a href="">음식점</a> &gt; <a href="">카페 / 커피전문점</a>
                                    <div>
                                        <span><img src="/img/honeypot.png" alt="꿀 이미지" width="30"></span>
                                        <span>85%</span> <span>맛</span>
                                        <span><img src="/img/brokenpot.png" alt="깨진독 이미지" width="30"></span>
                                        <span>43%</span> <span>시설</span>
                                    </div>
                                    <div class="resultOpt"><span class="pOpt">주소</span><span>서울시 관악구 봉천동 1599-4</span></div>
                                    <div class="resultOpt"><span class="pOpt">가격대</span><span>만원 미만</span></div>
                                    <div class="resultOpt"><span class="pOpt">주차</span><span>무료주차 가능</span></div>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="place">
                            <a href="">
                                <div class="list_img">
                                    <!--<img src="/img/logo.png" alt="글 이미지" width="100%" height="100%">-->
                                </div>
                                <div class=" list_detail">
                                    <p><button class="bookmark on"><i class="fa fa-bookmark-o"></i></button>
                                        <button class="bookmark"><i class="fa fa-bookmark"></i></button></p>
                                    <a href="">
                                        <strong>오후의 과일</strong>
                                    </a>
                                    <br/>
                                    <a href="">음식점</a> &gt; <a href="">카페 / 커피전문점</a>
                                    <div>
                                        <span><img src="/img/honeypot.png" alt="꿀 이미지" width="30"></span>
                                        <span>85%</span> <span>맛</span>
                                        <span><img src="/img/brokenpot.png" alt="깨진독 이미지" width="30"></span>
                                        <span>43%</span> <span>시설</span>
                                    </div>
                                    <div class="resultOpt"><span class="pOpt">주소</span><span>서울시 관악구 봉천동 1599-4</span></div>
                                    <div class="resultOpt"><span class="pOpt">가격대</span><span>만원 미만</span></div>
                                    <div class="resultOpt"><span class="pOpt">주차</span><span>무료주차 가능</span></div>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="place">
                            <a href="">
                                <div class="list_img">
                                    <!--<img src="/img/logo.png" alt="글 이미지" width="100%" height="100%">-->
                                </div>
                                <div class=" list_detail">
                                    <p><button class="bookmark on"><i class="fa fa-bookmark-o"></i></button>
                                        <button class="bookmark"><i class="fa fa-bookmark"></i></button></p>
                                    <a href="">
                                        <strong>오후의 과일</strong>
                                    </a>
                                    <br/>
                                    <a href="">음식점</a> &gt; <a href="">카페 / 커피전문점</a>
                                    <div>
                                        <span><img src="/img/honeypot.png" alt="꿀 이미지" width="30"></span>
                                        <span>85%</span> <span>맛</span>
                                        <span><img src="/img/brokenpot.png" alt="깨진독 이미지" width="30"></span>
                                        <span>43%</span> <span>시설</span>
                                    </div>
                                    <div class="resultOpt"><span class="pOpt">주소</span><span>서울시 관악구 봉천동 1599-4</span></div>
                                    <div class="resultOpt"><span class="pOpt">가격대</span><span>만원 미만</span></div>
                                    <div class="resultOpt"><span class="pOpt">주차</span><span>무료주차 가능</span></div>
                                </div>
                            </a>
                        </div>
                    </li>

                </ul>

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

<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>

<!-- 꿀플 메인 페이지 검색 옵션-->
<script src="/js/jquery.js"></script>
<script>
    $('#profile img').click(function(){
        // alert("test");
        $('#menu').slideToggle(300);
    }); // click() end
    $('#menu li').click(function(){
        $('#menu').slideUp();
    }); //click() end

    $(".dock").on("click", function (e) {
        e.preventDefault();
        $(".dock").hide();
        $(".undock").show();
        $("#menuWrapper").slideDown();
    });

    $(".undock").on("click", function (e) {
        e.preventDefault();
        $(".undock").hide();
        $(".dock").show();
        $("#menuWrapper").slideUp();
    });

    $("#menuWrapper li").on("mouseenter",function () {
        $("#menuWrapper li").css("color", "#000");
        $(this).css("color", "#FEBD39");

    })
        .on("mouseleave", function () {
            $(this).css("color", "#000");
        });

    $("#menuWrapper li span").on("click", function () {
        var category = $(this).text();
        $("#placeCategory span").text(category);
        $("#searchBox input").focus();
    });

    $("#searchBox input").focus(function () {
        $('#menuWrapper').slideUp();
        $(".undock").hide();
        $(".dock").show();
    });

</script>
</body>
</html>