package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();

    //find a single ad by its id:
    Ad findById(Long id);
    // insert a new ad and return the new ad's id
    Long insert(Ad ad, String[] categoriesIds);
    //Used to display one a
    Ad showAd(Long id);

    List<Ad> search(String searchQuery);

    void updateAd(Ad ad);

    void deleteAd(Long id);

    List<Ad> showUsersAds(Long id);

    List<Ad> searchCategory(Long id);
}
