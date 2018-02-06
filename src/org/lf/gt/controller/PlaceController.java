package org.lf.gt.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.lf.gt.service.BookmarksService;
import org.lf.gt.service.PlacesService;
import org.lf.gt.service.ReviewsService;
import org.lf.gt.service.TagContentService;
import org.lf.gt.util.ResizeImageUtil;
import org.lf.gt.vo.Place;
import org.lf.gt.vo.TagContent;
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
public class PlaceController {
	
	private PlacesService placeService;
	private ReviewsService reviewsService;
	private BookmarksService bookmarkService;
	
	public void setPlaceSevice(PlacesService placeSevice) {
		this.placeService = placeSevice;
	}
	
	public void setReviewsService(ReviewsService reviewsService) {
		this.reviewsService = reviewsService;
	}
	
	public void setBookmarkService(BookmarksService bookmarkService) {
		this.bookmarkService = bookmarkService;
	}
	
	@RequestMapping("/review/write")
	public String writeReview(String reviewContent, @RequestParam(value="pic") List<String> pics, HttpSession session, @RequestHeader String referer, int placeNo) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		//loginUser.setNo(1);
		reviewsService.writeReviewsMJY(placeNo, loginUser.getNo(), pics, reviewContent);
		
		return "redirect:"+referer;
	}
	
	@RequestMapping("/place/upload") 
	@ResponseBody
	public String ajaxUpload(MultipartFile upload, HttpServletRequest request) {

		ServletContext context = request.getServletContext();
		// 톰캣이 설치된 그 루트경로를 얻어옴
		String rootPath = context.getRealPath("/");
		// 원본저장할 경로
		String uploadPath = rootPath+"img/place_review/upload"+File.separator; /* pDetail이랑 같이 src 바꿔줘야함 */
	
		// 그 경로에 중복된 이름이 있으면 바꿔야 함.(UUID)
		String fileName = UUID.randomUUID()+upload.getOriginalFilename();
	
		// 경로 + 파일명으로 파일 객체 생성
		File file = new File(uploadPath+fileName);
	
		// 그리고 이동
		try {
			upload.transferTo(file);
			
			// 이동 완료 후에 썸네일 이미지 만들기
			// 썸네일 이미지 저장할 경로
			String repPic = rootPath+"img/place_review/rep_pic"+File.separator;
			String popRepPic = rootPath+"img/place_review/pop_rep_pic"+File.separator;
			String popListPic = rootPath+"img/place_review/pop_list_pic"+File.separator;
			String MoreListPic = rootPath+"img/place_review/more_list_pic"+File.separator;
			String MoreDetailPic = rootPath+"img/place_review/more_detail_pic"+File.separator;
			
			// 원본을 크기에 맞게 리사이즈
			ResizeImageUtil.resize(uploadPath+fileName, repPic+fileName, 64, 40);
			ResizeImageUtil.resize(uploadPath+fileName, popRepPic+fileName, 565, 475);
			ResizeImageUtil.resize(uploadPath+fileName, popListPic+fileName, 45, 31);
			ResizeImageUtil.resize(uploadPath+fileName, MoreListPic+fileName, 168, 168);
			ResizeImageUtil.resize(uploadPath+fileName, MoreDetailPic+fileName, 980, 600);
			
		} catch (Exception e) {
			e.printStackTrace();
		} // try ~ catch end
	
		try {
			fileName = URLEncoder.encode(fileName,"UTF-8").replace("+", "%20");
		} catch (Exception e) {
			e.printStackTrace();
		} // try ~ catch end
	
		// json으로 파일이름을 넘김
		return "{\"imageName\":\""+fileName+"\"}";
		
	} // ajaxUpload() end

	
	@RequestMapping("/reviewDetail/{reviewNo}")
	@ResponseBody
	public Map<String, Object> reviewDetail(@PathVariable int reviewNo) {
		return reviewsService.getReviewDetail(reviewNo);
	}
	
	@RequestMapping("/place/{no}/{type}/page/{page}") /* /order/new/page/1 */
	public String pDetail(@PathVariable int no,
			              @PathVariable String type, Model model,
						  @PathVariable int page, HttpSession session) {
		
		// System.out.println("no : " + no);
		
		model.addAllAttributes(placeService.placeInfo(no, page, type));
		/* 리뷰 정렬할 때 사용 */
		model.addAttribute("no", no);
		model.addAttribute("type",type);
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			System.out.println("loginUser no : " + loginUser.getNo());
		}
		
		return "pDetail";
	}
	
	/*
	@RequestMapping("/ajax/bookmark/update/bee/{userNo}")
	@ResponseBody
	public String bookmarkBeeUpdate2(@PathVariable int userNo, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser"); 
		boolean result = bookmarkService.executeBeeBookmark(loginUser.getNo(), userNo);
		
		return "{\"result\":"+result+"}";
	} // bookmarkBeeList() end
	*/
	
	/*
	@RequestMapping("")
	public String reviewUploadForm() {
		return "";
	}
	
	@RequestMapping("")
	public String reviewUpload() {
		return "pDetail";
	}
	*/
	
	@RequestMapping(value="/place/register", method=RequestMethod.GET)
	public String pRegForm() {
		return "pRegForm";
	}
	
	@RequestMapping(value="/place/register", method=RequestMethod.POST)
	public String pReg() {
		return "redirect:/place/100";
	}
	
	@RequestMapping("/place")
	public String gPlace() {
		return "gPlace";
	}
	
	@RequestMapping("/place/result/detail")
	public String pResult() {
		return "pResult";
	}
	
	@RequestMapping("/place/result")
	public String pSearch() {
		return "pSearch";
	}
}
