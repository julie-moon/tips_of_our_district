<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${place.name} 상세정보</title>
        <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
        <style>
            a{
                color:#424242;
                text-decoration:none;
            }
            #content .aux{
                overflow:hidden;
                background-color:#FFF;
            }
            #remoteControl{
                /*background-color:violet;*/
                width:80px;
                /**/
                position:fixed;
                top:157px;
                right:0px;
                border:1px solid #424242;
            }
            #openOrClose{
                background-color:#424242;
                width:25px;
                height:25px;
                color:#FFF;
                text-align:center;
                line-height:20px;
                position:absolute;
                top:-1px;
                left:-25px;
                cursor:pointer;
            }
            #remoteControl li{
                width:80px;
                height:30px;
                line-height:30px;
                font-size:15px;
                text-align:center;
                border-bottom:1px solid #424242;
            }
            #remoteControl li:last-child{
                border-bottom:0;
            }
            #remoteControl li a{
                display:inline-block;
                width:80px;
                height:30px;
            }
            #remoteControl li a:hover{
                background-color:#FEBD39;
                color:#FFF;
                font-weight:500;
            }
            #contentTop {
                /*background-color:antiquewhite;*/
                width:960px;
                height:467px;
                position:relative;
                margin-bottom:10px;
            }
            #content #bookmark{
                /*background-color:pink;*/
                font-size:25px;
                padding:15px 0;
            }
            #content #bookmark i{
            	cursor:pointer;
            }
            #content #spotPic{
                /*background-color:skyblue;*/
                width:660px;
                height:410px;
                position:absolute;
                top:57px;
                left:0;
            }
            #content #spotPic img{
                width:660px;
                height:410px;
            }
            #content #spotPic span{
                background-color:rgba(0, 0, 0, .6);
                color:#FFF;
                display:inline-block;
                padding:10px 16px;
                position:absolute;
                right:15px;
                bottom:15px;
                cursor:pointer;
            }
            #content #userInfo{
                background-color:#FFF8E1;
                width:270px;
                height:410px;
                margin-left:30px;
                position:absolute;
                bottom:0;
                right:0;
            }
            #userInfo .user_title{
                /*background-color:aquamarine;*/
                font-size:22px;
                font-weight:500;
                width:270px;
                text-align:center;
                position:absolute;
                top:70px;
            }
            #userInfo .writer_profile{
                /*background-color:cadetblue;*/
                position:absolute;
                top:130px;
                left:85px;
                width:100px;
                height:115px;
                background:url(/img/level${user.lvl}.png);
                background-repeat:no-repeat;
                background-position:center 0;
                background-size:100px 115px;
            }
            #userInfo .writer_image{
                width:80px;
                height:80px;
                border-radius:50px;
                position:absolute;
                top:0;
                left:0;/**/
            }
            #userInfo .plus_bee{
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
            #userInfo .writer_profile a{
                width:80px;
                height:80px;
                /*background:red;*/
                position:absolute;
                left: 10px;
                top: 17.5px;
                z-index:1000;
                overflow: hidden;
            }
            #userInfo .writer_profile a:hover .plus_bee {
                top:0;
            }
            /*
            #userInfo #userProfile .user_level {
                width:100px;
                position:absolute;
                top:130px;
                left:85px;
            }
            #userInfo #userProfile .profile_photo{
                width:80px;
                border-radius:40px;
                position:absolute;
                top:147.5px;
                left:95px;
            }
            #userInfo #userProfile .plus_bee{
                width:80px;
                height:80px;
                background-color:rgba(0, 0, 0, .5);
                border-radius:40px;
                text-align:center;
                font-size:20px;
                color:#FFF;
                line-height:78px;
                position:absolute;
                top:147.5px;
                left:95px;
                display:none;
            }*/
            #userInfo .user_nickname{
                /*background-color:skyblue;*/
                width:270px;
                font-size:18px;
                font-weight:700;
                text-align:center;
                position:absolute;
                top:285px;
            }
            #userInfo .user_nickname a:hover{
                color:#FEBD39;
            }
            #userInfo .found_spot{
                /*background-color:aqua;*/
                width:270px;
                text-align:center;
                position:absolute;
                top:320px;
            }
            #userInfo .found_spot .found_spot_num{
                color:#FEBD39;
                font-weight:700;
            }
            #contentMid{
                /*background-color:beige;*/
                width:960px;
                position:relative;
                margin-bottom:10px;
            }
            #contentMid #contentTitle{
                width:960px;
                height:30px;
                position:relative;
                padding:15px 0;
                /*background-color:pink;*/
                border-bottom:2px solid #424242;
            }
            #contentTitle #titleInfo{
                /*background:violet;*/
                position:absolute;
                top:15px;
            }
            #contentTitle #spotName{
                /*background-color:bisque;*/
                font-size:25px;
                font-weight:700;
                margin-right:10px;
                vertical-align:middle;
            }
            #contentMid .rating_avg{
                width:35px;
                vertical-align:middle;
                margin-right:5px;
                cursor:pointer;
            }
            #contentMid .rating_avg_pct{
                vertical-align:middle;
                font-size:18px;
                font-weight:500;
            }
            #contentMid #evaluation{
                vertical-align: middle;
                padding:5px 15px;
                border:1px solid #424242;
                margin-left:15px;
                cursor:pointer;
            }
            #contentMid #evaluation:hover{
                background-color:#FEBD39;
                border:1px solid #FEBD39;
            }
            #contentTitle .title_btn{
                /*background-color: aquamarine;*/
                position:absolute;
                bottom:15px;/**/
                right:0;   
            }
            #contentTitle .title_btn span:first-child{
                /*margin-right:10px;*/
            }
            #contentTitle .title_btn a{
                /*background-color:beige;*/
                color:#424242;
                text-decoration:none;
            }
            #contentTitle .title_btn a:hover{
                color:#FEBD39;
                font-weight:500;
            }
            .revise{
                margin-right:10px;
            }
            .same_user{
                display:none;
            }
            .request_revise{
            	padding-right:10px;
            }
            #contentMid #spotInfo{
                position:relative;
                /*background:burlywood;*/
                width:960px;
                /*height:300px;*/
                overflow:hidden;
                padding:10px 0;
            }
            #spotInfo #spotInfoRegdate{
                position:absolute;
                top:15px;
                right:15px; 
                font-size:14px;
            }
            #spotInfo dl{
                padding-left:15px;
            }
            #spotInfo dt{
                /*background-color:aqua;*/
                width:150px;
                padding:5px 0;
                float:left;
            }
            #spotInfo dd{
                /*background-color:azure;*/
                width:770px;
                padding:5px 0;
                float:left;
            }
            #spotInfo dd:last-child{
                padding-top:2px;
            }
            #spotInfo .spot_link{
                color:#424242;
                text-decoration:none;
            }
            #spotInfo .spot_link:hover{
                color:#FEBD39;
            }
            #spotInfo .spot_explain{
                line-height:25px;
            }
            #contentBottom{
                position:relative;
                /*background-color:aquamarine;*/
                width:960px;
                height:410px;
                margin:10px 0;
            }
            #contentBottom #map{
                background-color:pink;
                width:675px;
                height:487px;
                position:absolute;
            }
            /*
            #contentBottom #spotMap img{
                width:675px;
                height:487px;
            }
            */
            #contentBottom #tagBox{
                background-color:#FFF8E1;
                width:225px;
                /*height:380px;*/
                padding:15px 15px 20px 15px;
                margin-left:30px;
                position:relative;
                left:675px;
                top:-487px;
            }
            #tagBox #tagTitle{
                background-color:#FEBD39;
                padding:8px 10px 8px 30px;
                position:relative;
                display:inline-block
            }
            #tagBox #tagTitle::before{
                content:"";
                width:0;
                height:0;
                position:absolute;
                top:11px;
                left:8px;
                border:5px solid #FFF8E1;
                border-radius:5px;
            }
            #tagBox #tagTitle::after{
                content:"";
                width:0;
                height:0;
                position:absolute;
                top:0;
                right:-32px;
                border-left:16px solid #FEBD39;
                border-right:16px solid transparent;
                border-top:16px solid transparent;
                border-bottom:16px solid transparent;
            }
            #tagBox .tag_wrap{
                /*background-color:violet;*/
                position:relative;
                width:240px;
                /*height:318px;*/
                top:15px;
            }
            #tagBox .tag_list{
                background-color:#FEBD39;
                display:inline-block;
                padding:8px 15px;
                margin:0px 10px 10px 0px;
            }
            #reviewWrap{
                /*background-color:azure;*/
                width:960px;
                margin-top:100px; /* 50px */
            }
            #reviewWrap #reviewTitle{
                /*background-color:skyblue;*/
                font-size:20px;
                padding:15px 0;
                border-bottom:2px solid #424242;
            }
            #reviewWrap #writeReview{
                /*background-color:skyblue;*/
                width:960px;
                height:180px;
                padding:20px 0 10px 0;
                position:relative;
            }
            .review_profile{
                /*background-color:bisque;*/
                width:100px;   
                height:180px;
                position:absolute;
                text-align:center;
            }
            .review_profile .writer_level{
                width:100px;
            }
            .review_profile .writer_image{
                width:80px;
                border-radius:50px;
                position:absolute;
                top:0;
                left:0;/**/
            }
            /* 리뷰작성부분 프로필 */
            .review_profile .writer_image_nolink{
                width:80px;
                border-radius:50px;
                position:absolute;
                top:17.5px;
                left:10px;/**/
            }
            .minus{
                display:none;
            }
            .review_profile .plus_bee{
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
            .writer_profile{
                width:100px;
                height:115px;
                background:url(/img/level1.png);
                background-repeat:no-repeat;
                background-position:center 0;
                background-size:100px 115px; 
            }
            .writer_profile a{
                width:80px;
                height:80px;
                /*background:red;*/
                position:absolute;
                left: 10px;
                top: 17.5px;
                z-index:1000;
                overflow: hidden;
            }
            .writer_profile a:hover .plus_bee {
                top:0;
            }
            .review_profile .writer_nickname{
                /*background-color:aquamarine;*/
                text-align:center;
                font-size:16px;
                padding:15px 0 10px 0;
                font-weight:500;
            }
            .writer_nickname .writer_mypage{
                color:#424242;
                text-decoration:none;
            }
            .writer_nickname .writer_mypage:hover{
                color:#FEBD39;
                font-weight:500;
            }
            .review_profile .best{
                background-color:#F44336;
                text-align:center;
                color:#FFF;
                font-weight:500;
                font-size:11px;
                padding:2px 6px;  
            }
            #writeReview #reviewBox{
                position: absolute;
                top:20px;
                right:0;
            }
            #writeReview #reviewBox .review_write_area{
                /*background-color:aquamarine;*/
                width:810px;
                height:80px;
                margin-left:30px;
                resize:none;
                padding:10px;
                font-family:'Noto Sans KR', sans-serif;
                font-size:17px;
                border:1px solid #424242;
            }
            #writeReview #reviewBox #reviewFormBtm{
                /*background-color:burlywood;*/
                width:832px;
                height:70px;
                position:absolute;
                right:0;
            }
            #reviewFormBtm .uploaded_img_list{
                position:absolute;
                top:9px;
                left:0;
            }
            #reviewFormBtm .uploaded_img{
                width:50px;
                height:50px;
                border:1px solid #424242;
                float:left;
                margin-right:12px;
                text-align:center;
                line-height:48px;
                cursor:pointer;
            }
            #reviewFormBtm label{
                background-color:#FFF;
                width:50px;
                height:50px;
                display:block;
                text-align:center;
                line-height:48px;
                cursor:pointer;
            }
            #reviewFormBtm #imgUpload{
                display:none;
            }
            #reviewFormBtm .uploaded_img img{
                width:50px;
                height:50px;
            }
            #reviewFormBtm .review_register{
                position:absolute;
                right:0;
                bottom:9px;
                background-color:#424242;
                color:#FFF;
                font-size:15px;
                border-radius:0;
                border:0;
                width:60px;
                height:35px;
                vertical-align:middle;  
                cursor:pointer;
            }
            #review #reviewList{
                /*background-color:aquamarine;*/
                width:960px;
            }
            #alignReviews {
                overflow:hidden;
                /*background-color:violet;*/
                padding:60px 0 15px 0;
                border-bottom:2px solid #424242;
                position:relative;
            }
            #alignReviews ul{
                position:absolute;
                right:0;
                bottom:15px;
            }
            #alignReviews li{
                float:left;
                /*background-color:aqua;*/
                text-decoration:none;
                color:#424242;
                padding:0 15px;
            }
            #alignReviews li:first-child{
                border-right:1px solid #424242;
            }
            #alignReviews li:last-child{
                padding-right:0px;
            }
            #alignReviews .on{
                color:#FEBD39;
                font-weight:700;
            }
            #reviewList #bestReviewList{
                padding:12px 0;
                border-bottom:2px solid #424242;
            }
            #reviewList #reviewAll{
                padding:12px 0 0px 0;
            }
            #reviewList #bestReviewList li, #reviewList #reviewAll li{
                /*background-color:darkcyan;*/
                width:960px;
                list-style:none;
                padding:30px 0 10px 0; /*  */
                position:relative;
            }
            .review_content{
                background-color:#FFECB3;
                width:800px;
                position:relative;  
                display:inline-block;
                margin-left:30px;
                padding:5px 15px 60px 15px; /*  */
                left:100px;
                min-height:115px;
            }
            .review_content p{
                /*background-color:deepskyblue;*/
                width:800px; /*  */
                line-height:25px;
                padding:10px 0; 
                position:relative;
            }
            .review_content time{
                position:absolute;
                top:-21px;
                left:0;
                font-size:14px;
            }
            .review_content .report{
                position:absolute;
                top:-20px;
                right:0;
                font-size:13px;
            }
            .review_content .report a:hover{
                color:#FEBD39;
                font-weight:500;
            }
            .review_content .revise_or_delete{
                position:absolute;
                top:-20px;
                right:0px;
                font-size:13px;
            }
            .review_content .revise_or_delete a:hover{
                color:#FEBD39;
                font-weight:500;
            }
            .review_content .review_rep_image{
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
            .review_content .review_rep_image.off {
            	cursor:not-allowed;
            }
            .review_content .recommend_wrap{
                /*background-color:violet;*/
                position:absolute;
                bottom:15px;
                right:85px; /*  */
            }
            .recommend_wrap .recommend_btn{
                background-color:#FFF;
                display:inline-block;
                width:98px;
                border:1px solid #424242;
                padding:8px 0;
                cursor:pointer;
                text-align:center;
                margin-right:5px;
            }
            .recommend_btn img{
                width:25px;
                vertical-align:middle;
                margin-right:5px;
            }
            .recommend_wrap .recommend_btn .venom{
                width:22px;
            }
            .recommend_btn .recommend_cnt{
                vertical-align:middle;
            }
            #evaluationPopup, #resultPopup{
                width:100%;
                height:100%;
                z-index:9999;
                position:fixed;
                left:0;
                top:0;
                background:url(/img/evaluation_popup1.jpg);
                background-repeat:no-repeat;
                background-position:center;
                background-color:rgba(0, 0, 0, .6);
                display:none;
            }
            #evaluationOptions, #resultOptions{
                /*background-color:rgba(0,0,0, .2);*/
                width:701px;
                height:500px;
                position:fixed;
                left:50%;
                top:50%;
                margin: -250px 0 0 -350.5px;
            }
            #evaluationPopupTitle, #resultPopupTitle{
                /*background-color:pink;*/
                font-size:22px;
                font-weight:600;
                text-align:center;
                padding:40px 0 30px 0;
            }
            #evaluationHoneypot, #evaluationBrokenpot{
                width:80px;
                position:absolute;
                bottom:225px;
            }
            #honeypotOption a:hover, #brokenpotOption a:hover{
                color:#FEBD39;
                font-weight:700;
            }
            #evaluationHoneypot{
                background:url(/img/honeypot.png);
                background-repeat:no-repeat;
                background-size:contain;
                width:80px;
                height:70.39px;
                position:absolute;
                left:135px;
                bottom:228px;
            }
            #evaluationBrokenpot{
                background:url(/img/brokenpot.png);
                background-repeat:no-repeat;
                background-size:contain;
                width:80px;
                height:66.66px;
                position:absolute;
                right:135px;
                bottom:228px;
                /*background-color:aqua;*/
            }
            #honeypotOption {
                background:url(/img/evaluation_popup2.png);
                background-repeat:no-repeat;
                /*background-color:rgba(255, 0, 0, .5);*/
                width:350px;
                height:285px;
                position:absolute;
                left:-135px;
                top:-106px;
                font-size:18px;
                display:none;/**/
            }
            #brokenpotOption {
                background:url(/img/evaluation_popup2.png);
                background-repeat:no-repeat;
                /*background-color:rgba(0, 255, 0, .5);*/
                width:350px;
                height:285px;
                position:absolute;
                top:-109px;
                right:-135px;
                font-size:18px;
                display:none;/**/
            }
            #evaluationHoneypot:hover #honeypotOption{
                display:block;
            }
            #evaluationBrokenpot:hover #brokenpotOption{
                display:block;
            }
            .selected_reason{
                /*background-color:rgba(100%, 0%, 0%, .6);*/
                width:80px;
                height:40px;
                position:absolute;
                top:20px;
                text-align:center;
                font-size:19px;
                font-weight:700;
                line-height:40px;
            }
            .taste{
                position:absolute;
                top:45px;
                left:166px;
            }
            .facility{
                position:absolute;
                top:100px;
                left:60px;
            }
            .price{
                position:absolute;
                top:100px;
                left:260px;
            }
            .service{
                position:absolute;
                bottom:90px;
                left:43px;
            }
            .satisfaction{
                position:absolute;
                bottom:45px;
                left:150px;    
            }
            .accessibility{
                position:absolute;
                bottom:90px;
                left:260px;
            }
            #evaluationOptions button {
                position: absolute;
                bottom:45px;
                left:300.5px;
                width:100px;
                border:0;
                font-size:17px;
                font-weight:500;
                padding:8px 10px;
                background-color:#FEBD39;
                color:#FFF;
                cursor:pointer;
            }
            #copyURLpopup{
                z-index:1000;
                position: fixed;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, .8);
                left: 0;
                top: 0;
                display: none;
            }
            #URLcontainer{
                position: absolute;
                width: 400px;
                height: 80px;
                background: #fff;
                padding: 30px;
                top: 50%;
                left: 50%;
                margin: -70px 0 0 -230px;
                font-size: 22px;
                z-index: 1;
                /*text-align: center;*/
            }
            #URLcontainer input{
                width: 350px;
                height: 20px;
                margin-top: 20px;
                font-size: 18px;
            }
            
            /* 리뷰 사진 목록 팝업 */
            #reviewDetailPopup {
	            position:fixed;
	            width:100%;
	            height:100%;
	            left:0;
	            top:0;
	            background:rgba(0,0,0,.8);
	            z-index:3000;
	            display:none;
	        }
	        #popupArea {
	            position:fixed;
	            /*display: none;*/
	            z-index:4000;
	            display:none;
	        }
	        #reviewImageBox {
	            width:960px;
	            height:600px;
	            border:1px solid #424242;
	            background-color:#FFF;
	            position: fixed;
	            top:50%;
	            left:50%;
	            margin:-300px 0 0 -480px;
	        }
	        #reviewImageBox .image_box{
	            width:565px;
	            height:475px;
	            /*border:1px solid black;*/
	            position:absolute;
	            left:30px;
	            top:30px;
	            background-size:contain;
	            background-repeat:no-repeat;
	            background-position:center;
	        }
	        #slide {
	            width:565px;
	            height:475px;
	            position:relative;
	            overflow:hidden;
	        }
	        .item {
	            /*background:red;*/
	            width:565px;
	            height:475px;
	            position: absolute;
	        }
	        .item:nth-child(1) {
	            background:url(/img/아이린2.PNG);
	            background-repeat:no-repeat;
	            background-size:565px 475px;
	        }
	        .item:nth-child(2) {
	            left:565px;
	            background:url(/img/아이린3.PNG);
	            background-repeat:no-repeat;
	            background-size:565px 475px;
	        }
	        #reviewImageBox .image_box button {
	            background:transparent;
	            outline:none;
	            border:none;
	            cursor:pointer;
	            font-size:40px;
	            position:absolute;
	            width:46px;
	            height:56px;
	            top:50%;
	            margin-top:-23px;
	            color:#FFF;
	            background-color:rgba(0,0,0,0.3);
	            text-shadow:1px 1px 1px #424242;
	        }
	        .image_box .right_btn{
	            right:0px;
	        }
	        #imageListBox {
	            position:absolute;
	            left:30px;
	            bottom:30px;
	        }
	        #imageListBox li {
	            display:inline-block;
	            width:44.9px;
	            height:31px;
	            border:2px solid #999;
	            bottom:0;
	            cursor:pointer;
	            opacity:.5;
	            margin-right:8.5px;
	        }
	        #imageListBox li img{
	            width:44.9px;
	            height:31px;
	        }
	        #imageListBox li.now {
	            border: 2px solid #FEBD39;
	            opacity: 1;
	        }
	        #reviewImageBox #reviewBox {
	            width:300px;
	            height:538px;
	            border:1px solid black;
	            position:absolute;
	            right:0;
	            margin:30px 30px 30px 0;
	        }
	        #reviewImageBox #reviewBox .review_title{
	            width:300px;
	            height:50px;
	            line-height:50px;
	            border-bottom:1px solid black;
	            text-align:center;
	            font-size:20px;
	            font-weight:600;
	        }
	        #reviewImageBox #reviewBox .review_info{
	            /*background-color:aquamarine;*/
	            padding:25px 15px;
	            position:relative;
	        }
	        #reviewImageBox #reviewBox .review_info .writer_profile{
	            width:30px;
	            height:34px;
	            background:url(/img/level1.png);
	            background-repeat:no-repeat;
	            background-position:center 0;
	            background-size:30px 34px; 
	            position:relative;
	        }
	        #reviewImageBox #reviewBox .review_info .writer_image{
	            width:22px;
	            height:22px;
	            border-radius:25px;
	            position:absolute;
	            top:6px;
	            left:4px;
	        }
	        #reviewImageBox #reviewBox time{
	            /*background-color:bisque;*/
	            font-size:13px;
	            padding-left:15px;
	        }
	        #reviewImageBox #reviewBox .review_info .profile_info{
	            /*background-color:burlywood;*/
	            position:absolute;
	            left:50px;
	            top:31px;
	        }
	        #reviewImageBox .profile_info .writer_nickname{
	            font-size:16px;
	            margin-right:25px;
	            vertical-align:middle;
	            font-weight:500;
	        }
	        #reviewImageBox .profile_info .honey_num, .profile_info .venom_num{
	            font-size:15px;
	            vertical-align:middle;
	            margin-right:10px;
	        }
	        #reviewImageBox .profile_info .honey_num img{
	            width:16px;
	            vertical-align:middle;
	            margin-right:5px;
	        }
	        #reviewImageBox .profile_info .venom_num img{
	            width:14px;
	            vertical-align:middle;
	            margin-right:5px;
	        }
	        #reviewImageBox #reviewBox .review_cmt{
	            /*background-color:aqua;*/
	            word-break:break-all;
	            width:270px;
	            height:320px;
	            padding:0 15px 15px 15px;
	            margin-top:15px;
	            font-size:14px;
	            line-height:21px;
	            overflow-y:scroll;
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
                margin:10px 0 20px 0;
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
            #reviewFormBtm .label {
			background-color: #FFF;
			width: 50px;
			height: 50px;
			display: block;
			text-align: center;
			line-height: 48px;
			cursor: pointer;
			position: absolute;
			top: 0;
			background: transparent;
			.review_info span{
			vertical-align:super;
			}
			.added_image{
			position: relative;
			}
        </style>
    </head>
    <body>
        <c:import url="/WEB-INF/view/template/header.jsp"></c:import>
                    <div id="remoteControl">
                        <div id="openOrClose"><i class="fa fa-angle-right"></i></div>
                        <ul>
                            <li><a id="up" href=""><i class="fa fa-angle-up"></i></a></li>
                            <li><a href="">북마크</a></li>
                            <li><a id="shareLink" href="">링크 공유</a></li>
                            <li><a id="down" href=""><i class="fa fa-angle-down"></i></a></li>
                        </ul>
                    </div><!-- // #remoteControl -->   
                    <div id="contentTop">
                        <div id="bookmark"><i class="fa fa-bookmark-o"></i></div> <!-- fa fa-bookmark -->
                        <div id="spotPic">
                            <img src="/img/place/detail/${place.photo}" alt="${place.name} 대표이미지" />
                            <span>사진 더보기</span>
                        </div> <!-- // #spotPic -->
                        <div id="userInfo">
                            <p class="user_title">땅벌</p>                            
                            <div class="writer_profile">
                                <a href="">    
                                    <img class="writer_image" src="/img/profile/${user.profile}" />
                                    <div class="plus_bee">
                                        <i class="fa fa-plus-circle plus"></i>
                                        <i class="fa fa-minus-circle minus" ></i>
                                    </div>
                                </a>
                            </div> <!-- // .writer_profile -->    
                            <p class="user_nickname"><a href="">${user.nick}</a></p>
                            <p class="found_spot">꿀 바른 땅 <span class="found_spot_num">${count}</span>개</p>
                        </div> <!-- // #userInfo -->
                    </div> <!-- // #contentTop -->
                    <div id="contentMid">
                        <div id="contentTitle"> 
                            <div id="titleInfo">
                                <span id="spotName">${place.name}</span>
                                <img class="rating_avg" src="/img/honeypot.png" alt="총 평가 꿀단지" />
                                <span class="rating_avg_pct">85%</span>
                                <span id="evaluation">평가하기</span>
                            </div>
                            <div class="title_btn">
                                <!-- 글쓴이가 이 글에 들어왔을 때 -->
                                <div class="same_user">
                                    <span class="revise"><a href="">수정</a></span>
                                    <span class="delete"><a href="">삭제</a></span>
                                </div>
                                <!-- 글쓴이 외 사람들이 이 글을 볼 때 -->
                                <div class="different_user">
                                    <span class="request_revise"><a href="">수정요청</a></span>
                                    <span class="report"><a href="">신고</a></span>
                                </div>
                            </div> <!-- //#titleBnt -->
                        </div> <!-- // #contentTitle -->
                        <div id="spotInfo">
                            <span id="spotInfoRegdate"><time>${place.regdate}</time> 등록됨</span>
                            <dl>
                                <dt>카테고리</dt>
                                <dd>
	                                <c:forEach items="${categories}" var="category">
	                                		<span class="categories">${category.name} &gt;</span>
	                                </c:forEach>
                                </dd>
                                <dt>주소</dt>
                                <dd>${place.addr}</dd>
                                <dt>가격대</dt>
                                <c:choose>
	                                <c:when test="${place.price == null}">
	                                	<dd>&nbsp;</dd>
	                                </c:when>
	                                <c:otherwise>
	                                	<dd>${place.realPrice}</dd>
	                                </c:otherwise>
                                </c:choose>
                                <dt>영업시간</dt>
                                <c:choose>
	                                <c:when test="${place.bhour == null}">
	                                	<dd>&nbsp;</dd>
	                                </c:when>
	                                <c:otherwise>
	                                	<dd>${place.bhour}</dd>
	                                </c:otherwise>
                                </c:choose>
                                <dt>휴일</dt>
                                <c:choose>
	                                <c:when test="${place.holiday == null}">
	                                	<dd>&nbsp;</dd>
	                                </c:when>
	                                <c:otherwise>
	                                	<dd>${place.holiday}</dd>
	                                </c:otherwise>
                                </c:choose>
                                <dt>전화번호</dt>
                                <c:choose>
	                                <c:when test="${place.realPhone == null}">
	                                	<dd>&nbsp;</dd>
	                                </c:when>
	                                <c:otherwise>
	                                	<dd>${place.realPhone}</dd>
	                                </c:otherwise>
                                </c:choose>
                                <dt>주차</dt>
                                <c:choose>
	                                <c:when test="${place.parking == null}">
	                                	<dd>&nbsp;</dd>
	                                </c:when>
	                                <c:otherwise>
	                                	<dd>${place.realParking}</dd>
	                                </c:otherwise>
                                </c:choose>
                                <dt>웹사이트</dt>
                                <c:choose>
	                                <c:when test="${place.web == null}">
	                                	<dd>&nbsp;</dd>
	                                </c:when>
	                                <c:otherwise>
	                                	<dd><a class="spot_link" href="http://${place.web}" target="_blank">${place.web}</a></dd>
	                                </c:otherwise>
                                </c:choose>
                                <dt>설명</dt>
                                <dd class="spot_explain">${place.exp}</dd>
                            </dl>
                        </div>
                    </div> <!-- // #contentMid -->
                    <div id="contentBottom">
                        <div id="map"> <!-- spotMap -->
                            
                        </div> <!-- // #spotMap -->
                        <div id="tagBox">
                            <span id="tagTitle">태그</span>
                            <div class="tag_wrap">
                            	<c:forEach items="${tagList}" var="tag">
                            		<span class="tag_list">#${tag.tag}</span>
                            	</c:forEach>
                            </div>
                        </div> <!-- // #tag -->
                    </div> <!-- // #contentBottom  -->
                    <div id="reviewWrap">
                        <p id="reviewTitle">리뷰</p>
                        <div id="writeReview">
                            <div class="review_profile">
                                <div class="writer_profile">    
                                    <img class="writer_image_nolink" src="/img/profile_default.png" />
                                </div> <!-- // .writer_profile -->    
                                <p class="writer_nickname">
                                    벌꿀2
                                </p>
                            </div> <!-- // .review_profile -->
                            <div id="reviewBox">
                                <form id="reviewForm" action="/review/write" method="post" >
                                	<input type="hidden" name='placeNo' value='${place.no}' />
                                    <textarea class="review_write_area" placeholder="리뷰를 남겨주세요-!" name="reviewContent"></textarea>
                                    <div id="reviewFormBtm">
                                        <ul class="uploaded_img_list">
                                            <li class="uploaded_img btn_upload">
                                                <label for="imgUpload">
                                                    <i class="fa fa-plus-circle"></i>
                                                    <input name="" id="imgUpload" type="file" />
                                                </label>
                                            </li>
                                        </ul>
                                        <button class="review_register">등록</button>
                                    </div> <!-- // #reviewFormBtm -->
                                </form>
                            </div> <!-- // #reviewBox -->
                        </div> <!-- // #writeReview -->
                        <div id="reviewList">
                        	<c:if test="${!empty reviewList}"> 
                            <div id="alignReviews">
                                <ul>
                                    <li><a <c:if test="${type=='new'}">class="on"</c:if> href="/place/${no}/new/page/1">최신순</a></li> 
                                    <li><a <c:if test="${type=='popular'}">class="on"</c:if> href="/place/${no}/popular/page/1">인기순</a></li>
                                </ul>
                            </div>
                            </c:if>
                            <c:if test="${!empty bestReviewList}">
                            <div id="bestReviewList">
                                <ul>
                                	<c:forEach items="${bestReviewList}" var="bestReview">
                                    <li>
                                        <div class="review_profile">
                                            <div class="writer_profile" style="background-image:url(/img/level${bestReview.lvl}.png)"> 
                                                <a href="">    
                                                    <img class="writer_image" src="/img/profile/${bestReview.profile}" />
                                                    <div class="plus_bee">
                                                        <i class="fa fa-plus-circle plus"></i>
                                                        <i class="fa fa-minus-circle minus" ></i>
                                                    </div>
                                                </a>
                                            </div> <!-- // .writer_profile -->    
                                            <p class="writer_nickname">
                                                <a class="writer_mypage" href="">${bestReview.nick}</a>
                                            </p>
                                            <span class="best">BEST</span>
                                        </div><!-- // .review_profile --><!--
                                     --><div class="review_content">
                                            <time>${bestReview.regdate}</time>
                                            <!-- 글쓴 사람이 로그인 했을 때는 수정 / 삭제가 보여야 함 -->
                                            <div class="revise_or_delete same_user">
                                                <span class="revise"><a href="">수정</a></span>
                                                <span class="delete"><a href="">삭제</a></span>
                                            </div>   
                                            <!-- 글쓴이 외 사람들이 이 글을 볼 때 -->
                                            <div class="different_user">
                                                <span class="report"><a href="">신고</a></span>
                                            </div>
                                            <p>${bestReview.content}</p>
                                            <div data-no="${bestReview.no}" class="review_rep_image <c:if test="${bestReview.picCnt == 0}">off</c:if>" style="background-image:url(/img/place_review/${bestReview.pic})">
                                                <!-- <img src="" alt="" /> -->
                                                <c:if test="${bestReview.picCnt != 0}">
                                                	<span>+ <span class="img_cnt">${bestReview.picCnt}</span></span>
                                                </c:if>
                                            </div> <!-- // .review_rep_image -->
                                            <div class="recommend_wrap">
                                                <span class="recommend_btn">
                                                    <img class="honeypot" src="/img/honeypot.png" alt="추천"/>
                                                    <span class="recommend_cnt">${bestReview.honey}</span>
                                                </span>
                                                <span class="recommend_btn">
                                                    <img class="venom" src="/img/venom.png" alt="추천"/>
                                                    <span class="recommend_cnt">${bestReview.venom}</span>
                                                </span>
                                            </div> <!-- // .recommend_wrap -->
                                        </div> <!-- // .review_content -->
                                    </li>
                                    </c:forEach>
                                </ul>
                            </div> <!-- // #bestReviewList -->
                            </c:if>
                            <div id="reviewAll">
                                <ul>
                                <c:forEach items="${reviewList}" var="review">
                                    <li>
                                        <div class="review_profile">
                                            <div class="writer_profile" style="background-image:url(/img/level${review.lvl}.png)">
                                                <a href="">    
                                                    <img class="writer_image" src="/img/profile/${review.profile}" />
                                                    <div class="plus_bee">
                                                        <i class="fa fa-plus-circle plus"></i>
                                                        <i class="fa fa-minus-circle minus" ></i>
                                                    </div>
                                                </a>
                                            </div> <!-- // .writer_profile -->    
                                            <p class="writer_nickname">
                                                <a class="writer_mypage" href="">${review.nick}</a>
                                            </p>
                                        </div><!-- // .review_profile --><!--
                                     --><div class="review_content">
                                            <time>${review.regdate}</time>
                                            <!-- 글쓴 사람이 로그인 했을 때는 수정 / 삭제가 보여야 함 -->
                                            <div class="revise_or_delete same_user">
                                                <span class="revise"><a href="">수정</a></span>
                                                <span class="delete"><a href="">삭제</a></span>
                                            </div>   
                                            <!-- 글쓴이 외 사람들이 이 글을 볼 때 -->
                                            <div class="different_user">
                                                <span class="report"><a href="">신고</a></span>
                                            </div>
                                            <p>${review.content}</p>
                                            <div data-no="${review.no}" class="review_rep_image <c:if test="${review.picCnt == 0}">off</c:if>" style="background-image:url(/img/place_review/${review.pic})">
                                                <!-- <img src="" alt="" /> -->
                                                <c:if test="${review.picCnt != 0}">
                                                <span>+ <span class="img_cnt">${review.picCnt}</span></span>
                                                </c:if>
                                            </div> <!-- // .review_rep_image -->
                                            <div class="recommend_wrap">
                                                <span class="recommend_btn">
                                                    <img class="honeypot" src="/img/honeypot.png" alt="추천"/>
                                                    <span class="recommend_cnt">${review.honey}</span>
                                                </span>
                                                <span class="recommend_btn">
                                                    <img class="venom" src="/img/venom.png" alt="추천"/>
                                                    <span class="recommend_cnt">${review.venom}</span>
                                                </span>
                                            </div> <!-- // .recommend_wrap -->
                                        </div> <!-- // .review_content -->
                                    </li>
                                </c:forEach>
                                </ul>
                            </div> <!-- // #reviewAll -->
                        </div> <!-- // #reviewList -->
                        <c:if test="${!empty reviewList}">
                        <div class="paginate">
                            ${paginate}
                        </div> <!-- // .paginate -->
                        </c:if>
                    </div> <!-- // #reviewWrap -->
                    <div id="evaluationPopup">
                        <div id="evaluationOptions">
                            <h3 id="evaluationPopupTitle">평가하기</h3>
                            <div id="evaluationHoneypot">
                                <div id="honeypotOption">
                                    <a class="taste" href="">맛</a>
                                    <a class="facility" href="">시설</a>
                                    <a class="price" href="">가격</a>
                                    <a class="service" href="">서비스</a>
                                    <a class="satisfaction" href="">만족도</a>
                                    <a class="accessibility" href="">접근성</a>
                                </div> <!-- // #honeypotOption -->
                                <div class="selected_reason"></div><!-- // .selected_reason -->
                            </div> <!-- // #evaluationHoneypot -->
                            <div id="evaluationBrokenpot">
                                <div id="brokenpotOption">
                                    <a class="taste" href="">맛</a>
                                    <a class="facility" href="">시설</a>
                                    <a class="price" href="">가격</a>
                                    <a class="service" href="">서비스</a>
                                    <a class="satisfaction" href="">만족도</a>
                                    <a class="accessibility" href="">접근성</a>
                                    <!--   
                                    <span class="taste"><a href="">맛</a></span>
                                    <span class="facility"><a href="">시설</a></span>
                                    <span class="price"><a href="">가격</a></span>
                                    <span class="service"><a href="">서비스</a></span>
                                    <span class="satisfaction"><a href="">만족도</a></span>
                                    <span class="accessibility"><a href="">접근성</a></span>
                                    -->
                                </div> <!-- // #honeypotOption -->
                                <div class="selected_reason"></div><!-- // .selected_reason -->
                            </div> <!-- // #evaluationBrokenpot -->
                            <button>완료</button>
                        </div> <!-- // #evaluationOptions -->
                    </div><!-- // #evaluationPopup -->
                    <div id="resultPopup">
                        <div id="resultOptions">
                            <h3 id="resultPopupTitle">결과보기</h3>
                        </div> <!-- // #evaluationOptions -->    
                    </div><!-- // #resultPopup -->
                    <!-- url복사 팝업 -->
                    <div id="copyURLpopup">
                        <div id="URLcontainer">
                            <p>클릭하여 URL을 복사하세요.</p>
                            <div style="display:none;">
                                <textarea id="myClipboard"></textarea>
                            </div>
                            <input id="url" type="text" value="text to clipboard." />
                        </div> <!-- // #URLcontainer -->
                    </div> <!-- #copyURLpopup -->
                    <!-- 리뷰 사진 목록 팝업 -->
                    <div id="reviewDetailPopup"></div><!-- // #reviewDetailPopup -->
					    <div id="popupArea">
					        <div id="reviewImageBox" class="popup_content">
					            <h2 class="screen_out">리뷰 이미지 목록보기</h2>
					            <div class="image_box" class="popup_content">
					                <div id="slide">
					                    <div class="item"></div>
					                    <div class="item"></div>
					                </div> <!-- // #slide -->
					                <button class="right_btn"><i class="fa fa-chevron-right"></i></button>
					                <button class="left_btn"><i class="fa fa-chevron-left"></i></button>
					            </div> <!-- // .image_box -->
					            <div id="imageListBox" class="popup_content">
					                <h3 class="screen_out">리뷰이미지 목록</h3>
					                <ul class="popup_content imgs">
					                </ul>
					            </div><!-- // #imageListBox -->
					            <div id="reviewBox">
					                <div class="review_title"></div>
					                <div class="review_info">
					                    <div class="writer_profile">
					                        <img class="writer_image" />
					                    </div> <!-- // .writer_profile -->
					                    <div class="profile_info">    
					                        <span class="writer_nickname"></span>
					                        <span class="honey_num"><img src="/img/honeypot.png"><span class="honey_number"></span></span>
					                        <span class="venom_num"><img src="/img/venom.png"><span class="venom_number"></span></span>
					                    </div> <!-- // .profile_info -->
					                </div> <!-- // .review_info -->
					                <time></time>
					                <div class="review_cmt"></div> <!-- // .review_cmt -->
					            </div> <!-- // #reviewBox -->
					        </div> <!-- // #reviewImageBox -->
					    </div><!-- #popupArea -->
        <c:import url="/WEB-INF/view/template/footer.jsp"></c:import>        
        <script src="/js/jquery.js"></script>
        <script src="/js/underscore-min.js"></script>
        <script src="/js/moment-with-locales.js"></script>
        <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=h4zSgnvM6iBZzoyUUgt4&submodules=geocoder"></script>
        <script>
        
	        var imgs;
	        var info;
	        var idx = 0;
        
            // 리모컨
            $('#openOrClose').click(function(){
                if($("#remoteControl").css('right') == '0px') {
                    $('#remoteControl').css('right', '-82px');
                    $('#openOrClose i').removeClass('fa fa-angle-right').addClass('fa fa-angle-left');
                } else{
                    $('#remoteControl').css('right', '0px');
                    $('#openOrClose i').removeClass('fa fa-angle-left').addClass('fa fa-angle-right');
                }
            }); // click() end
            
            $('#up').click(function(e){
                e.preventDefault();
                // alert('up');
                $('html, body').animate({scrollTop:0}, 600);
            }); // click() end
            
            $('#down').click(function(e){
               e.preventDefault();
               // alert('down');
               $('html, body').animate({scrollTop:$(document).height()}, 1000);
            }); // click() end
            
            // URL 링크 공유 팝업 띄우기
            $('#shareLink').click(function(e){
                e.preventDefault();
                $('#copyURLpopup').fadeIn(500);
            }); // click() end
            
            // URL 복사 
            var $copyURLpopup = $("#copyURLpopup");
            var $url = $("#url");

            // url 받아오기
            var url = window.location.href;

            $("#shareLink").on("click", function () {
                $("#copyURLpopup").show();
                $url.val(url);
            }); // on() end

            function CopyToClipboard (tagToCopy, textarea){
                textarea.parentNode.style.display = "block";
                var textToClipboard = "";
                if ("value" in tagToCopy){ 
                    textToClipboard = tagToCopy.value; 
                } else{textToClipboard = 
                       (tagToCopy.innerText) ? tagToCopy.innerText : tagToCopy.textContent;}

                var success = false;

                if (window.clipboardData){
                    window.clipboardData.setData("Text", textToClipboard);
                    success = true;
                } else {
                    textarea.value = textToClipboard;
                    var rangeToSelect = document.createRange();
                    rangeToSelect.selectNodeContents(textarea);
                    var selection = window.getSelection();
                    selection.removeAllRanges();
                    selection.addRange(rangeToSelect);
                    success = true;

                    try {
                        if(window.netscape && (netscape.security && netscape.security.PrivilegeManager)){
                            netscape.security.PrivilegeManager.enablePrivilege( "UniversalXPConnect" );
                        }

                        textarea.select();
                        success = document.execCommand( "copy", false, null );
                    } catch ( error ){ 
                        success = false; 
                    }
                }
                
                textarea.parentNode.style.display = "none";
                textarea.value = "";

                if (success){ 
                    alert('클립보드에 복사되었습니다. \n "Ctrl+v"를 사용하여 원하는 곳에 붙여넣기 하세요.'); 
                } else { 
                    alert( " 복사하지 못했습니다. " ); 
                }

                /*
                if ( success ){ alert( ' The texts were copied to clipboard. \n\n Paste it, using "Ctrl + v". \n ' ); }
                else { alert( " It was failed to copy. \n " ); }
                */
                }//클립보드에 복사

                $url.on("click", function () {
                $copyURLpopup.on("click", function () {
                $copyURLpopup.hide();
                return false;
                }); // 바깥 클릭시 팝업 닫힘
                CopyToClipboard( this, myClipboard );
                $copyURLpopup.hide();
            }); // 클립보드에 복사후 팝업 닫기
            
            // 결과보기 팝업
            $('#titleInfo .rating_avg').click(function(){    
                // 팝업창 열림
                $('#resultPopup').fadeIn(500);
                
                // 팝업창 닫힘
                $('#resultPopup').click(function(){
                    $('#resultPopup').fadeOut(500);
                }); // click() end
            }); // click() end
            
            // 평가하기 버튼 눌렀을 때
            $('#evaluation').click(function(){
                
                // 팝업창 열림
                $('#evaluationPopup').fadeIn(500);
                
                // 완료 버튼 눌러야 팝업창 닫힘
                $('#evaluationOptions button').click(function(){
                    $('#evaluationPopup').fadeOut(500);
                }); // click() end
                
                $('#honeypotOption a').click(function(e){
                    e.preventDefault();
                    
                    // a 요소에 있는 값 얻어와야 함
                    var reason = $(this).text();
                    // alert(reason);
                    
                    // 꿀단지에 넣어주기
                    $(this).parent().next().text(reason);
                    
                    // 깨진 단지 흐리게
                    $('#evaluationBrokenpot').css({"background":"url(/img/brokenpot_transparent.png)",
                                                   "background-repeat":"no-repeat",
                                                   "background-size":"contain"});
                    
                    // 깨진 단지 글자 빼주기
                    $('#evaluationBrokenpot').children('.selected_reason').text("");
                    
                    // 깨진 단지 mouseover 시 배경 원래대로
                    $('#evaluationBrokenpot').mouseover(function(){
                        $('#evaluationBrokenpot').css({"background":"url(/img/brokenpot.png)",
                                                       "background-repeat":"no-repeat",
                                                       "background-size":"contain"});    
                    }); // mouseover() end
                    
                    // 깨진 단지 mouseleave 시 배경 흐리게
                    $('#evaluationBrokenpot').mouseleave(function(){
                        if($("#evaluationBrokenpot .selected_reason").text() == "") {
                            $('#evaluationBrokenpot').css({"background":"url(/img/brokenpot_transparent.png)",
                                                           "background-repeat":"no-repeat",
                                                           "background-size":"contain"});    
                        } else{
                            $('#evaluationBrokenpot').css({"background":"url(/img/brokenpot.png)",
                                                           "background-repeat":"no-repeat",
                                                           "background-size":"contain"});    
                        } // if ~ else end
                    }); // mouseleave() end
                    
                }); // $('#honeypotOption a').click() end
                
                $('#brokenpotOption a').click(function(e){
                    e.preventDefault();
                    // a 요소에 있는 값 얻어와야 함
                    var reason = $(this).text();
                    // alert(reason);
                    
                    // 깨진 단지에 넣어주기
                    $(this).parent().next().text(reason);
                    
                    // 꿀단지 흐리게 
                    $('#evaluationHoneypot').css({"background":"url(/img/honeypot_transparent.png)",
                                                  "background-repeat":"no-repeat",
                                                  "background-size":"contain"});
                    
                    // 꿀단지 글자 빼주기
                    $('#evaluationHoneypot').children('.selected_reason').text("");
                    
                    // 꿀단지 mouseover 시 배경 원래대로
                    $('#evaluationHoneypot').mouseover(function(){
                        $('#evaluationHoneypot').css({"background":"url(/img/honeypot.png)",
                                                      "background-repeat":"no-repeat",
                                                      "background-size":"contain"});
                    }); // mouseover() end
                    
                    // 꿀단지 mouseleave 시 배경 흐리게
                    $('#evaluationHoneypot').mouseleave(function(){
                        if($("#evaluationHoneypot .selected_reason").text() == "") {
                            $('#evaluationHoneypot').css({"background":"url(/img/honeypot_transparent.png)",
                                                          "background-repeat":"no-repeat",
                                                          "background-size":"contain"});    
                        } else{
                            $('#evaluationHoneypot').css({"background":"url(/img/honeypot.png)",
                                                          "background-repeat":"no-repeat",
                                                          "background-size":"contain"});    
                        } // if ~ else end
                    }); // mouseleave() end
                    
                }); // $('#brokenpotOption a').click() end
                
            }); // $('#evaluation').click() end

            // 리뷰 사진 목록 팝업
            $('.review_rep_image').click(function(){
            	var reviewNo = this.dataset.no;
            	// alert($(this).children().children('.img_cnt').text());
            	var photoCntNum = $(this).children().children('.img_cnt').text();
            	if($.isNumeric(photoCntNum)) {
            		$.ajax({
	            		url:"/reviewDetail/"+reviewNo,
	            		dataType:"json", 
	            		error:function(){
	            			alert('서버 점검 중-!');
	            		},
	            		success:function(json){
	            			imgs = json.photoList;
	            			info = json.reviewDetail;
	            			// console.log(imgs);
	            			// console.log(info);
	          				
		            		$(".imgs").empty();
		            		
	            			$(imgs).each(function(index){
	            				// console.log(this.pic);
	            				var $li = $("<li>");
	            				var $img = $("<img>").attr("src", "/img/place_review/pop_list_pic/"+this.pic);
	            				
	            				$li.append($img).prependTo(".imgs");
	            			}); // $(imgs).each() end
	            			
	            			$('.imgs li:first').addClass('now');
	            			
	            			$('.item:nth-child(1)').css('background-image', "url(/img/place_review/pop_rep_pic/"+imgs[0].pic+")");
	            			$('#reviewImageBox #reviewBox .review_title').text(info.name);
	            			$('#reviewImageBox #reviewBox .review_info .writer_profile').css('background-image', "url(/img/level"+info.lvl+".png)");
	            			$('#reviewImageBox #reviewBox .review_info .writer_image').attr("src", "/img/profile/"+info.profile);
	            			$('#reviewImageBox .profile_info .writer_nickname').text(info.nick);
	            			$('#reviewImageBox .profile_info .honey_number').text(info.honey);
	            			$('#reviewImageBox .profile_info .venom_number').text(info.venom);
	            			$('#reviewImageBox #reviewBox time').text(moment(info.regdate).format("YYYY-MM-DD HH:mm:ss")); 
	            			$('#reviewImageBox #reviewBox .review_cmt').html(info.content);
	            					
	            			$('#reviewDetailPopup, #popupArea').show();
	            		} // url, dataType, error, success end
            		}); // $.ajax() end
            	} // if end
            }); // click() end
            
            // 팝업 전체끄기 
            $("#reviewDetailPopup").click(function () {
                $(this).hide();
                $('#popupArea').hide();
            }); // click() end
            
            $(".right_btn").click(function () {
                
                $(".item:eq(0)").css({"left":0, background:"url(/img/place_review/pop_rep_pic/"+imgs[idx++].pic+")", "background-repeat":"no-repeat", "background-size":"565px 475px"}).animate({left:-565},300);

                if(idx==imgs.length) {
                    idx=0;
                }// if end
                
                console.log(imgs.length);
                
                $(".now").removeClass("now");
                $("#imageListBox li").eq(idx).addClass("now");
                $(".item:eq(1)").css({"left":500, "background":"url(/img/place_review/pop_rep_pic/"+imgs[idx].pic+")", "background-repeat":"no-repeat", "background-size":"565px 475px"}).animate({left:0},300);
                
            }); // click() end
            
            $(".left_btn").click(function () {

                $(".item:eq(0)").css({"left":0, "background":"url(/img/place_review/pop_rep_pic/"+imgs[idx--].pic+")", "background-repeat":"no-repeat", "background-size":"565px 475px"}).animate({left:565},300);

                if(idx==-1) {
                    idx=imgs.length-1;
                } // if end

                $(".now").removeClass("now");
                $("#imageListBox li").eq(idx).addClass("now");

                $(".item:eq(1)").css({"left":"-565px", "background":"url(/img/place_review/pop_rep_pic/"+imgs[idx].pic+")", "background-repeat":"no-repeat", "background-size":"565px 475px"}).animate({left:0},300);
                
            }); // click() end

            $("#imageListBox").on('click', 'li', function () {
                
            	// alert('test');
            	
                idx = $(this).index();
                $(".now").removeClass("now");
                $(this).addClass("now");

                $(".item").each(function () {
                    var left = $(this).css("left");

                    if(left=="0px") {
                        $(this).css({"background":"url(/img/place_review/pop_rep_pic/"+imgs[idx].pic+")", "background-repeat":"no-repeat", "background-size":"565px 475px"});
                    } // if end
                    // alert(left);
                }); // $(".item").each() end
               // alert(idx)
                
            }); // click() end
            
          	// 댓글 이미지 업로드
            var $imgUpload = $("#imgUpload");
            var $uploadImageList = $(".uploaded_img_list");

            $imgUpload.change(function() {
	           
            	var file = this.files[0];

	            if (file.size <= 0) {
		            alert("제대로 된 파일을 선택하세요.");
		            $imgUpload.val("");
		            return;
	            } // if end 

	            if (!file.type.startsWith("image/")) {
		            alert("이미지를 선택해주세요.");
		            $imgUpload.val("");
		            return;
	            } // if end

            	var form = new FormData();

	            form.append("upload", file);

	            $.ajax({
		            url:"/place/upload",  //////////컨트롤러에 바꾼 주소랑 맞추기
		            method:"POST",
		            processData:false,
		            mimeType:"multipart/form-data",
		            contentType:false,
		            data:form,
		            dataType:"json",
		            error:function() {
		            	alert("error");
		            },
		            success:function(json) {
		            	console.log(json);
		            	
			            var $li = $("<li class='uploaded_img added_image'>");
			            var $img = $("<img width='50'>")
			            .attr("src", "/img/place_review/upload/" + json.imageName); /*src 바꿔야함*/
			            var $icon = $("<div class='label'data-no='"+length+"'><i class='fa fa-minus-circle del_image'>");
		
		            	$li.append($img).append($icon).prependTo($uploadImageList);
		
		            	$("<input type='hidden' class='review_img"+(length)+"'>").attr({name:"pic",value:json.imageName}).appendTo("#reviewForm");
			            
		            	 var length = $(".uploaded_img_list li").length;
		            	
		            	 if(length>=11){
		 	            	//alert("이미지는 10개까지 첨부할 수 있습니다.");
		 	            	
		 	            	$(".btn_upload").hide();
		 	            	
		 	        		//return false;
		             	} // if end
		            	
		            } // success end
	            }) // .ajax() end
            }) // change() end

            // 클릭하면 지우기
            $(document).on("click",".label", function() {
            	//alert("test");
           	 	$(this).parent(".added_image").remove();
           	 	
           	 	var no = this.dataset.no;
           	 	
           	 	$(".review_img"+no).remove();
           	 	
           	 	$(".btn_upload").show();
            }); // on() end

            
            // 지도
            var map = new naver.maps.Map('map', {
				center: new naver.maps.LatLng(${place.lat}, ${place.lng}),
				zoom: 10
			});
			
            map.setOptions({ //지도 인터랙션 끄기
            	draggable: false,
            	pinchZoom: false,
            	scrollWheel: false,
            	keyboardShortcuts: false,
            	disableDoubleTapZoom: true,
            	disableDoubleClickZoom: true,
            	disableTwoFingerTapZoom: true
            });

			var marker = new naver.maps.Marker({
				position: new naver.maps.LatLng(${place.lat}, ${place.lng}),
				map: map
			});

        </script>
    </body>
</html>