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

@WebServlet(name = "EditAdServlet", urlPatterns = "/ads/edit")
public class EditAdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        Long id = Long.parseLong(request.getParameter("ad_id"));

        Ad ad = DaoFactory.getAdsDao().ViewAd(id);

        User user = DaoFactory.getUsersDao().userInformation(ad.getUserId());

        request.setAttribute("ad", ad);
        request.setAttribute("user", user);

        request.getRequestDispatcher("/WEB-INF/ads/editAd.jsp")
                .forward(request, response);
    }
}

