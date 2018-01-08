package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.SearchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");

        request.setAttribute("ads", DaoFactory.getAdsDao().searchAd(searchTerm));
        request.setAttribute("users", DaoFactory.getUsersDao().searchUser(searchTerm));
        request.getRequestDispatcher("/WEB-INF/search.jsp").forward(request, response);
    }
}
