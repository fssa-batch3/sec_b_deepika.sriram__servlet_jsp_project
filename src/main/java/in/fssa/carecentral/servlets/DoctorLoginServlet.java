package in.fssa.carecentral.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.carecentral.dto.DoctorDTO;
import in.fssa.carecentral.exception.ValidationException;
import in.fssa.carecentral.model.User;
import in.fssa.carecentral.service.DoctorService;
import in.fssa.carecentral.service.UserService;

/**
 * Servlet implementation class DoctorLoginServlet
 */
@WebServlet("/homepage/doctorlogin")
public class DoctorLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher rd = request.getRequestDispatcher("/login_for_doctor.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		DoctorService doctorService = new DoctorService();
		DoctorDTO doctor;
		
		try {
			doctor = doctorService.getDoctorByEmail(email);
		}catch(ValidationException e) {
			response.getWriter().println(e.getMessage());
			throw new RuntimeException("no user exists");
		}
		
		HttpSession doctorLogin = request.getSession();
		if(password.equals(doctor.getPassword())) {
			doctorLogin.setAttribute("logged email", email);
//			application.setAttribute("logged email" , email);
			doctorLogin.setAttribute("logged doctor", doctor);
			doctorLogin.setAttribute("logged doctor's user id", doctor.getUserId());
			doctorLogin.setAttribute("logged doctor's doctor id", doctor.getId());
			
			
			response.getWriter().println("<script>alert('Doctor logged in successfully!');");
			response.getWriter().println("window.location.href=\""+request.getContextPath()+"/home\"");
			response.getWriter().println("</script>");
//			response.sendRedirect(request.getContextPath()+"/homepage");
		}else {
			response.getWriter().println("<script>alert('Incorrect password!');");
			response.getWriter().println("window.location.href=\""+request.getContextPath()+"/homepage/doctorlogin\"");
			response.getWriter().println("</script>");
		}
		
	}

}
