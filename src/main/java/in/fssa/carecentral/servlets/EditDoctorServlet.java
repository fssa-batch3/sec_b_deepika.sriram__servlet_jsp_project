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
 * Servlet implementation class EditDoctorServlet
 */
@WebServlet("/doctors/edit")
public class EditDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String id = request.getParameter("id");
		if(id==null || id.isEmpty()) {
			response.getWriter().print("<script>alert('id cannot be negative!');</script>");
			throw new RuntimeException("id cannot be negative");
		}
		
		int doctorId = Integer.parseInt(id);
		try {
			
			DoctorService doctorService = new DoctorService();
			DoctorDTO doctor = doctorService.getDoctorById(doctorId);
			request.setAttribute("doctor", doctor);
			RequestDispatcher rd = request.getRequestDispatcher("/update_doctor.jsp");
			rd.forward(request, response);
		} catch (ValidationException e) {
			String alert = "<script>alert('" + e.getMessage() +"');</script>";
			response.getWriter().println(alert);
			e.printStackTrace();
		}
	}

}
