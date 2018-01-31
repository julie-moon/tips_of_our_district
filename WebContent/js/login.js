        /* 로그인 팝업 클릭 */
        $('#menu .login').click(function (e) {
            e.preventDefault()
            //alert("test");
            $('#loginBox').show();
            $('.login_box').show();
            
        }); // #menu .login click() end
        
        /* 로그인 일단 반환 */
        /*$(".login_box").click(function () {
           return false;
        }); // 클릭 한번 막기
        */
        
        
        /* 로그인 팝업 해제 */
        $('#loginBox').click(function () {
            //alert("test");
            $('#loginBox').hide();
            $('.login_box').hide();
        }); // #loginPopup click() end

       // var $userId = $("#username");
       // var $userPwd = $("#pwd");
        /* id값 문자열 전체, 2자리부터 ~ 15자리까지 */
        var idReg = /^[\w]{2,19}$/;
        /* pwd값 영문+숫자 8자 이상 ~ 15자까지 */
        var pwdReg = /^[a-z][a-z0-9]{7,15}$/;

        // 아이디, 비밀번호 중복 체크
        // input창 유효성 검사
        $('#loginForm').on("submit",function () {
            // 유효성 검사를 input마다 하려면 keyup이벤트를
            // submit을 하면 버튼 누를때 다 나온다 (왜? 인풋마다 검사하면 서버가 과부하 걸리니까 한번에 한다)
        	//alert("dfsdfsfdsdfd");
        	
        	var id = $("#username").val().trim();
        	var pwd  =$("#pwd").val().trim();
        	
        	console.log(id);
        	console.log(pwd);
        	   $.ajax({
                   url:"/ajax/login",
                   // data {} 객체 {이름(id=컨트롤러 단의 이름값과 동일하게 : 값}
                   data:{id:id,pwd:pwd} ,
                   dataType :"json",
                   error:function () {
                       alert("에러");
                   },
                   success: function (json) {
                       if(json.result){
                    	   //alert("성공");
                    	   // 로그인 성공할 시, 페이지 refresh(로그인 직전 페이지로 이동)
                    	   location.reload();
                       }else{
                    	  // alert("실패");
                    	   console.log();
                    	   $("#username").val("").focus();
                    	   $("#pwd").val("");
                           $(".failMsg").show();
                       }
                   } // success() end
               }); // $.ajax()end
               //alert("test");
            return false;
        }); /* #form on(submit) end */
