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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        if (request.getParameter("id") != null) {

            Long id = Long.parseLong(request.getParameter("id"));
            DaoFactory.getAdsDao().ViewAd(id);

            Ad ad = DaoFactory.getAdsDao().ViewAd(id);
//            User user = DaoFactory.getUsersDao().userInformation(ad.getUserId());

            request.setAttribute("ad", ad);
//            request.setAttribute("user", user);
            request.getRequestDispatcher("/WEB-INF/ads/editAd.jsp")
                    .forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Integer price = Integer.parseInt(request.getParameter("price"));
//        long id = (long) request.getParameter("id");

        Ad ad = DaoFactory.getAdsDao().ViewAd(Long.parseLong(request.getParameter("id")));
//        User user = DaoFactory.getUsersDao().userInformation(ad.getUserId());
        ad.setTitle(title);
        ad.setDescription(description);
        ad.setPrice(price);
//        ad.setId(id);

//        DaoFactory.getAdsDao().editAd(title, description, price, id);
        DaoFactory.getAdsDao().editAd(ad);
        response.sendRedirect("/ads/users-ads?id=" + ad.getId()); //concatenation done do go back to specific ad id

    }
}


//    The doPost method on the editAdServlet handles updating an existing record in the db.
//        For this to work, we need:

//        Prerequisite: Add an update() method to the MySQLAdsDAO to handle updating existing ads.

//        Inside the doPost on editAdServlet,
//        1. Find the existing Ad given its id from the form.
//        2. call the update method.
//        3. redirect users back to see the Ad

