<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>登陆|学生选课信息管理系统</title>
    <link href="<%= request.getContextPath() %>/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/static/css/signin.css" rel="stylesheet">
    <script type="text/javascript" src="<%= request.getContextPath() %>/static/js/md5.js" ></script>
    <script src="<%= request.getContextPath() %>/static/js/jquery.min.js"></script>
</head>
<body>

    <h2>选课管理信息系统登陆</h2>

    <div class="container">

    <div id="error" class="row">
        ${error}
    </div>

        <form class="form-signin" action="<%= request.getContextPath() %>/users" method="post">
        	<input type="hidden" name="method" value="login" />
        	<!-- <input id="hidden" type="hidden" name="password" /> -->
            <label for="inputEmail" class="sr-only">Email address</label>
            <input type="email" id="inputEmail" class="form-control" placeholder="Email address" name="email" value="" />
            <br/>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" class="form-control" placeholder="Password" id="password" onkeyup="change()" name="password" value="" />
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="remember" value="true"> Remember me
                </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </form>

    </div>

</body>
	<script>
/* 		function change(){
			var oldPwd=document.getElementById("pwd").value;
			var hiddenEle=document.getElementById("hidden");
			var newPwd=md5(oldPwd);
			hiddenEle.value=newPwd;
		} */
 		function getCookie(c_name){
			if (document.cookie.length>0)
			  {
			  c_start=document.cookie.indexOf(c_name + "=")
			  if (c_start!=-1)
			    { 
			    c_start=c_start + c_name.length+2
			    c_end=document.cookie.indexOf(";",c_start)-1
			    if (c_end==-1) c_end=document.cookie.length
			    return unescape(document.cookie.substring(c_start,c_end))
			    } 
			  }
			return ""
		} 
		/*
		以下是jquery方法获取cookie需要导入js包支持（jquery.cookie.js）
		var auto=$.cookie("autoLogin");*/
		var auto=getCookie("autoLogin");
		if (auto!="" && auto!=null) {
			var arr=auto.split("-h-e-");
			$("#inputEmail").val(arr[0]);
			$("#password").val(arr[1]);
		}

	</script>
</html>