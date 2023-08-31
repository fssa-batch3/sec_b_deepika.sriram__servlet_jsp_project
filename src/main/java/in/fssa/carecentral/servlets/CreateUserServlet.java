package in.fssa.carecentral.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.carecentral.enumfiles.Gender;
import in.fssa.carecentral.exception.ValidationException;
import in.fssa.carecentral.model.User;
import in.fssa.carecentral.service.UserService;

/**
 * Servlet implementation class CreateUserServlet
 */
@WebServlet("/users/create")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService  userService = new UserService();
		User user = new User();
		user.setFirstName(request.getParameter("first name"));
		user.setLastName(request.getParameter("last name"));
		user.setAge(Integer.parseInt(request.getParameter("age")));
		String[] genders = request.getParameterValues("gender");
		for(String g :genders) {
			user.setGender(Gender.valueOf(g));
		}
		user.setMobileNumber(Long.parseLong(request.getParameter("mobile number")));
		user.setEmailId(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		
		try {
			userService.createUser(user);
			response.sendRedirect("./../users");
		}catch(ValidationException e) {
			e.printStackTrace();
		}
	}

}
