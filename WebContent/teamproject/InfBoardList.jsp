<%@page import="cs.dit.dto.InfBoardDto"%>
<%@page import="cs.dit.dao.InfBoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
<% 
	//정보게시판 Dao로 DB에서 데이터를 불러와주는 코드입니다. 
	InfBoardDao dao = new InfBoardDao();
	ArrayList<InfBoardDto> dtos =  dao.list();
	//이 페이지의 데이터를 기준으로 데이터를 뽑아서 다른 페이지에서도 쓸 수 있게 만듭니다.
	pageContext.setAttribute("dtos", dtos);
	//유저의 로그인 상태를 유지하기 위해 이전 세션을 불러왔습니다.
	String id = (String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">	
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="../owlcarousel/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="../owlcarousel/assets/owl.theme.default.css">
  <link rel="stylesheet" href="../css/styledata.css">
</head>
<body>
<!-- 유저의 로그인 여부에 따라서 데이터 배너를 어떤걸 표시하는지 체크해주는 조건문 코드 입니다.  -->
<%if(id != null) {%>
	 	<jsp:include page="/WEB-INF/view/login_out/logoutimg.jsp"/>
	<%} else {%>
	  	<jsp:include page="/WEB-INF/view/login_out/loginimg.jsp"/>
	<%} %>
	<img id="free_banner" src="../images/Infboardbanner.png">
	<div id="infboard_list">
	<table class="w3-table-all w3-hoverable">
		<tr  class="w3-light-grey">
			<th>제목</th>
			<th>아이디</th>
			<th>파일 이름</th>
			<th>날짜</th>
		</tr>
		<!-- 데이터의 크기에 따라 리스트에 뿌려줄 수 있도록 반복시켜주는 코드입니다. -->
		<c:forEach var='dto' items='${dtos}'>
			<tr>
				<!-- 제목을 클릭하면  컨트롤러에서 지정한 View.in으로 넘어가 InfBoardViewForm으로 넘어갈때 데이터도 같이 넘어갈 수 있도록 만들었습니다. -->
				<td><a href="view.in?title=${dto.title}">${dto.title}</a></td>
				<td>${dto.id}</td>
				<td>${dto.filename}</td>
				<td>${dto.date}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>