

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.carecentral.dto.DoctorDTO;
import in.fssa.carecentral.exception.ValidationException;
import in.fssa.carecentral.service.DoctorService;
import in.fssa.carecentral.service.UserService;

/**
 * Servlet implementation class ViewDoctorForUsersServlet
 */
@WebServlet("/doctors/viewdoctor")
public class ViewDoctorForUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		DoctorService doctorService = new DoctorService();
		String id = request.getParameter("id");
		if(id==null||"".equals(id)) {
			throw new RuntimeException("id cannot be empty");
		}
		int doctorId = Integer.parseInt(id);
		try {
			DoctorDTO doctor = doctorService.getDoctorById(doctorId);
			request.setAttribute("Doctor", doctor);
			RequestDispatcher rd = request.getRequestDispatcher("/view_doctor_details.jsp");
			rd.forward(request, response);
		} catch (ValidationException e) {
			e.printStackTrace();
		}
		
	}

}
