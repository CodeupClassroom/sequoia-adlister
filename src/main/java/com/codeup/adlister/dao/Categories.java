package com.codeup.adlister.dao;

import com.codeup.adlister.controllers.ViewCategoryServlet;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import java.util.List;

public interface Categories {
    // get a list of all the ads
    List<Category> all();
    // insert a new category and return the category's id
//    Long insert(Categories category);
    // view single category
//    Category ViewCategory(int id);
//    Category getCategoryId(int id);

}
