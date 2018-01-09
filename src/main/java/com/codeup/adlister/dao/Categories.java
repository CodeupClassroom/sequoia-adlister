package com.codeup.adlister.dao;

import java.util.List;

public interface Categories {
    List<String> getCategories();
    List<Long> getRequestedCategoryIds(String[] categoryNames);
    List<Long> insertAdsCategories(Long adId, List<Long> catIds);
}
