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

<meta charset="UTF-8">
<title>Insert title here</title>

<body>
	<div class="container">
		<h1>회원 정보 리스트</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>국적</th>
					<th>이메일</th>
					<th>자기소개</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="member" items="${memberList }" varStatus="status">
			<c:set var="nationality" value="${member.nationality }"/>
				<tr>
					<td>${status.count }</td>
					<td>${member.name }</td>
					<%-- 전화본호가 010으로 시작하면 전화 번호 출력 --%>
					<c:choose>
						<c:when test="${fn:startsWith(member.phoneNumber, '010') }">
							<td>${member.phoneNumber }</td>
						</c:when>	
					<%-- 그렇지 않으면 유효하지 않은 전화번호라고 출력 --%>
						<c:otherwise>
							<td>유효하지 않은 전화번호</td>
						</c:otherwise>
					</c:choose>
					<td>${fn:replace(nationality, "삼국시대","삼국-")}</td>
					<td><b>${fn:split(member.email, '@')[0]}</b>@${fn:split(member.email, '@')[1]}</td>
					<td>${fn:substring( member.introduce, 0, 15) }
						<c:if test="${fn:length(member.introduce) > 15 }">
							...
						</c:if>
						
					</td>
							
				</tr>
			</c:forEach>	
			</tbody>
		</table>
	</div>
</body>
</html>