package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;

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
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override
    public User findByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, email);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by email", e);
        }
    }

    @Override
    public String getBio(long userId) {
        String query = "SELECT bio FROM user_info WHERE user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return rs.getString("bio");
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving bio from user", e);
        }
    }

    @Override
    public String getLocation(long userId) {
        String query = "SELECT location FROM user_info WHERE user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return rs.getString("location");
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving location from user", e);
        }
    }

    @Override
    public String getPhone(long userId) {
        String query = "SELECT phone_number FROM user_info WHERE user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return rs.getString("phone_number");
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving phone number from user", e);
        }
    }

    @Override
    public String getRegDate(long userId) {
        String query = "SELECT register_date FROM user_info WHERE user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return rs.getString("register_date");
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving register date from user", e);
        }
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO adlister_db.users(username, email, password) VALUES (?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            //stmt.setString(3, BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(DaoFactory.hashNumberOfRounds)));
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            Long userId = rs.getLong(1);
            insertRegisterDate(userId);
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    @Override
    public boolean updateInfo(String bio, String location, String phone, long userId) {
        String query = "UPDATE user_info SET bio = ?, location = ?, phone_number = ? WHERE user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, bio);
            stmt.setString(2, location);
            stmt.setString(3, phone);
            stmt.setLong(4, userId);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException("Error updating user information", e);
        }
    }

    @Override
    public boolean updateEmail(String email, long userId) {
        String query = "UPDATE users SET email = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, email);
            stmt.setLong(2, userId);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException("Error Updating Email to User", e);
        }
    }

    @Override
    public boolean updatePassword(String password, long userId) {
        String query = "UPDATE users SET password = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, password);
            stmt.setLong(2, userId);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException("Error Updating Password to User", e);
        }
    }
          
    // Used when inserting a new user. Will take their id and insert register date on user_info table
    private Long insertRegisterDate(Long userId) {
        try {
            String query = "INSERT INTO adlister_db.user_info(user_id, register_date) VALUES (?, CURDATE())";
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, userId);
            stmt.execute();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user register date", e);
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (! rs.next()) {
            return null;
        }
        return new User(
            rs.getLong("id"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("password")
        );
    }

    private User extractUserComplete(ResultSet rs) throws SQLException {
        if (! rs.next()) {
            return null;
        }
        return new User(
            rs.getLong("id"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("password"),
            rs.getString("bio"),
            rs.getString("location"),
            rs.getDate("register_date").toString(),
            rs.getString("phone_number")
        );
    }
}
