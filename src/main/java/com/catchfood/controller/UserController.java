package com.catchfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	    @RequestMapping("/loginTest")
	    public String loginTest(HttpSession session) {
	        session.setAttribute("userId", "testuser1");
	        session.setAttribute("userNum", 1);
	        return "redirect:/reservation";
	    }
	}

