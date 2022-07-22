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

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>
		제목<br>
		<input type="text" id="nameInput" class="form-control"><br>
		주소<br>
		<input type="text" id="addressInput" class="form-control"><br>
		<button id="addBtn" class="btn bg-success text-white form-control">추가</button>
		
	</div>
	<script>
		$(document).ready(function(){
			$("#addBtn").on("click",function(){
				
				let name = $("#nameInput").val();
				let address = $("#addressInput").val();
				
				if(name ==""){
					alert("이름을 입력하세요");
					return false;
				}
				if(address == ""){
					
					alert("주소를 입력하세요");
					return false;
				}
				if(address.startsWith("https://")){
					alert("옳바른 주소입니다");
				}

				if(address.startsWith("http://")){
					
					alert("주소가 잘못되었습니다");
					return false;
				}				
				$.ajax({
					
					type:"post",
					url:"/ajax/favorite/insert",
					data:{"name":name, "address":address},
					
					success:function(data){
						
						if(data.result =="success"){
							location.href = "/ajax/favorite/list"
						}else{
							
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