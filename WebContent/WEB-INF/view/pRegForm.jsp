<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>우리동네꿀팁 pRegForm</title>
    <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
    <style>
        #content .aux{
            background-color: #fff;
        }
        /* h2요소*/
        .aux h2 {
            font-size: 25px;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
            padding: 30px;
        }

        #regBox {
            width: 520px;
            margin-left: 170px;
        }
        #regBox .row {
            margin: 16px 0;
        }
        #regBox .msg {
            display:block;
            position:relative;
            width:350px;
            left:160px;
            color:#E91E63;
            font-weight:500;
            margin:5px 0;
            display: none;
        }
        #regBox .msg.ok {
            color:#2196F3;
        }

        .label {
            width: 140px;
            height: 20px;
            display: inline-block;
            font-size: 17px;
            /*text-align: center;*/
            margin-right: 10px;
            color: #424242;
            line-height: 20px;
        }

        #name,#address,#business_hours,#holiday,#phone,#tag,#web_site {
            /*#regBox input {*/
            border: 1px solid #E1E1E1;
            width: 333px;
            height: 20px;
            font-size: 18px;
            font-family: 'Noto Sans KR', sans-serif;
            /*font-weight: 500;*/
            padding: 6px;
            color: #606060;
            transition: .2s ease;
        }

        #address {
            width: 280px;
        }
        .add_btn {
            width: 51px;
            height: 33px;
            border: none;
            margin: auto;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 15px;
            font-weight: normal;
        }
        #map {
            display: inline-block;
            width: 345px;
            height: 300px;
            border: 1px solid #E1E1E1;
        }
        .preview {
            display: inline-block;
            width: 345px;
            height: 300px;
            border: 1px solid #E1E1E1;
        }
        #category1 {
            border: 1px solid #E1E1E1;
            width: 345px;
            height: 32px;
            font-size: 18px;
            font-family: 'Noto Sans KR', sans-serif;
            color: #606060;
            margin-bottom: 13px;
        }
        #category2 {
            border: 1px solid #E1E1E1;
            width: 345px;
            height: 32px;
            font-size: 18px;
            font-family: 'Noto Sans KR', sans-serif;
            color: #606060;
            margin-left: 153px;
            margin-bottom: 13px;
        }
        #category3 {
            /*display: none;*/
            border: 1px solid #E1E1E1;
            width: 345px;
            height: 32px;
            font-size: 18px;
            font-family: 'Noto Sans KR', sans-serif;
            color: #606060;
            margin-left: 153px;
            margin-bottom: 13px;
        }
        .price_line {
            margin-left: 159px;
        }
        .radio_label {
            /*background-color: #E91E63;*/
            width: 83px;
            margin-right: 0px;
            margin-bottom: 10px;
        }
        .radio_first {
            margin: 0 194px 10px 0;
        }
        .photo_btn {
            width: 90px;
            height: 40px;
            padding: 3px 15px;
            margin-right: 10px;
            border: 1px solid #E1E1E1;
            font-size: 17px;
        }
        .row em {
            color: #858585;
        }
        .photo_preview {
            margin-left: 153px;
            margin-top: 10px;
            position: relative;
            background-image: url("/img/ohu.jpg");
            background-position: center;
            background-size: cover;
        }
        .del_btn {
            width: 25px;
            height: 25px;
            border-radius: 25px;
            border: none;
            background-color: #fff;
            color: #666666;
            position: absolute;
            top: 5px;
            right: 5px;
            opacity: 0.6;
        }
        #explanation {
            display: inline-block;
            width: 341px;
            height: 150px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 17px;
        }
        .ex {
            vertical-align: top;
        }
        .tag_preview {
            /*display: none;*/
            height: 0;
            margin: 10px 0 0 153px;
            padding-bottom: 10px;
            border: none;
        }
        .tag_preview span {
            display: inline-block;
            padding: 0 10px;
            height: 30px;
            background-color: #FEBF37;
            text-align: center;
            line-height: 30px;
            margin: 0 15px 15px 0;
            position: relative;
        }
        .tag_preview span button {
            width: 20px;
            height: 20px;
            border-radius: 20px;
            border: 1px solid #E1E1E1;
            text-indent: -1px;
            line-height: 18px;
            background-color: #fff;
            color: #666666;
            position: absolute;
            right: -10px;
            top: -6px;
        }
        #regBox .button {
            width: 520px;
            height: 100px;
            margin: 30px 0 80px 0;
            line-height: 100px;
        }
        #regBox .button button {
            width: 348px;
            height: 40px;
            border: none;
            margin-left: 151px;
            background-color: #E1E1E1;
            font-size: 20px;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: bold;
        }
        #regBox .button button:hover {
            background-color: #FEBF37;
        }

        /* 장소찾기 팝업 */
        #popup {
            /*display: none;*/
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,.8);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 2000;
        }
        #popSearch {
            width: 600px;
            height: 700px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -350px 0 0 -300px;
            background-color: #fff;
        }
        .search_box {
            width: 500px;
            margin: auto;
        }
        .search_box h2 {
            text-align: center;
            padding: 30px;
            font-size: 20px;
            font-weight: bold;
        }
        .input_box {
            width: 478px;
            border: 1px solid #757575;
            padding: 10px 10px;
            margin: 10px 0 20px 0;
        }
        #searchInput {
            width: 400px;
            border: none;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 18px;
            margin-left: 5px;
        }
        .list_box {
            width: 478px;
            height: 370px;
            border: 1px solid #757575;
            padding: 10px 10px;
            margin: 10px 0;
        }
        .list_box li {
            border-bottom: 1px solid #E1E1E1;
            margin-bottom: 5px;
        }
        .list_box li:nth-last-child(1) {
            border: none;
        }
        .list_box .place_name {
            width: 180px;
            font-size: 17px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .list_box .place_add {
            font-size: 15px;
            margin-bottom: 5px;
        }
        #next {
            display: block;
            width: 500px;
            height: 40px;
            margin-top: 10px;
            text-align: center;
            line-height: 40px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 17px;
            color: #424242;
            border: none;
            background-color: #E1E1E1;
            text-decoration: none;
        }
        #next:hover {
            background-color: #FEBF37;
            color: #000;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"></c:import>

            <h2>꿀플등록</h2>
            <div id="regBox">
                <form method="post" action="pReg.gt">
                    <fieldset>
                        <legend class="screen_out">플레이스등록폼</legend>
                        <div class="row">
                            <label for="name" class="label">* 플레이스 이름</label>
                            <input  id="name" title="플레이스 이름을 입력해주세요."
                                    name="name"
                                    placeholder="예) 오후의 과일" autocomplete="off" />
                            <div class="msg name">
                                필수정보 입니다.
                            </div>
                        </div>
                        <div class="row">
                            <label for="address" class="label">* 주소/위치</label>
                            <input  id="address" title="주소를 입력해주세요."
                                    name="addr"
                                    placeholder="예) 봉천동" />
                            <button id="submit" class="add_btn">찾기</button>
                            <div class="msg address">
                                필수정보 입니다.
                            </div>
                        </div>
                        <div class="row">
                            <label class="label">&nbsp;&nbsp;&nbsp;지도</label>
                            <div id="map">
                                <!--지도api-->
                            </div>
                        </div>
                        <div class="row">
                            <label for="category1" class="label">* 카테고리</label>
                            <select id="category1" name="p_category">
                                <option>1차</option>
                                <option value="1">편의시설</option>
                                <option value="2">음식점</option>
                                <option value="3">지역마크</option>
                            </select>
                            <select id="category2" name="p_category">
                                <option>2차</option>
                                <option value="11">편의점</option>
                                <option value="12">은행</option>
                                <option value="13">병원 / 약국</option>
                                <option value="14">생활 / 편의</option>
                                <option value="15">엔터테인먼트</option>
                                <option value="16">쇼핑</option>
                                <option value="17">기타</option>
                                <option value="18">식당</option>
                                <option value="19">베이커리 / 디저트</option>
                                <option value="20">카페 / 커피전문점</option>
                                <option value="22">술점</option>
                                <option value="22">노점상</option>
                            </select>
                            <select id="category3" name="p_category">
                                <option>3차</option>
                                <option value="51">주유소</option>
                                <option value="52">세차장</option>
                                <option value="53">주차장</option>
                                <option value="54">숙박시설</option>
                                <option value="55">세탁소</option>
                                <option value="56">헤어 / 뷰티</option>
                                <option value="57">사우나 / 찜질방</option>
                                <option value="58">애견 (샵 / 동물병원)</option>
                                <option value="59">스포츠시설</option>
                                <option value="60">우체국</option>
                                <option value="61">구두수선</option>
                                <option value="62">프린트 / 제본</option>
                                <option value="63">인형뽑기</option>
                                <option value="64">클럽</option>
                                <option value="65">노래방</option>
                                <option value="66">당구장</option>
                                <option value="67">골프연습장</option>
                                <option value="68">볼링장</option>
                                <option value="69">PC방</option>
                                <option value="70">스크린야구</option>
                                <option value="71">멀티방</option>
                                <option value="72">영화관</option>
                                <option value="73">만화방</option>
                                <option value="74">방탈출</option>
                            </select>
                        </div>
                        <div class="row">
                            <label class="label">&nbsp;&nbsp;&nbsp;가격대</label>
                            <input value="1" id="1" name="price" type="radio" checked="checked" />
                            <label for="1" class="label radio_first">무료</label>
                            <input value="2" id="2" name="price" type="radio" class="price_line" />
                            <label for="2" class="label radio_label">만원 이하</label>
                            <input value="3" id="3" name="price" type="radio" />
                            <label for="3" class="label radio_label">1-3만원</label>
                            <input value="4" id="4" name="price" type="radio" />
                            <label for="4" class="label radio_label">3-5만원</label>
                            <input value="5" id="5" name="price" type="radio" class="price_line" />
                            <label for="5" class="label radio_label">5-7만원</label>
                            <input value="6" id="6" name="price" type="radio"  />
                            <label for="6" class="label radio_label">7-10만원</label>
                            <input value="7" id="7" name="price" type="radio" />
                            <label for="7" class="label radio_label">10만원이상</label>
                        </div>
                        <div class="row">
                            <label for="business_hours" class="label">&nbsp;&nbsp;&nbsp;영업시간</label>
                            <input  id="business_hours" title="영업시간을 입력해주세요."
                                    name="bhour"
                                    placeholder="예) 일-목:11:00-22:00 / 금-토:11:00-24:00" />
                        </div>
                        <div class="row">
                            <label for="holiday" class="label">&nbsp;&nbsp;&nbsp;휴일</label>
                            <input  id="holiday" title="휴일을 입력해주세요."
                                    name="holiday"
                                    placeholder="예) 화,마지막주 월" />
                        </div>
                        <div class="row">
                            <label for="phone" class="label">&nbsp;&nbsp;&nbsp;전화번호</label>
                            <input  id="phone" title="전화번호을 입력해주세요."
                                    name="phone"
                                    placeholder="예) 02-877-5700" />
                        </div>
                        <div class="row">
                            <label class="label">&nbsp;&nbsp;&nbsp;주차</label>
                            <input id="free" name="parking" value="F" type="radio" checked="checked" />
                            <label for="free" class="label radio_label">무료</label>
                            <input id="charge" name="parking" value="C"  type="radio" />
                            <label for="charge" class="label radio_label">유료</label>
                            <input id="impossible" name="parking" value="I" type="radio" />
                            <label for="impossible" class="label radio_label">불가능</label>
                        </div>
                        <div class="row">
                            <p class="label">* 사진</p>
                            <label for="photo" class="photo_btn" title="사진을 한장 등록해주세요">사진추가</label> <em>한 장만 등록 가능합니다~!</em>
                            <input id="photo" class="screen_out" type="file"
                                   name="photo"/>
                            <div class="msg photo">
                                필수 정보입니다.
                            </div>
                            <div class="preview photo_preview">
                                사진미리보기
                                <button class="del_btn"><i class="fa fa-times"></i></button>
                            </div>
                        </div>

                        <div class="row">
                            <label for="explanation" class="label ex">* 설명</label>
                            <textarea id="explanation" name="exp" title="설명을 입력해주세요" maxlength="100"></textarea>
                            <div class="msg explanation">
                                필수 정보입니다.
                            </div>
                        </div>
                        <div class="row">
                            <label for="tag" class="label">&nbsp;&nbsp;&nbsp;태그</label>
                            <input  id="tag" name="tag" title="태그를 입력해주세요." maxlength="10"
                                    placeholder="예) 과일음료" />
                            <div class="preview tag_preview">
                                        <span>
                                            #세상에서제일제일맛남
                                            <button><i class="fa fa-times"></i></button>
                                        </span>
                                <span>
                                            #굿굿
                                             <button><i class="fa fa-times"></i></button>
                                        </span>
                                <span>
                                            #세상에서제일제일맛남
                                            <button><i class="fa fa-times"></i></button>
                                        </span>
                                <!--<span>#짱맛개맛존맛</span>-->
                                <!--<span>#신선도최고</span>-->
                                <span>
                                            #세상에서제일제일맛남
                                            <button><i class="fa fa-times"></i></button>
                                        </span>
                            </div>
                        </div>
                        <div class="row">
                            <label for="web_site" class="label">&nbsp;&nbsp;&nbsp;웹사이트</label>
                            <input  id="web_site" title="사이트주소를 입력해주세요."
                                    name="web"
                                    placeholder="예) www.afternoonfruits.com" />
                        </div>
                        <div class="button">
                            <button>꿀플 등록하기</button>
                        </div>
                    </fieldset>
                </form>
            </div> <!-- // #regBox -->

            <div id="popup">
                <div id="popSearch">

                    <div class="search_box">
                        <h2>꿀플 등록</h2>
                        <p>등록하려는 장소를 입력하세요.</p>
                        <div class="input_box">
                            <label for="searchInput"><i class="fa fa-search"></i></label>
                            <input id="searchInput" placeholder="장소명" autocomplete="off" />
                        </div>
                        <p>같은 이름의 장소들</p>
                        <div class="list_box">
                            <ul>
                                <li>
                                    <p class="place_name">오후의발견</p>
                                    <p class="place_add">서울특별시 중구 을지로32길 15-19</p>
                                </li>
                                <li>
                                    <p class="place_name">티앙팡 오후의 홍차</p>
                                    <p class="place_add">서울특별시 서대문구 이화여대2가길 19 </p>
                                </li>
                                <li>
                                    <p class="place_name">오후의 과일</p>
                                    <p class="place_add">서울특별시 중구 을지로32길 15-19</p>
                                </li>
                                <li>
                                    <p class="place_name">오후의작은선물</p>
                                    <p class="place_add">서울특별시 중구 을지로32길 15-19</p>
                                </li>
                                <li>
                                    <p class="place_name">오후의테라피금송이</p>
                                    <p class="place_add">서울특별시 중구 을지로32길 15-19</p>
                                </li>
                            </ul>
                        </div>
                        <button id="next">목록에 없다면, 다음 단계로</button>
                    </div>

                </div>
            </div> <!-- // #popup -->

