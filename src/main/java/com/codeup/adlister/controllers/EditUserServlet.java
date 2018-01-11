package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "controllers.EditUserServlet", urlPatterns = "/editUser")
public class EditUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
        }
        request.getRequestDispatcher("/WEB-INF/editUser.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        User user = (User) request.getSession().getAttribute("user");
        boolean inputHasErrors = false;
        ArrayList<String> listOfEditUserErrors = new ArrayList<>();

        if (email.isEmpty()) {
            String emailIsEmpty = "You must enter an email.";
            listOfEditUserErrors.add(emailIsEmpty);
            inputHasErrors = true;
        }

        if (password.isEmpty()) {
            String passwordIsEmpty = "You must enter a password.";
            listOfEditUserErrors.add(passwordIsEmpty);
            inputHasErrors = true;
        }

        if (!passwordConfirmation.equals(password)) {
            String passwordsDoNotMatch = "Your passwords do not match.";
            listOfEditUserErrors.add(passwordsDoNotMatch);
            inputHasErrors = true;
        }

        if (inputHasErrors) {
            // Displays an error message based on user input.
            request.getSession().setAttribute("listOfEditUserErrors", listOfEditUserErrors);
            request.getRequestDispatcher("/WEB-INF/editUser.jsp").forward(request, response);
        } else {
            // Save the new user information
            DaoFactory.getUsersDao().editProfileInformation(email, password, user.getId());
            User userUpdated = DaoFactory.getUsersDao().findByUsername(user.getUsername());
            request.getSession().setAttribute("user", userUpdated);

            response.sendRedirect("/login");
        }
    }
}
