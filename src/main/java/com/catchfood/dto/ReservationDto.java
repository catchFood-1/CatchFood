package com.catchfood.dto;

import java.time.LocalDateTime;

import lombok.Data;
@Data
public class ReservationDto {
	private int reservationNum; //자동증가
	private String reservationDate; //datetime -> String으로 바꿈(DB는 그대로)
	private int reservationNumber;
	private String reservationRequest;
	private LocalDateTime reservationNow; //예약했을때 시간 자동 생성
	private int userNum; //외래키
}
