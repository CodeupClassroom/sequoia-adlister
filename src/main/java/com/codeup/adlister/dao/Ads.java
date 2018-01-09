package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();

    // get a single ad
    Ad findAdByID(int adID);

    // get all ads belonging to a user ID
    List<Ad> adsByUserId(long userId);

    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    List<Ad> search(String input);
}
