package com.codeup.adlister.util;

import com.codeup.adlister.models.Ad;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class ValidateAd {

    public static ArrayList<String> validate(Ad ad) {
    ArrayList<String> listOfErrorsWithAd = new ArrayList<>();

        if (ad.getTitle().isEmpty()) {
            String titleIsEmpty = "You must enter a title.";
            listOfErrorsWithAd.add(titleIsEmpty);
        }

        if (ad.getDescription().isEmpty()) {
            String descriptionIsEmpty = "You must enter a description.";
            listOfErrorsWithAd.add(descriptionIsEmpty);
        }

        return listOfErrorsWithAd;
    }
}
