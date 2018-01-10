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
import java.util.HashMap;

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
        Ad ad = new Ad(
                user.getId(),
                request.getParameter("title"),
                request.getParameter("description")
        );
        boolean inputHasErrors = ad.getTitle().isEmpty() || ad.getDescription().isEmpty();
        String[] categories = request.getParameterValues("category");

        for(String category:categories) {
            System.out.println(category);
        }

        System.out.println(ad.getId());

        if (inputHasErrors) {
            showMessageDialog(null,
                    "A blank field(s) was detected. Please fix your error(s) and try again.");

            HashMap<String, String> oldInput = new HashMap<>();

            oldInput.put("title", ad.getTitle());
            oldInput.put("description", ad.getDescription());

            request.getSession().setAttribute("oldInput", oldInput);

            response.sendRedirect("/ads/create");

        } else {

            // create and save a new ad
            Long adId = DaoFactory.getAdsDao().insert(ad);


            System.out.println(adId);



            for (String category : categories) {
                long category_id = Long.parseLong(category);
                DaoFactory.getAdsDao().insertAdCategory(adId, category_id);
            }
            response.sendRedirect("/ads");
        }
    }
}
