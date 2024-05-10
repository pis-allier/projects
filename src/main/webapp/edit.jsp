<!doctype html>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Delete notes</title>
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
		<h2>Delete Notes</h2>

		<div class="row">
			<div class="col">
              
				<%
				int id = Integer.parseInt(request.getParameter("note_id").trim());
				Session s = FactoryProvider.getFactory().openSession();
				Note note = (Note) s.get(Note.class, id);
				%>
				<form action="UpdateServlet" method="post">
               <input type="hidden" value="<%= note.getId() %>" name="noteId">
					<div class="mb-3">
						<label for="title" class="form-label">Title Note</label> <input
							type="text" name="title" required class="form-control" id="title"
							value="<%= note.getTitle() %>>">

					</div>
					<div class="mb-3">
						<label for="content" class="form-label">Note Content</label>
						<textarea name="content" class="form-control" required
							id="content" ><%=note.getContent() %></textarea>
					</div>

					<button type="submit" class="btn btn-primary">Save</button>
				</form>





			</div>


		</div>

	</div>









	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>