package com.catchfood.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catchfood.dao.BasketDao;
import com.catchfood.dto.BasketViewDto;

import jakarta.servlet.http.HttpSession;
@Controller
public class BasketController {
	@Autowired
	BasketDao basketdao;
	
	@RequestMapping("mybasket")
	public String mybasket(HttpSession session, Model model) {
        if (session.getAttribute("userNum") == null) {
            session.setAttribute("userNum",2);          
            session.setAttribute("userId", "testuser123");  
        }
		int userNum = (int)session.getAttribute("userNum");
		String userId = (String)session.getAttribute("userId");
		List<BasketViewDto> myreservation = basketdao.MyBasket(userNum);
		
		model.addAttribute("myreservation",myreservation);
		model.addAttribute("userId",userId);
		return"Basket/mybasket";
	}
}
