package com.codeup.adlister.dao;

import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsCategoriesDao implements Categories {

    private Connection connection = null;

    public MySQLAdsCategoriesDao(Config config) {
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


    // This will get a List of Strings for all unique categories
    @Override
    public List<String> getCategories() {
        PreparedStatement stmt = null;
        try {
            String sql = "SELECT category FROM categories";
            stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            List<String> categories = new ArrayList<>();
            while (rs.next()) {
                categories.add(rs.getString(1));
            }
            return categories;
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving categories.", e);
        }
    }

    // This will take in a list of Strings that corospond to category names. If they are valid names in the categories table, then it will return a List<Long> of those specific ids.
    @Override
    public List<Long> getRequestedCategoryIds(String[] categoryNames) {
        PreparedStatement stmt = null;
        List<Long> categoryIds = new ArrayList<>();
        try {

            // Loops for as many String names in the given argument, adding to return List each iteration

            for (String category : categoryNames) {
                String sql = "SELECT id FROM categories WHERE category = ?";
                stmt = connection.prepareStatement(sql);
                stmt.setString(1, category);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    categoryIds.add(rs.getLong("id"));
                }
            }

            // Returns the final full list
            return categoryIds;

        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving category ids.", e);
        }
    }

    // This will insert ad/category relationships into the ads_categories pivot table after the ad is initially created. Will return unique id keys for new rows in the ads_categories table.
    @Override
    public List<Long> insertAdsCategories(Long adId, List<Long> catIds) {
        PreparedStatement stmt = null;
        List<Long> newAdIds = new ArrayList<>();

        try {

            // Loops for as many categories were chosen by user, inserting at the end of each iteration

            for (long catId : catIds) {
                String sql = "INSERT INTO adlister_db.ads_categories (ads_id, ads_category_id) VALUES (?, ?)";
                stmt = connection.prepareStatement(sql);
                stmt.setLong(1, adId);
                stmt.setLong(2, catId);
                stmt.execute();
                ResultSet rs = stmt.getGeneratedKeys();
                rs.next();
                newAdIds.add(rs.getLong(1));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error inserting to ads_categories.", e);
        }
        return newAdIds;
    }
}
