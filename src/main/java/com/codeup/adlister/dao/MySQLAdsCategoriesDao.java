package com.codeup.adlister.dao;

import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsCategoriesDao implements Categories{

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

    // This will get corresponding category id if named category exists
    @Override
    public List<Long> getRequestedCategoryIds(String[] categoryNames) {
        PreparedStatement stmt = null;
        List<Long> categoryIds = new ArrayList<>();
        try {
            for (String category : categoryNames) {
                String sql = "SELECT id FROM categories WHERE category = ?";
                stmt = connection.prepareStatement(sql);
                stmt.setString(1, category);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    categoryIds.add(rs.getLong("id"));
                }
            }
            return categoryIds;
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving category ids.", e);
        }
    }

    // This will insert ad/category relationships into the ads_categories pivot table
    @Override
    public Long insertAdsCategories(Long adId, List<Long> catIds) {
        PreparedStatement stmt = null;
        try {
            for (long catId : catIds) {
                System.out.println("The cat ID is = " + catId);
                System.out.println("The ad ID is = " + adId);
                String sql = "INSERT INTO adlister_db.ads_categories (ads_id, ads_category_id) VALUES (?, ?)";
                stmt = connection.prepareStatement(sql);
                stmt.setLong(1, adId);
                stmt.setLong(2, catId);
                stmt.execute();
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error inserting to ads_categories.", e);
            }
        return null;
    }
}
