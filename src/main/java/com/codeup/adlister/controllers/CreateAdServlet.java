package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Checking if user is logged in and has session in progress. If not, redirects to /login
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        // If logged in, sends ads/create.jsp
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Find current user in database to use user id in Ad obj
        User user = (User) request.getSession().getAttribute("user");

        Ad ad = new Ad(
            user.getId(),
            request.getParameter("title"),
            request.getParameter("description"),
            request.getParameter("adLocation")
        );

        // Send to ads after creation
        DaoFactory.getAdsDao().insert(ad);
        response.sendRedirect("/ads");
    }
}
