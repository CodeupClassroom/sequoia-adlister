package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLCategoriesDao implements Categories {
    private Connection connection;

    public MySQLCategoriesDao(Config config) {
        try {
            String selectAllCategories = "SELECT * FROM categories";
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(selectAllCategories);
            while (rs.next()){
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Category> all() {
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement("SELECT * FROM categories");
            ResultSet rs = stmt.executeQuery();
            return createCategoryFromResults(rs);

        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving categories.", e);
        }
    }


    private Category extractCategory(ResultSet rs) throws SQLException {
        if (!rs.next()) {
            return null;
        }
        return new Category(
                rs.getLong("id"),
                rs.getString("category")
        );
    }

    private List<Category> createCategoryFromResults(ResultSet rs) throws SQLException {
        List<Category> categories = new ArrayList<>();
        while (rs.next()) {
            categories.add(extractCategory(rs));
        }
        return categories;
    }
}
