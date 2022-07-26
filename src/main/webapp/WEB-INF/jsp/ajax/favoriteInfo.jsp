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
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1>즐겨찾기 목록</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="favoriteList" items="${favoriteList }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${favoriteList.name }</td>
					<td>${favoriteList.address }</td>
					<td><button type="button"  class=" delete-btn btn btn-sm bg-danger text-white" data-favorite-id="${favoriteList.id }"> 삭제</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		$(document).ready(function () {
			$(".delete-btn").on("click", function(){
				
				// 지금 클릭된 버튼이 포함된 행의 id 얻어 오기 $(this) 이벤트가 발생한 그 객체를 말함
				let favoriteId = $(this).data("favorite-id");
				
				
				// id를 전달해서 해당 즐겨찾기를 삭제해주는 api 활용
				
				$.ajax({
					type:"get",
					url:"/ajax/favorite/delete",
					data:{"id":favoriteId},
					success:function(data){
						
						if(data.result == "success"){
							location.reload();
						}else{
							alert("삭제 실패!!");
						}
						
					},
					error:function(){
						alert("에러발생!!");
					}
				});
				
			});			
		});
	</script>
</body>
</html>