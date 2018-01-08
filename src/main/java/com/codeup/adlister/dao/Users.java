package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);

    Long insert(User user);

    // Shows a user's information on a selected ad
    User showUserInformation(long id);

    // Edit a user's profile
    void editProfileInformation(User user);
}
