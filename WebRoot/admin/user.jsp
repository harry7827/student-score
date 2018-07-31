<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
    <style type="text/css">
    	.outside{align-content: center;}
    	input{
    		 width:250px !important;
    		 display:inline-block !important;
    	}
    	select{
    		width:250px !important;
    		display:inline-block !important;
    		font-size:14px !important;
    	}
    </style>
</head>
<body>

  <div class="container">
      <h5><b>当前位置</b>：用户管理 > 所有用户</h5>
      <hr>
      <div>
      
		<!-- 隐藏编辑框 -->
			

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">编辑学生信息</h4>
						</div>
						<div class="modal-body">
						
							<form action="<%= request.getContextPath() %>/users" method="post">
				            	<input type="hidden" name="method" value="updateUsersInfo"/>
				            	<input type="hidden" name="uid" value="" class="myId" />
				                <div>
				                    <label>学号</label>
				                    <input disabled="disabled" type="text" name="school_num" class="myDesc" />
				                </div>
				                <div>
				                    <label>姓名</label>
				                    <input type="text" name="name" class="myDesc" />
				                </div>
				                <div>
				                    <label>性别</label>
				                    <select class="myDesc" name="sex" style="height:26px;" >
				                   		<option value="男">男</option>
					          			<option value="女">女</option>
				          			</select>
				                </div>
				                <div>
				                    <label>年级</label>
				                    <input type="text" name="grade" class="myDesc" />
				                </div>
				                <div>
				                    <label>学院</label>
				                    <input type="text" name="school" class="myDesc" />
				                </div>
				                <div>
				                    <label>专业</label>
				                    <input type="text" name="major" class="myDesc" />
				                </div>
				                <div>
				                    <label style="padding-left: 6px">QQ</label>
				                    <input type="text" name="qq" class="myDesc" />
				                </div>
				                <div>
				                    <label>电话</label>
				                    <input type="text" name="phone" class="myDesc" />
				                </div>
				                <div>
				                    <label>邮箱</label>
				                    <input type="text" name="email" class="myDesc" />
				                </div>
				                <div>
				                    <label>地址</label>
				                    <input type="text" name="adress" class="myDesc" />
				                </div>
				                <div>
				                    <label>角色</label>
				                    <input disabled="disabled" type="text" name="role" class="myDesc" />
				                </div>
				                <div style="padding-top: 15px">
				                    <button type="submit" class="btn btn-primary">确认修改</button>
				                    <button type="button" class="btn btn-warning resetButton">重置</button>
				                </div>
				            </form>
				            
						</div>
						<div class="modal-footer">
							<!-- <button type="button" class="btn btn-primary">确定提交</button> -->
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
		<!-- 隐藏编辑框 -->
      
      
      	<table class="table table-bordered" id="outside">
	        <tr>
				<th>学号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>年级</th>
				<th>学院</th>
				<th>专业</th>
				<th>QQ</th>
				<th>电话</th>
				<th>邮箱</th>
				<th>地址</th>
				<th>角色</th>
				<th>操作</th>
			</tr>
			<c:forEach var="users" items="${ usersList }">
		        <tr>
					<td>${ users.school_num }</td>
					<td>${ users.name }</td>
					<td>${ users.sex }</td>
					<td>${ users.grade }</td>
					<td>${ users.school }</td>
					<td>${ users.major }</td>
					<td>${ users.qq }</td>
					<td>${ users.phone }</td>
					<td>${ users.email }</td>
					<td>${ users.adress }</td>
					<c:if test="${ users.role==1 }">
						<td style="color:green">老师</td>
					</c:if>
					<c:if test="${ users.role==2 }">
						<td>学生</td>
					</c:if>
		            <td>
			            <button class="btn btn-primary btn-lt bianji" data-toggle="modal" data-target="#myModal">编辑</button>
						<form style="display:inline-block" action="<%= request.getContextPath() %>/users" method="post">
						<input name="method" type="hidden" value="deleteUserByUid" />
						<input name="uid" type="hidden" value="${ users.uid }" />
						<button type="submit" class="btn btn-danger">删除</button></form>
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
			
			for (var i = 0; i < len-1; i++) {
				var tdInnerHtml=tdEles.get(i).innerHTML;
				var descEle = $(".myDesc").get(i);
				$(descEle).prop("value",tdInnerHtml);
			}
			
		})
		
		$(".resetButton").click(function(){
			var eles=$(this).parent().parent().find("input[type='text']");
			for(var i=1;i<eles.size()-1;i++){
				$(eles.get(i)).prop("value","");
			}
			$(this).parent().parent().find("select").prop("value","");
		})
		
	</script>
</html>
