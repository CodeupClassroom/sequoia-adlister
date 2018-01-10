package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="ViewCategoryServlet", urlPatterns = "/ads/index")
public class ViewCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int categoryid = Integer.parseInt(request.getParameter("price"));
//        request.setAttribute("ads", DaoFactory.getAdsDao().getCategoryId(categories.categoryid));
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);

    }
}
