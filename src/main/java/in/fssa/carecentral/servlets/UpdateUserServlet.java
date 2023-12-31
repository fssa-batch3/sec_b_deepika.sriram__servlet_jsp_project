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
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/users/update")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserService();
		User user = new User();
		user.setFirstName(request.getParameter("first name"));
		user.setLastName(request.getParameter("last name"));
		user.setAge(Integer.parseInt(request.getParameter("age")));
		user.setGender(Gender.valueOf(request.getParameter("gender")));
		user.setMobileNumber(Long.parseLong(request.getParameter("mobile number")));
		user.setEmailId(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		
		String userId =  request.getParameter("id");
		if(userId==null) {
			response.getWriter().print("<script>alert('id cannot be empty!');</script>");
			throw new RuntimeException("id cannot be empty");
		}
		try {
			
			int id = Integer.parseInt(userId);
			userService.updateUser(id, user);
			response.getWriter().print("<script>alert('User updated successfully!');");
			response.getWriter().print("window.location.href=\""+request.getContextPath()+"/homepage\"");
			response.getWriter().print("</script>");
		}catch(ValidationException e) {
			response.getWriter().println("<script>alert('"+e.getMessage()+"');</script>");
			e.printStackTrace();
		}
	}

}
