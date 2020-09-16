<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studyPaper.jsp</title>
</head>
<body>
	<h3>1과목 소프트웨어 설계</h3>
	<div>시험실시일자 : 2020.09.10</div>
	<div>timer : 100qns</div>
	<c:forEach items="${problemList}" var="list">
		<div>
			<div>${list.problem_text}</div>
			<div>${list.ans_1}</div>
			<div>${list.ans_2}</div>
			<div>${list.ans_3}</div>
			<div>${list.ans_4}</div>
			
			<div>${list.haeseol}</div>
		</div>
	</c:forEach>
</body>
</html>