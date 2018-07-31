<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>

  <div class="container">
    <h5><b>当前位置</b>：公告</h5>
    <hr>
    <table class="table table-bordered" id="outside">
			<tr>
				<th>标题</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>公告内容</th>
			</tr>
			<c:forEach items="${ notesList }" var="notes" varStatus="status" >
				<tr>
					<td>${ notes.title }</td>
					<td>${ notes.start_time }</td>
					<td>${ notes.stop_time }</td>
					<td>${ notes.ndesc }</td>
				</tr>
			</c:forEach>
		</table>
  </div>

</body>
</html>
