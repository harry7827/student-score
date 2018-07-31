<%@ page import="com.sc.bean.Users"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="base.jsp"%>
<html>
<head>
<title></title>
</head>
<body>

	<div class="container">
		<h5>
			<b>当前位置</b>：个人信息 > 个人信息修改
		</h5>
		<hr>
		
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
				            	<input type="hidden" name="method" value="usersChangeInfo"/>
				            	<input type="hidden" name="uid" value="" class="myId" />
				                <div>
				                    <label>工号</label>
				                    <input disabled="disabled" type="text" name="school_num" class="myDesc" />
				                </div>
				                <div>
				                    <label>姓名</label>
				                    <input type="text" name="name" class="myDesc" />
				                </div>
				                <div>
				                    <label>性别</label>
				                    <input type="text" name="sex" class="myDesc" />
				                </div>
				                <div>
				                    <label>学院</label>
				                    <input type="text" name="school" class="myDesc" />
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
				                    <input type="text" class="myDesc" disabled="disabled" />
				                </div>
				                <div>
				                    <label>地址</label>
				                    <input type="text" name="adress" class="myDesc" />
				                </div>
				                <div>
				                    <label>角色</label>
				                    <input disabled="disabled" type="text" name="role" class="myDesc" />
				                    <input type="hidden" name="email" value="${ currentUsers.email }" />
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
				<th>工号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>学院</th>
				<th>QQ</th>
				<th>电话</th>
				<th>邮箱</th>
				<th>地址</th>
				<th>角色</th>
				<th>操作</th>
			</tr>
			<tr>
				<td>${ currentUsers.school_num }</td>
				<td>${ currentUsers.name }</td>
				<td>${ currentUsers.sex }</td>
				<td>${ currentUsers.school }</td>
				<td>${ currentUsers.qq }</td>
				<td>${ currentUsers.phone }</td>
				<td>${ currentUsers.email }</td>
				<td>${ currentUsers.adress }</td>
				<c:if test="${ currentUsers.role==0 }">
					<td>管理员</td>
				</c:if>
				<c:if test="${ currentUsers.role==1 }">
					<td>老师</td>
				</c:if>
				<c:if test="${ currentUsers.role==2 }">
					<td>学生</td>
				</c:if>
				<!-- 功能待实现 -->
				<td>
				<button class="btn btn-primary btn-lt bianji" data-toggle="modal" data-target="#myModal">编辑</button>
				<input name="uid" type="hidden" value="${ currentUsers.uid }" />
				</td>
			</tr>
		</table>

	</div>

</body>

	<script>
		var tableEle=$("#outside tr");
		$(".bianji").click(function(){
			//找到所有td元素
			var tdEles=$(this).parent().parent().children();
			var len=tdEles.length;
			//找到id值,并设置ID值,方便传值到后台
			var thisId=$(this).parent().children().find("input").val();
			$(".myId").val(thisId);
			
			for (var i = 0; i < len-1; i++) {
				var tdInnerHtml=tdEles.get(i).innerHTML;
				var descEle = $(".myDesc").get(i);
				$(descEle).prop("value",tdInnerHtml);
			}
		})
		
		$(".resetButton").click(function(){
			$(this).parent().parent().find("input[type='text']").prop("value","");
		})
	</script>

</html>
