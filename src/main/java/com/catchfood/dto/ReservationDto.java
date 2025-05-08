package com.catchfood.dto;

import java.time.LocalDateTime;

import lombok.Data;
@Data
public class ReservationDto {
	private int reservationNum;
	private LocalDateTime reservationDate;
	private int reservationNumber;
	private String reservationRequest;
	private LocalDateTime reservationNow;
	private int userNum;
}
