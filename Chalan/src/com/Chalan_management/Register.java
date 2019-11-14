package com.Chalan_management;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("Name");
		String surname = request.getParameter("Surname");
		
		String username = request.getParameter("Username");
		String pass = request.getParameter("pw1");
		
		String email = request.getParameter("Email");
		String vno = request.getParameter("Vno");
		
		String phone = request.getParameter("Phone");
		String q = request.getParameter("Q");
		String a = request.getParameter("A");
		
		RegisterDao dao = new RegisterDao();
		if(dao.insertData(name, surname, username, pass, email, vno, phone, q, a))
		{
			System.out.println("Success");
			RequestDispatcher rd =request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}else
		{
			System.out.println("error");
			response.getOutputStream().println("there might be some isshue in server side plz try again letter");
		}
	}

}
