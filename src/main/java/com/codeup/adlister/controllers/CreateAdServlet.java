package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.ValidateAd;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static javax.swing.JOptionPane.showMessageDialog;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.setAttribute("categories", DaoFactory.getCategoriesDao().getAllCategories());
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String[] categories = request.getParameterValues("category");

        Ad ad = new Ad(
                request.getParameter("title"),
                request.getParameter("description")
        );

        ArrayList<String> listOfErrors = ValidateAd.validate(ad);

        if (listOfErrors.size() > 0) {
            request.getSession().setAttribute("listOfErrors", listOfErrors);

            HashMap<String, String> oldInput = new HashMap<>();

            oldInput.put("title", ad.getTitle());
            oldInput.put("description", ad.getDescription());

            request.getSession().setAttribute("oldInput", oldInput);

            response.sendRedirect("/ads/create");

        } else {

            // create and save a new ad
            Long adId = DaoFactory.getAdsDao().insert(ad);

            for (String category : categories) {
                long category_id = Long.parseLong(category);
                DaoFactory.getAdsDao().insertAdCategory(adId, category_id);
            }
            response.sendRedirect("/ads");
        }
    }
}
