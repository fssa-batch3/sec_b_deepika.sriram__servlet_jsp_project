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
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		UserService userService = new UserService();
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			User user = userService.getUserById(id);
			if(user!=null) {
				request.setAttribute("User", user);
				RequestDispatcher rd = request.getRequestDispatcher("/view-user.jsp");
				rd.forward(request, response);
			}else {
				throw new RuntimeException("No user found");
			}
		} catch (ValidationException e) {
			e.printStackTrace();
		}
	}

}
