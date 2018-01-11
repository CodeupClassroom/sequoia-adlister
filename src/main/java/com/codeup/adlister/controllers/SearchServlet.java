package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.SearchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String searchTerm = request.getParameter("searchTerm");

        List<Ad> allAdsForThisSearch = DaoFactory.getAdsDao().searchAd(searchTerm);

        for (Ad ad : allAdsForThisSearch) {
            List<Category> categoriesForThisAd = DaoFactory.getCategoriesDao().getCategoriesForAd(ad.getId());
            ad.setCategories(categoriesForThisAd);
        }


        request.setAttribute("ads", allAdsForThisSearch);
//        request.setAttribute("users", DaoFactory.getUsersDao().searchUser(searchTerm));
        request.getRequestDispatcher("/WEB-INF/search.jsp").forward(request, response);
    }
}
