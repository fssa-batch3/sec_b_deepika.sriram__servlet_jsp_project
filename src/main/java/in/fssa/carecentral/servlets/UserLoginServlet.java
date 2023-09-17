package in.fssa.carecentral.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.carecentral.exception.ValidationException;
import in.fssa.carecentral.model.User;
import in.fssa.carecentral.service.UserService;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/homepage/login")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/user_login.jsp");
		rd.forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserService userService = new UserService();
//		boolean isCredentialsCorrect = userService.isRegistered(email, password);
//		try {
//			
//					HttpSession login = request.getSession();
//					login.setAttribute("email", email);
//					login.setAttribute("logged user", loggedUser);
//					response.getWriter().println("User logged in successfully");
//					response.sendRedirect(request.getContextPath()+"/homepage");
//					
//				} catch (ValidationException e) {
//					e.printStackTrace();
//				}
//			}else {
//				response.getWriter().println("User log in failed");
//				response.sendRedirect("/user_login.jsp");
//			}
		User user;
		try {
			user = userService.getUserByEmail(email);
		}catch(ValidationException e) {
			throw new RuntimeException("no user exists");
		}
		HttpSession login = request.getSession();
		if(password.equals(user.getPassword())) {
			login.setAttribute("logged email", email);
			System.out.println(email);
			login.setAttribute("logged user", user);
			System.out.println(user);
			login.setAttribute("logged user id", user.getId());
			System.out.println(user.getId());
			
			response.getWriter().println("<script>alert('User logged in successfully!');");
			response.getWriter().println("window.location.href=\""+request.getContextPath()+"/homepage\"");
			response.getWriter().println("</script>");
		}else {
			response.getWriter().println("<script>alert('Incorrect password!');");
			response.getWriter().println("window.location.href=\""+request.getContextPath()+"/homepage/login\"");
			response.getWriter().println("</script>");
		}
	}

}
