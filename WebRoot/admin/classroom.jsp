<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>

<div class="container">
  <h5><b>当前位置</b>：教室管理 > 教室管理</h5>
  <hr>
  <div>
  
		<!-- 隐藏编辑框 -->
			
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">编辑教室信息</h4>
						</div>
						<div class="modal-body">
						
							        <div class="classroomadd">
							           <form action="<%= request.getContextPath() %>/croom" method="post">
										   <input name="method" type="hidden" value="updateByCrid" />
										   <input type="hidden" name="crid" value="" class="myId" />
							               <div>
							                   <label>教室名称</label>
							                   <input type="text" name="crname" placeholder="如： 9#105" class="myDesc" />
							               </div>
							               <div>
							                   <label>容纳人数</label>
							                   <input type="text" name="crmaxnum" placeholder="如：80" class="myDesc" />
							               </div>
							               <div style="padding-top: 15px">
							                   <button type="submit" class="btn btn-primary">确认修改</button>
							                   <button type="button" class="btn btn-warning resetButton">重置</button>
							               </div>
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
			<th>教室号</th>
			<th>教室名</th>
			<th>容纳人数</th>
			<th>操作</th>
		</tr>
		<c:forEach var="croom" items="${ croomList }">
			<tr>
				<td>${ croom.crid }</td>
				<td>${ croom.crname }</td>
				<td>${ croom.crmaxnum }</td>
		        <td>
		        	<button class="btn btn-primary btn-lt bianji" data-toggle="modal" data-target="#myModal">编辑</button>
					<form style="display:inline-block" action="<%= request.getContextPath() %>/croom" method="post">
						<input name="method" type="hidden" value="deleteByCrid"/>
						<input name="crid" type="hidden" value="${ croom.crid }"/>
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
			
			for (var i = 1; i < len; i++) {
				var tdInnerHtml=tdEles.get(i).innerHTML;
				var descEle = $(".myDesc").get(i-1);
				$(descEle).prop("value",tdInnerHtml);
			}
		})
		
		$(".resetButton").click(function(){
			$(this).parent().parent().find("input[type='text']").prop("value","");
		})
	</script>

</html>
