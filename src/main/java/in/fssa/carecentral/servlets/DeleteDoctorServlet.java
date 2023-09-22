package in.fssa.carecentral.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.carecentral.exception.ValidationException;
import in.fssa.carecentral.service.DoctorService;

/**
 * Servlet implementation class DeleteDoctorServlet
 */
@WebServlet("/doctors/delete")
public class DeleteDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = request.getParameter("id");
		if(id==null || id.isEmpty()) {
			response.getWriter().print("<script>alert('id cannot be empty');</script>");
			throw new RuntimeException("id cannot be empty");
		}
		
		int doctorId = Integer.parseInt(id);
		DoctorService doctorService = new DoctorService();
		try {
			doctorService.deleteDoctor(doctorId);
			response.sendRedirect(request.getContextPath()+"/doctors");
		} catch (ValidationException e) {
			e.printStackTrace();
		}
	}

}
