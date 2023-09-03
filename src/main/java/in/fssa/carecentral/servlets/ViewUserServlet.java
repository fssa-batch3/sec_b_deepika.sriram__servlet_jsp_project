package in.fssa.carecentral.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.carecentral.exception.ValidationException;
import in.fssa.carecentral.model.User;
import in.fssa.carecentral.service.UserService;

/**
 * Servlet implementation class ViewUserServlet
 */
@WebServlet("/users/user")
public class ViewUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id =  request.getParameter("id");
		if(id==null || id.isEmpty()) {
			throw new RuntimeException("id cannot be empty");
		}
		
		int userId = Integer.parseInt(id);
		try {
			UserService  userService = new UserService();
			User user = userService.getUserById(userId);
			request.setAttribute("User", user);
			RequestDispatcher rd = request.getRequestDispatcher("/view-user.jsp");
			rd.forward(request, response);
		}catch(ValidationException e) {
			e.printStackTrace();
		}
		
	}

}
