package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.mysql.cj.jdbc.Driver;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLCategoriesDao implements Categories {
    private Connection connection;

    public MySQLCategoriesDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

//
//    String selectAllCategories = "SELECT * FROM categories";
//
//    Statement stmt = connection.createStatement();
//    ResultSet rs = stmt.executeQuery(selectAllCategories);
//            while (rs.next()){
//    }

    @Override
    public List<String> getCategories() {
        PreparedStatement stmt;
        try {
            String selectCategory = ("SELECT category FROM categories");
            stmt = connection.prepareStatement(selectCategory);
            ResultSet rs = stmt.executeQuery();
            // put list of categories into a new Array List
            List<String> categories = new ArrayList<>();
            while (rs.next()) {
                categories.add(rs.getString(1));
            }
            return categories;
        } catch (SQLException e) {
            throw new RuntimeException("Error - unable to retrieve categories.", e);
        }
    }
}
