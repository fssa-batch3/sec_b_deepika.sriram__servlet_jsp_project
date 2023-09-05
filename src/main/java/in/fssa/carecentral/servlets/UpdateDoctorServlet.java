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
import in.fssa.carecentral.model.Doctor;
import in.fssa.carecentral.model.User;
import in.fssa.carecentral.service.DoctorService;
import in.fssa.carecentral.service.UserService;

/**
 * Servlet implementation class UpdateDoctorServlet
 */
@WebServlet("/doctors/update")
public class UpdateDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id==null || id.isEmpty()) {
			throw new RuntimeException("id cannot be empty");
		}
		
		int doctorId = Integer.parseInt(id);
		DoctorService doctorService = new DoctorService();
		Doctor doctor = new Doctor();
		doctor.setFirstName(request.getParameter("first name"));
		doctor.setLastName(request.getParameter("last name"));
		doctor.setAge(Integer.parseInt(request.getParameter("age")));
		doctor.setGender(Gender.valueOf(request.getParameter("gender")));
		doctor.setMobileNumber(Long.parseLong(request.getParameter("mobile number")));
		doctor.setPassword(request.getParameter("password"));
		doctor.setQualifications(request.getParameter("qualifications"));
		doctor.setExperience(Double.parseDouble(request.getParameter("experience")));
		doctor.setDepartment(request.getParameter("department"));
		doctor.setDoctorImage(request.getParameter("doctor image"));
		
		try {
			doctorService.updateDoctor(doctorId, doctor);
			String alert = "<script>alert('Doctor updated successfully');</script>";
			response.getWriter().println(alert);
			response.sendRedirect("./../doctors");
		} catch (ValidationException e) {
			String alert = "<script>alert('" + e.getMessage() +"');</script>";
			response.getWriter().println(alert);
			e.printStackTrace();
		}
	}

}
