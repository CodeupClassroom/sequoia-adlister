package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        // validate username uniqueness in db: not empty, length of username, and no special characters
        boolean usernameHasErrors = DaoFactory.getUsersDao().findByUsername(username) != null
            || username.isEmpty()
            || username.length() > 255
            || username.length() < 8
            || !StringUtils.isAlphanumeric(username);

        // validate password uniqueness in db: not empty, length of password, and if is ascii printable
        boolean passwordHasErrors = password.isEmpty()
            || password.length() > 255
            || password.length() < 8
            || (! password.equals(passwordConfirmation))
            || !StringUtils.isAsciiPrintable(password);

        // validate email uniqueness in db: not empty, length of email, contains only one "@", has at least one "." after the "@" character
        boolean emailHasErrors = DaoFactory.getUsersDao().findByEmail(email) != null
            || email.isEmpty()
            || email.length() > 255
            || StringUtils.countMatches(email, "@") != 1
            || StringUtils.lastIndexOf(email, ".") <= StringUtils.lastIndexOf(email, "@");

        if (usernameHasErrors || passwordHasErrors || emailHasErrors) {
            username = usernameHasErrors ? "" : username;
            password = passwordHasErrors ? "" : password;
            email = emailHasErrors ? "" : email;
            request.setAttribute("inputError", true);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("email", email);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            return;
        }

        // create and save a new user
        User user = new User(username, email, password);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
