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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Ad> allAds = DaoFactory.getAdsDao().all();
        List<Ad> allAdsWithCategories = new ArrayList<>();

        for (Ad ad : allAds) {
//            System.out.println(ad.getId());
            List<Category> categoriesForThisAd = DaoFactory.getCategoriesDao().getCategoriesForAd(ad.getId());
            Ad adWithCategory = new Ad(
                    ad.getId(),
                    ad.getTitle(),
                    ad.getDescription(),
                    categoriesForThisAd
            );
            allAdsWithCategories.add(adWithCategory);
//            for (Category category : categoriesForThisAd) {
//                System.out.printf("Ad id: %d has category: %s\n", ad.getId(),category.getCategory());
//            }
        }

//
        request.setAttribute("ads", allAdsWithCategories);

//        request.setAttribute("categories", DaoFactory.getCategoriesDao().getAllCategories());
//        request.setAttribute("categories", DaoFactory.getCategoriesForAd(long ad.id));
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }
}
