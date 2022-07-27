<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션 예약</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
		 <div class="container" >
            <header class="d-flex display-4 text-secondary justify-content-center pt-3">통나무 팬션</header>
            <nav style="background-color:chocolate ;">
                <ul class="nav nav-fill">
                    <li class="nav-item"><a href="#" class="nav-link text-white" >팬션소개</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white" >객실보기</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white" >예약안내</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white">커뮤니티</a></li>               
                </ul>
            </nav>
            <section>
            	<form method="get" action="/ajax/pension/insert">
	            	<h1 class="text-center">예약하기</h1>
	            	이름<input type="text" class="form-control" name="name" id="nameInput">
	            	예약날짜<input type="text" class="form-control" name="date" id="datepicker">
	            	숙박일수<input type="text" class="form-control" name="day" id="dayInput">
	            	숙박인원<input type="text" class="form-control" name="headcount" id="headcountInput">
	            	전화번호<input type="text" class="form-control" name="phoneNumber" id="phoneNumberInput">
	            	<button type="submit" class="btn bg-warning form-control" id="addBtn">예약하기</button>
            	</form>
            </section>
            <footer>
                <small class="text-secondary">
                        제주특별자치도 제주시 애월읍<br>
                        사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표 : 김동욱 <br>
                        Copyright 2025 tongnamu All right reserved
                </small>
            </footer>
	  </div>     
	  <script>
		  $(document).ready(function(){
			 
			  
				$("#datepicker").datepicker();
				
				$("#addBtn").on("click",function(){
					
					let name = $("#nameInput").val();
					let date = $("#datepicker").val();
					let day = $("#dayInput").val();
					let headcount = $("#headcountInput").val();
					let phoneNumber = $("#phoneNumberInput").val();
					
					if( name == ""){
						alert("이름을 입력해주세요");
						return false;
					}
					if( date == ""){
						alert("예약날짜 입력해주세요");
						return false;
					}
					if( day == ""){
						alert("숙박일수 입력해주세요");
						return false;
					}
					if( headcount == ""){
						alert("숙박인원을 입력해주세요");
						return false;
					}
					if( phoneNumber == ""){
						alert("전화번호를 입력해주세요");
						return false;
					}					
				});
				  
		  });

  </script>
</body>
</html>