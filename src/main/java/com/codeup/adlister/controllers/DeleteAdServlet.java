package com.codeup.adlister.controllers;

        import com.codeup.adlister.dao.DaoFactory;

        import javax.servlet.ServletException;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;

        import static javax.swing.JOptionPane.showMessageDialog;

@WebServlet(name = "controllers.DeleteAdServlet", urlPatterns = "/deleteAd")
public class DeleteAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
        }
        Long id = Long.parseLong(request.getParameter("id"));
        request.getSession().setAttribute("id", id);

        request.getRequestDispatcher("/WEB-INF/ads/deleteAd.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        long id = (long) request.getSession().getAttribute("id");
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        boolean inputHasErrors = title.isEmpty() || description.isEmpty();

        if (inputHasErrors) {
            showMessageDialog(null,
                    "A blank field(s) was detected. Please fix your error(s) and try again.");
            response.sendRedirect("/profile");
        } else {
//            DaoFactory.getAdsDao().editAdInformation(title, description, id);
//            response.sendRedirect("/profile");
        }

    }
}

