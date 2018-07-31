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
    <h5><b>当前位置</b>：课程管理 > 添加课程</h5>
    <hr>
    <div class="courceadd">
      <form  action="<%= request.getContextPath() %>/course" method="post">
      	<input name="method" type="hidden" value="addCourse" />
        <div>
          <label>课程名称</label>
          <input type="text" class="form-control" name="cname"/>
        </div>
        <div>
          <label id="credit">学分</label>
          <!-- <input type="text" class="form-control" placeholder="如：1.5" name="cscore"/> -->
          <select class="form-control" name="cscore" >
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
          <select class="form-control" name="cteacher" >
	          <c:forEach items="${ roleList }" var="role" >
	          	<option value="${ role.uid }">${ role.name }</option>
	          </c:forEach>
          </select>
        </div>
        <div>
          <label>上课时间</label>
          <input type="text" class="form-control" placeholder="如：周三7,8节；周五3,4节；{10-15周}" name="cdate"/>
        </div>
        <div>
          <label>上课地点</label>
          <select class="form-control" name="crid" >
          	<c:forEach items="${ croomList }" var="croom" >
          		<option value="${ croom.crid }">${ croom.crname }</option>
          	</c:forEach>
		  </select>
        </div>
        <br>
        <button type="submit" class="btn btn-primary">添加</button>
        <button type="reset" class="btn btn-warning">重置</button>
      </form>
    </div>
  </div>

</body>

</html>
