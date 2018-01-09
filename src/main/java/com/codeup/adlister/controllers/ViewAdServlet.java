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

    @WebServlet(name = "ShowAdServlet", urlPatterns = "/ad")
    public class ViewAdServlet extends HttpServlet {
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            Long id = Long.parseLong(request.getParameter("id"));

            Ad ad = DaoFactory.getAdsDao().ViewAd(id);
//            -----Include user id info to show on ad-----
            User user = DaoFactory.getUsersDao().userInformation(ad.getUserId());

            //make a getrequest to the servlet,
            // parameter hold the ID number of the individual ad,
            // save that number into a variable,
            // a href = tag --> send to servlet with id



            request.setAttribute("ad", ad);
//            ----Set attribute for user----
            request.setAttribute("user", user);
            request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);

        }
    }
