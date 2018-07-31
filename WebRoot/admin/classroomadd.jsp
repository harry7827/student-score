<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>

    <div class="container">
        <h5><b>当前位置</b>：教室管理 > 添加教室</h5>
        <hr>
        <div class="classroomadd">
           <form action="<%= request.getContextPath() %>/croom" method="post">
			   <input name="method" type="hidden" value="addCroom" />
               <div>
                   <label>教室名称</label>
                   <input type="text" name="crname" placeholder="如： 9#105"/>
               </div>
               <div>
                   <label>容纳人数</label>
                   <input type="text" name="crmaxnum" placeholder="如：80"/>
               </div>
               <div style="padding-top: 15px">
                   <button type="submit" class="btn btn-primary">添加</button>
                   <button type="reset" class="btn btn-warning">重置</button>
               </div>
           </form>
        </div>
    </div>

</body>
</html>
