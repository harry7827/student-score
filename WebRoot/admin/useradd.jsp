<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp"%>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="<%= request.getContextPath() %>/static/js/md5.js" ></script>
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
        <h5><b>当前位置</b>：用户管理 > 添加用户</h5>
        <hr>
        <div class="useradd">
            <form action="<%= request.getContextPath() %>/users" method="post" >
            	<input type="hidden" name="method" value="usersAdd" />
            	<input id="hidden" type="hidden" name="password" />
                <div>
                    <label>学号</label>
                    <input type="text" name="school_num"/>
                </div>
                <div>
                    <label>姓名</label>
                    <input type="text" name="name"/>
                </div>
                <div>
                    <label>年级</label>
                    <input type="text" name="grade"/>
                </div>
                <div>
                    <label>学院</label>
                    <input type="text" name="school"/>
                </div>
                <div>
                    <label>专业</label>
                    <input type="text" name="major"/>
                </div>
                <div>
                    <label>邮箱</label>
                    <input type="text" name="email"/>
                </div>
                <div>
                    <label>密码</label>
                    <input type="password" name="pwd" onkeyup="change()" id="pwd"/>
                </div>
                <div>
                    <label>角色</label>
                    <select class="form-control" name="role" >
                   		<option value="1">老师</option>
	          			<option value="2">学生</option>
          			</select>
                </div>
                <hr>
                <div>
                    <label>性别</label>
                    <select class="form-control" name="sex" >
                   		<option value="男">男</option>
	          			<option value="女">女</option>
          			</select>
                </div>
                <div>
                    <label style="padding-left: 6px">QQ</label>
                    <input type="text" name="qq"/>
                </div>
                <div>
                    <label>电话</label>
                    <input type="text" name="phone"/>
                </div>
                <div>
                    <label>住址</label>
                    <input type="text" name="adress"/>
                </div>
                <div style="padding-top: 15px">
                    <button type="submit" class="btn btn-primary" >添加</button>
                    <button type="reset" class="btn btn-warning">重置</button>
                    <span color="red" >${ msg }</span>
                </div>
            </form>
        </div>
    </div>

</body>
	<script>
		function change(){
			var oldPwd=document.getElementById("pwd").value;
			var hiddenEle=document.getElementById("hidden");
			var newPwd=md5(oldPwd);
			hiddenEle.value=newPwd;
		}
		$("input").addClass("form-control");
		//错误示范：getAttribute获取不到value值，使用.value属性可以
/* 		function addUsersPassword(){
			var inputList=document.getElementsByTagName("input");
			var oldPwd=inputList[6].getAttribute("value");
			var newPwd=md5(oldPwd);
			inputList[6].setAttribute("value",newPwd);
			var params;
			for(var i=0;i<inputList.length;i++){
				if(i==0){
					params=inputList[i].getAttribute("name")+"="+inputList[i].getAttribute("value")+"&";
				}else if(i==inputList.length-1){
					params=params+inputList[i].getAttribute("name")+"="+inputList[i].getAttribute("value");
				}else{
					params=params+inputList[i].getAttribute("name")+"="+inputList[i].getAttribute("value")+"&";
				}
			}
			
			var xmlhttp;
			if(window.XMLHttpRequest){
				xmlhttp=new XMLHttpRequest("Microsoft.XMLHTTP");
			}else{
				xmlhttp=new ActiveXObject();
			}
			var url="/student/usersAdd";
			xmlhttp.open("post",url,true);
			xmlhttp.setRequestHeader("content-type","application/x-www-form-urlencoded")
			xmlhttp.send(params);
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				xmlhttp.onreadystatechange=function(){
					
				}
			}
			return true; 
		}  */
	</script>
</html>
