<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h1>즐겨찾기 추가하기</h1>
		제목<br>
		<input type="text" id="titleInput" class="form-control"><br>
		주소<br>
		<input type="text" id="addressInput" class="form-control"><button type="button" id="duplicateBtn" class=" btn bg-primary text-white">중복확인</button><br>
		<div id="urlcheck1" class="text-small d-none text-danger">중복된 url 입니다.</div>
		<div id="urlcheck2" class="text-small d-none text-primary">사용가능한 url 입니다.</div>
		<button id="addBtn" class="btn bg-success text-white form-control">추가</button>
		
	</div>
	<script>
		$(document).ready(function(){
			
			$("#duplicateBtn").on("click", function () {
				
				let address = $("#addressInput").val();
				
				if(address == ""){
					
					alert("주소를 입력하세요");
					return false;
					
				}
				$.ajax({
					type:"get",
					url:"/ajax/favorite/is_duplicate",
					data:{"address": address},
					success:function(data){
						
						if(data.is_duplicate){
							$("#urlcheck1").removeClass("d-none");
							// alert("중복된 url입니다.");
						}else{
							$("#urlcheck2").removeClass("d-none");
							// alert("사용가능한 url입니다.");
						}
					},
					error:function(){
						alert("에러 발생!!");
					}
					
				});
				
			});
			$("#addBtn").on("click",function(){
				
				let title = $("#titleInput").val();
				let address = $("#addressInput").val();
				
				if(title ==""){
					alert("제목을 입력하세요");
					return false;
				}
				if(address == ""){
					
					alert("주소를 입력하세요");
					return false;
				}
				
				// http://, https:// 로 시작하지 않으면 주소형식이 잘못되었습니다. 경고
				
				if(!address.startsWith("http://") && !address.startsWith("https://")){
					
					alert("주소형식이 잘못 되었습니다!");			
					return ;
				}
								
				$.ajax({
					
					type:"post",
					url:"/ajax/favorite/insert",
					data:{"name":title, "address":address},
					
					success:function(data){
						// {"result :" "success"}
						// {"result :" "fail"}
						
						if(data.result == "success"){
							
							// 성공
							location.href = "/ajax/favorite/list"
						}else{
							
							// 실패
							alert(data.result);
							
							alert("삽입실패");
						}
					},
					error:function(){
						
						alert("에러발생");
					}
					
				});
			});
		});
	</script>
</body>
</html>