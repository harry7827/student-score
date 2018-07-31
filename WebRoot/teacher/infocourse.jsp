<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>

  <div class="container">
    <h5><b>当前位置</b>：课程查询 > 课程查询</h5>
    <hr>
    <div>
   		<table class="table table-bordered" id="outside">
			<tr>
				<th>课程号</th>
				<th>课程名称</th>
				<th>授课教师</th>
				<th>教室</th>
				<th>上课时间</th>
			</tr>
			<c:forEach var="course" items="${ courseList }">
				<c:if test="${ course.teacher.name==currentUsers.name }">
					<tr>
						<td>${ course.cid }</td>
						<td>${ course.cname }</td>
						<td>${ course.teacher.name }</td>
						<td>${ course.croom.crname }</td>
						<td>${ course.cdate }</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
    </div>
  </div>

</body>
</html>
