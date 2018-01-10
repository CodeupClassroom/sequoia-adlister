package com.codeup.adlister.dao;

import com.codeup.adlister.models.Category;

import java.util.List;

public interface Categories {
    // Get all of the categories from the database
    List<Category> getAllCategories();
}
