package com.catchfood.dao;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.catchfood.dto.ReservationDto;

@Mapper
public interface ReservationDao {
	//예약 리스트 전체 보기(관리자)
	public List<ReservationDto> reservationList();
			
	//예약 삭제하기(관리자)
	public int reservationDelete(int reservationNum);
			
			
			
	//고객이 결제 하고난뒤 -> DB로 insert
	public int reservationInsert(ReservationDto reservationDto);
		
}	
	
	
	
	
//		public int reservationInsert(
//				@Param("reservationDate") String reservationDate,
//				@Param("reservationNumber") int reservationNumber,
//				@Param("reservationRequest") String reservationRequest,
//				@Param("userNum") int userNum
//				);

