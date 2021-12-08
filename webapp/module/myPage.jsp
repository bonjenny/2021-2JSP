<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mb" class="memberManagement.ManagementBook" scope="session"/>

<script type="text/javascript">
	function sub1(member_id) {
		document.location.href="reservation/reservation_control.jsp?action=list&member_id="+member_id;
	}
	function sub3(member_id) {
		document.location.href="cart/cart_control.jsp?action=list&member_id="+member_id;
	}
	function sub4(member_id) {
		document.location.href="management/manager_control.jsp?action=infoEdit&member_id="+member_id;
	}
</script>

<!-- myPage.jsp -->
<head>
<link rel="stylesheet" href="css/list.css" type="text/css" media="screen" />
</head>
<header>
	<!-- header 시작 -->
		<nav id="navi">
		<!-- navi 시작 -->
			<ul>
				<li><a href="javascript:sub1('<%=mb.getMember_id()%>')">나의 예약</a></li>    	
    			<li><a href="index.jsp?CONTENTPAGE=myReview.jsp">나의 리뷰</a></li>
    			<li><a href="javascript:sub3('<%=mb.getMember_id()%>')">나의 찜목록</a></li>
    			<li><a href="javascript:sub4('<%=mb.getMember_id()%>')">나의 정보</a></li>
			</ul>
		</nav><!-- navi 끝 -->
	</header><!-- header 끝 -->

<section id="main">
<!-- section main 시작 --> 
	<section id="category1">
	<!-- section category1 시작 -->
		<div id="search">
        		<h3>마이 페이지</h3>
				<input type="button" value="항공" style="background-color: #bbb;">
            	<input type="button" value="숙박" >
            	<input type="button" value="투어·티켓" style="background-color: #bbb;"><br>
            	<select>
					<option value="카테고리 전체">카테고리 전체
				</select>
				<input type="date" placeholder="search"> ~
				<input type="date" placeholder="search">
				<input type="search" placeholder="search">
        	</div>
      	
       	<div id="category1_list">
        <!-- category1_list 시작 -->  
			<div class="items">
				<a href="#"><img src="img/ellisia.png"></a>
				<div class="itemp">
					<p class="title">엘리시아</p>
					<p class="comment">
						룸B 402호<br>
						2021.10.08(금) ~ 2021.10.09(토), 1박<br>
						자차<br>
						체크인 15:00 ~ 체크아웃 11:00<br>
						호텔 비지니스, 부산광역시 해운대구 XX로 123<br><br>
						대표전화: 000-0000-0000
					</p>
				</div>
			</div>
		</div> <!-- category1_list 끝 -->
	</section> <!-- section category1 끝 -->                                
</section> <!-- section main 끝 -->