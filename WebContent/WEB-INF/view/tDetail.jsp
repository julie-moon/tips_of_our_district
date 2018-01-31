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
            #content .aux{
                overflow:hidden;
                background-color:#FFF;
            }
            #remoteControl{
                background-color:violet;
                width:80px;
                /**/
                position:fixed;
                top:158px;
                right:0px;
            }
            #remoteControl li{
                width:80px;
                height:30px;
                line-height:25px;
                font-size:15px;
                text-align:center;
            }
            #remoteContol li a{
                background-color:red;
                display:block;
                width:80px;
                height:30px;
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
            }
            #userInfo .writer_image{
                width:80px;
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
            #contentTitle .title_bnt{
                /*background-color: aquamarine;*/
                position:absolute;
                bottom:15px;/**/
                right:0;   
            }
            #contentTitle .title_bnt a{
                color:#424242;
                text-decoration:none;
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
            #contentBottom #spotMap{
                background-color:pink;
                width:675px;
                height:487px;
                position:absolute;
            }
            #contentBottom #spotMap img{
                width:675px;
                height:487px;
            }
            #contentBottom #tagBox{
                background-color:#FFF8E1;
                width:225px;
                /*height:380px;*/
                padding:15px 15px 20px 15px;
                margin-left:30px;
                position:relative;
                left:675px;
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
                border:5px solid #FFF;
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
                width:800px;
                /*height:318px;*/
                top:-30px;
                left:100px;
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
            #reviewWrap .reviewTitle{
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
                background:url(/img/hexagon.png);
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
            #reviewBox .review_write_area{
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
            #reviewBox #reviewFormBtm{
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
            #reviewFormBtm .check_secret{
                position: absolute;
                right: 80px;
                bottom: 9px;
                /*background-color:#424242;*/
                /*color:#FFF;*/
                font-size:22px;
                border-radius:0;
                border:0;
                width: 35px;
                height:35px;
                outline: none;
                cursor:pointer;
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
                outline: none;
            }
            #review #reviewList{
                width:960px;
            }
            #reviewList #alignReviews{
                /*background-color:aquamarine;*/
                text-align:right;
                padding:20px 0 15px 0;
                border-bottom:2px solid #424242;
            }
            #alignReviews a{
                text-decoration:none;
                color:#424242;
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
            .secret .secret_rep_message{
                position: absolute;
                top: 50%;
                margin-top: -35px;
                text-align: center;
                font-size: 24px;
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
                top:-25px;
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
            .review_content .recommend_wrap{
                /*background-color:violet;*/
                position:absolute;
                bottom:15px;
                right:85px; /*  */
            }
            .review_content .reply_secret{
                /*display: none;*/
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
            #evaluationPopup{
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
            #evaluationOptions{
                /*background-color:rgba(0,0,0, .2);*/
                width:701px;
                height:500px;
                position:fixed;
                left:50%;
                top:50%;
                margin: -250px 0 0 -350.5px;
            }
            #evaluationPopupTitle{
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

            #boardWrap{
                background: lightblue;
                padding: 5px;
            }
            #boardWrap h2{
                font-size: 36px;
                font-weight: 700;
            }
            i.fa-bookmark-o, i.fa-bookmark{
                color: #FEBD39;
                font-size: 32px;
            }
            button.bookmark {
                border: none;
                outline: none;
                cursor: pointer;
                background: #fff;
            }
            #boardWrap span{
                margin-right: 5px;
            }
            #mainOption {
                background: lightgreen;
                float: right;
                margin: 10px 5px 10px 0;
            }
            #remoteControl{
                /*background-color:violet;*/
                width:80px;
                /**/
                position:fixed;
                top:157px;
                right:0px;
                border:1px solid #424242;
                z-index: 100;
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
            #mainContent {
                background: brown;
                padding: 10px;
            }
            #mainContent .mainPhoto img{
                /* 이미지는 항상 센터 */
                display: block;
                margin: 0 auto;
                max-width: 900px;
            }
            #mainContent .contentDetail{
                display: block;
                max-width: 900px;
                text-align: left;
                padding: 20px;
                color: #fff;
            }
            /*#tagBox {*/
                /*margin-top: 20px;*/
                /*padding-left: 20px;*/
            /*}*/
            /*#tagBox #tagTitle{*/
                /*background-color:#FEBD39;*/
                /*padding:0 20px;*/
                /*!*position:absolute;*!*/
            /*}*/
            #contentValue{
                /*margin: 10px;*/
                text-align: center;
                /*padding-top: 10px;*/

            }
            #contentValue button{
                margin: 10px;
                padding: 0 10px;
                text-align:center;
                font-size:24px;
                text-indent:2px;
                line-height: 34px;

            }
            #contentValue button img{
                margin-right: 10px;
            }
            .report {
                background: green;
                float: right;
                padding: 5px 10px;
            }
            #picPopup {
                position: fixed;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, .8);
                left: 0;
                top: 0;
                display: none;
            }
            #picDetail {
                position: absolute;
                padding: 30px;
                width: 850px;
                height: 600px;
                background: #fff;
                top: 50%;
                left: 50%;
                margin: -330px 0 0 -455px;
                display: table-cell;
                vertical-align: middle;
            }
            .im{
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                /*background-image: url("/img/brokenpot.png");*/
                background-repeat: no-repeat;
                background-size: contain;
                background-position: center;
            }
            #reportPopup{
                position: fixed;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, .8);
                left: 0;
                top: 0;
                display: none;
            }
            #reportDetail{
                position: absolute;
                width: 600px;
                height: 400px;
                background: #fff;
                padding: 30px;
                top: 50%;
                left: 50%;
                margin: -230px 0 0 -330px;
                font-size: 22px;
                z-index: 1;
                /*text-align: center;*/
            }
            #reportDetail form {
                width:  400px;
                padding: 20px;
                margin: 0 auto;
            }
            #reportDetail input{
                margin: 20px;
            }
            #reportBtn {
                width: 380px;
                height: 40px;
                margin-top: 5px;
                margin-left: 10px;
                font-size: 18px;
            }
            #reportDetail legend{
                text-align: center;
                font-weight: 700;
                margin-bottom: 20px;
            }
            #reportPopup label{
                /*display: inline-block;*/
            }

            #copyURLpopup{
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
                z-index: 100;
                /*text-align: center;*/
            }
            #URLcontainer input{
                width: 350px;
                height: 20px;
                margin-top: 20px;
                font-size: 18px;
            }
            .board_main_bottom{
                background: yellowgreen;
                margin: 10px 0;
            }
            .board_main_bottom .boardNav{
                background: cornflowerblue;
                width: 26px;
                margin: 0px 10px;
            }
            .board_main_bottom a {
                text-decoration: none;
            }
            .board_main_bottom a:hover {
                text-decoration: underline;
            }
            .reg_rep_rep .recommend_btn{
                position: absolute;
                width: 58px;
                border:1px solid #424242;
                padding:11px 0;
                cursor:pointer;
                text-align:center;
                margin-right:5px;
                bottom: 15px;
                /*left: 150px;*/
                background: #fff;
            }
            .rep_rep{
                left: 25px;
            }
            .icon_reply {
                /*display: inline-block;*/
                position: absolute;
                left: -25px;
                top: 25%;
                font-style: normal;
                font-weight: 700;
                font-size: 22px;
                color: #FEBD39;
                transform: rotate(180deg);
            }
            #reviewList #replyList{
                position: absolute;
                font-size:20px;
                padding:15px 0;
            }
        </style>
    </head>
    <body>
        <c:import url="/WEB-INF/view/template/header.jsp"></c:import>
                    <div id="boardWrap">
                        <p><button class="bookmark"><i class="fa fa-bookmark-o"></i></button>
                            <button class="bookmark hidden"><i class="fa fa-bookmark"></i></button></p>
                        <h2>여의도역 벚꽃 축제 사람 많겠죠?</h2>
                        <span>
                    <span class="user_photo"><img src="/img/profile_default.png" alt="유저 이미지" width="30"></span>
                    <span class="user_name">벌꿀234</span>
                    <span class="view_icon"><i class="fa fa-eye"></i></span>
                    <span class="view_count">99539</span>
                    <span>17.11.28 17:24:23</span>
                </span>
                    </div><!-- 글 기본 정보 -->

                    <div id="mainOption">
                        <a href="">수정</a>
                        <span>|</span>
                        <a href="">삭제</a>
                    </div><!-- 해당 작성자만 보이게 -->

                    <div id="remoteControl">
                        <div id="openOrClose"><i class="fa fa-angle-right"></i></div>
                        <ul>
                            <li><a id="up" href=""><i class="fa fa-angle-up"></i></a></li>
                            <li><a href="">북마크</a></li>
                            <li><a href="" id="shareURL">링크 공유</a></li>
                            <li><a id="down" href=""><i class="fa fa-angle-down"></i></a></li>
                        </ul>
                    </div><!-- // #remoteControl -->


                    <div id="mainContent">
                        <div class="mainPhoto"><img src="/img/IMG_3561.jpg" alt="컨텐츠 사진"></div>
                        <div class="contentDetail">
                            <p>사랑의 봄날의 영원히 희망의 작고 보내는 있음으로써 없으면, 교향악이다. 용감하고 일월과 할지니, 풀이 주며, 같이 사막이다. 고동을 심장의 가치를 주는 붙잡아 끓는다. 투명하되 그들의 수 때문이다. 이 설레는 하였으며, 얼마나 산야에 영락과 그들에게 크고 보는 보라. 싹이 그림자는 우는 그들의 앞이 그와 것이 것이다. 기쁘며, 구하기 가는 산야에 것이다. 하는 구하지 피고, 것이다. 충분히 원질이 고동을 때까지 웅대한 힘차게 대한 곧 얼음 있다. 우리의 불어 없는 그들은 생명을 청춘을 같이, 것이다.
                                <br/>
                                <br/>
                                청춘의 피는 위하여서, 구하지 있는 원대하고, 그것은 발휘하기 이것은 있다. 청춘의 이상의 실현에 동력은 위하여서. 그들의 생명을 그들은 관현악이며, 생의 노년에게서 소금이라 위하여서. 우는 위하여 두기 있다. 작고 인간의 낙원을 아니더면, 부패를 꽃이 심장의 군영과 칼이다. 트고, 뛰노는 타오르고 끓는 하였으며, 굳세게 창공에 철환하였는가? 기쁘며, 그러므로 피고, 두기 못할 눈에 풀밭에 불어 끝까지 것이다. 길지 인간의 가치를 하는 같은 열매를 피부가 싹이 그러므로 교향악이다. 싹이 청춘이 생명을 청춘의 이상의 부패뿐이다.
                                <br/>
                                <br/>
                                못하다 되려니와, 얼마나 철환하였는가? 피가 얼음과 희망의 것이다.보라, 우리 그들은 것이다. 얼음에 부패를 방황하였으며, 낙원을 끓는다. 것은 굳세게 끓는 몸이 눈이 위하여서. 날카로우나 유소년에게서 위하여, 있으랴? 이상은 넣는 노년에게서 밝은 품으며, 꽃이 풀이 되는 것이다. 피는 같이, 피어나는 바이며, 별과 그림자는 불어 봄바람이다. 더운지라 얼음 작고 있는 꽃 용감하고 영락과 보배를 이것이다. 용기가 풍부하게 가치를 아름다우냐? 품에 어디 꽃이 것은 칼이다.</div>
                        </p>
                        <div id="tagBox">
                            <span id="tagTitle">태그</span>
                            <div class="tag_wrap">
                                <span class="tag_list">#여의도역</span>
                                <span class="tag_list">#벚꽃축제</span>
                                <span class="tag_list">#여의도역</span>
                                <span class="tag_list">#여의도역</span>
                            </div>
                        </div><!-- 태그부분 -->
                        <div id="contentValue">
                            <button><img src="/img/honeypot.png" alt="꿀 이미지" width="30" height="30">꿀 <span>101</span></button>
                            <button><img src="/img/venom.png" alt="독 이미지" width="30" height="30">독 <span>30</span></button>
                        </div><!-- 꿀/독 -->
                        <div class="report">
                            <a href="" class="reportBtn">신고하기</a>
                        </div>
                        <p></p>
                    </div><!-- 메인 컨텐츠 -->

                    <div id="reviewWrap">
                        <!--<p >댓글</p>-->

                        <div id="reviewList">
                            <span id="replyList">댓글 목록</span>
                            <p id="alignReviews">
                                <a class="on" href="">최신순</a>
                                <span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
                                <a class="" href="">인기순</a>
                            </p>


                            <div id="bestReviewList">

                                <ul>
                                    <li>
                                        <div class="review_profile">
                                            <div class="writer_profile"> 
                                                <a href="">    
                                                    <img class="writer_image" src="/img/profile_default.png" />
                                                    <div class="plus_bee">
                                                        <i class="fa fa-plus-circle plus"></i>
                                                        <i class="fa fa-minus-circle minus" ></i>
                                                    </div>
                                                </a>
                                            </div> <!-- // .writer_profile -->    
                                            <p class="writer_nickname">
                                                <a class="writer_mypage" href="">벌꿀2</a>
                                            </p>
                                            <span class="best">BEST</span>
                                        </div><!-- // .review_profile --><!--
                                     --><div class="review_content">
                                            <time>17.11.28 17:25:42</time>
                                            <!--
                                            <span class="report"><a href="">신고</a></span>
                                            -->
                                            <!-- 글쓴 사람이 로그인 했을 때는 수정 / 삭제가 보여야 함 -->
                                            <span class="revise_or_delete">
                                                <span class="revise"><a href="">수정</a></span>
                                                &nbsp;&nbsp;&nbsp;
                                                <span class="delete"><a href="">삭제</a></span>
                                            </span>   
                                            <p>
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                <br />
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br /> 
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br />
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br /> 
                                                <!--
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br />
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br /> 
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br />
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br />
                                                -->     
                                            </p>
                                            <div class="review_rep_image">
                                                <!-- <img src="" alt="" /> -->
                                                <span>+ <span class="img_cnt">5</span></span>
                                            </div> <!-- // .review_rep_image -->
                                            <div class="recommend_wrap">
                                                <span class="recommend_btn">
                                                    <img class="honeypot" src="/img/honeypot.png" alt="추천"/>
                                                    <span class="recommend_cnt">1,000</span>
                                                </span>
                                                <span class="recommend_btn">
                                                    <img class="venom" src="/img/venom.png" alt="추천"/>
                                                    <span class="recommend_cnt">500</span>
                                                </span>
                                            </div> <!-- // .recommend_wrap -->
                                        </div> <!-- // .review_content -->
                                    </li>
                                    <li>
                                        <div class="review_profile">
                                            <div class="writer_profile">
                                                <a href="">
                                                    <img class="writer_image" src="/img/profile_default.png" />
                                                    <div class="plus_bee">
                                                        <i class="fa fa-plus-circle plus"></i>
                                                        <i class="fa fa-minus-circle minus" ></i>
                                                    </div>
                                                </a>
                                            </div> <!-- // .writer_profile -->    
                                            <p class="writer_nickname">
                                                <a class="writer_mypage" href="">벌꿀2</a>
                                            </p>
                                            <span class="best">BEST</span>
                                        </div><!-- // .review_profile --><!--
                                     --><div class="review_content">
                                            <time>17.11.28 17:25:42</time>
                                            <span class="report"><a href="">신고</a></span>
                                            <!-- 글쓴 사람이 로그인 했을 때는 수정 / 삭제가 보여야 함 -->
                                            <!--
                                            <span class="revise_or_delete">
                                                <span class="revise"><a href="">수정</a></span>
                                                &nbsp;&nbsp;&nbsp;
                                                <span class="delete"><a href="">삭제</a></span>
                                            </span>
                                            -->
                                            <p>
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            </p>
                                            <div class="review_rep_image">
                                                <!-- <img src="" alt="" /> -->
                                                <span>+ <span class="img_cnt">5</span></span>
                                            </div> <!-- // .review_rep_image -->
                                            <div class="recommend_wrap">
                                                <span class="recommend_btn">
                                                    <img class="honeypot" src="/img/honeypot.png" alt="추천"/>
                                                    <span class="recommend_cnt">1,000</span>
                                                </span>
                                                <span class="recommend_btn">
                                                    <img class="venom" src="/img/venom.png" alt="추천"/>
                                                    <span class="recommend_cnt">500</span>
                                                </span>
                                            </div> <!-- // .recommend_wrap -->
                                        </div> <!-- // .review_content -->
                                    </li>
                                    <li>
                                        <div class="review_profile">
                                            <div class="writer_profile">
                                                <a href="">   
                                                    <img class="writer_image" src="/img/profile_default.png" />
                                                    <div class="plus_bee">
                                                        <i class="fa fa-plus-circle plus"></i>
                                                        <i class="fa fa-minus-circle minus" ></i>
                                                    </div>
                                                </a>
                                            </div> <!-- // .writer_profile -->    
                                            <p class="writer_nickname">
                                                <a class="writer_mypage" href="">벌꿀2</a>
                                            </p>
                                            <span class="best">BEST</span>
                                        </div><!-- // .review_profile --><!--
                                     --><div class="review_content">
                                            <time>17.11.28 17:25:42</time>
                                            <span class="report"><a href="">신고</a></span>
                                            <!-- 글쓴 사람이 로그인 했을 때는 수정 / 삭제가 보여야 함 -->
                                            <!--
                                            <span class="revise_or_delete">
                                                <span class="revise"><a href="">수정</a></span>
                                                &nbsp;&nbsp;&nbsp;
                                                <span class="delete"><a href="">삭제</a></span>
                                            </span>
                                            -->
                                            <p>
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            </p>
                                            <div class="review_rep_image">
                                                <!-- <img src="" alt="" /> -->
                                                <span>+ <span class="img_cnt">5</span></span>
                                            </div> <!-- // .review_rep_image -->
                                            <div class="recommend_wrap">
                                                <span class="recommend_btn">
                                                    <img class="honeypot" src="/img/honeypot.png" alt="추천"/>
                                                    <span class="recommend_cnt">1,000</span>
                                                </span>
                                                <span class="recommend_btn">
                                                    <img class="venom" src="/img/venom.png" alt="추천"/>
                                                    <span class="recommend_cnt">500</span>
                                                </span>
                                            </div> <!-- // .recommend_wrap -->
                                        </div> <!-- // .review_content -->
                                    </li>
                                </ul>
                            </div> <!-- // #bestReviewList -->
                            <div id="reviewAll">
                                <ul>
                                    <li>
                                        <div class="review_profile">
                                            <div class="writer_profile">
                                                <a href="">    
                                                    <img class="writer_image" src="/img/profile_default.png" />
                                                    <div class="plus_bee">
                                                        <i class="fa fa-plus-circle plus"></i>
                                                        <i class="fa fa-minus-circle minus" ></i>
                                                    </div>
                                                </a>
                                            </div> <!-- // .writer_profile -->    
                                            <p class="writer_nickname">
                                                <a class="writer_mypage" href="">벌꿀2</a>
                                            </p>
                                        </div><!-- // .review_profile --><!--
                                     --><div class="review_content">
                                        <time>17.11.28 17:25:42</time>
                                        <!--
                                            <span class="report"><a href="">신고</a></span>
                                            -->
                                        <!-- 글쓴 사람이 로그인 했을 때는 수정 / 삭제가 보여야 함 -->
                                        <span class="revise_or_delete">
                                            <span class="revise"><a href="">수정</a></span>
                                            &nbsp;&nbsp;&nbsp;
                                            <span class="delete"><a href="">삭제</a></span>
                                        </span>
                                        <p>
                                            올해도 많지 않을까요?<br />
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            <br />
                                            올해도 많지 않을까요?<br />
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br />
                                            올해도 많지 않을까요?<br />
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br />
                                            올해도 많지 않을까요?<br />
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br />
                                            <!--
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br />
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br /> 
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br />
                                                올해도 많지 않을까요?<br />
                                                주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요<br />
                                                -->     
                                        </p>
                                        <div class="review_rep_image">
                                            <!-- <img src="" alt="" /> -->
                                            <span>+ <span class="img_cnt">5</span></span>
                                        </div> <!-- // .review_rep_image -->
                                        <div class="recommend_wrap">
                                            <span class="recommend_btn">
                                                <img class="honeypot" src="/img/honeypot.png" alt="추천"/>
                                                <span class="recommend_cnt">1,000</span>
                                            </span>
                                            <span class="recommend_btn">
                                                <img class="venom" src="/img/venom.png" alt="추천"/>
                                                <span class="recommend_cnt">500</span>
                                            </span>
                                        </div> <!-- // .recommend_wrap -->
                                        <div class="reg_rep_rep">
                                            <span class="recommend_btn rep_comment">답글</span>
                                        </div><!-- //.reg_rep_rep -->
                                    </div> <!-- // .review_content -->
                                    </li>
                                    <li>
                                        <div class="review_profile rep_rep">
                                            <div class="writer_profile">
                                                <i class="icon_reply fa fa-reply"></i><!-- 대댓글 이미지 -->
                                                <a href="">
                                                    <img class="writer_image" src="/img/profile_default.png" />
                                                    <div class="plus_bee">
                                                        <i class="fa fa-plus-circle plus"></i>
                                                        <i class="fa fa-minus-circle minus" ></i>
                                                    </div>
                                                </a>
                                            </div> <!-- // .writer_profile -->    
                                            <p class="writer_nickname">
                                                <a class="writer_mypage" href="">벌꿀2</a>
                                            </p>
                                        </div><!-- // .review_profile --><!--
                                     --><div class="review_content">
                                        <time>17.11.28 17:25:42</time>
                                        <span class="report"><a href="">신고</a></span>
                                        <!-- 글쓴 사람이 로그인 했을 때는 수정 / 삭제가 보여야 함 -->
                                        <!--
                                            <span class="revise_or_delete">
                                                <span class="revise"><a href="">수정</a></span>
                                                &nbsp;&nbsp;&nbsp;
                                                <span class="delete"><a href="">삭제</a></span>
                                            </span>
                                            -->
                                        <p>
                                            올해도 많지 않을까요?<br />
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                        </p>
                                        <div class="review_rep_image">
                                            <!-- <img src="" alt="" /> -->
                                            <span>+ <span class="img_cnt">5</span></span>
                                        </div> <!-- // .review_rep_image -->
                                        <div class="recommend_wrap">
                                            <span class="recommend_btn">
                                                <img class="honeypot" src="/img/honeypot.png" alt="추천"/>
                                                <span class="recommend_cnt">1,000</span>
                                            </span>
                                            <span class="recommend_btn">
                                                <img class="venom" src="/img/venom.png" alt="추천"/>
                                                <span class="recommend_cnt">500</span>
                                            </span>
                                        </div> <!-- // .recommend_wrap -->
                                        <div class="reg_rep_rep">
                                            <span class="recommend_btn rep_comment">답글</span>
                                        </div><!-- //.reg_rep_rep -->
                                    </div> <!-- // .review_content -->
                                    </li>
                                    <li>
                                        <div class="review_profile">
                                            <div class="writer_profile">
                                                <a href="">    
                                                    <img class="writer_image" src="/img/profile_default.png" />
                                                    <div class="plus_bee">
                                                        <i class="fa fa-plus-circle plus"></i>
                                                        <i class="fa fa-minus-circle minus" ></i>
                                                    </div>
                                                </a>
                                            </div> <!-- // .writer_profile -->    
                                            <p class="writer_nickname">
                                                <a class="writer_mypage" href="">벌꿀2</a>
                                            </p>
                                        </div><!-- // .review_profile --><!--
                                     --><div class="review_content">
                                        <time>17.11.28 17:25:42</time>
                                        <span class="report"><a href="">신고</a></span>
                                        <!-- 글쓴 사람이 로그인 했을 때는 수정 / 삭제가 보여야 함 -->
                                        <!--
                                            <span class="revise_or_delete">
                                                <span class="revise"><a href="">수정</a></span>
                                                &nbsp;&nbsp;&nbsp;
                                                <span class="delete"><a href="">삭제</a></span>
                                            </span>
                                            -->
                                        <p>
                                            올해도 많지 않을까요?<br />
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                        </p>
                                        <div class="review_rep_image">
                                            <!-- <img src="" alt="" /> -->
                                            <span>+ <span class="img_cnt">5</span></span>
                                        </div> <!-- // .review_rep_image -->
                                        <div class="recommend_wrap">
                                            <span class="recommend_btn">
                                                <img class="honeypot" src="/img/honeypot.png" alt="추천"/>
                                                <span class="recommend_cnt">1,000</span>
                                            </span>
                                            <span class="recommend_btn">
                                                <img class="venom" src="/img/venom.png" alt="추천"/>
                                                <span class="recommend_cnt">500</span>
                                            </span>
                                        </div> <!-- // .recommend_wrap -->
                                        <div class="reg_rep_rep">
                                            <span class="recommend_btn rep_comment">답글</span>
                                        </div><!-- //.reg_rep_rep -->
                                    </div> <!-- // .review_content -->
                                    </li>
                                    <li>
                                        <div class="review_profile">
                                            <div class="writer_profile">
                                                <a href="">
                                                    <img class="writer_image" src="/img/profile_default.png" />
                                                    <div class="plus_bee">
                                                        <i class="fa fa-plus-circle plus"></i>
                                                        <i class="fa fa-minus-circle minus" ></i>
                                                    </div>
                                                </a>
                                            </div> <!-- // .writer_profile -->    
                                            <p class="writer_nickname">
                                                <a class="writer_mypage" href="">벌꿀2</a>
                                            </p>
                                        </div><!-- // .review_profile --><!--
                                     --><div class="review_content secret">
                                        <time>17.11.28 17:25:42 <span class="reply_secret"><i class="fa fa-lock"></i></time>
                                        <!--
                                            <span class="report"><a href="">신고</a></span>
                                            -->
                                        <!-- 글쓴 사람이 로그인 했을 때는 수정 / 삭제가 보여야 함 -->
                                        <span class="revise_or_delete">
                                            <span class="revise"><a href="">수정</a></span>
                                            &nbsp;&nbsp;&nbsp;
                                            <span class="delete"><a href="">삭제</a></span>
                                        </span>
                                        <p class="secret_rep_message">
                                            <i class="fa fa-lock"></i> 비밀댓글입니다.
                                        </p>
                                        <!--<div class="review_rep_image">-->
                                        <!--&lt;!&ndash; <img src="" alt="" /> &ndash;&gt;-->
                                        <!--<span>+ <span class="img_cnt">5</span></span>-->
                                        <!--</div> &lt;!&ndash; // .review_rep_image &ndash;&gt;-->
                                        <!--<div class="recommend_wrap">-->
                                        <!--<span class="recommend_btn">-->
                                        <!--<img class="honeypot" src="/img/honeypot.png" alt="추천"/>-->
                                        <!--<span class="recommend_cnt">1,000</span>-->
                                        <!--</span>-->
                                        <!--<span class="recommend_btn">-->
                                        <!--<img class="venom" src="/img/venom.png" alt="추천"/>-->
                                        <!--<span class="recommend_cnt">500</span>-->
                                        <!--</span>-->
                                        <!--</div> &lt;!&ndash; // .recommend_wrap &ndash;&gt;-->
                                    </div> <!-- // .review_content -->
                                    </li>

                                    <li>
                                        <div class="review_profile">
                                            <div class="writer_profile">
                                                <a href="">
                                                    <img class="writer_image" src="/img/profile_default.png" />
                                                    <div class="plus_bee">
                                                        <i class="fa fa-plus-circle plus"></i>
                                                        <i class="fa fa-minus-circle minus" ></i>
                                                    </div>
                                                </a>
                                            </div> <!-- // .writer_profile -->    
                                            <p class="writer_nickname">
                                                <a class="writer_mypage" href="">벌꿀2</a>
                                            </p>
                                        </div><!-- // .review_profile --><!--
                                     --><div class="review_content">
                                        <time>17.11.28 17:25:42 <span class="reply_secret"><i class="fa fa-lock"></i></span></time>
                                        <span class="report"><a href="">신고</a></span>
                                        <!-- 글쓴 사람이 로그인 했을 때는 수정 / 삭제가 보여야 함 -->
                                        <!--
                                            <span class="revise_or_delete">
                                                <span class="revise"><a href="">수정</a></span>
                                                &nbsp;&nbsp;&nbsp;
                                                <span class="delete"><a href="">삭제</a></span>
                                            </span>
                                            -->
                                        <p>
                                            올해도 많지 않을까요?<br />
                                            주말 피해서 가시면 좀 적을수도.. 잘 모르겠네요
                                        </p>
                                        <div class="review_rep_image">
                                            <!-- <img src="" alt="" /> -->
                                            <!--<span>+ <span class="img_cnt">5</span></span>-->
                                        </div> <!-- // .review_rep_image -->
                                        <div class="recommend_wrap">
                                            <span class="recommend_btn">
                                                <img class="honeypot" src="/img/honeypot.png" alt="추천"/>
                                                <span class="recommend_cnt">1,000</span>
                                            </span>
                                            <span class="recommend_btn">
                                                <img class="venom" src="/img/venom.png" alt="추천"/>
                                                <span class="recommend_cnt">500</span>
                                            </span>
                                        </div> <!-- // .recommend_wrap -->
                                        <div class="reg_rep_rep">
                                            <span class="recommend_btn rep_comment">답글</span>
                                        </div><!-- //.reg_rep_rep -->
                                    </div> <!-- // .review_content -->
                                    </li>
                                </ul>
                            </div> <!-- // #reviewAll -->
                        </div> <!-- // #reviewList -->
                        <p class="reviewTitle">댓글 쓰기</p>
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
                                <form id="reviewForm" action="" method="get">
                                    <textarea class="review_write_area" placeholder="댓글을 남겨주세요-!"></textarea>
                                    <div id="reviewFormBtm">
                                        <ul class="uploaded_img_list">
                                            <li class="uploaded_img">
                                                <label for="imgUpload">
                                                    <i class="fa fa-plus-circle"></i>
                                                    <input id="imgUpload" type="file" />
                                                </label>
                                            </li>
                                        </ul>
                                        <button class="check_secret"><i class="fa fa-lock"></i></button>
                                        <!--<button class="check_secret"><i class="fa fa-unlock"></i></button>-->
                                        <button class="review_register">등록</button>
                                    </div> <!-- // #reviewFormBtm -->
                                </form>
                            </div> <!-- // #reviewBox -->
                        </div> <!-- // #writeReview -->
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

                        <div class="board_main_bottom">
                            <div class="row">
                                <div class="btn_wrapper col r_col">
                                    <span class="boardNav"><strong><i class="fa fa-angle-up"></i></strong> 이전글</span><span> <a href="">여의도로 가능 교통편 </a></span>
                                    <hr/>
                                    <span class="boardNav"><strong><i class="fa fa-angle-down"></i></strong> 다음글</span><span> <a href="">여의도 벚꽃축제 가는길 </a></span>
                                </div>
                            </div>
                        </div><!-- 이전글 다음글 -->
                    </div> <!-- // #reviewWrap -->
                

            <div id="picPopup">
                <div id="picDetail">
                    <div class="im"></div>
                    <!--<img src="/img/brokenpot.png" alt="">-->
                </div>
            </div><!-- 댓글 상세 사진 -->

            <div id="reportPopup">
                <div id="reportDetail">
                    <form>
                        <fieldset>
                            <legend>신고하기</legend>
                            <input type="radio" id="report1" name="report" value="1" checked><label for="report1">타인에 대한 욕설 또는 비방</label><br/>
                            <input type="radio" id="report2" name="report" value="2"><label for="report2">개인의 정보 유출 또는 사생활 침해</label><br/>
                            <input type="radio" id="report3" name="report" value="3"><label for="report3">음란성 내용 또는 음란물 링크</label><br/>
                            <input type="radio" id="report4" name="report" value="4"><label for="report4">상업적 광고, 사이트 / 홈피 홍보</label><br/>
                            <input type="radio" id="report5" name="report" value="5"><label for="report5">같은 내용의 반복(도배)</label><br/>
                            <button id="reportBtn" type="submit">신고하기</button>
                        </fieldset>
                    </form>
                </div>
            </div><!-- 신고팝업 -->

            <div id="copyURLpopup">
                <div id="URLcontainer">
                    <p>클릭하여 URL을 복사하세요.</p>
                    <div style="display: none;"><textarea id="myClipboard"></textarea></div>
                    <input id="url"  type="text" value="text to clipboard." />
                </div>
            </div><!-- url복사 팝업 -->
