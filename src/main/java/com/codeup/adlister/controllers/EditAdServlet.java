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
import java.util.ArrayList;
import java.util.List;

import static javax.swing.JOptionPane.showMessageDialog;

@WebServlet(name = "controllers.EditAdServlet", urlPatterns = "/editAd")
public class EditAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
        }
        Long id = Long.parseLong(request.getParameter("id"));
        request.getSession().setAttribute("id", id);
        request.getRequestDispatcher("/WEB-INF/ads/editAd.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        long id = (long) request.getSession().getAttribute("id");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Ad ad = DaoFactory.getAdsDao().showOneAd(id);
        User user = DaoFactory.getUsersDao().showUserInformation(ad.getUserId());
        User currentSessionUser = (User) request.getSession().getAttribute("user");
        boolean inputHasErrors = false;

        if (user.getId() == currentSessionUser.getId()) {
            inputHasErrors = title.isEmpty() || description.isEmpty();
            ArrayList<String> listOfErrors = new ArrayList<>();

            if (title.isEmpty()) {
                String titleIsEmpty = "You must enter a title.";
                listOfErrors.add(titleIsEmpty);
                inputHasErrors = true;
            }

            if (description.isEmpty()) {
                String descriptionIsEmpty = "You must enter a description.";
                listOfErrors.add(descriptionIsEmpty);
                inputHasErrors = true;
            }

            if (inputHasErrors) {
                request.getSession().setAttribute("listOfErrors", listOfErrors);
//                showMessageDialog(null,
//                        "A blank field(s) was detected. Please fix your error(s) and try again.");
                response.sendRedirect("/editAd");
            } else {
                DaoFactory.getAdsDao().editAdInformation(title, description, id);
                response.sendRedirect("/profile");
            }
        }
    }




    // 0. create and empty list of errors
    // 1. for every piece of validation you want to do
    // 2. check some condition
    // 3. if the condition fails, add a nice message to the list

    // pass the errors to the jsp
    // ...

    // in the jsp
    // check if the errors are empty
    // if not, loop through and display them
}
