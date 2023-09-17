package in.fssa.carecentral.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.carecentral.exception.ValidationException;
import in.fssa.carecentral.model.Appointment;
import in.fssa.carecentral.service.AppointmentService;

/**
 * Servlet implementation class CancelAppointmentServlet
 */
@WebServlet("/cancel")
public class CancelAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if("cancel appointment".equals(action)) {
			int appId = Integer.parseInt(request.getParameter("appointmentId"));
			String appointmentdata = request.getParameter("appointment");
			Gson gson = new Gson();
			
			Appointment appointment = gson.fromJson(appointmentdata, Appointment.class);
			System.out.print(appointment);
			
			AppointmentService appointmentService = new AppointmentService();
			try {
				appointmentService.updateAppointmentStatusByAppointmentId(appId, appointment);
//				response.getWriter().println("<script>alert('Appointment cancelled successfully!');");
//				response.getWriter().println("window.location.href=\""+request.getContextPath()+"/myappointments\"");
//				response.getWriter().println("</script>");
			} catch (ValidationException e) {
				e.printStackTrace();
				response.getWriter().println("<script>alert('"+e.getMessage()+"');");
				response.getWriter().println("window.location.href=\""+request.getContextPath()+"/myappointments\"");
				response.getWriter().println("</script>");
				throw new RuntimeException(e.getMessage());
			}
		}
	}

}
