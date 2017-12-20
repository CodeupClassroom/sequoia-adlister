import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SayHelloServlet", urlPatterns = "/say-hello")
public class SayHelloServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");

        String message = "Hello, ";
        message += name == null ? "World" : name;
        message += "!";

        // separate class to encapsulate data, M in MVC
        Greeting greeting = new Greeting();
        greeting.setMessage(message);

        // make variable accessable in the jsp
        request.setAttribute("greeting", greeting);
        // delegate to a jsp
        request.getRequestDispatcher("hello.jsp").forward(request, response);
    }
}
