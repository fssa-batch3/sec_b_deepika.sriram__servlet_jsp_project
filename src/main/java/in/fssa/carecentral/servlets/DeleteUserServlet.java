package in.fssa.carecentral.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.carecentral.exception.ValidationException;
import in.fssa.carecentral.service.UserService;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/users/delete")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String userId = request.getParameter("id");
		if(userId==null) {
			throw new RuntimeException("id cannot be empty");
		}
		int id = Integer.parseInt(userId);
		try {
			UserService userService = new UserService();
			userService.deleteUser(id);
		}catch(ValidationException e) {
			e.printStackTrace();
		}finally {
			response.sendRedirect(request.getContextPath()+"/users");
		}
	}

}
