<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팬션 정보</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<body>
	 <div class="container" >
            <header class="d-flex display-4 text-secondary justify-content-center pt-3">통나무 팬션</header>
            <nav style="background-color:chocolate ;">
                <ul class="nav nav-fill">
                    <li class="nav-item"><a href="#" class="nav-link text-white" >팬션소개</a></li>
                    <li class="nav-item"><a href="/ajax/pension/lookUp" class="nav-link text-white" >객실보기</a></li>
                    <li class="nav-item"><a href="/ajax/pension/input" class="nav-link text-white" >예약하기</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white">예약목록</a></li>               
                </ul>
            </nav>
            <section>
				<h1 class="text-center">예약목록보기</h1>
				<table class="table text-center">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="pensionList" items="${pensionList }" varStatus="status">
					
						<tr>
							
							<td>${pensionList.name}</td>
							<td><fmt:formatDate value="${pensionList.date }" pattern="yyyy년 M월 d일"/></td>
							<td>${pensionList.day }</td>
							<td>${pensionList.headcount }</td>
							<td>${pensionList.phoneNumber }</td>
							<c:choose>
								<c:when test="${pensionList.state eq '대기중' }">
									<td><span class="text-primary">${pensionList.state }</span></td>
								</c:when>
															
								<c:otherwise>
									<td><span class="text-success">${pensionList.state }</span></td>
								</c:otherwise>	
							</c:choose>
							<td><button type="button" class="btn bg-danger text-white delete-btn" data-pension-id="${pensionList.id }">삭제</button></td>
						</tr>
					</c:forEach>	
					</tbody>
				</table>
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
	  		
	  		$(".delete-btn").on("click",function(){
	  			
	  			// 해당 행을 삭제한다.
	  			// 삭제할 대상의 id를 얻어낸다.
	  			let pensionId = $(this).data("pension-id");
	  			
	  			// 삭제 api를 호출한다.
	  			
	  			$.ajax({
	  				
	  				type:"get",
	  				url:"/ajax/pension/delete",
	  				data:{"id":pensionId},
	  				success:function(data){
	  					// {"result" : "success"} , {"result":"fail"}
	  					if(data.result == "success"){
	  						location.reload();
	  					}else{
	  						alert("삭제 실패!!");
	  					}
	  				},
	  				error:function(){
	  					alert("에러 발생!!");
	  				}
	  			});
	  			
	  		});
	  		
	  		
	  		
	  	});
	  </script>   
</body>
</html>