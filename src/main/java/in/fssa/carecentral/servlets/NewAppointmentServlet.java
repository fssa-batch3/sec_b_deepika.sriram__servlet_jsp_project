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
		User user = (User)request.getSession().getAttribute("logged user");
		String doctorId = request.getParameter("id");
		System.out.println("doctor id in string"+doctorId);
		if(doctorId==null || doctorId.isEmpty()) {
			response.getWriter().println("<script>alert('id cannot be empty!');</script>");
			throw new RuntimeException("doctor id cannot be empty");
		}
		if(user!=null) {
			int doctor_id = Integer.parseInt(doctorId);
			System.out.println("doctor id in integer"+doctor_id);
			request.setAttribute("doctor id", doctor_id);
			request.setAttribute("logged user", user);
			RequestDispatcher rd = request.getRequestDispatcher("/appointment.jsp");
			rd.forward(request, response);
		}else {
			response.getWriter().println("<script>alert('you have not been logged in...plz log in into this website');");
			response.getWriter().println("window.location.href=\""+request.getContextPath()+"/homepage\"");
			response.getWriter().println("</script>");
			
			throw new RuntimeException("you have not been logged in...plz log in into this website");
		}
		
		
	}

}
