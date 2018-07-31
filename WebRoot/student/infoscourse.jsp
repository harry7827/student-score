<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
  <div class="msgContainer1">
  </div>
  <div class="container">
      <h5><b>当前位置</b>：信息查询 > 选课情况查询</h5>
      <hr>
      <div>
	      <table class="table table-bordered" id="outside">
	      	<tr>
		      	<th>课程号</th>
		      	<th>课程名称</th>
		      	<th>学分</th>
		      	<th>上课时间</th>
		      	<th>上课地点</th>
		      	<th>任课老师</th>
		      	<th>操作</th>
	      	</tr>
	      	<c:forEach var="ucourse" items="${ allStuCourse }">
				<c:if test="${ ucourse.users.uid==currentUsers.uid }">
					<tr>
						<td>${ ucourse.course.cid }</td>
						<td>${ ucourse.course.cname }</td>
						<td>${ ucourse.course.cscore }</td>
						<td>${ ucourse.course.cdate }</td>
						<td>${ ucourse.course.croom.crname }</td>
						<td>${ ucourse.course.teacher.name }</td>
						<td>
							<form style="display:inline-block" action="<%= request.getContextPath() %>/stuCourse" method="post">
								<input name="method" type="hidden" value="deleteStuCourse" />
								<input name="cid" type="hidden" value="${ ucourse.course.cid }"/>
								<button type="submit" class="btn btn-primary btn-lt">删除选课</button>
							</form>
						</td>
					</tr>
				</c:if>
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
