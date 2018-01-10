package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.util.ArrayList;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    // insert a category to an ad
    Long insertAdCategory(long ads_id, long cat_id);

    // Shows one ad only
    Ad showOneAd(long id);

    // shows all ads by a particular user
    List<Ad> showAdsByUser(long id);

    // Display search results for ads
    List<Ad> searchAd(String searchTerm);

    // Edit ad:
    void editAdInformation(String title, String description, long id);

//    deletes one ad:
    void deleteAd(long id);

    }
