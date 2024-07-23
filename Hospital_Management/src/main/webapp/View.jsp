<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.StuDao" %>
<%@ page import="com.model.Student" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String pgid = request.getParameter("page");
int pid = Integer.parseInt(pgid);
int id = pid;
int total = 5;
if (id == 1) {
    // No action needed
} else {
    id = id - 1;
    id = id * total + 1;
}

out.println("<h2> Page No: " + pid + "</h2>");
List<Student> list = StuDao.getRecords(id, total);
out.println("<table><tr><th>SID</th><th>Name</th><th>City</th><th>Course</th><th>Marks</th></tr>");
for (Student s : list) {
    out.println("<tr><td>" + s.getSid() + "</td><td>" + s.getName() + "</td><td>" + s.getCity() + "</td><td>" + s.getCourse() + "</td><td>" + s.getMarks() + "</td></tr>");
}
out.println("</table>");
%>
<a href="View.jsp?page=1">1..</a>
<a href="View.jsp?page=2">2..</a>
<a href="View.jsp?page=3">3..</a>

</body>
</html>
