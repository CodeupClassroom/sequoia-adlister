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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
        }
        request.getRequestDispatcher("/WEB-INF/editUser.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        boolean inputHasErrors = false;
        ArrayList<String> listOfEditUserErrors = new ArrayList<>();

        if (email.isEmpty() && password.isEmpty() && passwordConfirmation.isEmpty()) {
            String editError = "You must submit an email/password.";
            listOfEditUserErrors.add(editError);
            inputHasErrors = true;
        }

        if (password.isEmpty() && !passwordConfirmation.isEmpty()) {
            String passwordRequired = "You must enter a password before it can be confirmed.";
            listOfEditUserErrors.add(passwordRequired);
            inputHasErrors = true;
        }

        if (inputHasErrors) {
            // Displays an error message based on user input.
            request.getSession().setAttribute("listOfErrors", listOfEditUserErrors);
            request.getRequestDispatcher("/WEB-INF/editUser.jsp").forward(request, response);
        }

        if (!email.isEmpty()) {
            editEmail(request, response, email);
        }

        if (!password.isEmpty()) {
            editPassword(request, response, password, passwordConfirmation);
        }
    }

    private void editEmail(HttpServletRequest request, HttpServletResponse response, String email)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        DaoFactory.getUsersDao().editEmail(email, user.getId());

        //update user for session
        user = DaoFactory.getUsersDao().findByUsername(user.getUsername());
        request.getSession().setAttribute("user", user);
        response.sendRedirect("/profile");
    }

    private void editPassword(HttpServletRequest request, HttpServletResponse response, String password,
                              String passwordConfirmation)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        boolean inputHasErrors = false;
        ArrayList<String> listOfEditPasswordErrors = new ArrayList<>();

        // Check if the passwords match.
        if (!passwordConfirmation.equals(password)) {
            String passwordsDoNotMatch = "Your passwords do not match.";
            listOfEditPasswordErrors.add(passwordsDoNotMatch);
            inputHasErrors = true;
        }

        if (inputHasErrors) {
            request.getSession().setAttribute("listOfErrors", listOfEditPasswordErrors);
            request.getRequestDispatcher("/WEB-INF/editUser.jsp").forward(request, response);
        } else {
            // Save the new password.
            DaoFactory.getUsersDao().editPassword(password, user.getId());
            response.sendRedirect("/profile");
        }
    }
}
