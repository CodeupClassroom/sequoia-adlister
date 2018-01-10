package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EditAdServlet", urlPatterns = "/ad/edit")
public class EditAdServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
//
        // Current session user
        User currentUser = (User) request.getSession().getAttribute("user");

        // Requested ad_id from user to edit
        int requestedAdId = Integer.parseInt(request.getParameter("adID"));

        // Get valid list of ad ids from current user to compare to requestedAdID
        List<Ad> usersAds = DaoFactory.getAdsDao().adsByUserId(currentUser.getId());

        // If session user doesn't have matching ad_id, they are redirected to ads index
        boolean userOwnsAd = false;
        for (Ad ad : usersAds) {
            if (ad.getId() == requestedAdId) {
                userOwnsAd = true;
            }
        }
        if (!userOwnsAd) {
            response.sendRedirect("/ads/index");
        }

        // To generate category checkboxes on edit.jsp
        List<String> categories = DaoFactory.getAdsCategoriesDao().getCategories();
        request.setAttribute("categories", categories);

        // Get specific Ad to be editing for edit.jsp
        Ad adToEdit = DaoFactory.getAdsDao().findAdByID(requestedAdId);
        request.setAttribute("adToEdit", adToEdit);
        request.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(request,response);

    }
}
