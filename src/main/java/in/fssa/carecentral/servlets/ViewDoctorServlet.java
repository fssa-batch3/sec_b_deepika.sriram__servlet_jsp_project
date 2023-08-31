package in.fssa.carecentral.servlets;

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

/**
 * Servlet implementation class ViewDoctorServlet
 */
@WebServlet("/doctors/view")
public class ViewDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String doctorId = request.getParameter("id");
		if(doctorId==null || doctorId.isEmpty()) {
			throw new RuntimeException("id cannot be empty");
		}
		
		int id = Integer.parseInt(doctorId);
		try {
			DoctorDTO doctor = new DoctorService().getDoctorById(id);
			request.setAttribute("Doctor", doctor);
			RequestDispatcher rd = request.getRequestDispatcher("/view_doctor.jsp");
			rd.forward(request, response);
		} catch (ValidationException e) {
			e.printStackTrace();
		}
	}

}
