<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>list of Admitted Patients</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js">
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"
	integrity="sha256-ugED92WALymbx9ylw12aADWaCrsQysE29DyvnAv5i3w="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/ui/1.010.4/jquery-ui.js"></script>
<script src="https://kit.fontawesome.com/de73162224.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- DataTables CSS -->
<link href="css/addons/datatables.min.css" rel="stylesheet">
<!-- DataTables JS -->
<script href="js/addons/datatables.min.js" rel="stylesheet"></script>

<!-- DataTables Select CSS -->
<link href="css/addons/datatables-select.min.css" rel="stylesheet">
<!-- DataTables Select JS -->
<script href="js/addons/datatables-select.min.js" rel="stylesheet"></script>
<link href="css/addons/datatables.min.css" rel="stylesheet">
<style>
* {
	box-sizing: border-box;
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

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#calender").datepicker();
	});
	$(document).ready(function () {
		$('#dtMaterialDesignExample').DataTable();
		$('#dtMaterialDesignExample').find('label').each(function () {
		$(this).parent().append($(this).children());
		});
		$('#dtMaterialDesignExample .dataTables_filter').find('input').each(function () {
		$('input').attr("placeholder", "Search");
		$('input').removeClass('form-control-sm');
		});
		$('#dtMaterialDesignExample .dataTables_length').addClass('d-flex flex-row');
		$('#dtMaterialDesignExample .dataTables_filter').addClass('md-form');
		$('#dtMaterialDesignExample select').removeClass(
		'custom-select custom-select-sm form-control form-control-sm');
		$('#dtMaterialDesignExample select').addClass('mdb-select');
		$('#dtMaterialDesignExample .mdb-select').materialSelect();
		$('#dtMaterialDesignExample .dataTables_filter').find('label').remove();
		});
	$(document).ready(function () {
		  $('#dtMaterialDesignExample').DataTable({
		    "paging": false // false to disable pagination (or any other option)
		  });
		  $('.dataTables_length').addClass('bs-select');
		});$(document).ready(function () {
			  $('#dtMaterialDesignExample').DataTable({
				    "pagingType": "simple" // "simple" option for 'Previous' and 'Next' buttons only
				  });
				  $('.dataTables_length').addClass('bs-select');
				});
</script>
</head>
<body>

	<div class="topnav">
		<a class="active" href="Dashboard.jsp">DASHBOARD</a> <a
			href="Patientlist.jsp">PATIENT</a> <a href="Admissions.jsp">ADMISSIONS</a>
		<div align="right">
			<i class="fas fa-user-circle" style='font-size: 48px'></i>
		</div>
	</div>

	<form action="" method="post">
		<div class="row" style="margin-top: 10px">
			<div class="col-3">
				<h3 align="left">Admitted Patients</h3>
			</div>
			<div class="col-2"></div>
			<div class="col-3">
				<input id="calender" type="text" name="date"
					placeholder="Day wise patients"> <i
					class="far fa-calendar-alt" height="8px"></i>
			</div>
			<!-- <div class="col-1"></div>
<div class="col-3" align="right"> -->
			<div class="container">
				<div class="form-group">
					<div class="col-sm-5">
						<div class="input-group">
							<input type="text"  id ="myInput"placeholder="Search.. by name " name="q"
								class="form-control">
							<div class="input-group-btn">
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-search">search</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

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
	<div class= "container mt-3">
		<table id="dtMaterialDesignExample" class="table table-striped table-bordered" >
			<tr>
				<th>Patient id</th>
				<th>First name</th>
				<th>Last name</th>
				<th>Gender</th>
				<th>Phone number</th>
				<th>Father Name</th>
				<th>Floor</th>
				<th>room number</th>
				<th>DateOfJoin</th>
			</tr>
			<tbody id="mytable">
			<%
				response.setHeader("Cache-Control", "no-cache ,no-store,must-revalidate");
				Statement statement = connection.createStatement();
				String search = request.getParameter("q");
				System.out.println("search is " + search);
				String query = null;
				if (search == null) {
					
					 query = "select p.patient_id,p.first_name,p.last_name,p.phonenumber,p.father_name,p.dateof,r.floor,r.roomnumber,(select name from properties where properties_master_id=3 and value=p.gender)as gender from patient_details as p,rooms_master as r where p.first_name  ='"
							+ search + "'"; 
					System.out.println("search is " + search);
				} else {
					
					query = "select p.patient_id,p.first_name,p.last_name,p.phonenumber,p.father_name,p.dateof,r.floor,r.roomnumber,(select name from properties where properties_master_id=3 and value=p.gender)as gender from patient_details as p,rooms_master as r"; 
				
					
				
				}

				ResultSet rst = statement.executeQuery(query);
				while (rst.next()) 
				{
					out.print("<tr>");
					out.print("<td ><a href=\"\"></a>" + rst.getInt("patient_id") + "</td>");
					out.print("<td>" + rst.getString("first_name") + "</td>");
					out.print("<td>" + rst.getString("last_name") + "</td>");
					out.print("<td>" + rst.getString("gender") + "</td>");
					out.print("<td>" + rst.getString("phonenumber") + "</td>");
					out.print("<td>" + rst.getString("father_name") + "</td>");
					out.print("<td>" + rst.getInt("floor") + "</td>");
					out.print("<td>" + rst.getInt("roomnumber") + "</td>");
					out.print("<td>" + rst.getTimestamp("dateof") + "</td>");
					out.print("</tr>");

				}
			%>
		<tbody>
		</table>
		</div>
	</form>
	<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#mytable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>
</html>