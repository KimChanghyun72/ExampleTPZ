<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>StudyPaper.jsp</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial;
	padding: 10px;
	background: #f1f1f1;
}

/* Header/Blog Title */
.header {
	padding: 30px;
	text-align: center;
	background: white;
}

.header h1 {
	font-size: 50px;
}

/* Style the top navigation bar */
.topnav {
	overflow: hidden;
	background-color: #333;
}

/* Style the topnav links */
.topnav a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
	background-color: #ddd;
	color: black;
}

/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {
	float: left;
	width: 75%;
}

/* Right column */
.rightcolumn {
	float: left;
	width: 25%;
	background-color: #f1f1f1;
	padding-left: 20px;
}

/* Fake image */
.fakeimg {
	background-color: #aaa;
	width: 100%;
	padding: 20px;
}

/* Add a card effect for articles */
.card {
	background-color: white;
	padding: 20px;
	margin-top: 20px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Footer */
.footer {
	padding: 20px;
	text-align: center;
	background: #ddd;
	margin-top: 20px;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 800px) {
	.leftcolumn, .rightcolumn {
		width: 100%;
		padding: 0;
	}
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
	.topnav a {
		float: none;
		width: 100%;
	}
}
</style>
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script>
$(function(){
	 $("#foo-table").DataTable();
})
<c:forEach items="${problemList}" var="list">
$(function(){
	$("input[name=problem${list.problem_id}]").on("change", function(){
		for(var i=0; i<4; i++){
			if($("input[name='problem${list.problem_id}']").eq(i).prop("checked")){
				$("input[name='answer${list.problem_id}']").eq(i).prop("checked",true)
			}
		}
	});
	
	$("input[name=answer${list.problem_id}]").on("change", function(){
		for(var i=0; i<4; i++){
			if($("input[name='answer${list.problem_id}']").eq(i).prop("checked")){
				$("input[name='problem${list.problem_id}']").eq(i).prop("checked",true)
			}
		}
	});
	});

</c:forEach>

</script>
</head>
<body>
	<div class="header">
		<h1>Header</h1>
	</div>
<div class="leftcolumn">
<table id="foo-table" class="table table-bordered">
		<thead>
			<tr><th>문제</th><th>지역선택</th></tr>
		</thead>
		<tbody>
		
			<tr><td>1</td><td>서울</td></tr>
			<tr><td>2</td><td>경기도</td></tr>
			<tr><td>3</td><td>충청남도</td></tr>
			<tr><td>4</td><td>충청북도</td></tr>
			<tr><td>5</td><td>전라남도</td></tr>
			<tr><td>6</td><td>전라북도</td></tr>
			<tr><td>7</td><td>경상남도</td></tr>
			<tr><td>8</td><td>경상북도</td></tr>
			<tr><td>9</td><td>강원도</td></tr>
			<tr><td>10</td><td>제주도</td></tr>
			<tr><td>99</td><td>해외</td></tr>
		</tbody>
    </table>
    
</div>
<div class="rightcolumn">
			<div class="card">
				<h3>정답확인</h3>0
				<div class="fakeimg">
					<table>
						<tbody>
							<c:forEach items="${problemList}" var="list">
								<tr>
									<td>1<input type="radio" name="answer${list.problem_id}" value="1"></td>
									<td>2<input type="radio" name="answer${list.problem_id}" value="2"></td>
									<td>3<input type="radio" name="answer${list.problem_id}" value="3"></td>
									<td>4<input type="radio" name="answer${list.problem_id}" value="4"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="fakeimg"></div>
			</div>
			</div>
	<div class="row">
		<div class="leftcolumn">
			<div class="card">
			<table id="foo-table" class="table table-bordered">
				<thead>
			<tr>
			<th>문제</th>
			</tr>
		</thead>
				<tbody>
				<c:forEach items="${problemList}" var="list">
					<tr>
					<td>
					<div>${list.problem_image}</div>
					<div>${list.problem_text}</div>
					<div>
						<input type="radio" name="problem${list.problem_id}" value="1">${list.ans_1}</div>
					<div>
						<input type="radio" name="problem${list.problem_id}" value="2">${list.ans_2}</div>
					<div>
						<input type="radio" name="problem${list.problem_id}" value="3">${list.ans_3}</div>
					<div>
						<input type="radio" name="problem${list.problem_id}" value="4">${list.ans_4}</div>
					<div>${list.haeseol}</div>
					</td>
					</tr>
				</c:forEach>
				</tbody>
				</table>
			</div>
		</div>
		<div class="rightcolumn">
			<div class="card">
				<h3>정답확인</h3>
				<div class="fakeimg">
					<table>
						<tbody>
							<c:forEach items="${problemList}" var="list">
								<tr>
									<td>1<input type="radio" name="answer${list.problem_id}" value="1"></td>
									<td>2<input type="radio" name="answer${list.problem_id}" value="2"></td>
									<td>3<input type="radio" name="answer${list.problem_id}" value="3"></td>
									<td>4<input type="radio" name="answer${list.problem_id}" value="4"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="fakeimg"></div>
			</div>
		</div>
	</div>
</body>
</html>
