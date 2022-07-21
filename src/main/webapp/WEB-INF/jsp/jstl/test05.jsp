<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<header>
			<h1 class="">과거날씨</h1>
		</header>
		<div class="d-flex">
		
			<nav>
				<img src="/img/logo.png" width="100">
				<ul class="nav flex-column bg-primary">
					<li class="nav-items"><a href="#" class="nav-link text-white">날씨</a></li>
					<li class="nav-items"><a href="/jstl/weatherinput" class="nav-link text-white">날씨입력</a></li>
					<li class="nav-items"><a href="#" class="nav-link text-white">테마날씨</a></li>
					<li class="nav-items"><a href="#" class="nav-link text-white">관측기후</a></li>
					
				</ul>
			</nav>
			<section>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="weatherHistory" items="${weatherHistory }">
						<tr>
							<td><fmt:formatDate value="${weatherHistory.date }" pattern="yyyy년 M월d일"/></td>
							<c:choose>
								<c:when test="${weatherHistory.weather eq'맑음' }" >
									<td><img src="/img/sunny.jpg"></td>
								</c:when>
								<c:when test="${weatherHistory.weather eq'흐림' }" >
									<td><img src="/img/cloudy.jpg"></td>
								</c:when>
								<c:when test="${weatherHistory.weather eq'구름조금' }" >
									<td><img src="/img/partlyCloudy.jpg"></td>
								</c:when>
								<c:otherwise>
									<td><img src="/img/rainy.jpg"></td>
								</c:otherwise>																									
							</c:choose>
							<td>${weatherHistory.temperatures }°C</td>
							<td>${weatherHistory.precipitation }mm</td>
							<td>${weatherHistory.microDust}</td>
							<td>${weatherHistory.windSpeed }km/h</td>
						</tr>	
						</c:forEach>
					</tbody>
					
				</table>
			</section>
		</div>
		<footer class="d-flex">
			<div>
				<img src="/img/logo2.png" width="100">
			</div>
			<span class="text-secondary ml-3">(07062)서울시 동작구 여의대방로16길 61<br>
			Copyright@2020 KMA. All Right RESERVED.</span>
			
		</footer>
	</div>
</body>
</html>