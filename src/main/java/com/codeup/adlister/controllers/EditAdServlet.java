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

@WebServlet(name = "controllers.EditAdServlet", urlPatterns = "/editAd")
public class EditAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
        }
        Long id = Long.parseLong(request.getParameter("id"));
        request.getSession().setAttribute("id", id);
        request.getRequestDispatcher("/WEB-INF/ads/editAd.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        long id = (long) request.getSession().getAttribute("id");
        String title = request.getParameter("title");
        String description = request.getParameter("description");


//        boolean inputHasErrors = title.isEmpty() || description.isEmpty();
//        if (inputHasErrors) {
//            response.sendRedirect("/editAd");
//        } else {
        // create and save a new ad
        DaoFactory.getAdsDao().editAdInformation(title, description, id);
        response.sendRedirect("/profile");
//        }
    }
}
