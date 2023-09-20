package in.fssa.carecentral.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.carecentral.dto.AppointmentDTO;
import in.fssa.carecentral.enumfiles.Gender;
import in.fssa.carecentral.enumfiles.MethodOfConsultation;
import in.fssa.carecentral.enumfiles.Status;
import in.fssa.carecentral.exception.ValidationException;
import in.fssa.carecentral.model.Appointment;
import in.fssa.carecentral.service.AppointmentService;

/**
 * Servlet implementation class AcceptOrRejectAppointmentServlet
 */
@WebServlet("/statusupdate")
public class AcceptOrRejectAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Appointment appointment = new Appointment();
		appointment.setPatientId(Integer.parseInt(request.getParameter("user id")));
		appointment.setDoctorId(Integer.parseInt(request.getParameter("doctor id")));
		appointment.setReasonForConsultation(request.getParameter("reason for consultation"));
		appointment.setMethodOfConsultation(MethodOfConsultation.valueOf(request.getParameter("method of consultation")));
		appointment.setDateOfConsultation(request.getParameter("date of consultation"));
		appointment.setStartTime(request.getParameter("start time"));
		appointment.setEndTime(request.getParameter("end time"));
		appointment.setStatus(Status.valueOf(request.getParameter("status")));
		
		AppointmentService appointmentService = new AppointmentService();
		int appointmentId = Integer.parseInt(request.getParameter("appointment Id"));
		
		try {
			String status = appointment.getStatus().name();
			appointmentService.updateAppointmentStatusByAppointmentId(appointmentId, appointment);
			if(status.equals("Approved")) {
				response.getWriter().println("<script>alert('Appointment "+status+" successfully!')");
				response.getWriter().println("window.location.href=\""+request.getContextPath()+"/home\"");
				response.getWriter().println("</script>");
			}else {
				response.getWriter().println("<script>alert('Appointment cancelled successfully!')");
				response.getWriter().println("window.location.href=\""+request.getContextPath()+"/home\"");
				response.getWriter().println("</script>");
			}
			
		} catch (ValidationException e) {
			e.printStackTrace();
			response.getWriter().println("<script>alert('"+e.getMessage()+"!')");
			response.getWriter().println("window.location.href=\""+request.getContextPath()+"/appointmentdetail\"");
			throw new RuntimeException(e.getMessage());
		}
		
		
	}

}
