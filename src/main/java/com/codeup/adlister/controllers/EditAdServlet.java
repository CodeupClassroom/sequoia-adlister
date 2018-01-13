package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="controllers.EditServlet", urlPatterns="/ads/edit")
public class EditAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        if (request.getParameter("id") != null) {

            //get the id from the url, given to us on the Edit button on profile.jsp <a href="ads/edit?id=${ad.id}">
            Long id = Long.parseLong(request.getParameter("id"));

            // find the ad in the ads table with that id...
            Ad ad = DaoFactory.getAdsDao().findById(id);
            // set the attribute to be used/passed to the view:
            request.setAttribute("ad", ad);
            // The edit.jsp form now pre-populates with: value="${ad.title}" value="${ad.description} and HIDDEN value="${ad.id}"

            //Shows the view/form jsp
            request.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //The difference between create ad and update ad is that we already have a user and
        // ad in the database
        Ad ad = DaoFactory.getAdsDao().findById(Long.parseLong(request.getParameter("id")));

        ad.setTitle(request.getParameter("title"));
        ad.setDescription(request.getParameter("description"));

        DaoFactory.getAdsDao().updateAd(ad);
        response.sendRedirect("/profile");





    }
}
