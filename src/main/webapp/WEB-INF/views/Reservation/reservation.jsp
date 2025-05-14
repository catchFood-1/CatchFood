<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>날짜 + 시간대 선택</title>

  <!-- flatpickr CDN -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  <style>
	  .menu-category {
	    display: none;
	  }
	  .menu-category.active {
	    display: block;
	  }
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp"/>

	<h1>CatchFood 예약</h1>
	<h3><i><u>예약 확정 후에는 변경이 불가합니다.</u></i></h3>
	<form name="reservation" method="post" action="reservationTemp" onsubmit="updateMenuHiddenFields()">
		<h3>예약 날짜 선택</h3>
		<input type="text" id="datePicker" placeholder="날짜 선택">
		<input type="hidden" id="reservationDate" name="reservationDate">
		<input type="hidden" id="reservationNumber" name="reservationNumber">
		<input type="hidden" id="menuNames" name="menuNames">
		<input type="hidden" id="menuPrices" name="menuPrices">
		<input type="hidden" id="totalPrice" name="totalPrice">
		
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
		
		<p><strong>예약 시간 확인 ☞ </strong> <span id="final"></span></p>
		
		<hr>
		<h3><음식 선택></h3>
		<div>
		    <button type="button" onclick="showCategory('korean')">한식</button>
		    <button type="button" onclick="showCategory('western')">양식</button>
		    <button type="button" onclick="showCategory('chinese')">중식</button>
		    <button type="button" onclick="showCategory('japanese')">일식</button>
		</div>
		
		<div id="korean" class="menu-category">
    		<h3>한식</h3>
    		<c:forEach var="menu" items="${korean}">
    			<c:set var="total" value="값" />
    			
				<table border="1" width="300" style="margin-bottom: 10px;">
		            <tr>
		                <td>
		                    <label>
                       			 <input type="checkbox" name="selectedMenus" value="${menu.menuNum}">
                       		 	${menu.menuName}
                   			 </label>
							<input type="hidden" name="menuName_${menu.menuNum}" value="${menu.menuName}">
							<input type="hidden" name="menuPrice_${menu.menuNum}" value="${menu.menuPrice}">
		                </td>
		                <td rowspan="4">
		                    <img src="${menu.menuImage}" width="100" onerror="this.style.display='none'">
		                </td>
		            </tr>
		            <tr><td>${menu.menuDescription}</td></tr>
		            <tr><td>${menu.menuPrice}원</td></tr>
		            <tr>
		                <td>수량: <input type="number" name="menuCount_${menu.menuNum}" value="1" min="1"></td>
		            </tr>
        		</table>
    		</c:forEach>
		</div>
		
		<script>
			
		
		</script>
		
		<div id="western" class="menu-category">
		    <h3>양식</h3>
		    <c:forEach var="menu" items="${western}">
		    	<c:set var="total" value="값" />
		    	
		        <table border="1" width="300" style="margin-bottom: 10px;">
		            <tr>
		                <td>
		                    <label>
                       			 <input type="checkbox" name="selectedMenus" value="${menu.menuNum}">
                       		 	${menu.menuName}
                   			 </label>
							<input type="hidden" name="menuName_${menu.menuNum}" value="${menu.menuName}">
							<input type="hidden" name="menuPrice_${menu.menuNum}" value="${menu.menuPrice}">
		                </td>
		                <td rowspan="4">
		                    <img src="${menu.menuImage}" width="100" onerror="this.style.display='none'">
		                </td>
		            </tr>
		            <tr><td>${menu.menuDescription}</td></tr>
		            <tr><td>${menu.menuPrice}원</td></tr>
		            <tr>
		               <td>수량: <input type="number" name="menuCount_${menu.menuNum}" value="1" min="1"></td>
		            </tr>
		        </table>
		    </c:forEach>
		</div>
		
		<div id="chinese" class="menu-category">
		    <h3>중식</h3>
		    <c:forEach var="menu" items="${chinese}">
		    	<c:set var="total" value="값" />
		    	
		        <table border="1" width="300" style="margin-bottom: 10px;">
		            <tr>
		            	<td>
			            	<label>
                       			 <input type="checkbox" name="selectedMenus" value="${menu.menuNum}">
                       		 	${menu.menuName}
                   			 </label>
							<input type="hidden" name="menuName_${menu.menuNum}" value="${menu.menuName}">
							<input type="hidden" name="menuPrice_${menu.menuNum}" value="${menu.menuPrice}">
		                </td>
		                <td rowspan="4">
		                    <img src="${menu.menuImage}" width="100" onerror="this.style.display='none'">
		                </td>
		            </tr>
		            <tr><td>${menu.menuDescription}</td></tr>
		            <tr><td>${menu.menuPrice}원</td></tr>
		            <tr>
		                <td>수량: <input type="number" name="menuCount_${menu.menuNum}" value="1" min="1"></td>
		            </tr>
		        </table>
		    </c:forEach>
		</div>
		
		<div id="japanese" class="menu-category">
		    <h3>일식</h3>
		    <c:forEach var="menu" items="${japanese}">
		    	<c:set var="total" value="값" />
				
		        <table border="1" width="300" style="margin-bottom: 10px;">
		            <tr>
		                <td>
			            	<label>
                       			 <input type="checkbox" name="selectedMenus" value="${menu.menuNum}">
                       		 	${menu.menuName}
                   			 </label>
							<input type="hidden" name="menuName_${menu.menuNum}" value="${menu.menuName}">
							<input type="hidden" name="menuPrice_${menu.menuNum}" value="${menu.menuPrice}">
		                </td>
		                <td rowspan="4">
		                    <img src="${menu.menuImage}" width="100" onerror="this.style.display='none'">
		                </td>
		            </tr>
		            <tr><td>${menu.menuDescription}</td></tr>
		            <tr><td>${menu.menuPrice}원</td></tr>
		            <tr>
		                <td>수량: <input type="number" name="menuCount_${menu.menuNum}" value="1" min="1"></td>
		            </tr>
		        </table>
		    </c:forEach>
		</div>
		
		<hr>
		<h3><요청 사항></h3>
		<textarea rows="4" cols="40" name="reservationRequest" placeholder="ex. 콩 알러지가 있어요. 콩 빼주세요."></textarea><p>
		<input type="submit" value="다음">
	</form>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>	
	
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
	          alert("날짜를 먼저 선택해주세요.");
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
	    	    const reservationDateValue = document.getElementById("reservationDate").value;

	    	    if (!reservationDateValue) {
	    	      alert("날짜와 시간을 먼저 선택해주세요.");
	    	      return;
	    	    }

	    	    const people = this.value;
	    	    document.getElementById("reservationNumber").value = people;

	    	    // 최종 선택 문장 만들기
	    	    const finalText = reservationDateValue + " / " + people + "명";
	    	    document.getElementById("final").textContent = finalText;
	    	  });
	    	});

		function showCategory(categoryId) {
			document.querySelectorAll('.menu-category').forEach(el => el.classList.remove('active'));
			document.getElementById(categoryId).classList.add('active');
		}
		
		window.onload = () => showCategory('korean'); 
		
		function updateMenuHiddenFields() {
			  const checkedMenus = document.querySelectorAll('input[name="selectedMenus"]:checked');

			  let menuNames = [];
			  let menuPrices = [];
			  let total = 0;

			  checkedMenus.forEach(menu => {
			    const menuNum = menu.value;
			    const name = menu.dataset.name;
			    const price = parseInt(menu.dataset.price);
			    const countInput = document.querySelector(`input[name="count_${menuNum}"]`);
			    if (!countInput) return;  // null이면 아래 코드 실행 안 하고 빠져나감
			    const count = parseInt(countInput.value);

			 	// 여기서 수량 0이면 건너뛰는 것도 좋음
			    if (isNaN(count) || count < 1) return;
			    
			    menuNames.push(`${name} x${count}`);
			    menuPrices.push(price * count);
			    total += price * count;
			  });

			  document.getElementById("menuNames").value = menuNames.join(", ");
			  document.getElementById("menuPrices").value = menuPrices.join(", ");
			  document.getElementById("totalPrice").value = total;
			}
		
		document.querySelectorAll('input[name="selectedMenus"]').forEach(cb => {
			  cb.addEventListener("change", updateMenuHiddenFields);
			});

			document.querySelectorAll('input[type="number"][name^="count_"]').forEach(input => {
			  input.addEventListener("input", updateMenuHiddenFields);
			});
			
			
			document.querySelector("form").addEventListener("submit", function (e) {
			  // 기존 hidden 제거
			  document.querySelectorAll(".menu-data").forEach(el => el.remove());

			  document.querySelectorAll("input[name='selectedMenus']:checked").forEach(cb => {
			    const form = cb.form;
			    
			    // 이름
			    const nameInput = document.createElement("input");
			    nameInput.type = "hidden";
			    nameInput.name = "menuName";
			    nameInput.value = cb.dataset.name;
			    nameInput.classList.add("menu-data");
			    form.appendChild(nameInput);

			    // 가격
			    const priceInput = document.createElement("input");
			    priceInput.type = "hidden";
			    priceInput.name = "menuPrice";
			    priceInput.value = cb.dataset.price;
			    priceInput.classList.add("menu-data");
			    form.appendChild(priceInput);
			  });
			});
			

			
	</script>
</body>
</html>