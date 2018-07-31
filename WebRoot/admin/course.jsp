<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
    <style type="text/css">
    	input{
    		 width:250px !important;
    		 display:inline-block !important;
    	}
    	select{
    		width:250px !important;
    		display:inline-block !important;
    		font-size:14px !important;
    	}
    	option{
    		
    	}
    </style>
</head>
<body>

  <div class="container">
    <h5><b>当前位置</b>：课程管理 > 课程管理</h5>
    <hr>
    <div>
		<!-- 隐藏编辑框 -->
			

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">编辑课程信息</h4>
						</div>
						<div class="modal-body">
						
							<div class="courceadd">
						      <form  action="<%= request.getContextPath() %>/course" method="post">
						      	<input name="method" type="hidden" value="updateCourseByCid" />
				            	<input type="hidden" name="cid" value="" class="myId" />
						        <div>
						          <label>课程名称</label>
						          <input type="text" class="form-control myDesc" name="cname"/>
						        </div>
						        <div>
						          <label id="credit">学分</label>
						          	<select class="form-control myDesc" name="cscore" >
						          	<% 
						          		double [] courseArray = new double [9];
						          		double s = 1.0;
						          		for(int i=0;i<courseArray.length;i++){
						          			courseArray[i]=s;
						          			s+=0.5;
						          		}
						          		for(int i=0;i<courseArray.length;i++){
						          			%>
						          			<option value="<%= courseArray[i] %>"><%= courseArray[i] %></option>
						          			<%
						          		}
						          	%>
								  </select>
						        </div>
						        <div>
						          <label>任课教师</label>
						          <select class="form-control myDesc" name="cteacher" >
							          <c:forEach items="${ roleList }" var="role" >
							          	<option value="${ role.uid }">${ role.name }</option>
							          </c:forEach>
						          </select>
						        </div>
						        <div>
						          <label>上课时间</label>
						          <input type="text" class="form-control myDesc" placeholder="如：周三7,8节；周五3,4节；{10-15周}" name="cdate"/>
						        </div>
						        <div>
						          <label>上课地点</label>
						          <select class="form-control myDesc" name="crid" >
						          	<c:forEach items="${ croomList }" var="croom" >
						          		<option value="${ croom.crid }">${ croom.crname }</option>
						          	</c:forEach>
								  </select>
						        </div>
						        <br>
						        <button type="submit" class="btn btn-primary">确认修改</button>
						        <button type="button" class="btn btn-warning resetButton">重置</button>
						      </form>
						    </div>
				            
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
			
		<!-- 隐藏编辑框 -->
		
    	<table class="table table-bordered" id="outside">
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
	                	<button class="btn btn-primary btn-lt bianji" data-toggle="modal" data-target="#myModal">编辑</button>
						<form style="display:inline-block" action="<%= request.getContextPath() %>/course" method="post">
							<input name="method" type="hidden" value="deleteCourseByCid" />
							<input name="cid" type="hidden" value="${ course.cid }"/>
							<button type="submit" class="btn btn-danger">删除</button>
						</form>
					</td>
				</tr>
			</c:forEach>
        </table>
    </div>
  </div>

</body>
	<script>
		var tableEle=$("#outside tr");
		$(".bianji").click(function(){
			//找到所有td元素
			var tdEles=$(this).parent().parent().children();
			var len=tdEles.length;
			//找到id值,并设置ID值,方便传值到后台
			var thisId=$(this).parent().children().find("input").get(1).getAttribute("value");
			$(".myId").val(thisId);
			for(var i=0;i<=5;i++){
				if(i==3||i==5){
					//上课教室//上课老师
					var tdIdValue=tdEles.get(i).getAttribute("id");
					var descEle = $(".myDesc").get(i-1);
					$(descEle).prop("value",tdIdValue);
				}else{
					//课程名称//学分//上课时间
					var tdHtml=tdEles.get(i).innerHTML;
					var descEle = $(".myDesc").get(i-1);
					$(descEle).prop("value",tdHtml);
				}
			}
			
			//课程名称
/* 			var cnameHtml=tdEles.get(1).innerHTML;
			var descEle1 = $(".myDesc").get(0);
			$(descEle1).prop("value",cnameHtml);
			//学分
			var cscoreHtml=tdEles.get(2).innerHTML;
			var descEle2 = $(".myDesc").get(1);
			$(descEle2).prop("value",cscoreHtml);
			//上课老师
			var cteacherValue=tdEles.get(3).getAttribute("id");
			var descEle4 = $(".myDesc").get(2);
			$(descEle4).prop("value",cteacherValue);
			//上课时间
			var cdateHtml=tdEles.get(4).innerHTML;
			var descEle3 = $(".myDesc").get(3);
			$(descEle3).prop("value",cdateHtml);
			//上课教室
			var croomValue=tdEles.get(5).getAttribute("id");
			var descEle5 = $(".myDesc").get(4);
			$(descEle5).prop("value",croomValue); */
			
		})
		
		$(".resetButton").click(function(){
			$(this).parent().parent().find("input[type='text']").prop("value","");
			$(this).parent().parent().find("select").prop("value","");
		})
	</script>
</html>
