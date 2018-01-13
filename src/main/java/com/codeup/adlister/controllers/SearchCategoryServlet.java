package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name="controller.SearchCategory", urlPatterns="/search_categories")
public class SearchCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/category.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setAttribute("ads", DaoFactory.getAdsDao().searchCategory(Long.parseLong(request.getParameter("categories_id"))));
            request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }
}
