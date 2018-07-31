<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="<%= request.getContextPath() %>/static/js/md5.js" ></script>
</head>
<body>

  <div class="container">
    <h5><b>当前位置</b>：个人信息 > 密码修改</h5>
    <hr>
    <div class="changepasswd">
      <form action="<%= request.getContextPath() %>/users" method="post"  >
      	<input type="hidden" name="method" value="changePwd" />
        <div>
          <label style="padding-left: 15px">旧密码</label>
          <input type="password" name="old_password" class="changePwd"/>
        </div>
        <div>
          <label style="padding-left: 15px">新密码</label>
          <input type="password" name="new_password" class="changePwd"/>
        </div>
        <div>
          <label>确认密码</label>
          <input type="password" name="new_passwordAgain" class="changePwd"/>
        </div>
        <div style="padding-top: 15px">
          <button type="submit" class="btn btn-primary" onclick="change()" >确认修改</button>
          <button type="reset" class="btn btn-warning">重置</button>
        </div>
      </form>
    </div>
  </div>

</body>
	<script>
		function change(){
			var chanegInput=document.getElementsByClassName("changePwd");
			for(var i=0;i<chanegInput.length;i++){
				var oldPwd=chanegInput[i].value;
				var newPwd=md5(oldPwd);
				chanegInput[i].value=newPwd;
			}
		}
	</script>
</html>
