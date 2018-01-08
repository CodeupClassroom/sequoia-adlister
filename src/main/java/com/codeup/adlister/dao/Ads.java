package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    // Shows one ad only
    Ad showOneAd(long id);

    // shows all ads by a particular user
    List<Ad> showAdsByUser(long id);

    // Display search results for ads
    List<Ad> searchAd(String searchTerm);
}
