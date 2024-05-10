<!doctype html>
<%@page import="com.entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>All notes</title>
<link rel="stylesheet" href="css/style.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

</head>
<body>



	<div class="container ">
		<%@include file="navbar.jsp"%>
		<br>
		<h2>All Notes</h2>

		<div class="row">
			<div class="col">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> l1 = q.list();
				for (Note note : l1) {
				%>




				<div class="card mt-3" >
					<div class="card-body">
						<h5 class="card-title"><%= note.getTitle() %></h5>
						<p class="card-text"><%= note.getContent() %></p>
						<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
						<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-success">Edit</a>
					</div>
				</div>
				<%
				}
				s.close();
				%>


			</div>


		</div>

	</div>









	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>