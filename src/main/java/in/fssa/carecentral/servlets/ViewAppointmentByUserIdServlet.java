package in.fssa.carecentral.servlets;

import java.io.IOException;
import java.util.Set;

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
 * Servlet implementation class ViewAppointmentByUserIdServlet
 */
@WebServlet("/myappointments")
public class ViewAppointmentByUserIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int id = (int)request.getSession().getAttribute("logged user id");
//		if(id==null||"".equals(id)) {
//			response.getWriter().println("<script>alert('user id doesn't exists...plz log in');</script>");
//		}
//		int userId = Integer.parseInt(id);
		
		AppointmentService appointmentService = new AppointmentService();
		try {
			Set<AppointmentDTO> appointmentList = appointmentService.getAllAppointmentsByUserId(id);
			request.setAttribute("appointments", appointmentList);
			RequestDispatcher rd = request.getRequestDispatcher("/appointment_list_for_patient.jsp");
			rd.forward(request, response);
		} catch (ValidationException e) {
			response.getWriter().println("<script>alert('"+e.getMessage()+"');</script>");
			e.printStackTrace();
		}
	}

}
