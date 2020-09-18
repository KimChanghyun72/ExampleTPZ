<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <script>
        jQuery(function($){
            $("#foo-table").DataTable();
        });
    </script>
    <title></title>
</head>
<body>
    <table id="foo-table" class="table table-bordered">
		<thead>
			<tr><th>No</th><th>지역선택</th></tr>
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
</body>
</html>
