<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>날짜 + 시간대 선택</title>

  <!-- flatpickr CDN -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<body>
	<img src="/images/CatchFoodWhite.png" alt="CaTchFood">
	<h1>CatchFood 예약</h1>
	<h3><i><u>예약 확정 후에는 변경이 불가합니다.</u></i></h3>
	<form name="reservation" method="post" action="reservationTemp">
		<h3>예약 날짜 선택</h3>
		<input type="text" id="datePicker" placeholder="날짜 선택">
		<input type="hidden" id="reservationDate" name="reservationDate">
		<input type="hidden" id="reservationNumber" name="reservationNumber">
	
		<hr>
		<h3><시간 선택></h3>
		<div id="timeButtons">
			<button type="button" class="time-slot" value="10:00">10:00</button>
		    <button type="button" class="time-slot" value="11:00">11:00</button>
		    <button type="button" class="time-slot" value="12:00">12:00</button>
		    <button type="button" class="time-slot" value="13:00">13:00</button>
		    <button type="button" class="time-slot" value="14:00">14:00</button>
		    <br>브레이크 타임 15:00-17:00<br>
		    <button type="button" class="time-slot" value="17:00">17:00</button>
		    <button type="button" class="time-slot" value="18:00">18:00</button>
		    <button type="button" class="time-slot" value="19:00">19:00</button>
		    <button type="button" class="time-slot" value="20:00">20:00</button>
		    <button type="button" class="time-slot" value="21:00">21:00</button>
		 </div>

		<hr>
		<h3><인원 선택></h3>
		<div>
			<button type="button" class="people" value="1">1명</button>
			<button type="button" class="people" value="2">2명</button>
			<button type="button" class="people" value="3">3명</button>
			<button type="button" class="people" value="4">4명</button>
			<button type="button" class="people" value="5">5명</button><br>
			<button type="button" class="people" value="6">6명</button>
			<button type="button" class="people" value="7">7명</button>
			<button type="button" class="people" value="8">8명</button>
			<button type="button" class="people" value="9">9명</button>
			<button type="button" class="people" value="10">10명</button>
		</div>
		
		<hr>
		<h3><요청 사항></h3>
		<textarea rows="4" cols="40" name="reservationRequest" placeholder="ex. 콩 알러지가 있어요. 콩 빼주세요."></textarea>
		
		<!-- 음식.jsp포함하기  --><br>
		
		<p><strong>최종 선택:</strong> <span id="final"></span></p>
		
		<input type="submit" value="다음">
	</form>
	
	<script>
		let selectedDate = null;
	
	    flatpickr("#datePicker", {
	      dateFormat: "Y-m-d",
	      minDate: "today",
	      maxDate: new Date().fp_incr(14),
	      onChange: function(selectedDates, dateStr) {
	        selectedDate = dateStr;
	        document.getElementById("final").textContent = "";
	        document.getElementById("reservationDate").value = "";
	      }
	    });
	
	    document.querySelectorAll(".time-slot").forEach(button => {
	      button.addEventListener("click", function () {
	        if (!selectedDate) {
	          alert("먼저 날짜를 선택해주세요.");
	          return;
	        }
	
	        const time = this.value;
	        const fullDateTime = selectedDate + " " + time;
	
	        document.getElementById("reservationDate").value = fullDateTime;
	        document.getElementById("final").textContent = fullDateTime;
	      });
	    });
	    
	    document.querySelectorAll(".people").forEach(button => {
	        button.addEventListener("click", function () {
	          const people = this.value;
	          document.getElementById("reservationNumber").value = people;

	          // 기존 날짜+시간 텍스트 가져오기
	          const baseText = document.getElementById("reservationDate").value;
	          
	          // 최종 선택 문장 만들기
	          const finalText = baseText ? baseText + " / " + people + "명" : people + "명";

	          // 보여주기
	          document.getElementById("final").textContent = finalText;
	        });
	      });
	</script>
</body>
</html>