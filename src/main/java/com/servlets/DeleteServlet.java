package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			System.out.println(noteId);
			Session s = FactoryProvider.getFactory().openSession();
			Transaction x = s.beginTransaction();
			Note note = (Note) s.get(Note.class, noteId);
			s.delete(note);
			x.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
