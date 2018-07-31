<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
    <title>选课管理信息系统</title>
    <link href="<%= request.getContextPath() %>/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/static/css/index.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/static/css/admin.css" rel="stylesheet">
</head>
<body>
    <%
        if (session.getAttribute("currentUsers") == null) {
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
    %>

    <c:if test="${currentUsers.role == 1}">
        <% response.sendRedirect(request.getContextPath()+"/teacher/index.jsp"); %>
    </c:if>
    <c:if test="${currentUsers.role == 2}">
        <% response.sendRedirect(request.getContextPath()+"/student/index.jsp"); %>
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
                    <li><a href="<%= request.getContextPath() %>/admin/index.jsp">首页</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%= request.getContextPath() %>/admin/useradd.jsp">添加用户</a></li>
                            <li><a href="<%= request.getContextPath() %>/users?method=findAllUsers">所有用户</a></li>
                            <li><a href="<%= request.getContextPath() %>/admin/userimport.jsp">用户批量导入</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">公告管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%= request.getContextPath() %>/admin/notesadd.jsp">添加公告</a></li>
                            <li><a href="<%= request.getContextPath() %>/notes?method=findAllNotesByPage&pageCode=1">公告管理</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">课程管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%= request.getContextPath() %>/course?method=listTeacherAndCroom">添加课程</a></li>
                            <li><a href="<%= request.getContextPath() %>/course?method=findAllCourse">课程管理</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">教室管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%= request.getContextPath() %>/admin/classroomadd.jsp">添加教室</a></li>
                            <li><a href="<%= request.getContextPath() %>/croom?method=findAllCroom">教室管理</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">学生信息管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%= request.getContextPath() %>/stuCourse?method=findAllStuCourse">学生选课管理</a></li>
                            <li><a href="<%= request.getContextPath() %>/stuScore?method=findAllStuScore">学生成绩管理</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a>欢迎您admin：${currentUsers.name}！</a></li>
                    <li><a href="<%= request.getContextPath() %>/signout.jsp">【注销】</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
	
	  <div class="msgContainer1">
  	  </div>
	
    <footer class="footer">
        <div class="container">
            <p class="text-muted">
                Copyright &copy 2018 <a href="http://www.hiwcm.com/" > harry </a>. All right reserved.
            </p>
        </div>
    </footer>

    <script src="<%= request.getContextPath() %>/static/js/jquery.min.js"></script>
    <script src="<%= request.getContextPath() %>/static/js/bootstrap.min.js"></script>

</body>
	<script>
	var msg="${ msg }"+"";
	if(!msg.trim()=="" && msg!=null){
		$(".msgContainer1").html("<div class='msgContainer2' style='position: absolute;margin-left: 45%;margin-top: 10%;color: white;background: blue;border-radius: 18px;line-height: 30px;box-shadow: 2px 2px cornflowerblue;'><span style='line-height: 40px;display:inline-block;padding: 1px 20px;'>"+msg+"</span></div>");
	}
	$(".msgContainer2").animate({ 
	    height:"0px",
	}, 3000 );
	$(".msgContainer1").animate({ 
	    opacity:"0"
	}, 1600 );
	</script>
</html>
