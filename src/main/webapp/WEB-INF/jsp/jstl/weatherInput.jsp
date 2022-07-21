<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>         
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

 
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<header>
			<h1 class="">날씨입력</h1>
		</header>
		<div class="d-flex">
		
			<nav>
				<img src="/img/logo.png" width="100">
				<ul class="nav flex-column bg-primary">
					<li class="nav-items"><a href="/jstl/test05" class="nav-link text-white">날씨</a></li>
					<li class="nav-items"><a href="#" class="nav-link text-white">날씨입력</a></li>
					<li class="nav-items"><a href="#" class="nav-link text-white">테마날씨</a></li>
					<li class="nav-items"><a href="#" class="nav-link text-white">관측기후</a></li>			
				</ul>
			</nav>
			<section>
				<form method="get" action="/jstl/test06">
					날짜<input type="text" id="date" name="date"> 
					날씨
					<select name="weather">
						<option value="맑음">맑음</option>
						<option value="흐림">흐림</option>
						<option value="비">비</option>
						<option value="구름조금">구름조금</option>
					</select>
					
					미세먼지
					<select name="microDust">
						<option value="좋음">좋음</option>
						<option value="보통">보통</option>
						<option value="나쁨">나쁨</option>
						<option value="최악">최악</option>
					</select><br>
					기온<input type="text" name="temperatures">
					강수량<input type="text" name="precipitation"> 
					풍속<input type="text" name="windSpeed"> 
					<button class="btn bg-success text-white" type="submit">저장</button> 
				</form>
			</section>
			<footer class="d-flex">
				<div>
					<img src="/img/logo2.png" width="100">
				</div>
				<span class="text-secondary ml-3">(07062)서울시 동작구 여의대방로16길 61<br>
				Copyright@2020 KMA. All Right RESERVED.</span>
			
		</footer>
	</div>
	<script>
		$(document).ready(function(){
			
			$("#date").datepicker({
				dateFormat:"yy년-mm월-dd일"
			});
			
		});
	</script>
</body>
</html>