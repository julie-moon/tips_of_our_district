package org.lf.gt.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.lf.gt.service.BookmarksService;
import org.lf.gt.service.PlacesService;
import org.lf.gt.service.ReplyService;
import org.lf.gt.service.ReviewsService;
import org.lf.gt.service.UsersService;
import org.lf.gt.vo.Bookmark;
import org.lf.gt.vo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {
	
	private UsersService usersService;
	
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}
	
	private BookmarksService bookmarkService;
	
	public void setBookmarkService(BookmarksService bookmarkService) {
		this.bookmarkService = bookmarkService;
	}
	
	private ReplyService replyService;
	
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	private ReviewsService reviewsService;
	
	public void setReviewsService(ReviewsService reviewsService) {
		this.reviewsService = reviewsService;
	}
	
	private PlacesService placesService;
	
	public void setPlacesService(PlacesService placesService) {
		this.placesService = placesService;
	}
	
	/*
	@RequestMapping("/user/{no}/bookmark/place/page/{page}")
	public String bookmarkPlace(@PathVariable int no, @PathVariable int page, Model model) {
		model.addAllAttributes(bookmarkService.bookmarkInfo(no, page));
		model.addAllAttributes(usersService.myPageInfo(no));
		return "myPageBookmarkPlace"; 
	}
	*/
	
	@RequestMapping("/user/{no}")
	public String myPage(@PathVariable int no, Model model, HttpSession session) {
		// System.out.println(no);
		
		if(session != null) {
			User loginUser = (User)session.getAttribute("loginUser");
			System.out.println(loginUser);
			
			model.addAttribute("loginUser", loginUser);
		} // if end 
		
		model.addAllAttributes(usersService.myPageInfo(no));
		
		return "myPage";
		
	} // myPage() end
	
	
	@RequestMapping("/ajax/ePlace/{userNo}/page/{page}")
	@ResponseBody
	public Map<String, Object> evaluatedPlaceList(@PathVariable int userNo, @PathVariable int page){
		return placesService.evaluatedPlaceInfo(userNo, page);
	} // evaluatedPlaceList() end
	
	@RequestMapping("/ajax/bookmark/place/{userNo}/page/{page}")
	@ResponseBody
	public Map<String, Object> bookmarkPlaceList(@PathVariable int userNo, @PathVariable int page, @RequestParam String name){
		System.out.println(name);
		return bookmarkService.bookmarkInfo(userNo, page, name);
	} // bookmakrPlaceList() end
	
	@RequestMapping("/ajax/bookmark/tip/{userNo}/page/{page}")
	@ResponseBody
	public Map<String, Object> bookmarkTipList(@PathVariable int userNo, @PathVariable int page, @RequestParam String name) {
		return bookmarkService.bookmarkInfo(userNo, page, name);
	} // bookmarkTipList() end
	
	@RequestMapping("/ajax/bookmark/bee/{userNo}")
	@ResponseBody
	public List<Bookmark> bookmarkBeeList(@PathVariable int userNo) {
		return bookmarkService.bookmarkBeeList(userNo);
	} // bookmarkBeeList() end
	
	@RequestMapping("/ajax/reply/{userNo}/page/{page}") /* 카테고리필요 */
	@ResponseBody
	public Map<String, Object> replyList(@PathVariable int userNo, @PathVariable int page, @RequestParam String category) {
		return replyService.replyInfo(userNo, page, category);
	} // replyList() end  
	
	@RequestMapping("/ajax/review/{userNo}/page/{page}")
	@ResponseBody
	public Map<String, Object> reviewList(@PathVariable int userNo, @PathVariable int page) {
		return reviewsService.reviewInfo(userNo, page);
	} // reviewList() end
	
	@RequestMapping("/level")
	public String level() {
		return "level";
	} // level() end
	
	// 회원가입폼
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm() {
		return "joinForm";
	}
	
	// 회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(User user) {
		//System.out.println(user.getProfile());
		//System.out.println(user.getId());
		//System.out.println(user.getPwd());
		//System.out.println(user.getNick());
		//System.out.println(user.getEmail());
		//System.out.println(user.getBirth());
		//System.out.println(user.getSex());
		//System.out.println(user.getLocation());
		//System.out.println(user.getArea());
		//System.out.println(user.getPeriod());
		usersService.register(user);
		return "redirect:/main";	
	}
	
	// 프로필 사진 업로드 
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(HttpServletRequest request,
			Model model, MultipartFile profile) {
		// servletContext 객체를 request로부터 얻어옴
		ServletContext context = request.getServletContext();
		// 톰캣이 설치된 그 루트 경로를 얻어옴
		String rootPath = context.getRealPath("/");
		
		System.out.println(rootPath);
		// 원본 저장할 경로
		String uploadPath = rootPath+"upload"+File.separator;
		System.out.println(uploadPath);
		// uuid : 중복없이 파일이름 만들기
		String fileName = UUID.randomUUID()+profile.getOriginalFilename();
		// 경로 + 파일명으로 파일 객체 생성
		File file = new File(uploadPath+fileName);
		System.out.println(file);
		
		// 이동
		try {
			profile.transferTo(file);
		}catch(Exception e){
			e.printStackTrace();
		} // try ~ catch end
		
		// view 페이지에서 출력
		model.addAttribute("img",fileName);
		
		return "redirect:join";
	}
	
	// id 중복 체크 (유효성 검사 : ajax)
	@RequestMapping("/ajax/check/id")
	@ResponseBody
	public String checkId(String id) {
		// System.out.println(id);
		boolean result = usersService.checkId(id);
		return "{\"result\":"+result+"}";
	}
	
	// nickname 중복 체크 (유효성 검사 : ajax)
	@RequestMapping("/ajax/check/nickname")
	@ResponseBody
	public String checkNick(String nickname) {
		//System.out.println(nickname);
		boolean result = usersService.checkNick(nickname);
		return "{\"result\":"+result+"}";
	}
	
	// email 중복 체크 (유효성 검사 : ajax)
	@RequestMapping("/ajax/check/email")
	@ResponseBody
	public String checkEmail(String email) {
		//System.out.println(email);
		boolean result = usersService.checkEmail(email);
		return "{\"result\":"+result+"}";
	}
	
	// login 처리 
	@RequestMapping("/ajax/login")
	@ResponseBody
	public String login(User user, HttpSession session) {
		
		//System.out.println("login처리");
		
		User user2 = usersService.login(user);
		session.setAttribute("loginUser", user2);
		
		boolean result = user2!=null;
		
		return "{\"result\":"+result+"}";
		
	}
	
	// logout 처리
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	@RequestMapping(value="/user/edit/{no}", method=RequestMethod.GET)
	public String editForm(@PathVariable int no) {
		return "uEditForm";
	}
	
	@RequestMapping(value="/user/edit", method=RequestMethod.POST)
	public String edit(@RequestHeader String referer) {
		return "redirect:"+referer;
	}
	
}
