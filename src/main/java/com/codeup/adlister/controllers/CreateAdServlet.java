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
import java.util.List;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Checking if user is logged in and has session in progress. If not, redirects to /login
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        // If logged in, grabs the updated list of valid categories for checkboxes on the jsp
        List<String> categories = DaoFactory.getAdsCategoriesDao().getCategories();
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Find current user in database to use user id in Ad obj
        User user = (User) request.getSession().getAttribute("user");

        // Capturing values of checkbox group into String array
        String[] categories = request.getParameterValues("categories");

        // Converts array of category String names to List of category ids
        List<Long> catIds = DaoFactory.getAdsCategoriesDao().getRequestedCategoryIds(categories);

        // Creates Ad obj with values from creation page
        Ad ad = new Ad(
            user.getId(),
            request.getParameter("title"),
            request.getParameter("description"),
            request.getParameter("adLocation")
        );

        // Send to ads after creation
        Long adId = DaoFactory.getAdsDao().insert(ad);

        // Adding the appropriate ad_id/category_id relationships on ads_categories table
        DaoFactory.getAdsCategoriesDao().insertAdsCategories(adId, catIds);

//        DaoFactory.getAdsCategoriesDao().insertAdsCategories();
        response.sendRedirect("/ad?adID=" + Long.toString(adId));
    }
}
