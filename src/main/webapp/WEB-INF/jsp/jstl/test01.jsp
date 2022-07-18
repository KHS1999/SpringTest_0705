<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>1.JSTL core 변수</h4>
	<c:set var="number1" value="36"/>
	<c:set var="number2" value="3"/>
	<h2>첫번째 숫자 :${number1 } </h2>
	<h2>두번째 숫자 : ${number2 }</h2>
	
	<hr>
	
	<h4>2.JSTL core 연산</h4>	
	<c:set var="sum">${number1 + number2}</c:set> 
	<c:set var="min">${number1 - number2}</c:set> 
	<c:set var="duplicate">${number1 * number2}</c:set> 
	<c:set var="division">${number1 / number2}</c:set> 
	
	<h2>더하기:${sum}</h2>
	<h2>빼기:${min}</h2>
	<h2>곱하기:${duplicate}</h2>
	<h2>나누기:${division}</h2>
	
	<hr>
	
	<h4>3.JSTL core out</h4>
	<c:out value="<title>core out</title>"/>
	
	<hr>
	
	<h4>4.JSTL core if</h4>
	
	<c:set var="average" value="${(number1 + number2) /2 }"/>
	
	<c:if test="${average >=10 }">
		<h1>${average }</h1>
	</c:if>
	<c:if test="${average < 10 }">
		<h3>${average }</h3>
	</c:if>
	
	<hr>
	
	<h2>5.JSTL core if</h2>
	
	<c:if test="${number1 * number2 >100 }">
		<c:out value="<script>alert('너무 큰 수 입니다.')</script>" escapeXml="false"/>
	</c:if>
</body>
</html>