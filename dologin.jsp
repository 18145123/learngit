<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,java.net.*"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>登录成功</h1>
	<hr>
	<br>
	<br>
	<br>
	<%
		request.setCharacterEncoding("utf-8");
		//首先判断用户是否选择了记住登录状态
		String[] isUseCookies = request.getParameterValues("isUseCookie");
		if(isUseCookies!=null&&isUseCookies.length>0)
		{
			//把用户名和密码都保存在Cookie对象里面
			String username = URLEncoder.encode(request.getParameter("username"),"utf-8");
			//使用URLEncoder解决无法再Cookie当中保存中文字符串问题
			String password = URLEncoder.encode(request.getParameter("password"),"utf-8");
			
			
			
			Cookie usernameCookie = new Cookie("username",username);
			Cookie passwordCookie = new Cookie("password",password);
			usernameCookie.setMaxAge(486000);
			passwordCookie.setMaxAge(486000);//设置最大生存期限为十天
			response.addCookie(usernameCookie);
			response.addCookie(passwordCookie);
		}
		else
		{
			Cookie[] cookies = request.getCookies();
			if(cookies!=null&&cookies.length>0)
			{
				for(Cookie c:cookies)
				{
					if(c.getName().equals("uesrname") || c.getName().equals("password"));
					{
						c.setMaxAge(0);//设置Cookie失效
						response.addCookie(c);//重新保存。
					}
				}
			}
		}
	%>
	<a href="users.jsp" target="_balnk">查看用户信息</a>
	
</body>
</html>