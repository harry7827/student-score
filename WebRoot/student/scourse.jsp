<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
	<div class="msgContainer1" >
  	</div>
	<div class="container">
		<h5><b>当前位置</b>：选课</h5>
		<hr>
		<div>
			<table class="table table-bordered" id="outside" >
	            <tr>
					<th>课程号</th>
					<th>课程名称</th>
					<th>学分</th>
					<th>教师</th>
					<th>上课时间</th>
					<th>上课地点</th>
					<td>操作</td>
				</tr>
				<c:forEach var="course" items="${ courseList }">
					<tr>
						<td>${ course.cid }</td>
						<td>${ course.cname }</td>
						<td>${ course.cscore }</td>
						<td id="${ course.teacher.uid }">${ course.teacher.name }</td>
						<td>${ course.cdate }</td>
						<td id="${ course.croom.crid }">${ course.croom.crname }</td>
		                <td>
							<form style="display:inline-block" action="<%= request.getContextPath() %>/stuCourse" method="post">
								<input name="method" type="hidden" value="addStuCourse" />
								<input name="cid" type="hidden" value="${ course.cid }"/>
								<button type="submit" class="btn btn-primary btn-lt">添加选课</button>
							</form>
						</td>
					</tr>
				</c:forEach>
	        </table>
		</div>
	</div>

</body>
	<script>
		var msg="${ msg }"+"";
		
		if(!msg.trim()=="" && msg!=null){
			$(".msgContainer1").html("<div class='msgContainer2' style='position: absolute;margin-left: 45%;margin-top: 10%;color: white;background: blue;border-radius: 18px;line-height: 30px;box-shadow: 2px 2px cornflowerblue;'><span style='line-height: 40px;display:inline-block;padding: 1px 20px;'>"+msg+"</span></div>");
		}
		$(".msgContainer2").animate({ 
		    height:"0px",
		}, 3000 );
		$(".msgContainer1").animate({ 
		    opacity:"0"
		}, 1600 );
	</script>
</html>
