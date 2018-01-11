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
import java.util.List;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("categories", DaoFactory.getCategoriesDAO().getCategories());

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");

        System.out.println(request.getSession().getAttribute("user"));

        if(request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        // Brings in categories list for create.jsp
        List<String> categories = DaoFactory.getCategoriesDAO().getCategories();
        request.setAttribute("categories", categories);

//        // make array with category elements
//        String[] categories = request.getParameterValues("categories");


        // Validation for price input
        HashMap<String, String> errors = new HashMap<>();
        try {
            request.getParameter("price");
        } catch (NumberFormatException e) {
            errors.put("price", "Price should be a number");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/WEB-INF/ads/create.jsp");
        }


        Ad ad = new Ad(
                user.getId(),
                user.getUsername(),
                request.getParameter("title"),
                request.getParameter("description"),
                Integer.parseInt(request.getParameter("price"))
        );


        Long newAdId = DaoFactory.getAdsDao().insert(ad);
        response.sendRedirect("/ads/users-ads?id=" + newAdId);
    }
}
