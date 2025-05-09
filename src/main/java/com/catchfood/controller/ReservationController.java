package com.catchfood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catchfood.dao.ReservationDao;
import com.catchfood.dto.ReservationDto;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {
	@Autowired
	ReservationDao reservationDao;
	
	//예약 폼
	@RequestMapping("reservation")
	public String reservationForm() {
		return "Reservation/reservation";
	}
	
	
	//예약 리스트(관리자용)
	@RequestMapping("reservationList")
	public String list(Model model) {
		model.addAttribute("lists", reservationDao.reservationList());
		return "Reservation/reservationList";
	}
	
	//예약 임시 저장공간으로 넘기기
	@RequestMapping("reservationTemp")
	public String sessionInsert(ReservationDto reservationDto, HttpSession session) {
		session.setAttribute("tempReservation", reservationDto);   //tempReservation=임시예약
		return "Reservation/reservationConfirmation";
	}
	
	
		
	//(폼 -> )예약 추가
//	@RequestMapping("reservationInsert")
//	public String insert(ReservationDto reservationDto) {
//		reservationDao.reservationInsert(
//				reservationDto.getReservationDate(),
//				reservationDto.getReservationNumber(),
//				reservationDto.getReservationRequest(),
//				1
//				);
//		return "redirect:reservationList";
//	}
	
	//예약 삭제
	@RequestMapping("reservationDelete")
	public String delete(ReservationDto reservationDto) {
		reservationDao.reservationDelete(reservationDto.getReservationNum());
		
		return "redirect:reservationList";
	}
}
