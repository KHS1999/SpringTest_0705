<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 객실보기</title>
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
                    <li class="nav-item"><a href="/ajax/pension/input" class="nav-link text-white" >예약하기</a></li>
                    <li class="nav-item"><a href="/ajax/pension/list" class="nav-link text-white">예약목록</a></li>               
                </ul>
            </nav>    
            <section>
           		<div class="img">
                   	 <img src="/img/test06_banner1.jpg" alt="메인 배너"  width="1110px" id="bannerImage" >
                     <img src="/img/test06_banner2.jpg" alt="통나무 이미지" width="1110px" class="d-none" id="img2">
                     <img src="/img/test06_banner3.jpg" alt="통나무 이미지" width="1110px" class="d-none" id="img3">
                     <img src="/img/test06_banner4.jpg" alt="통나무 이미지" width="1110px" class="d-none" id="img4">
                </div> 	
                <div class="d-flex">
                    <div class="col-4 display-4 d-flex justify-content-center align-items-center" style="background-color: sienna;">
                        <div class="display-4 text-white">
                            실시간 <br>예약하기
                        </div>
                    </div>
                    <div class="col-5" style="background-color:chocolate ;">
                        <div class="d-flex align-items-end mt-3 text-white">
                            <h3>예약확인</h3> 

                        </div>
                        <div class="text-white">
                            이름 <input type="text" class="form-control " id="nameInput">
                            전화번호<input type="text" class="form-control" id="phoneNumberInput">
                        </div>
                        
                        <button class="btn bg-success " style="color:aliceblue;" id="btn">조회하기</button>
                        
                    </div>
                    <div class="col-3 d-flex justify-content-center align-items-center text-white" style="background-color: sienna;">
                        <div>
                            <h3>예약문의:</h3><br>
                            <h1>010-</h1>
                            <h1>000-1111</h1>
                    	</div>
                    </div>
                </div>
            	
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

                var imageList = ["/img/test06_banner1.jpg","/img/test06_banner2.jpg","/img/test06_banner3.jpg","/img/test06_banner4.jpg"];
                let index = 0; 

                setInterval(function(){
                    index++;

                    if(index == 4){
                        index = 0;
                    }

                    // 이미지 교체
                    $("#bannerImage").attr("src",imageList[index]);
                        
                    
                },3000);
					$("#btn").on("click", function(){
						// 이름과 전화번호 가져오기
						let name = $("#nameInput").val();
						let phoneNumber =$("#phoneNumberInput").val();
						
						if(name == ""){
							alert("이름 입력하세요");
							return ;
						}
						if(phoneNumber == ""){
							alert("전화번호를 입력하세요");
							return ;
						}	
						
						$.ajax({
							type:"get",
							url:"/ajax/pension/get",
							data:{"name":name, "phoneNumber":phoneNumber},
							success:function(data){
								
							
								if(data ==""){
									alert("조회된 결과가 없습니다.")
								}else{
									let content = "";
									content += "이름: " + data.name +"\n";
									content += "날짜 : " + data.date.slice(0,10) +"\n";
									content += "일수 : " + data.day +"\n";
									content += "인원 : " + data.headcount +"\n";
									content += "상태 : " + data.state +"\n";
		
									alert(content);
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