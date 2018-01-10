package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

//    -----View One Specific Ad-----
    Ad ViewAd (long id);


    //    ---------Method to Update Ad---------
//    void editAd(String title, String description, Integer price, long id);
    void editAd(Ad ad);
    List<Ad> search(String searchAd);

}
