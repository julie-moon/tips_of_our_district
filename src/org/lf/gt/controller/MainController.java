package org.lf.gt.controller;

import org.lf.gt.service.PlacesService;
import org.lf.gt.service.TipsService;
import org.lf.gt.service.UsersService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	private PlacesService placesService;
	private TipsService tipsService;
	private UsersService usersService;
	
	public void setPlacesService(PlacesService placesService) {
		this.placesService = placesService;
	}
	
	public void setTipsService(TipsService tipsService) {
		this.tipsService = tipsService;
	}
	
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/search/{keyword}")
	public String wSearch(@PathVariable String keyword) {
		//model.addAllAttributes(tipsService.get(keyword));
		//model.addAllAttributes(placesService.get(keyword));
		return "wSearch";
	}
	
}
