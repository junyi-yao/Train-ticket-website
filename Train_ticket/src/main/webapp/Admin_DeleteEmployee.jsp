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
<title>Delete Employee Management Interface</title>
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
<h1 style="color: #5e9ca0;">Delete Employee</h1>
<br>
Enter the SSN of the employee to delete.
<hr>
   <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
      url = "jdbc:mysql://mydb.cigic3cefobe.us-east-2.rds.amazonaws.com/TrainTicketing"
      user = "admin"  password = "Group14!"/>

   <sql:query dataSource = "${snapshot}" var = "result">
      SELECT * from Employee;
   </sql:query>
   
   <form action="Admin_DeleteEmployee.jsp" method="post">
        <table style="with: 50%">
            <tr>
                <td>SSN</td>
                <td><input type="number" name="SSN" /></td>
            </tr>
        </table>
        <input type="submit" value="Submit" /></form>
	<%
		if(request.getParameter("SSN") != null && !request.getParameter("SSN").isEmpty()){
			Connection conn = DriverManager.getConnection(
			          "jdbc:mysql://mydb.cigic3cefobe.us-east-2.rds.amazonaws.com/TrainTicketing", "admin", "Group14!");
			Statement stmt = conn.createStatement();
			String sqlStr = "delete from Employee where SSN=" + request.getParameter("SSN") + ";";
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
				responseMsg = "Successfully deleted employee of SSN: " + request.getParameter("SSN");
			else if(resultCode == 0)
				responseMsg = "Employee of SSN: " + request.getParameter("SSN") + " does not exist, no deletion performed.";
			else if(resultCode == -999)
				responseMsg = "Error during deletion, no deletion performed.";
			out.print(responseMsg);
		}
	%>
</body>
</html>