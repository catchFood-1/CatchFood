package com.catchfood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catchfood.dao.MenuDao;

@Controller
public class MenuController {
	@Autowired
	MenuDao menudao;
	
	@RequestMapping("/menulist")
	public String getMenusByCategory(Model model) {
	    model.addAttribute("korean", menudao.getMenusByCategory(1));
	    model.addAttribute("western", menudao.getMenusByCategory(2));
	    model.addAttribute("chinese", menudao.getMenusByCategory(3));
	    model.addAttribute("japanese", menudao.getMenusByCategory(4));
	    return "Menu/menulist";
	}
}
