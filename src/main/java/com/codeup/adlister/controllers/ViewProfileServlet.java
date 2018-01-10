package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        User user = (User) request.getSession().getAttribute("user");
        request.getSession().setAttribute("loggedIn", "true");
        request.setAttribute("userAds", DaoFactory.getAdsDao().adsByUserId(user.getId()));
        request.setAttribute("bio", DaoFactory.getUsersDao().getBio(user.getId()));
        request.setAttribute("location", DaoFactory.getUsersDao().getLocation(user.getId()));
        request.setAttribute("phone", DaoFactory.getUsersDao().getPhone(user.getId()));
        request.setAttribute("regDate", DaoFactory.getUsersDao().getRegDate(user.getId()));
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }
}