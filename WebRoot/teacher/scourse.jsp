<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>

  <div class="container">
    <h5><b>当前位置</b>：信息管理 > 学生选课管理</h5>
    <hr>
    <div>
      <table class="table table-bordered" id="outside">
		<tr>
			<th>学生姓名</th>
			<th>学号</th>
			<th>课程号</th>
			<th>课程名称</th>
			<th>学分</th>
			<th>上课时间</th>
			<th>上课地点</th>
			<th>任课老师</th>
		</tr>
		<c:forEach var="ucourse" items="${ allStuCourse }">
			<c:if test="${ ucourse.course.teacher.uid==currentUsers.uid }">
				<tr>
					<td>${ ucourse.users.name }</td>
					<td>${ ucourse.users.school_num }</td>
					<td>${ ucourse.course.cid }</td>
					<td>${ ucourse.course.cname }</td>
					<td>${ ucourse.course.cscore }</td>
					<td>${ ucourse.course.cdate }</td>
					<td>${ ucourse.course.croom.crname }</td>
					<td>${ ucourse.course.teacher.name }</td>
				</tr>
			</c:if>
		</c:forEach>
	  </table>
	  
    </div>
  </div>


</body>
</html>