<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
        <script src="/js/jquery.js"></script>
        <script>
            var $picPopup = $("#picPopup");
            var $reportPopup = $("#reportPopup");
            var $reportBtn = $("#reportBtn");
            var $copyURLpopup = $("#copyURLpopup");
            var $url = $("#url");

            //url 받아오기
            var url = window.location.href;

            $("a").click(function (e) {
                e.preventDefault();
            });

            $(".check_secret").on("click", function (e) {
                e.preventDefault();
                $(".check_secret .fa").toggleClass("fa-unlock", "fa-lock");
                $(".check_secret .fa").toggleClass("fa-lock", "fa-unlock");
            });

            var $pEditPopup = $("#pEditPopup");
            $("#editSubmit").on("click", function (e) {
                e.preventDefault();
                $pEditPopup.hide();
            });

            //삭제 버튼 눌렀을때 팝업 보이게 해야함
            var $pDeletePopup = $("#pDeletePopup");
            $("#pDelButton").on("click", function (e) {
                e.preventDefault();
                $pDeletePopup.hide();
            });

            $picPopup.click(function () {
                $picPopup.hide();
            });

            $(".reportBtn").on("click", function () {
                $reportPopup.show();
            });

            $reportBtn.click(function (e) {
                e.preventDefault();

                alert("신고가 접수되었습니다.");
                $reportPopup.hide();
            });

            $(".review_rep_image").on("click", "img", function () {
                var image = $(this).attr("src");
                // console.log(image);
                $(".im").css("background-image", "url(" + image + ")");
                $picPopup.show();
            });

            $('#profile img').click(function(){
                // alert("test");
                $('#menu').slideToggle(300);
            }); // click() end
            $('#menu li').click(function(){
                $('#menu').slideUp();
            }); //click() end
            
            // 평가하기 버튼 눌렀을 때
            $('#evaluation').click(function(){
                
                // 팝업창 열림
                $('#evaluationPopup').fadeIn(500);
                
                // 완료 버튼 눌러야 팝업창 닫힘
                $('#evaluationOptions button').click(function(){
                    $('#evaluationPopup').fadeOut(500);
                }); // click() end
                
            }); // click() end

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

            $("#shareURL").on("click", function () {
                $("#copyURLpopup").show();
                $url.val(url);
            });

            function CopyToClipboard ( tagToCopy, textarea ){

                textarea.parentNode.style.display = "block";

                var textToClipboard = "";
                if ( "value" in tagToCopy ){    textToClipboard = tagToCopy.value;    }
                else {    textToClipboard = ( tagToCopy.innerText ) ? tagToCopy.innerText : tagToCopy.textContent;    }

                var success = false;

                if ( window.clipboardData ){
                    window.clipboardData.setData ( "Text", textToClipboard );
                    success = true;
                }
                else {
                    textarea.value = textToClipboard;

                    var rangeToSelect = document.createRange();

                    rangeToSelect.selectNodeContents( textarea );

                    var selection = window.getSelection();
                    selection.removeAllRanges();
                    selection.addRange( rangeToSelect );

                    success = true;

                    try {
                        if ( window.netscape && (netscape.security && netscape.security.PrivilegeManager) ){
                            netscape.security.PrivilegeManager.enablePrivilege( "UniversalXPConnect" );
                        }

                        textarea.select();
                        success = document.execCommand( "copy", false, null );
                    }
                    catch ( error ){  success = false;  }
                }

                textarea.parentNode.style.display = "none";
                textarea.value = "";

                if ( success ){ alert( ' 클립보드에 복사되었습니다. \n "Ctrl+v"를 사용하여 원하는 곳에 붙여넣기 하세요. ' ); }
                else {    alert( " 복사하지 못했습니다. " );    }

                /*
                if ( success ){    alert( ' The texts were copied to clipboard. \n\n Paste it, using "Ctrl + v". \n ' );    }
                else {    alert( " It was failed to copy. \n " );    }
                */
            }//클립보드에 복사

            $url.on("click", function () {
                $copyURLpopup.on("click", function () {
                    $copyURLpopup.hide();
                    return false;
                });//바깥 클릭시 팝업 닫힘
                CopyToClipboard( this, myClipboard );
                $copyURLpopup.hide();
            });//클립보드에 복사후 팝업 닫기
        </script>
    </body>
</html>