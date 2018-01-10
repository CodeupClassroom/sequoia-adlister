package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import org.apache.commons.lang3.StringUtils;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.EditAccountServlet", urlPatterns = "/edit-account")
public class EditAccountServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/edit-account.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getParameter("edit");
        User user = (User) request.getSession().getAttribute("user");
        switch(option) {
            case "info":
                String bio = request.getParameter("bio");
                String location = request.getParameter("location");
                String phone = request.getParameter("phone");

                boolean bioError = bio.length() > 255;

                boolean locationError = location.length() > 255
                        || !StringUtils.isAsciiPrintable(location);

                boolean phoneError = phone.length() > 255
                        || !StringUtils.isNumeric(StringUtils.remove(phone, '+'));

                if(bioError || locationError || phoneError) {
                    bio = bioError ? "" : bio;
                    location = locationError ? "" : location;
                    phone = phoneError ? "" : phone;
                    request.setAttribute("inputErrorInfo", true);
                    request.setAttribute("bio", bio);
                    request.setAttribute("location", location);
                    request.setAttribute("phone", phone);
                    request.getRequestDispatcher("/WEB-INF/edit-account.jsp").forward(request, response);
                    return;
                }

                DaoFactory.getUsersDao().updateInfo(bio, location, phone, user.getId());
                response.sendRedirect("/profile");
                return;

            case "email":
                String email1 = request.getParameter("email1");
                String email2 = request.getParameter("email2");

                boolean emailError = email1.isEmpty()
                        || email2.isEmpty()
                        || email1.length() > 255
                        || !email1.equals(email2)
                        || StringUtils.countMatches(email1, "@") != 1
                        || StringUtils.lastIndexOf(email1, ".") <= StringUtils.lastIndexOf(email1, "@");

                if(emailError) {
                    request.setAttribute("inputErrorEmail", true);
                    request.getRequestDispatcher("/WEB-INF/edit-account.jsp").forward(request, response);
                    return;
                }

                DaoFactory.getUsersDao().updateEmail(email1, user.getId());
                response.sendRedirect("/profile");
                return;

            case "password":
                String oldPassword = request.getParameter("oldPassword");
                String newPassword1 = request.getParameter("newPassword1");
                String newPassword2 = request.getParameter("newPassword2");

                boolean passwordError = oldPassword.isEmpty()
                        || !oldPassword.equals(user.getPassword())
                        //|| !BCrypt.checkpw(oldPassword, user.getPassword())
                        || newPassword1.isEmpty()
                        || newPassword2.isEmpty()
                        || newPassword1.length() > 255
                        || newPassword1.length() < 8
                        || (! newPassword1.equals(newPassword2))
                        || !StringUtils.isAsciiPrintable(newPassword1);

                if(passwordError) {
                    request.setAttribute("inputErrorPassword", true);
                    request.getRequestDispatcher("/WEB-INF/edit-account.jsp").forward(request, response);
                    return;
                }

                DaoFactory.getUsersDao().updatePassword(newPassword1, user.getId());
                response.sendRedirect("/profile");
                return;

            default:
                response.sendRedirect("/profile");
                return;
        }
    }
}