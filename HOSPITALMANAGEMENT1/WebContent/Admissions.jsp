<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://kit.fontawesome.com/de73162224.js"></script>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<style>
* {
	box-sizing: border-box;
}

table {
	border-collapse: collapse;
}

table th {
	text-align: left;
	background-color: #3a6070;
	color: #fff;
	padding: 4px 30px 4px 8px;
}

table td {
	border: 1px solid e3e3e3;
	padding: 4px 8px;
}

body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.topnav {
	overflow: hidden;
	background-color: #e9e9e9;
}

.topnav a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #2196F3;
	color: white;
}

.topnav .search-container {
	float: right;
}

.topnav input[type=text] {
	padding: 6px;
	margin-top: 8px;
	font-size: 17px;
	border: none;
}

.topnav .search-container button {
	float: right;
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.topnav .search-container button:hover {
	background: #ccc;
}

@media screen and (max-width: 600px) {
	.topnav .search-container {
		float: none;
	}
	.topnav a, .topnav input[type=text], .topnav .search-container button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	}
	.topnav input[type=text] {
		border: 1px solid #ccc;
	}
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
	text-align: left;
}

table {
	width: 100%;
	background-color: #f1f1c1;
}
</style>
</head>
<body>

	<div class="topnav">
		<a class="hello" href="Dashboard.jsp">DASHBOARD</a> 
		<a class="hello" href="Patientlist.jsp">PATIENT</a> 
		 <a class="active" href="Admissions.jsp">ADMISSIONS</a> 
		 <div align="right">
<i class="fas fa-user-circle"style='font-size:48px' ></i>
</div>

	</div>
	<br>
	<h2>List of Patients</h2>
	<div class="search-container" align="right">
		<form action="">
			<input type="text" placeholder="Search.." name="search">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
		</form>
	</div>
	<%!
Connection connection=null;
public void jspInit()
{
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	try
	{
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/modules","root","Lokesh@546");
	}
	catch(Exception e)
	{ 
		e.printStackTrace();
		
	}
	}
	catch(ClassNotFoundException e)
	{
		e.printStackTrace();
	}
}
%>
	<table>
		<tr>
			<th>Patient id</th>
			<th>First name</th>
			<th>Last name</th>
			<th>Phone number</th>
			<th>Floor</th>
			<th>Room number</th>
			
		</tr>
		<%
Statement statement=connection.createStatement();

ResultSet rst=statement.executeQuery("select p.patient_id,p.first_name,p.last_name,p.phonenumber,p.father_name,r.floor,r.roomnumber,(select name from properties where properties_master_id=3 and value=p.gender)as gender from patient_details as p,rooms_master as r");
while(rst.next())
{
	out.print("<tr>");
	 out.print("<td ><a href=\"\"></a>"+rst.getInt("patient_id")+"</td>"); 
	out.print("<td>"+rst.getString("first_name")+"</td>");
	out.print("<td>"+rst.getString("last_name")+"</td>");
	out.print("<td>"+rst.getString("phonenumber")+"</td>");
	out.print("<td>"+rst.getString("floor")+"</td>");
	out.print("<td>"+rst.getString("roomnumber")+"</td>");
	out.print("</td>");
	out.print("</tr>");
	

}
%>
	</table>
</body>
</html>
