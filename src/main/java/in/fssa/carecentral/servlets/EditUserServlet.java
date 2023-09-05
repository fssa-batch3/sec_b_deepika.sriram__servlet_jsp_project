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
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/users/edit")
public class EditUserServlet extends HttpServlet {
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
			User user = new UserService().getUserById(id);
			request.setAttribute("user", user);
			RequestDispatcher rd = request.getRequestDispatcher("/update-user.jsp");
			rd.forward(request, response);
		}catch(ValidationException e) {
			String alert = "<script>alert('" + e.getMessage() +"');</script>";
			response.getWriter().println(alert);
			e.printStackTrace();
		}
		
		
	}

}