<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
<script src="/js/jquery.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=h4zSgnvM6iBZzoyUUgt4&submodules=geocoder"></script>
<script>
	$('#profile img').click(function(){
	    // alert("test");
	    $('#menu').slideToggle(300);
	}); // click() end
	$('#menu li').click(function(){
	    $('#menu').slideUp();
	}); //click() end
	
	$("#next").click(function () {
	    $("#popup").hide();
	});
	
	
	//지도
	var map = new naver.maps.Map("map", {
	    //center: new naver.maps.LatLng(37.3595316, 127.1052133),
	    zoom: 14,
	    mapTypeControl: true
	});
	
	var infoWindow = new naver.maps.InfoWindow({
	    anchorSkew: true
	});
	
	map.setCursor('pointer');
	
	
	// search by tm128 coordinate
	function searchCoordinateToAddress(latlng) {
	    var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);
	
	    infoWindow.close();
	
	    naver.maps.Service.reverseGeocode({
	        location: tm128,
	        coordType: naver.maps.Service.CoordType.TM128
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('다시 입력하슈!');
	        }
	
	        var items = response.result.items,
	            htmlAddresses = [];
	
	        for (var i=0, ii=items.length, item, addrType; i<2; i++) {
	            item = items[i];
	            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';
	
	            htmlAddresses.push(addrType +' '+ item.address);
	            //htmlAddresses.push('&nbsp&nbsp&nbsp -> '+ item.point.x +','+ item.point.y);
	        }
	
	        $("#address").val(item.address);
	        infoWindow.setContent([
	            '<div style="padding:10px;min-width:100px;line-height:150%;font-size: 12px">',
	            //'<h4 style="margin-top:5px;">검색 좌표 : '+ response.result.userquery +'</h4><br />',
	            htmlAddresses.join('<br />'),
	            '</div>'
	        ].join('\n'));
	
	        infoWindow.open(map, latlng);
	    });
	}
	
	// result by latlng coordinate
	function searchAddressToCoordinate(address) {
	    naver.maps.Service.geocode({
	        address: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }
	
	        var item = response.result.items[0],
	            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
	            point = new naver.maps.Point(item.point.x, item.point.y);
	
	        $("#address").val(item.address);
	        infoWindow.setContent([
	            '<div style="padding:10px;min-width:100px;line-height:150%;font-size: 13px">',
	            '<h4 style="margin-top:5px;">검색 주소 : '+ response.result.userquery +'</h4><br />',
	            addrType +' ' + item.address +'<br />',
	            //'&nbsp&nbsp&nbsp -> '+ point.x +','+ point.y,
	            '</div>'
	        ].join('\n'));
	
	
	        map.setCenter(point);
	        infoWindow.open(map, point);
	    });
	}
	
	function initGeocoder() {
	
	    map.addListener('click', function(e) {
	        searchCoordinateToAddress(e.coord);
	    });
	
	    $('#address').on('keydown', function(e) {
	        var keyCode = e.which;
	
	        if (keyCode === 13) { // Enter Key
	            searchAddressToCoordinate($('#address').val());
	        }
	    });
	
	    $('#submit').on('click', function(e) {
	        e.preventDefault();
	
	        searchAddressToCoordinate($('#address').val());
	    });
	
	    //searchAddressToCoordinate('정자동 178-1');
	}
	
	naver.maps.onJSContentLoaded = initGeocoder;
	
	
	
	
	var $name = $("#name"),
	    $nameMsg = $(".name"),
	    $address = $("#address"),
	    $addMsg = $(".address"),
	    $explanation = $("#explanation"),
	    $expMsg = $(".explanation");
	
	//플레이스 이름 유효성 검사
	$name.keyup(function() {
	
	    var name = $name.val();
	
	    if(name=="") {
	        $nameMsg.removeClass("ok").show();
	        $name.val("").focus();
	        return false;
	    }else {
	        $nameMsg.hide();
	    }
	});//$name keyup() end
	
	//jax 처리
	$address.keyup(function() {
	
	    var address = $address.val();
	
	    if(address=="") {
	        $addMsg.removeClass("ok").show();
	        $address.val("").focus();
	        return false;
	    }else {
	        $addMsg.hide();
	    }
	});//$address keyup() end
	
	
	//설명 유효성 검사
	$explanation.keyup(function() {
	
	    var explanation = $explanation.val();
	
	    if(explanation=="") {
	        $expMsg.removeClass("ok").show();
	        $explanation.val("").focus();
	        return false;
	    }else {
	        $expMsg.hide();
	    }
	});//$explanation keyup() end
</script>
</body>
</html>