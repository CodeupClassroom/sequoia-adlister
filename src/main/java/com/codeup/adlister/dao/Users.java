package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    User findByEmail(String email);
    String getBio(long userId);
    String getLocation(long userId);
    String getPhone(long userId);
    String getRegDate(long userId);
    boolean updateInfo(String bio, String location, String phone, long userId);
    boolean updateEmail(String email, long userId);
    boolean updatePassword(String password, long userId);
    Long insert(User user);
}
