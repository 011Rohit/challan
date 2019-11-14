package com.Chalan_management;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.chalan.LoginD;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String username = request.getParameter("uname");
		String pass = request.getParameter("pass");
		LoginDao dao = new LoginDao();
		
			
		if(dao.checkLogin(username, pass))
		{
			/*HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }*/
            //generate a new session
            HttpSession newSession = request.getSession(true);

            //setting session to expiry in 5 mins
            //newSession.setMaxInactiveInterval(5*60);
            String vno = dao.getVehicleNo(username);
            Cookie uname = new Cookie("username", username);
            Cookie vehicleNo = new Cookie("vehicleNo",vno);
            response.addCookie(uname);
            response.addCookie(vehicleNo);            
            System.out.println(username);
            request.setAttribute("uname", username);
			RequestDispatcher rd =request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
		}else
		{
			RequestDispatcher rd =request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}
	}

}
