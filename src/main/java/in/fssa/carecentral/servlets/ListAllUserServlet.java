package in.fssa.carecentral.servlets;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.carecentral.model.User;
import in.fssa.carecentral.service.UserService;



//import in.fssa.carecentral.service.UserService;

/**
 * Servlet implementation class ListAllUserServlet
 */
@WebServlet("/users")
public class ListAllUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UserService userService = new UserService();
		Set<User> userList = userService.listAllUser();
		request.setAttribute("Users" , userList);
		RequestDispatcher rd = request.getRequestDispatcher("/list-user.jsp");
		rd.forward(request, response);
		
	}

}
