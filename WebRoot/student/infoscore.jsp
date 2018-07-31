<%@ page import="com.sc.bean.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>

  <div class="container">
    <h5><b>当前位置</b>：信息查询 > 成绩查询</h5>
    <hr>
    <div>
	 	<table class="table table-bordered" id="outside">
			<tr>
				<th>课程号</th>
				<th>课程名</th>
				<th>学分</th>
				<th>平时成绩</th>
				<th>期末成绩</th>
				<th>最终成绩</th>
			</tr>
			<c:forEach var="score" items="${ allStuScore }">
				<c:if test="${ score.ucourse.users.uid==currentUsers.uid }">
					<tr>
						<td>${ score.ucourse.course.cid }</td>
						<td>${ score.ucourse.course.cname }</td>
						<td>${ score.ucourse.course.cscore }</td>
						<td>${ score.pscore }</td>
						<td>${ score.qscore }</td>
						<td>${ score.zscore }</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
  </div>

</body>

</html>
