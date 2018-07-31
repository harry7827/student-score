<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <link href="<%= request.getContextPath() %>/static/css/notesmanage.css" rel="stylesheet">
</head>
<body>

  <div class="container">
      <h5><b>当前位置</b>：公告管理 > 公告管理</h5>
      <hr>
      <div>
      
		<!-- 隐藏编辑框 -->
			

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">编辑公告</h4>
						</div>
						<div class="modal-body">
						
							<form  action="<%= request.getContextPath() %>/notes?method=updateNotesByNid&pageCode=${ notesPageBean.pageCode }" method="post">
				            	<input name="nid" type="hidden" value="" class="myId" />
				                <div>
				                    <label style="padding-left: 28px">标题</label>
				                    <input type="text" placeholder="Title" name="title" size="26px" value="" maxlength="40" class="myDesc" />
				                </div>
				                <div>
				                    <label style="padding-top: 6px">开始时间</label>
				                    <input type="date" name="start_time" value="" class="myDesc" />
				                </div>
				                <div>
				                    <label style="padding-top: 6px">结束时间</label>
				                    <input type="date" name="stop_time" value="" class="myDesc" /><span style="color:red;" >${ error }</span>
				                </div>
				                <div>
				                    <label>公告内容</label>
				                    <textarea rows="8" cols="55" name="ndesc" class="myArea" maxlength="255" placeholder="最多可以输入255个字" ></textarea>
				                </div>
				                <div style="padding-top: 15px">
				                    <button type="submit" class="btn btn-primary">确认提交</button>
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
				<th>标题</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>公告内容</th>
				<td>操作</td>
			</tr>
			<c:forEach items="${ notesPageBean.beanList }" var="notes" >
				<tr>
					<td>${ notes.title }</td>
					<td>${ notes.start_time }</td>
					<td>${ notes.stop_time }</td>
					<td>${ notes.ndesc }</td>
					<td>
						<button class="btn btn-primary btn-lt bianji" data-toggle="modal" data-target="#myModal">编辑</button>
						<form style="display:inline-block" action="<%= request.getContextPath() %>/notes?pageCode=${ notesPageBean.pageCode }" method="post">
						<input name="method" type="hidden" value="deleteNotesByNid" />
						<input name="nid" type="hidden" value="${ notes.nid }" />
						<button type="submit" class="btn btn-danger">删除</button>
						</form>
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					</td>
				</tr>
			</c:forEach>
		</table>
		<div id="outerDiv">
			<div id="codeId">
				总${ notesPageBean.totalPage }页|第${ notesPageBean.pageCode }页
			</div>
			<c:choose>
				<c:when test="${ notesPageBean.totalPage<=10 }">
					<c:set var="begin" value="1"></c:set>
					<c:set var="end" value="${ notesPageBean.totalPage }"></c:set>
				</c:when>
				
				<c:otherwise>
					<c:set var="begin" value="${ notesPageBean.pageCode-5 }"></c:set>
					<c:set var="end" value="${ notesPageBean.pageCode+4 }"></c:set>
					
					<c:if test="${ begin<1 }">
						<c:set var="begin" value="1"></c:set>
						<c:set var="end" value="10"></c:set>
					</c:if>
					<c:if test="${ end>notesPageBean.totalPage }">
						<c:set var="begin" value="${ notesPageBean.totalPage-9 }"></c:set>
						<c:set var="end" value="${ notesPageBean.totalPage }"></c:set>
					</c:if>
					
				</c:otherwise>
			</c:choose>
			<div id="divId">
				<ul class="pagination">
					<c:if test="${ notesPageBean.pageCode>1 }">
						<li><a href="<%= request.getContextPath() %>/notes?method=findAllNotesByPage&pageCode=${ notesPageBean.pageCode-1 }">«</a></li>
					</c:if>
					<c:if test="${ notesPageBean.pageCode<=1 }">
						<li><a href="<%= request.getContextPath() %>/notes?method=findAllNotesByPage&pageCode=1">«</a></li>
					</c:if>
					
					<c:forEach var="i" begin="${ begin }" end="${ end }">
						<li><a href="<%= request.getContextPath() %>/notes?method=findAllNotesByPage&pageCode=${ i }">${ i }</a></li>
						<a href=""></a>
					</c:forEach>
					
					<c:if test="${ notesPageBean.pageCode<notesPageBean.totalPage }">
						<li><a href="<%= request.getContextPath() %>/notes?method=findAllNotesByPage&pageCode=${ notesPageBean.pageCode+1 }">»</a></li>
					</c:if>
					<c:if test="${ notesPageBean.pageCode>=notesPageBean.totalPage }">
						<li><a href="<%= request.getContextPath() %>/notes?method=findAllNotesByPage&pageCode=${ notesPageBean.pageCode }">»</a></li>
					</c:if>
				</ul>
			</div>
		</div>
      </div>
  </div>

</body>
	<script>
		var tableEle=$("#outside tr");
		$(".bianji").click(function(){
			//找到所有td元素
			var tdEles=$(this).parent().parent().children();
			//找到id值,并设置ID值,方便传值到后台
			var thisId=$(this).parent().children().find("input").get(1).getAttribute("value");
			$(".myId").val(thisId);
			
			for (var i = 0; i < 3; i++) {
				var tdInnerHtml=tdEles.get(i).innerHTML;
				var descEle = $(".myDesc").get(i);
				descEle.setAttribute("value",tdInnerHtml);
			}
			var td4Html = tdEles.get(3).innerHTML;
			$(".myArea").html(td4Html);
		})
		
		$(".resetButton").click(function(){
			$(this).parent().parent().find("input[type='date']").val("");
			$(this).parent().parent().find("input[type='text']").val("");
			$(this).parent().parent().find("textarea").html("");
		})
 		var index="${ notesPageBean.pageCode }"+"";;
		if (!index.trim()=="" && index!=null){
			var aEles=$(".pagination").children().find("a");
			for(var i=0;i<aEles.size();i++){
				var aHtml = aEles.get(i).innerHTML;
				if(aHtml==index){
					aEles.get(i).setAttribute("class","active");
				}
			}
		}
		
		
	</script>
</html>
