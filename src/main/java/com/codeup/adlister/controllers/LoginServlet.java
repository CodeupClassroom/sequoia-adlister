package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);
        boolean inputHasErrors = false;
        ArrayList<String> listOfLoginErrors = new ArrayList<>();

        if (username.isEmpty()) {
            String usernameIsEmpty = "You must enter a username.";
            listOfLoginErrors.add(usernameIsEmpty);
            inputHasErrors = true;
        }

        if (password.isEmpty()) {
            String passwordIsEmpty = "You must enter a password.";
            listOfLoginErrors.add(passwordIsEmpty);
            inputHasErrors = true;
        }

        if (inputHasErrors) {
            // Displays an error message based on user input.
            request.getSession().setAttribute("listOfLoginErrors", listOfLoginErrors);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }

        boolean validAttempt = user != null && Password.check(password, user.getPassword());

        if (!validAttempt) {
            String invalidAttempt = "You must enter the correct username or password.";
            listOfLoginErrors.add(invalidAttempt);
            inputHasErrors = true;
        }

        if (inputHasErrors) {
            request.getSession().setAttribute("listOfLoginErrors", listOfLoginErrors);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }

        if (validAttempt) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/profile");
        }
    }
}
