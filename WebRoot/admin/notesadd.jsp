<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>

<div class="container">
    <h5><b>当前位置</b>：公告管理 > 添加公告</h5>
    <hr>
        <div class="notesadd">
            <form  action="<%= request.getContextPath() %>/notes" method="post">
            	<input name="method" type="hidden" value="notesAdd" />
                <div>
                    <label style="padding-left: 28px">标题</label>
                    <input type="text" placeholder="Title" name="title" maxlength="40" size="26px"/>
                </div>
                <div>
                    <label style="padding-top: 6px">开始时间</label>
                    <input type="date" name="start_time"/>
                </div>
                <div>
                    <label style="padding-top: 6px">结束时间</label>
                    <input type="date" name="stop_time"/><span style="color:red;" >${ error }</span>
                </div>
                <div>
                    <label>公告内容</label>
                    <textarea rows="15" cols="75" name="ndesc" maxlength="255" placeholder="最多可以输入255个字" ></textarea>
                </div>
                <div style="padding-top: 15px">
                    <button type="submit" class="btn btn-primary myFade">添加</button>
                    <button type="reset" class="btn btn-warning">重置</button>
                </div>
                <%-- <span color="red" >${ msg }</span> --%>
            </form>
        </div>
</div>

</body>
</html>
