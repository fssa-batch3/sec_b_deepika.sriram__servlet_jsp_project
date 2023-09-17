package in.fssa.carecentral.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession();
		System.out.println("Logout Servlet");
		
		session.invalidate();
		java.io.PrintWriter out = response.getWriter();

        // Generate JavaScript code to display an alert box
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Logged out successfully!');");
        out.println("window.location.href=\""+request.getContextPath()+"/homepage\"");
        out.println("</script>");
//		response.sendRedirect(request.getContextPath()+"/homepage");
	}

}
