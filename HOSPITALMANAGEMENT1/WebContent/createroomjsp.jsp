<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%!Connection connection = null;

	public void jspInit() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/modules", "root", "Lokesh@546");
			} catch (Exception e) {
				e.printStackTrace();

			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}%>
<%
	response.setHeader("Cache-Control", "no-cache ,no-store,must-revalidate");
	Statement statement = connection.createStatement();
	statement.executeQuery("insert into properties ");
%>