<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>选课管理信息系统</title>
    <link href="<%= request.getContextPath() %>/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/static/css/index.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/static/css/student.css" rel="stylesheet">
</head>
<body>

    <%
        if (session.getAttribute("currentUsers") == null) {
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
    %>

    <c:if test="${currentUsers.role == 0}">
        <% response.sendRedirect(request.getContextPath()+"/admin/index.jsp"); %>
    </c:if>
    <c:if test="${currentUsers.role == 1}">
        <% response.sendRedirect(request.getContextPath()+"/teacher/index.jsp"); %>
    </c:if>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">SDUTSSCM</a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="<%= request.getContextPath() %>/student/index.jsp">首页</a></li>
                    <li><a href="<%= request.getContextPath() %>/notes?method=findAllNotes">公告</a></li>
                    <li><a href="<%= request.getContextPath() %>/course?method=findAllCourse">选课</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">信息查询 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%= request.getContextPath() %>/stuScore?method=findAllStuScore">成绩查询</a></li>
                            <li><a href="<%= request.getContextPath() %>/stuCourse?method=findAllStuCourse">选课情况查询</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人信息 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                        	<c:if test="${currentUsers.role==1}">
                        	<li><a href="<%= request.getContextPath() %>/teacher/changepasswd.jsp">密码修改</a></li>
                            </c:if>
                            <c:if test="${currentUsers.role==2}">
                        	<li><a href="<%= request.getContextPath() %>/student/changepasswd.jsp">密码修改</a></li>
                            </c:if>
                            <li><a href="<%= request.getContextPath() %>/users?method=showUsersInfo">个人信息修改</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a>欢迎您，${currentUsers.name}同学！</a></li>
                    <li><a href="<%= request.getContextPath() %>/signout.jsp">【注销】</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>


    <footer class="footer">
        <div class="container">
            <p class="text-muted">
                Copyright &copy 2018 <a href="http://www.hiwcm.com/"> harry </a>. All right reserved.
            </p>
        </div>
    </footer>

</body>
    <script src="<%= request.getContextPath() %>/static/js/jquery.min.js"></script>
    <script src="<%= request.getContextPath() %>/static/js/bootstrap.min.js"></script>
</html>
