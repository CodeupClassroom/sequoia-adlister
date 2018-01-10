package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        // validate input
        boolean inputHasErrors = username.isEmpty()
                || password.isEmpty();

        if (inputHasErrors) {
                doGet(request, response);

        } else {

            //Check to see if username already exist in database
            User registerName = DaoFactory.getUsersDao().findByUsername(username);
            if (registerName != null) {
                request.setAttribute("user", registerName);
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
                return;
            }

            if(!password.equals(passwordConfirmation)){
                request.setAttribute("password", password);
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
                return;
            }

            if(email.isEmpty() || !email.contains("@")){
                request.setAttribute("email", email);
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
                return;
            }


            // create and save a new user
            User user = new User(username, email, password);
            Long id = DaoFactory.getUsersDao().insert(user);
            user.setId(id);
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/profile");
        }
    }
}
