package in.fssa.carecentral.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.carecentral.dto.DoctorDTO;
import in.fssa.carecentral.enumfiles.Gender;
import in.fssa.carecentral.exception.ValidationException;
import in.fssa.carecentral.service.DoctorService;

/**
 * Servlet implementation class CreateDoctorServlet
 */
@WebServlet("/doctors/create")
public class CreateDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DoctorService doctorService = new DoctorService();
		DoctorDTO doctor = new DoctorDTO();
		doctor.setFirstName(request.getParameter("first name"));
		doctor.setLastName(request.getParameter("last name"));
		doctor.setAge(Integer.parseInt(request.getParameter("age")));
		doctor.setGender(Gender.valueOf(request.getParameter("gender")));
		doctor.setMobileNumber(Long.parseLong(request.getParameter("mobile number")));
		doctor.setEmailId(request.getParameter("email"));
		doctor.setPassword(request.getParameter("password"));
		doctor.setQualifications(request.getParameter("qualifications"));
		doctor.setExperience(Double.parseDouble(request.getParameter("experience")));
		doctor.setDepartment(request.getParameter("department"));
		doctor.setDoctorImage(request.getParameter("doctor image"));
		
		try {
			doctorService.createDoctor(doctor);
			String alert = "<script>alert('Doctor created successfully');</script>";
			response.getWriter().println(alert);
			response.sendRedirect(request.getContextPath()+"/doctors");
		} catch (ValidationException e) {
			String alert = "<script>alert('" + e.getMessage() +"');</script>";
			response.getWriter().println(alert);
			e.printStackTrace();
		}
		
		
		
	}

}
