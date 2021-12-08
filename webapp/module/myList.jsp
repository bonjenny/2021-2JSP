<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, cartManagement.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>myList.jsp</title>
	<link rel="stylesheet" href="css/list.css" type="text/css" media="screen" />

<script type="text/javascript">
	function check(cart_no) {
		document.location.href="cart/cart_control.jsp?action=edit&cart_no="+cart_no;
	}
</script>

</head>

<jsp:useBean id="cDatas" scope="session" class="java.util.ArrayList"/>

<body>
	<header>
	<!-- header 시작 -->
		<nav id="navi">
		<!-- navi 시작 -->
			<ul>
				<li><a href="index.jsp?CONTENTPAGE=content.jsp">
					<img src="img/home.png"></a></li>
				<li>&#5171;</li>
				<li><a href="index.jsp?CONTENTPAGE=myPage.jsp">마이페이지</a></li>
				<li>&#5171;</li>
				<li><a href="index.jsp?CONTENTPAGE=myList.jsp">나의 찜목록</a></li>
			</ul>
		</nav><!-- navi 끝 -->
	</header><!-- header 끝 -->

	<section id="main">
    <!-- section main 시작 -->
    	<section id="category1">
        <!-- section category1 시작 -->
        	<div id="search">
        		<h3>나의 찜목록</h3>
				<input type="button" value="관광명소" style="background-color: #bbb;">
            	<input type="button" value="맛집"><br>
            	<select>
					<option value="피자">피자
					<option value="카페">카페
					<option value="국밥">국밥	
				</select>
				<input type="search" placeholder="search">
        	</div>

            <div id="category1_list">
                <!-- category1_list 시작 -->   
           	<% for(CartBook cb : (ArrayList<CartBook>)cDatas) { %>       
                <div class="items">
                	<svg class="list" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32" viewBox="0 0 32 32" fill="rgb(231, 76, 60)" data-svg-content="true"><g><path d="M 31.984,13.834C 31.9,8.926, 27.918,4.552, 23,4.552c-2.844,0-5.35,1.488-7,3.672 C 14.35,6.040, 11.844,4.552, 9,4.552c-4.918,0-8.9,4.374-8.984,9.282L0,13.834 c0,0.030, 0.006,0.058, 0.006,0.088 C 0.006,13.944,0,13.966,0,13.99c0,0.138, 0.034,0.242, 0.040,0.374C 0.48,26.872, 15.874,32, 15.874,32s 15.62-5.122, 16.082-17.616 C 31.964,14.244, 32,14.134, 32,13.99c0-0.024-0.006-0.046-0.006-0.068C 31.994,13.89, 32,13.864, 32,13.834L 31.984,13.834 z"></path></g></svg>			
                    <a href="javascript:check(<%=cb.getCart_no() %>)"><img src="<%=cb.getSrc() %>"></a>
                    <div class="itemp">
                        <p class="title"><%=cb.getProduct_name() %></p>
                        <p class="comment">
                        	<%=cb.getProduct_detail() %><br>
                        	평점 <%=cb.getReview() %>(<%=cb.getRatings() %>)  ·  찜 723<br>
                        	330km ｜ <%=cb.getDistinguishing() %><br><br>
                        	주소: <%=cb.getLocation() %><br>
							전화:<%=cb.getTel() %><br>
							홈페이지: https://www.instagram.com/leejeamo…<br><br>
                       	</p>
                        <p class="time"><%=cb.getTime() %></p>
                        <p class="memo">메모남기기</p>
                    </div>
                </div> 
          	<% } %>                
            </div> <!-- category1_list 끝 -->
        </section> <!-- section category1 끝 -->
    </section> <!-- section main 끝 -->
</body>
</html>