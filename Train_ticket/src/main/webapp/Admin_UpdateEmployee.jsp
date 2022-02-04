<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Employee</title>
</head>
<body>
<%
  // check login status, error out if not logged in as admin
  // comment the line below in production
  session.setAttribute("User", "admin");
  if (session.getAttribute("User") != "admin")
  {
    %><jsp:forward page="Admin_NotAdminErrorPage.jsp" /><%
  }else{
	  System.out.println("Logged in as admin, continue.");
  }
%>
<h1 style="color: #5e9ca0;">Edit an Employee</h1>
<br>
All forms must be filled. New data will overwrite existing data.
<hr>
   <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
      url = "jdbc:mysql://mydb.cigic3cefobe.us-east-2.rds.amazonaws.com/TrainTicketing"
      user = "admin"  password = "Group14!"/>

   <sql:query dataSource = "${snapshot}" var = "result">
      SELECT * from Employee;
   </sql:query>
   
   <form action="Admin_UpdateEmployee.jsp" method="post">
        <table style="with: 50%">
        	<tr>
                <td>SSN</td>
                <td><input type="number" name="SSN" /></td>
            </tr>
            <tr>
                <td>First Name</td>
                <td><input type="text" name="firstName" /></td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td><input type="text" name="lastName" /></td>
            </tr>
            <tr>
                <td>UserName</td>
                <td><input type="text" name="username" /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password" /></td>
            </tr>
        </table>
        <input type="submit" value="Submit" /></form>
        <div style="color: #5e9ca0;">
		<%
			if(request.getParameter("SSN") != null && !request.getParameter("SSN").isEmpty()
			&& request.getParameter("firstName") != null && !request.getParameter("firstName").isEmpty()
			&& request.getParameter("lastName") != null && !request.getParameter("lastName").isEmpty()
			&& request.getParameter("username") != null && !request.getParameter("username").isEmpty()
			&& request.getParameter("password") != null && !request.getParameter("password").isEmpty()
			){
				Connection conn = DriverManager.getConnection(
				          "jdbc:mysql://mydb.cigic3cefobe.us-east-2.rds.amazonaws.com/TrainTicketing", "admin", "Group14!");
				Statement stmt = conn.createStatement();
				String sqlStr = "update Employee set First_name='" 				
				+ request.getParameter("firstName") + "', last_name='"
				+ request.getParameter("lastName") + "', username='"
				+ request.getParameter("username") + "', password='"
				+ request.getParameter("password") + "' where SSN="
				+ request.getParameter("SSN") + ";";
				System.out.println(sqlStr);
				int resultCode;
				try{
					resultCode = stmt.executeUpdate(sqlStr);				
				}catch(Exception e){
					resultCode = -999;								
				}			
				stmt.close();
				conn.close();
				System.out.println(resultCode);
				String responseMsg = "";
				if(resultCode == 1)
					responseMsg = "Successfully updated employee of SSN: " + request.getParameter("SSN");
				else if(resultCode == 0)
					responseMsg = "Cannot find this employee of given SSN, no update performed.";
				else if(resultCode == -999)
					responseMsg = "Error during update, no update performed.";
				out.print(responseMsg);
			}%>
		</div>
</body>
</html>