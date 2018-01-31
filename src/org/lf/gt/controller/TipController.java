package org.lf.gt.controller;

import org.lf.gt.service.TipsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TipController {

	private TipsService tipService;
	
	public void setTipService(TipsService tipService) {
		this.tipService = tipService;
	}
	/*
	@RequestMapping("/tip")
	public String gTip() {
		return "gTip";
	}
	*/
	@RequestMapping("/tip") /* /{no} */
	public String tDetail() {
		return "tDetail";
	}
	
	@RequestMapping("/tip/{category}")
	public String tList(@PathVariable String category) {
		//System.out.println(category);
		//model.addAllAttributes(tipsService.get(category));
		return "tList";
	}

	@RequestMapping("/tip/search/{q}")
	public String tResult(@PathVariable String q) {
		//System.out.println(q);
		//model.addAllAttributes(tipsService.get(q));
		return "tResult";
	}
	
}
