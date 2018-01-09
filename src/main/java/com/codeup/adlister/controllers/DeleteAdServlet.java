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

import static javax.swing.JOptionPane.showMessageDialog;

@WebServlet(name = "controllers.DeleteAdServlet", urlPatterns = "/deleteAd")
public class DeleteAdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Ad ad = DaoFactory.getAdsDao().showOneAd(id);
        User user = DaoFactory.getUsersDao().showUserInformation(ad.getUserId());

        User currentSessionUser = (User) request.getSession().getAttribute("user");


        if (user.getId() == currentSessionUser.getId()) {
            DaoFactory.getAdsDao().deleteAd(id);
            response.sendRedirect("/profile");
        }
    }
}


