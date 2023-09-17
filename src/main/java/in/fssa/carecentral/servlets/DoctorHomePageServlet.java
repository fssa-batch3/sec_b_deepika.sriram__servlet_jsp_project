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
import in.fssa.carecentral.dto.DoctorDTO;
import in.fssa.carecentral.exception.ValidationException;
import in.fssa.carecentral.service.AppointmentService;

/**
 * Servlet implementation class DoctorHomePageServlet
 */
@WebServlet("/home")
public class DoctorHomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		DoctorDTO doctor = (DoctorDTO) request.getSession().getAttribute("logged doctor");
		request.setAttribute("doctor", doctor);
		int doctorId = doctor.getId();
		AppointmentService appointmentService = new AppointmentService();
		try {
			Set<AppointmentDTO> appointmentList = appointmentService.getAllAppointmentsByDoctorId(doctorId);
			request.setAttribute("appointmentList", appointmentList);
		} catch (ValidationException e) {
			e.printStackTrace();
			response.getWriter().println("<script>alert('"+e.getMessage()+"')</script>");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/homepage_for_doctor.jsp");
		rd.forward(request, response);
		
		
	}

}
