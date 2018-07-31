# 简介：

###本项目是javaweb最佳实践，用到一些诸如servlet的最基础的知识。欢迎star。。



#### 环境：

jdk：jdk1.8.0_121，tomcat：tomcat8.0.52



#### 需要了解的知识点：

* ​html，css，JavaScript，jquery等前端基础；

* java基础；

* ​简单注解和反射

* ​mysql基础；

* ​xml；

* javaweb：EL表达式，EL函数，jsp技术，servlet；

  ​

#### mvc模式

​    数据库持久层用到：org.apache.commons.dbutils封装数据库数据到对象。连接池使用了c3p0。参数可以在c3p0-config.xml中配置。

​    service：业务层，处理业务

​    servlet：web层，获取页面数据，请求分发转向。baseServlet作为最基础的servlet，利用反射技术，使得servlet开发方便快捷了许多。另外密码加密使用了md5.权限简单验证用到了拦截器。



**还有很多值得优化的地方。项目仅供学习。**