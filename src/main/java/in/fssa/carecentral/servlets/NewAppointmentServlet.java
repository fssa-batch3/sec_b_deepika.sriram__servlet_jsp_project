package in.fssa.carecentral.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.carecentral.model.User;

/**
 * Servlet implementation class NewAppointmentServlet
 */
@WebServlet("/appointment/booknew")
public class NewAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		User user = (User)request.getSession().getAttribute("logged user");
		if(user!=null) {
			request.setAttribute("logged user", user);
			RequestDispatcher rd = request.getRequestDispatcher("/appointment.jsp");
			rd.forward(request, response);
		}else {
			response.getWriter().println("<script>alert('you have not been logged in...plz log in into this website');</script>");
			response.sendRedirect(request.getContextPath()+"/homepage/login");
			throw new RuntimeException("you have not been logged in...plz log in into this website");
		}
		
		
	}

}
