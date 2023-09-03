package in.fssa.carecentral.servlets;

import java.io.IOException;
import java.util.Set;

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
 * Servlet implementation class ViewDoctorListServlet
 */
@WebServlet("/users/viewdoctors")
public class ViewDoctorListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		DoctorService doctorService = new DoctorService();
		try {
			Set<DoctorDTO> doctors = doctorService.listAllDoctor();
			request.setAttribute("doctorList", doctors);
			RequestDispatcher rd = request.getRequestDispatcher("/view_doctor_list.jsp");
			rd.forward(request, response);
		} catch (ValidationException e) {
			e.printStackTrace();
		}
	}

}
