package com.catchfood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.catchfood.dao.UserDao;
import com.catchfood.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
		@Autowired
		UserDao userDao;
		
		//회원가입 form
	    @RequestMapping("register")
	    public String register() {
	        return "User/register";
	    }
	    
	    
	    //회원가입 처리메소드
	    @RequestMapping("registerProcess")
	    public String registerProcess(HttpServletRequest request, @ModelAttribute UserDto user, Model model) {
	        String emailFront = request.getParameter("userEmail");
	        String emailDomain = request.getParameter("email");
	        String fullEmail = emailFront + "@" + emailDomain;

	        user.setUserEmail(fullEmail);

	        userDao.registerProcess(user);

	        return "redirect:login";
	    }

	    
		//로그인 폼으로 가기
	    @RequestMapping("login")
	    public String loginForm() {
	    	return "User/login";
	    }
	    
	    
	    //로그인 성공시 -> main
	    @RequestMapping("loginSuccess")
	    public String loginSuccess( @RequestParam("userId") String userId, 
	    							@RequestParam("userPasswd") String userPasswd,
	    							HttpSession session,
	    							Model model) {
	    	UserDto loginUser = userDao.login(userId, userPasswd);
	    	if (loginUser != null) {
	    		session.setAttribute("loginUser", loginUser); // 세션유지 
	    		return "redirect:/"; // 메인 페이지
	    	}else {
	    		model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
	            return "User/login"; //login폼
	    	}
	    }
	    
	    
	    //로그아웃 -> main
	    @RequestMapping("logout")
	    public String logout(HttpSession session) {
	        session.invalidate(); // 세션 종료
	        return "redirect:/";  // 메인 페이지
	    }
	    
	    
	    //주소창 검색 jsp로 이동
	    @RequestMapping("popup")
		public String popup() {
			return "User/jusoPopup";
	    }

	    

}