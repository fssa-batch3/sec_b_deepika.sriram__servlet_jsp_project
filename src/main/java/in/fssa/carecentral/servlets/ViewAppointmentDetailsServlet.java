package in.fssa.carecentral.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.carecentral.dto.AppointmentDTO;
import in.fssa.carecentral.exception.ValidationException;
import in.fssa.carecentral.service.AppointmentService;

/**
 * Servlet implementation class ViewAppointmentDetailsServlet
 */
@WebServlet("/appointmentdetail")
public class ViewAppointmentDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = request.getParameter("id");
		if(id==null ||  id.isEmpty()) {
			response.getWriter().println("<script>alert('id cannot be empty!');");
			response.getWriter().println("window.location.href=\""+request.getContextPath()+"/home\"");
			response.getWriter().println("</script>");
			throw new RuntimeException("id cannot be empty!");
		}
		int appointmentId = Integer.parseInt(id);
		AppointmentService appointmentService = new AppointmentService();
		try {
			AppointmentDTO appointment = appointmentService.getAppointmentByAppointmentId(appointmentId);
			request.setAttribute("appointment", appointment);
			RequestDispatcher rd = request.getRequestDispatcher("/appointment_details.jsp");
			rd.forward(request, response);
		} catch (ValidationException e) {
			response.getWriter().println(e.getMessage());
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		
	}

}
