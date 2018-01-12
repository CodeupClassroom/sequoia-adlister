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

//<%--Ad show page--%>
//
// <%--Create a page that shows the information about an individual ad. This page should show all the
// information about that ad, as well as the information about the user that posted the ad.--%>
//
//  <%--Your ads index page should contain links to each individual ad page.--%>
//
//  <%--You should have one page that displays the information for any arbitrary ad.
//  Consider passing the id of the ad as a parameter in the GET request to this page.--%>


@WebServlet(name = "controllers.IndividualAdServlet", urlPatterns = "/showAd")

public class IndividualAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));

        Ad ad = DaoFactory.getAdsDao().showOneAd(id);
        User user = DaoFactory.getUsersDao().showUserInformation(ad.getUserId());
        System.out.println(user);

        request.setAttribute("ad", ad);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/ads/showAd.jsp").forward(request, response);
    }
}
