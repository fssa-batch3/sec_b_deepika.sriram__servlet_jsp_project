package in.fssa.carecentral.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.carecentral.enumfiles.MethodOfConsultation;
import in.fssa.carecentral.exception.ValidationException;
import in.fssa.carecentral.model.Appointment;
import in.fssa.carecentral.model.User;
import in.fssa.carecentral.service.AppointmentService;
import in.fssa.carecentral.service.UserService;

/**
 * Servlet implementation class CreateAppointmentServlet
 */
@WebServlet("/appointment/create")
public class CreateAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AppointmentService appointmentService = new AppointmentService();
		String id = request.getParameter("id");
		System.out.println(id);
		if(id==null || "".equals(id)) {
			throw new RuntimeException("id cannot be empty");
		}
		int doctorId = Integer.parseInt(id);
		User user = (User)request.getSession().getAttribute("logged user");
		int userId = user.getId();
		System.out.print(userId);
		
		Appointment appointment = new Appointment();
		appointment.setDoctorId(doctorId);
		appointment.setPatientId(userId);
		appointment.setReasonForConsultation(request.getParameter("health issues"));
		String[] moc = request.getParameterValues("method of consultation");
		for(String m : moc) {
			appointment.setMethodOfConsultation(MethodOfConsultation.valueOf(m));
		}
		appointment.setDateOfConsultation(request.getParameter("date of consultation"));
		appointment.setStartTime(request.getParameter("start time")+":00");
		appointment.setEndTime(request.getParameter("end time")+":00");
		
		try {
			appointmentService.create(appointment);
			response.getWriter().println("<script>alert('Appointment booked successfully!');</script>");
			response.sendRedirect(request.getContextPath()+"/myappointments");
		} catch (ValidationException e) {
			e.printStackTrace();
			response.getWriter().print("<script>alert('"+e.getMessage()+"');</script>");
			response.sendRedirect(request.getContextPath()+"/appointment/booknew");
		}
	}

}
