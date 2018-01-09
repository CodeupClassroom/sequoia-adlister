//package com.codeup.adlister.controllers;
//
//import com.codeup.adlister.dao.DaoFactory;
//import com.codeup.adlister.models.Ad;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//    @WebServlet(name = "ShowAdServlet", urlPatterns = "/ads/show")
//    public class ViewAdServlet extends HttpServlet {
//        public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//            Long id = Long.parseLong(request.getParameter("id"));
//
//            Ad ad = DaoFactory.getAdsDao().(id);
//            //make a getrequest to the servlet,
//            // parameter hold the ID number of the individual ad,
//            // save that number into a variable,
//            // a href = tag --> send to servlet with id
//
//
//
//            request.setAttribute("ad", ad);
//            request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);
//
//        }
//    }