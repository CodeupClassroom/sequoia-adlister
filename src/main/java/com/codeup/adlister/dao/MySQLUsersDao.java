package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLUsersDao implements Users {
    private Connection connection;

    public MySQLUsersDao(Config config) {
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


    @Override
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return extractUser(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override
    public User showUserInformation(long id) {
        String query = "SELECT * FROM users WHERE id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            return extractUser(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error displaying user information", e);
        }
    }

    @Override
    public List<User> searchUser(String searchTerm) {
        String query = "SELECT * FROM users WHERE username LIKE ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, "%" + searchTerm + "%");
            ResultSet rs = stmt.executeQuery();
            return createUsersFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("An error occurred while retrieving ads and/or users.", e);
        }
    }

    @Override
    public void editProfileInformation(String email, String password, long id) {
        String query = "UPDATE users SET email = ?, password = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, Password.hash(password));
            stmt.setLong(3, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error editing profile information.", e);
        }
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        return new User(
            rs.getLong("id"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("password")
        );
    }

    private List<User> createUsersFromResults(ResultSet rs) throws SQLException {
        List<User> users = new ArrayList<>();
        while(rs.next()) {
            users.add(extractUser(rs));
        }
        return users;
    }
}
