package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Note note = new Note(title, content, new Date());

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			s.save(note);
			tx.commit();
			System.out.println(s.save(note));
			s.close();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1> data saved </h1>");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
