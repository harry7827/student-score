<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>

	<div class="container">
		<h5><b>当前位置</b>：信息管理 > 学生成绩管理</h5>
		<hr>
		<div>
			<table class="table table-bordered" id="outside">
				<tr>
					<th>课程号</th>
					<th>课程名</th>
					<th>学分</th>
					<th>学号</th>
					<th>姓名</th>
					<th>平时成绩</th>
					<th>期末成绩</th>
					<th>最终成绩</th>
				</tr>
				<c:forEach var="score" items="${ allStuScore }">
					<c:if test="${ score.ucourse.course.teacher.uid==currentUsers.uid }">
						<tr>
							<td>${ score.ucourse.course.cid }</td>
							<td>${ score.ucourse.course.cname }</td>
							<td>${ score.ucourse.course.cscore }</td>
							<td>${ score.ucourse.users.school_num }</td>
							<td>${ score.ucourse.users.name }</td>
							<td>${ score.pscore }</td>
							<td>${ score.qscore }</td>
							<td>${ score.zscore }</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
<div></div>
</body>
</html>
