<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>항공권 예약 사이트 - 회원가입</title>
    <link rel="stylesheet" href="css/join.css" type="text/css" media="screen" />
</head>
<body>
	<header>
	<!-- header 시작 -->
		<nav id="navi">
		<!-- navi 시작 -->
            <ul>
                <li><a href="index.jsp?CONTENTPAGE=content.jsp"><img src="img/home.png"></a></li>
                <li>&#5171;</li>
                <li><a href="index.jsp?CONTENTPAGE=loginForm.jsp">회원가입</a></li>
            </ul>
        </nav> <!-- navi 끝 -->
    </header> <!-- header 끝 -->

    <section id="main">
    <!-- section main 시작 -->
        <div align="center">
<h3>회원가입 - Sign up Page</h3>
<hr>
<form name=form1 method=post action="../management/manager_control.jsp">
<input type=hidden name="action" value="insert">
<table border="1">
  <tr>
    <th>아이디</th>	
    <td><input type="text" name="member_id" maxlength="10"></td>
  </tr>
  <tr>
    <th>비밀번호</th>
    <td><input type="email" name="member_pwd" maxlength="50"></td>
  </tr>
  <tr>
    <th>이름</th>
    <td><input type="text" name="member_name" maxlength="20"></td>
  </tr>
  <tr>
    <th>생년월일</th>
    <td><input type="date" name="member_birth"></td>
  </tr>  
  <tr>
    <th>전화번호</th>
    <td><input type="text" name="member_tel" maxlength="20"></td>
  </tr>
  <tr>
    <th>이메일</th>
    <td><input type="text" name="member_email"></td>
  </tr>
  <tr>
    <th>주소</th>
    <td><input type="text" name="member_addr"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"></td>
</tr>
</table>
</form>
</div>
    </section> <!-- section main 끝 -->
</body>
</html>