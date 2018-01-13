package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.AdServlet", urlPatterns = "/ad")
public class AdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // If no GET parameter sent, then page will redirect to /ads
        if (request.getParameter("adID") == null) {
            response.sendRedirect("/ads");
            return;
        }

        // Get ad id number from parameter (string) and convert to (int)
        String StringAdID = request.getParameter("adID");
        int adID = Integer.parseInt(StringAdID);

        // Create Ad obj by searching for specific ad ID
        Ad ad = DaoFactory.getAdsDao().findAdByID(adID);

        // Set Attribute and send to jsp
        request.setAttribute("ad", ad);
        request.getRequestDispatcher("WEB-INF/ads/ad.jsp").forward(request, response);

    }
}
